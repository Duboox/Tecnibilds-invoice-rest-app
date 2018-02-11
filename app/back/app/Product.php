<?php

namespace Tbappback;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = [
        'user_id', 'cod', 'name', 'brand', 'rating', 'stock', 'picture', 'description', 'unit_price'
    ];

    public static function initialize()
    {
        return [
            'user_id' => '',
            'cod' => '',
            'name' => '',
            'brand' => '',
            'rating' => '',
            'stock' => '',
            'picture' => '',
            'description' => '',
            'unit_price' => '',
        ];
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
