<?php

namespace App\Http\Controllers;

use App\Models\Cashier;
use App\Models\CashierDetail;
use App\Models\CashierDetailCash;
use App\Models\CashierMovement;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Carbon;

class CashierController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $this->custom_authorize('browse_cashiers');

        return view('cashiers.browse');
    }


    public function list(){
        $paginate = request('paginate') ?? 10;
        $search = request('search') ?? null;
        $cashier = Cashier::with(['cashierMovements' => function($q){
                $q->where('deleted_at', NULL);
            },'cashierDetailsOne' ])
            // ->where(function($query) use ($search){
            //     if($search){
            //         $query->OrwhereHas('user', function($query) use($search){
            //             $query->whereRaw("name like '%$search%'");
            //         });
            //     }
            // })
            ->where('deleted_at', NULL)
            ->orderBy('id', 'DESC')
            ->paginate($paginate);
            
        // dump($cashier);
        // return 1;

        
        return view('cashiers.list', compact('cashier'));
    }

    public function create()
    {
        $this->custom_authorize('add_cashiers');
        return view('cashiers.edit-add');
    }

    public function store(Request $request)
    {
        $this->custom_authorize('add_cashiers');
        $cashier = Cashier::where('user_id', $request->user_id)->where('status', '!=', 'cerrada')->where('deleted_at', NULL)->first();
        $user = User::where('id', $request->user_id)->first();
        if($cashier)
        {
            return redirect()->back()->withInput()->with(['message' => 'La persona seleccionada cuenta con una caja activa...', 'alert-type' => 'error']);
        }
        DB::beginTransaction();
        try {
            
            $cashier = Cashier::create([
                'branch_id' => $user->branch_id,
                'user_id' => $request->user_id,
                'title'=>$request->title,
                'observation'=>$request->observations,
                'status' => 'Apertura Pendiente'                
            ]);

            $cashierMovement = CashierMovement::create([
                        'cashier_id' => $cashier->id,
                        'amount' => $request->amount,
                        'observation' => 'Monto de apertura de caja.',
                        'type' => 'Ingreso',
                        'status'=>'Pendiente'
                    ]);

            $detail = CashierDetail::create([
                'cashierMovement_id' => $cashierMovement->id,
                'cashier_id' => $cashier->id,
                'type' => 'Apertura',
            ]);

            for ($i=0; $i < count($request->cash_value); $i++) { 
                CashierDetailCash::create([
                    'cashierDetail_id' => $detail->id,
                    'cash_value' => $request->cash_value[$i],
                    'quantity' => $request->quantity[$i],
                ]);
            }

            DB::commit();
            return redirect()->route('cashiers.index')->with(['message' => 'Registrado exitosamente.', 'alert-type' => 'success']);
        } catch (\Throwable $th) {
            DB::rollBack(); return 0;
            return redirect()->route('cashiers.index')->with(['message' => 'Ocurrió un error.', 'alert-type' => 'error']);
        }
    }

    public function change_status(Request $request, $id)
    {
        $cashier = Cashier::where('id', $id)->where('status', '!=', 'apertura pendiente')->where('deleted_at', NULL)->first();
        if ($cashier) {
            return redirect()->back()->withInput()->with(['message' => 'La caja ya no se encuentra en apertura pendiente.', 'alert-type' => 'warning']);
        }
        DB::beginTransaction();
        try {
            $cashier =  Cashier::where('id', $id)->first();
            if($request->status == 'Abierta'){
                $message = 'Caja aceptada exitosamente.';
                $cashier->update([
                    'status' => $request->status,
                    'open_at' => Carbon::now()
                ]);
                CashierMovement::where('cashier_id',$cashier->id)->update(['status'=>'Aceptada']);
            }else{
                $message = 'Caja rechazada exitosamente.';
                $cashier->update([
                    'status' => 'Rechazada',
                    // 'deleted_at' => Carbon::now()
                ]);         
                $cashier->delete();   
            }
            DB::commit();
            return redirect()->route('voyager.dashboard')->with(['message' => $message, 'alert-type' => 'success']);
        } catch (\Throwable $th) {
            DB::rollback();
            return redirect()->route('voyager.dashboard')->with(['message' => 'Ocurrió un error.', 'alert-type' => 'error']);
        }
    }

    public function print_open($id)
    {
        $cashier = Cashier::with(['userCashier', 'cashierDetails' => function($q){
                        $q->where('deleted_at', NULL);
                    }, 'cashierDetails.cashierDetailCashes' => function($q){
                        $q->where('deleted_at', NULL);
                    }, 'cashierMovements' => function($q){
                        $q->where('deleted_at', NULL);
                    }]
                    )->where('id', $id)
                    ->first();

        return view('cashiers.print-open', compact('cashier'));
    }
}
