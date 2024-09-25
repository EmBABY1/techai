<?php

namespace App\Models;

use App\Models\User;
use App\Models\Packages;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Subscription extends Model
{
    protected $fillable = [
        'from_date',
        'to_date',
        'package_id',
        'user_id',
    ];
    use HasFactory;
    public function financial()
    {
        return $this->belongsTo(Financial::class, 'package_id');
    }
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function package()
    {
        return $this->belongsTo(Packages::class);
    }
    public function myPlans()
    {
        return $this->hasMany(MyPlan::class);
    }

// Usage in your controller or elsewhere

}
