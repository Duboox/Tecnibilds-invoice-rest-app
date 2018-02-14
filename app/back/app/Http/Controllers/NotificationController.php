<?php

namespace Tbappback\Http\Controllers;

use Illuminate\Http\Request;
use Tbappback\Notification;
use Tbappback\User;

class NotificationController extends Controller
{
    public function show($id)
    {
        $user = User::findOrFail($id);

        $userNotifications = $user->unreadNotifications()->get();
        return response()
            ->json([
                'notifications' => $userNotifications,
            ]);
    }

    public function destroy($id)
    {
        $user = User::findOrFail($id);

        $userNotifications = $user->notifications();
        return response()
            ->json([
                'deleted' => true
            ]);
    }
}
