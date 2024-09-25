<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Myplan extends Model
{
    protected $table = "myplans";
    use HasFactory;
    protected $fillable = [
        'subscription_id',
        'package_id',
        'user_id',
        'package_name',
        'duration',
        'property2',
        'property3',
        'property4',
        'from_date',
        'to_date',
    ];
    public function subscription()
    {
        return $this->belongsTo(Subscription::class);
    }
    public function package()
    {
        return $this->belongsTo(Package::class);
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }
}