<?php

namespace Tbappback;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    protected $fillable = [
        'name', 'last_name', 'picture', 'company', 'address', 'phone', 'gender', 'email', 'position'
    ];

    public static function initialize()
    {
        return [
            'name' => '',
            'last_name' => '',
            'picture' => '',
            'company' => '',
            'address' => '',
            'phone' => '',
            'gender' => '',
            'email' => '',
            'position' => '',
            'salary' => '',
        ];
    }
}
