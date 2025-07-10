<?php

namespace App\Http\Controllers;

use App\Models\Cashier;
use App\Models\CashierMovement;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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
            }])
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
        if($cashier)
        {
            return redirect()->back()->withInput()->with(['message' => 'La persona seleccionada cuenta con una caja activa...', 'alert-type' => 'error']);
        }

        DB::beginTransaction();
        try {
        // return $request;

            $cashier = Cashier::create([
                // 'branch_id' => 1,
                'user_id' => $request->user_id,
                'title'=>$request->title,
                'observation'=>$request->observations,
                'status' => 'Pendiente'                
            ]);

            CashierMovement::create([
                        'cashier_id' => $cashier->id,
                        'amount' => $request->amount,
                        'observation' => 'Monto de apertura de caja.',
                        'type' => 'Ingreso',
                        'status'=>'Pendiente'
                    ]);

            DB::commit();
            return redirect()->route('cashiers.index')->with(['message' => 'Registrado exitosamente.', 'alert-type' => 'success']);
        } catch (\Throwable $th) {
            DB::rollBack(); return 0;
            return redirect()->route('cashiers.index')->with(['message' => 'Ocurrió un error.', 'alert-type' => 'error']);
        }
    }
}
