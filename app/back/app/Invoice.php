<?php

namespace Tbappback;

use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    protected $fillable = [
        'customer_id', 'number', 'title', 'date', 'due_date', 'status',
        'iva_percent', 'iva', 'discount', 'sub_total', 'total'
    ];

    public static function initialize() // when the instance is initialized
    {                                   // default form info is loaded
        return [
            'customer_id' => 'Select',
            'number' => 0000000,
            'title' => 'Invoice for ',
            'date' => date('Y-m-d'),
            'due_date' => null,
            'status' => 0,
            'iva_percent' => 12,
            'iva' => 0,
            'discount' => 0,
            'items' => [ // where 'items' is an array of InvoiceItem
                InvoiceItem::initialize()
            ]
        ];
    }

    public function items()
    {
        return $this->hasMany(InvoiceItem::class);
    }

    public function customer()
    {
        return $this->belongsTo(Customer::class);
    }
}
