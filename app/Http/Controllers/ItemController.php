<?php

namespace App\Http\Controllers;

use App\Models\Branch;
use App\Models\Category;
use App\Models\Item;
use App\Models\ItemStock;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ItemController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $this->custom_authorize('browse_items');
        $categories = Item::with(['category'])
            ->where('deleted_at', null)
            ->select('category_id')
            ->groupBy('category_id')
            ->get();

        return view('parameters.items.browse', compact('categories'));
    }

    public function list(){
        $search = request('search') ?? null;
        $paginate = request('paginate') ?? 10;
        $category_id = request('category') ?? null;
        $user = Auth::user();

        $data = Item::with(['category', 'presentation', 'itemStocks'=>function($q)use($user){
                            $q->where('deleted_at', null)
                            ->whereRaw($user->branch_id? "branch_id = $user->branch_id" : 1);
                        }])
                        ->where(function($query) use ($search){
                            $query->OrwhereHas('category', function($query) use($search){
                                $query->whereRaw($search ? "name like '%$search%'" : 1);
                            })
                            ->OrwhereHas('presentation', function($query) use($search){
                                $query->whereRaw($search ? "name like '%$search%'" : 1);
                            })
                            ->OrWhereRaw($search ? "id = '$search'" : 1)
                            ->OrWhereRaw($search ? "observation like '%$search%'" : 1)
                            ->OrWhereRaw($search ? "name like '%$search%'" : 1);
                        })
                        ->where('deleted_at', NULL)
                        ->whereRaw($category_id? "category_id = '$category_id'" : 1)
                        ->orderBy('id', 'DESC')
                        ->paginate($paginate);

        return view('parameters.items.list', compact('data'));
    }

    public function show($id)
    {
        $this->custom_authorize('read_items');

        $user = Auth::user();
        $branches = Branch::where('deleted_at', null)
            ->whereRaw($user->branch_id? "id = $user->branch_id" : 1)
            ->get();

        $item = Item::with(['category', 'presentation', 'itemStocks'=>function($q)use($user){
                $q->orderBy('id', 'DESC')
                ->whereRaw($user->branch_id? "branch_id = $user->branch_id" : 1);
            }])
            ->where('id', $id)
            ->where('deleted_at', null)
            ->first();

        return view('parameters.items.read', compact('item', 'branches'));
    }


    public function storeStock(Request $request, $id)
    {
        $this->custom_authorize('add_items');    
        DB::beginTransaction();
        try {
            ItemStock::create([
                'branch_id'=>$request->branch_id,
                'item_id' => $id,
                'quantity' =>  $request->quantity,
                'stock' => $request->quantity,
                'type' => 'Ingreso',
                'observation' => $request->observation,
            ]);
            DB::commit();
            return redirect()->route('voyager.items.show', ['id'=>$id])->with(['message' => 'Registrado exitosamente.', 'alert-type' => 'success']);

        } catch (\Exception $e) {
            DB::rollback();
            return redirect()->route('voyager.items.show',  ['id'=>$id])->with(['message' => 'Ocurrió un error.', 'alert-type' => 'error']);
        } 
    }

    public function destroyStock($id, $stock)
    {
        $item = ItemStock::where('id', $stock)
                ->where('deleted_at', null)
                ->first();
        DB::beginTransaction();
        try {            
            $item->delete();
            DB::commit();
            return redirect()->route('voyager.items.show', ['id'=>$id])->with(['message' => 'Eliminado exitosamente.', 'alert-type' => 'success']);
        } catch (\Throwable $e) {
            DB::rollBack();
            return redirect()->route('voyager.items.show', ['id'=>$id])->with(['message' => 'Ocurrió un error.', 'alert-type' => 'error']);
        }
    }




}
