<?php

namespace Tbappback\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;

use Tbappback\User;
use Tbappback\Invoice;
use Tbappback\Product;
use Tbappback\Employee;

class DashboardController extends Controller
{
    public function index()
    {
        $totalUsers = count(User::all());
        $newUsersWeek = count(User::where('created_at', '>=', Carbon::now()->subWeek())->get());

        $totalSales = count(Invoice::all());
        $newSalesWeek = count(Invoice::where('created_at', '>=', Carbon::now()->subWeek())->get());

        return response()
            ->json([
                'analytics' => [
                    'users' => [
                        'totalUsers' => $totalUsers,
                        'newUsers' => $newUsersWeek
                    ],
                    'sales' => [
                        'totalSales' => $totalSales,
                        'newSales' => $newSalesWeek
                    ]
                ],
            ]);
    }
}
