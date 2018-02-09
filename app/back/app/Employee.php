<?php

namespace Tbappback;

use Illuminate\Database\Eloquent\Model;

class Employee extends Model
{
    protected $fillable = [
        'name', 'last_name', 'picture', 'address', 'phone', 'gender', 'email', 'position', 'salary'
        ];

    public static function initialize()
    {
        return [
            'name' => '',
            'last_name' => '',
            'picture' => '',
            'address' => '',
            'phone' => '',
            'gender' => '',
            'email' => '',
            'position' => '',
            'salary' => '',
        ];
    }
}
