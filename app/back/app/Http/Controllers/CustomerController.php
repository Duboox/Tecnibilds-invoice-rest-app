<?php

namespace Tbappback\Http\Controllers;

use Illuminate\Http\Request;
use Tbappback\Customer;
use Carbon\Carbon;

class CustomerController extends Controller
{
    public function index()
    {
        $customer = Customer::all();
        return response()
            ->json([
                'model' => $customer
            ]);
    }

    public function show($id)
    {
        $customer = Customer::findOrFail($id);
        $customer->created_at->diffForHumans();

        return response()
            ->json([
                'model' => $customer
            ]);
    }
}
