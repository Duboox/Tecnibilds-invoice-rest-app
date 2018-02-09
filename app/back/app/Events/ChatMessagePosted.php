<?php

namespace Tbappback\Events;

use Tbappback\ChatMessage;
use Tbappback\User;

use Illuminate\Broadcasting\Channel;
use Illuminate\Queue\SerializesModels;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;

class ChatMessagePosted implements ShouldBroadCast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    /**
     * ChatMessage
     *
     * @var $chatMessage
     */
    public $chatMessage;

    /**
     * User
     *
     * @var $user
     */
    public $user;

    /**
     * Create a new event instance.
     *
     * @return void
     */
    public function __construct(ChatMessage $chatMessage, User $user)
    {
        $this->chatMessage = $chatMessage;
        $this->user = $user;
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return \Illuminate\Broadcasting\Channel|array
     */
    public function broadcastOn()
    {
        return new PresenceChannel('chatRoom');
    }
}
