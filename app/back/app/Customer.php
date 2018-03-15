<?php

namespace Tbappback;

use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    protected $fillable = [
        'name', 'last_name', 'picture', 'company', 'rif', 'address', 'phone', 'gender', 'email'
    ];

    public static function initialize()
    {
        return [
            'name' => '',
            'last_name' => '',
            'picture' => '',
            'company' => '',
            'rif' => '',
            'address' => '',
            'phone' => '',
            'gender' => '',
            'email' => '',
        ];
    }

    public function invoices()
    {
        return $this->hasMany(Invoice::class);
    }
}
