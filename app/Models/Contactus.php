<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Contactus extends Model
{
    use HasFactory;
    protected $table = 'contactus';

    protected $fillable = [
        'name',
        'email',
        'subject',
        'message',

    ];
    public function user()
    {
        return $this->belongsTo(User::class);
    }
      // Optional: Explicitly specify date attributes
      protected $dates = [
        'created_at',
        'updated_at',
    ];
}
