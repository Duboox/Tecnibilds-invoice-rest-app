<?php

namespace Tbappback;

use Illuminate\Database\Eloquent\Model;

class Provider extends Model
{
    protected $fillable = [
        'name', 'last_name', 'picture', 'company', 'address', 'phone', 'gender', 'email'
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
        ];
    }
}
