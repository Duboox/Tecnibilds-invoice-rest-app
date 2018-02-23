<?php

namespace Tbappback\Http\Controllers;

use Illuminate\Http\Request;
use Tbappback\ChatMessage;
use Tbappback\User;
use Carbon\Carbon;

use Tbappback\Events\ChatMessagePosted;

class ChatMessageController extends Controller
{
    public function chatMessagePosted($chatMessageId)
    {
        $chatMessage = ChatMessage::findOrFail($chatMessageId);
        $user = User::findOrFail($chatMessage->user_id);

        event(new ChatMessagePosted($chatMessage, $user));
    }

    public function index()
    {
       $chatMessagesExpired = ChatMessage::where('created_at', '<=', Carbon::now()->subDays(365));
        $chatMessagesExpired->delete();

        $chatMessages = ChatMessage::with('user')->get();
        /* foreach ($chatMessages as $chatMessage) {
            $chatMessage->created_at->diffForHumans();
        } */
        return response()
            ->json([
                'model' => $chatMessages
            ]);
    }

    public function show($id)
    {
        $chatMessages = ChatMessage::findOrFail($id);
        $chatMessages->created_at->diffForHumans();

        return response()
            ->json([
                'model' => $chatMessages
            ]);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'user_id' => 'required',
            'message' => 'required',
        ]);

        $message = ChatMessage::create($request->all());

        $this->chatMessagePosted($message->id);

        return response()
            ->json([
                'saved' => true
            ]);
    }
}
