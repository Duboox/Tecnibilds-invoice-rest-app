<?php

namespace Tbappback\Http\Controllers;

use Illuminate\Http\Request;
use Tbappback\User;
use Carbon\Carbon;

class UserController extends Controller
{
    public function index()
    {
        $users = User::all();
        return response()
            ->json([
                'model' => $users
            ]);
    }

    public function show($id)
    {
        $user = User::findOrFail($id);
        Carbon::parse($user->created_at)->diffForHumans();
        $user->created_at->diffForHumans();

        return response()
            ->json([
                'model' => $user
            ]);
    }
}
