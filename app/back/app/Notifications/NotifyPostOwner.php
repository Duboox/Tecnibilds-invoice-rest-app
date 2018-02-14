<?php

namespace Tbappback\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Notification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Messages\BroadcastMessage;
use Tbappback\Post;

class NotifyPostOwner extends Notification
{
    use Queueable;

    public $post;
    public $userComm;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct(Post $post, $userComm)
    {
        $this->post = $post;
         $this->userComm = $userComm;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['database', 'broadcast'];
    }

    public function toDatabase($notifiable)
    {
        return [
            'post' => $this->post,
            'userComm' => $this->userComm,
            'header' => ' Ha comentado tu post!'
            /* 'comment' => $this->postComment */
        ];
    }

    public function toBroadcast($notifiable)
    {
        return new BroadcastMessage([
            'post' => $this->post,
           /* 'comment' => $this->postComment */
        ]);
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            //
        ];
    }
}
