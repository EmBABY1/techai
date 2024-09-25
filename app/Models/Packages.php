<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Packages extends Model
{
    protected $fillable = [
        'name',
        'duration',
        'price',
        'description',
        'property2',
        'property3',
        'property4',

    ];
    public function myPlans()
    {
        return $this->hasMany(MyPlan::class);
    }
    use HasFactory;
}