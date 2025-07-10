<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\RegistersUserEvents;

class CashierMovement extends Model
{

    use HasFactory, SoftDeletes, RegistersUserEvents;

    protected $dates = ['deleted_at'];

    protected $fillable = [
        'cashier_id',
        'amount',
        'observation',
        'type',
        'status',
        // 'transferCashier_id',

        'registerUser_id',
        'registerRole',
        'deleted_at',
        'deleteUser_id',
        'deleteRole',
        'deleteObservation',
    ];
}
