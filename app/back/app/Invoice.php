<?php

namespace Tbappback;

use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    protected $fillable = [
        'customer_id', 'title', 'date', 'due_date', 'discount',
        'sub_total', 'total'
    ];

    public static function initialize() // when the instance is initialized
    {                                   // default form info is loaded
        return [
            'customer_id' => 'Select',
            'title' => 'Invoice for ',
            'date' => date('Y-m-d'),
            'due_date' => null,
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
