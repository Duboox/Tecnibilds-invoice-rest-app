<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/* usar el middleware Auth:api para otros request */
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::group(['middleware' => 'auth:api'], function () {
    /* App Resource Routes */
    Route::resource('users', 'UserController');
    Route::resource('dashboard', 'DashboardController');
    Route::resource('message', 'ChatMessageController');
    Route::resource('product', 'ProductController');
    Route::resource('invoice', 'InvoiceController');
    Route::resource('employee', 'EmployeeController');
    Route::resource('customer', 'CustomerController');

});

// Testing Route Json   :: En http-> api/test
Route::get('/test', function () {
    return response()->json([
        'user' => [
            'first-name' => 'Joshua',
            'last-name' => 'Martinez'
        ]
    ]);
});