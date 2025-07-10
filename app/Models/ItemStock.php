<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Traits\RegistersUserEvents;

class ItemStock extends Model
{
    use HasFactory, RegistersUserEvents, SoftDeletes;

    protected $dates = ['deleted_at'];

    protected $fillable = [
        'branch_id',
        'item_id',
        'quantity',
        'stock',
        'type',
        'observation',

        'registerUser_id',
        'registerRole',
        'deleted_at',
        'deleteUser_id',
        'deleteRole',
        'deleteObservation',
    ];

    public function item()
    {
        return $this->belongsTo(Item::class, 'itemSale_id')->withTrashed();
    }
    public function register()
    {
        return $this->belongsTo(User::class, 'registerUser_id');
    }

}
