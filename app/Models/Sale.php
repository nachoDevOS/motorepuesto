<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\RegistersUserEvents;

class Sale extends Model
{
    use HasFactory, RegistersUserEvents, SoftDeletes;

    protected $dates = ['deleted_at'];

    protected $fillable = [
        'cashier_id',
        'person_id',
        'branch_id',
        'code',
        'typeSale',
        'amountReceived',
        'amountChange',
        'amount',
        'observation',
        'dateSale',
        'status',

        'registerUser_id',
        'registerRole',
        'deleted_at',
        'deleteUser_id',
        'deleteRole',
        'deleteObservation',
    ];

    public function person()
    {
        return $this->belongsTo(Person::class, 'person_id')->withTrashed();
    }

    public function cashier()
    {
        return $this->belongsTo(Cashier::class, 'cashier_id')->withTrashed();
    }
    public function branch()
    {
        return $this->belongsTo(Branch::class, 'branch_id')->withTrashed();
    }

    public function register()
    {
        return $this->belongsTo(User::class, 'registerUser_id')->withTrashed();
    }

    public function saleDetails()
    {
        return $this->hasMany(SaleDetail::class, 'sale_id');
    }
}
