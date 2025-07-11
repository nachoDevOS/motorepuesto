<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ErrorController;
use App\Http\Controllers\PersonController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\AjaxController;
use App\Http\Controllers\BrandController;
use App\Http\Controllers\CashierController;
use App\Http\Controllers\ItemController;
use App\Http\Controllers\SaleController;
use App\Models\Item;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/



Route::get('login', function () {
    return redirect('admin/login');
})->name('login');

Route::get('/', function () {
    return redirect('admin');
});

Route::get('/info/{id?}', [ErrorController::class , 'error'])->name('errors');
// Route::get('/development', [ErrorController::class , 'error503'])->name('development');

Route::group(['prefix' => 'admin', 'middleware' => ['loggin', 'system']], function () {
    Voyager::routes();

    // Route::get('cashiers', [CashierController::class, 'index'])->name('cashiers.index');
    Route::resource('cashiers', CashierController::class);
    Route::get('cashiers/list/ajax', [CashierController::class, 'list'])->name('cashiers.list');
    Route::post('cashiers/{cashier}/change/status', [CashierController::class, 'change_status'])->name('cashiers.change.status');//*** Para que los cajeros Acepte o rechase el dinero dado por Boveda o gerente
    Route::get('cashiers/{cashier}/print/open', [CashierController::class, 'print_open'])->name('print.open');



    Route::resource('sales', SaleController::class);
    Route::get('sales/ajax/list', [SaleController::class, 'list']);
    Route::get('sales/item/stock/ajax', [AjaxController::class, 'itemStockList']);//Para obtener los item que hay disponible en el inventario
    Route::get('sales/{id}/prinf', [SaleController::class, 'prinf'])->name('sales.prinf');

    

    Route::get('people', [PersonController::class, 'index'])->name('voyager.people.index');
    Route::get('people/ajax/list', [PersonController::class, 'list']);

    Route::get('brands', [BrandController::class, 'index'])->name('voyager.brands.index');
    Route::get('brands/ajax/list', [BrandController::class, 'list']);

    Route::get('items', [ItemController::class, 'index'])->name('voyager.items.index');
    Route::get('items/ajax/list', [ItemController::class, 'list']);
    Route::get('items/{id}', [ItemController::class, 'show'])->name('voyager.items.show');
    Route::post('items/{id}/stock', [ItemController::class, 'storeStock'])->name('items-stock.store');
    Route::delete('items/{id}/stock/{stock}', [ItemController::class, 'destroyStock'])->name('items-stock.destroy');







    Route::get('users/ajax/list', [UserController::class, 'list']);
    Route::post('users/store', [UserController::class, 'store'])->name('voyager.users.store');
    Route::put('users/{id}', [UserController::class, 'update'])->name('voyager.users.update');
    Route::delete('users/{id}/deleted', [UserController::class, 'destroy'])->name('voyager.users.destroy');



    Route::get('ajax/personList', [AjaxController::class, 'personList']);
    Route::post('ajax/person/store', [AjaxController::class, 'personStore']);

});


// Clear cache
Route::get('/admin/clear-cache', function() {
    Artisan::call('optimize:clear');

    Artisan::call('db:seed', ['--class' => 'UpdateBreadSeeder']);
    Artisan::call('db:seed', ['--class' => 'UpdatePermissionsSeeder']);
    
    return redirect('/admin/profile')->with(['message' => 'Cache eliminada.', 'alert-type' => 'success']);
})->name('clear.cache');