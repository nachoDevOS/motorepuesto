<?php

namespace App\Http\Controllers;

use App\Models\Item;
use Illuminate\Http\Request;
use App\Models\Person;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class AjaxController extends Controller
{
    public function __construct(){
        $this->middleware('auth');
    }

    public function personList(){
        $q = request('q');
        $data = Person::OrWhereRaw($q ? "ci like '%$q%'" : 1)
                        ->OrWhereRaw($q ? "phone like '%$q%'" : 1)
                        ->OrWhereRaw($q ? "first_name like '%$q%'" : 1)
                        ->OrWhereRaw($q ? "middle_name like '%$q%'" : 1)
                        ->OrWhereRaw($q ? "paternal_surname like '%$q%'" : 1)
                        ->OrWhereRaw($q ? "maternal_surname like '%$q%'" : 1)
                        ->orWhere(function ($subQ) use ($q) {
                            $subQ->whereRaw("CONCAT(COALESCE(first_name, ''), ' ', COALESCE(middle_name, '')) like ?", ["%$q%"])
                                ->orWhereRaw("CONCAT(COALESCE(first_name, ''), ' ', COALESCE(paternal_surname, ''), ' ', COALESCE(maternal_surname, '')) like ?", ["%$q%"])
                                ->orWhereRaw("CONCAT(COALESCE(first_name, ''), ' ', COALESCE(middle_name, ''), ' ', COALESCE(paternal_surname, ''), ' ', COALESCE(maternal_surname, '')) like ?", ["%$q%"]);
                        })
                        ->where('deleted_at', null)
                        ->get();
        return response()->json($data);
    }

    public function personStore(Request $request){
        DB::beginTransaction();
        try {
            $person =Person::create($request->all());
            DB::commit();
            return response()->json(['person' => $person]);
        } catch (\Throwable $th) {
            DB::rollback();
            return response()->json(['error' => $th->getMessage()], 500);
        }
    }

    // Para obtener los item del inventario que hay en stock
    public function itemStockList(){
        $search = request('q');
        $user = Auth::user();
        $data = Item::with(['itemStocks' => function($q)use($user) {
                $q->where('deleted_at', null)
                ->whereRaw($user->branch_id? "branch_id = $user->branch_id" : 1);
            }, 'brand', 'category', 'presentation'])
            ->withSum(['itemStocks as total_stock' => function($query)use($user) {
                $query->where('deleted_at', null)
                ->whereRaw($user->branch_id? "branch_id = $user->branch_id" : 1);
            }], 'stock')
            ->Where(function($query) use ($search){
                if($search){
                    $query->OrwhereHas('brand', function($query) use($search){
                        $query->whereRaw($search ? 'name like "%'.$search.'%"' : 1);
                    })
                    ->OrwhereHas('category', function($query) use($search){
                        $query->whereRaw($search ? 'name like "%'.$search.'%"' : 1);
                    })
                    ->OrwhereHas('presentation', function($query) use($search){
                        $query->whereRaw($search ? 'name like "%'.$search.'%"' : 1);
                    })
                    ->OrWhereRaw($search ? "id like '%$search%'" : 1)
                    ->OrWhereRaw($search ? "name like '%$search%'" : 1);
                }
            })
            ->where('deleted_at', null)
            ->get()
            ->map(function ($item) {
                // Si no hay itemStocks o la suma es null, establecer total_stock a 0
                $item->total_stock = $item->total_stock ?? 0;
                return $item;
            });
        return response()->json($data);
    }
}
