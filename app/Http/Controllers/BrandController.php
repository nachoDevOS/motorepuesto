<?php

namespace App\Http\Controllers;

use App\Models\Brand;
use Illuminate\Http\Request;

class BrandController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }

    public function index()
    {
        $this->custom_authorize('browse_brands');

        return view('parameters.brands.browse');
    }

    public function list(){

        $search = request('search') ?? null;
        $paginate = request('paginate') ?? 10;

        $data = Brand::where(function($query) use ($search){
                            $query->OrWhereRaw($search ? "id = '$search'" : 1)
                            ->OrWhereRaw($search ? "name like '%$search%'" : 1)
                            ->OrWhereRaw($search ? "observation like '%$search%'" : 1);
                        })
                        ->where('deleted_at', NULL)
                        ->orderBy('id', 'DESC')->paginate($paginate);

        return view('parameters.brands.list', compact('data'));
    }
    
}
