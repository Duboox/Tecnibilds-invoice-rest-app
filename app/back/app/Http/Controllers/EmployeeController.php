<?php

namespace Tbappback\Http\Controllers;

use Illuminate\Http\Request;
use Tbappback\Employee;
use Carbon\Carbon;

class EmployeeController extends Controller
{
    public function index()
    {
        $employees = Employee::all();
        return response()
            ->json([
                'model' => $employees
            ]);
    }

    public function show($id)
    {
        $employee = Employee::findOrFail($id);
        $employee->created_at->diffForHumans();

        return response()
            ->json([
                'model' => $employee
            ]);
    }
}
