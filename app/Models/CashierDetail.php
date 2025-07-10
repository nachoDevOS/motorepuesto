<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\RegistersUserEvents;

class CashierDetail extends Model
{
    use HasFactory, SoftDeletes, RegistersUserEvents;

    protected $dates = ['deleted_at'];

    protected $fillable = [
        'cashier_id',
        'cashierMovement_id',
        'type',
        'status',

        'registerUser_id',
        'registerRole',
        'deleted_at',
        'deleteUser_id',
        'deleteRole',
        'deleteObservation',
    ];

    public function cashier()
    {
        return $this->belongsTo(Cashier::class, 'cashier_id');
    }

    public function cashierDetailCashes()
    {
        return $this->hasMany(CashierDetailCash::class, 'cashierDetail_id');
    }


    // public function cashierMovement()
    // {
    //     return $this->belongsTo(CashierMovement::class, 'cashierMovement_id');
    // }


}
