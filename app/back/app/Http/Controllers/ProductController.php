<?php

namespace Tbappback\Http\Controllers;

use Illuminate\Http\Request;
use Tbappback\Product;
use Tbappback\User;
use Carbon\Carbon;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::with('user')->get();
        return response()
            ->json([
                'model' => $products
            ]);
    }

    public function show($id)
    {
        $product = Product::findOrFail($id);
        $product->created_at->diffForHumans();

        return response()
            ->json([
                'model' => $product
            ]);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'user_id' => 'required',
            'cod' => 'required',
            'name' => 'required',
            'description' => 'required',
            'unit_price' => 'required',
        ]);

        $product = Product::create($request->all());

        return response()
            ->json([
                'saved' => true
            ]);
    }

    public function destroy($id)
    {
        $product = Product::findOrFail($id);

        $product->delete();

        return response()
            ->json([
                'deleted' => true
            ]);
    }
}
