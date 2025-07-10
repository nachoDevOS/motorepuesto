<?php

namespace App\Http\Controllers;

use App\Models\Item;
use Illuminate\Http\Request;

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

    public function list()
    {
        return view('sales.list');
    }

    public function create()
    {
        $this->custom_authorize('add_sales');
        return view('sales.edit-add');
    }
}
