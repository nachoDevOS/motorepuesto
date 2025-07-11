<?php

namespace App\Http\Controllers;

use App\Models\Cashier;
use App\Models\Item;
use App\Models\ItemStock;
use App\Models\Sale;
use App\Models\SaleDetail;
use App\Models\SaledetailItemstock;
use App\Models\SaleTransaction;
use App\Models\Transaction;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class SaleController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $this->custom_authorize('browse_sales');
        return view('sales.browse');
    }

    public function list(){

        $this->custom_authorize('browse_sales');

        $search = request('search') ?? null;
        $paginate = request('paginate') ?? 10;
        $typeSale = request('typeSale') ?? null;

        $data = Sale::with(['person','register', 'branch', 'saleDetails'=>function($q){
                            $q->where('deleted_at', null);
                        }])
                        ->where(function($query) use ($search){
                            $query->OrWhereRaw($search ? "id = '$search'" : 1)
                            ->OrWhereRaw($search ? "code like '%$search%'" : 1)
                            ->OrWhereRaw($search ? "ticket like '%$search%'" : 1);
                        })
                        ->where('deleted_at', NULL)
                        ->whereRaw($typeSale? "typeSale = '$typeSale'" : 1)
                        ->orderBy('id', 'DESC')
                        ->paginate($paginate);

        return view('sales.list', compact('data'));
    }

    public function create()
    {
        $this->custom_authorize('add_sales');
        return view('sales.edit-add');
    }

    // public function generarNumeroFactura() {
    //     $fecha = now()->format('Ymd');
    //     $ultimoRegistro = Sale::orderBy('id', 'desc')
    //                             ->first();
    //     $secuencia = $ultimoRegistro ? ($ultimoRegistro->id + 1) : 1;
    //     return sprintf("%s%06d", $fecha, $secuencia);
    // }
    public function generarNumeroFactura($typeSale)
    {
        $prefix = $typeSale == 'Venta'? 'VTA-':'PRO-';
        $fecha = now()->format('Ymd');
        $count = Sale::withTrashed()
                    ->where('typeSale', $typeSale)
                    ->whereDate('created_at', today())
                    ->count();

        return $prefix . $fecha . str_pad($count + 1, 4, '0', STR_PAD_LEFT);
    }

    public function store(Request $request)
    { 
        $this->custom_authorize('add_sales');
        $user = Auth::user();        
        if($request->typeSale == 'Venta')
        {
            foreach ($request->products as $key => $value) {
                $item = Item::with(['itemStocks'=>function($q)use($user){
                        $q->where('deleted_at', null)
                        ->where('stock', '>', 0)
                        ->whereRaw($user->branch_id? "branch_id = $user->branch_id" : 1);
                    }])
                    ->where('deleted_at', null)
                    ->where('status', 1)
                    ->where('id', $value['id'])
                    ->first();
                $auxStock = $item->itemStocks->sum('stock');     

                if ($value['quantity'] > $auxStock) {
                    return redirect()->route('sales.create')->with(['message' => 'Ocurrió un error.', 'alert-type' => 'error']);
                }
            }
        }

        DB::beginTransaction();
        try {
            $cashier = Cashier::where('status','Abierta')->where('user_id', $user->id)->first();
            if(!$cashier && $request->typeSale == 'Venta')
            {
                return redirect()->route('sales.create')->with(['message' => 'No cuenta con caja activa.', 'alert-type' => 'error']);
            }
            if(!$user->branch_id)
            {
                return redirect()->route('sales.create')->with(['message' => 'No se encuentra en una sucursal.', 'alert-type' => 'error']);
            }
            

            $sale = Sale::create([
                    'cashier_id'=>$request->typeSale == 'Venta'?$cashier->id:null,
                    'person_id'=>$request->person_id,
                    'branch_id'=>$user->branch_id,
                    'code'=>$this->generarNumeroFactura($request->typeSale),
                    'typeSale'=>$request->typeSale, 
                    'amountReceived'=>$request->typeSale == 'Venta'?$request->amountReceived:null,
                    'amountChange'=>$request->typeSale == 'Venta'?$request->amountReceived - $request->amountTotalSale:null,
                    'amount'=>$request->amountTotalSale,
                    'observation'=>$request->observation,
                    'dateSale'=>Carbon::now(),
                    'status'=>'Aceptada'
            ]);
            if($request->typeSale == 'Venta')
            {
                $transaction = Transaction::create([
                    'type'=>$request->payment_type,
                    'status'=>'Aceptada'
                ]);
                SaleTransaction::create([
                    'transaction_id'=>$transaction->id,
                    'sale_id'=>$sale->id,
                    'amount'=>$request->amountTotalSale
                ]);
            }
            foreach ($request->products as $key => $value) {
                $item=Item::where('id',$value['id'])->first();
      
                $saleDetail = SaleDetail::create([
                    'sale_id'=>$sale->id,
                    'item_id'=>$value['id'],
                    'price'=>$value['price'],
                    'quantity'=>$value['quantity'],
                    'amount'=>$value['subtotal'],
                    'name'=>$item->name
                ]);
         
                if($request->typeSale == 'Venta')
                {


                    $aux = $value['quantity'];
                    $cant = ItemStock::where('item_id', $value['id'])
                            ->where('deleted_at', null)
                            ->where('stock', '>', 0)
                            ->orderBy('id', 'ASC')
                            ->get();

                    foreach ($cant as  $item) {
                        if($item->stock >= $aux)
                        {
                            SaledetailItemstock::create([
                                'saleDetail_id'=>$saleDetail->id,
                                'itemStock_id'=>$item->id,
                                'quantity'=>$aux
                            ]);
                            $item->decrement('stock', $aux);
                            $aux=0;                        
                        }
                        else
                        {                            
                            $aux = $aux-$item->stock;
                            SaledetailItemstock::create([
                                'saleDetail_id'=>$saleDetail->id,
                                'itemStock_id'=>$item->id,
                                'quantity'=>$item->stock
                            ]);
                            $item->update([
                                'stock'=>0
                            ]);
                        }
                        if($aux == 0)
                        {
                            break;
                        }
                    } 
                }
            }            

            DB::commit();
            return redirect()->route('sales.index')->with(['message' => 'Registrado exitosamente.', 'alert-type' => 'success']);
        } catch (\Throwable $e) {
            DB::rollBack(); return 0;
            return redirect()->route('sales.index')->with(['message' => 'Ocurrió un error.', 'alert-type' => 'error']);
        }
    }

    public function prinf($id)
    {
        $sale = Sale::with(['person','register', 'branch', 'saleDetails'=>function($q){
                    $q->where('deleted_at', null);
            }])
            ->where('id', $id)
            ->where('deleted_at', null)
            ->first();
        if($sale->typeSale == 'Venta')
        {
            $transaction = SaleTransaction::with(['transaction'])
            ->where('sale_id', $sale->id)
            ->first();
            return view('sales.prinfSale', compact('sale','transaction' ));
        }
        else
        {
            return view('sales.prinfProforma', compact('sale'));
        }
    }
}
