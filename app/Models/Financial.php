<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Financial extends Model
{
    use HasFactory;
    protected $table = 'financial';

    protected $fillable = [
        'package_id',
        'package_name',
        'package_price',
        'no_of_subscriptions',
        'total_price_of_each_package',
        'total_price_of_all_packages',
    ];

    /**
     * Get the subscriptions associated with the financial package.
     */
    public function subscriptions()
    {
        return $this->hasMany(Subscription::class, 'package_id');
    }
}
