<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\RegistersUserEvents;

class Cashier extends Model
{
    use HasFactory, SoftDeletes, RegistersUserEvents;

    protected $dates = ['deleted_at'];

    protected $fillable = [
        'branch_id',
        'user_id',
        'title',
        'observation',
        'status',
        'open_at',
        'closed_at',
        'closeUser_id',

        'registerUser_id',
        'registerRole',
        'deleted_at',
        'deleteUser_id',
        'deleteRole',
        'deleteObservation'
    ];


    public function userCashier()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function registerCashier()
    {
        return $this->belongsTo(User::class, 'registerUser_id');
    }

    public function cashierMovements()
    {
        return $this->hasMany(CashierMovement::class, 'cashier_id');
    }

    public function cashierDetails()
    {
        return $this->hasMany(CashierDetail::class, 'cashier_id');
    }


    // Para poder obtener el primer registro
    public function cashierDetailsOne(){
        return $this->hasOne(CashierDetail::class, 'cashier_id');
    }


 
}
