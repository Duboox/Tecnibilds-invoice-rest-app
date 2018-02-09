<?php

namespace Tbappback;

use Illuminate\Database\Eloquent\Model;

class InvoiceItem extends Model
{
    protected $fillable = [
        'qty', 'product_id'
    ];

    public static function initialize()
    {
        return [
            'product_id' => '',
            'qty' => '',
        ];
    }

    public function products()
    {
        return $this->hasMany(Product::class);
    }
}
