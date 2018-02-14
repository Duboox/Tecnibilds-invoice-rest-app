<?php

namespace Tbappback\Http\Controllers;

use Illuminate\Http\Request;
use Tbappback\Notifications\NotifyPostOwner;
use Tbappback\PostComment;
use Tbappback\Post;
use Tbappback\User;

class PostCommentsController extends Controller
{
    public function store(Request $request)
    {
        $this->validate($request, [
            'post_id' => 'required',
            'user_id' => 'required',
            'content' => 'required',
        ]);
        $postComment = PostComment::create($request->all());

        /* NOTIFY USER */
        $post = Post::findOrFail($request->post_id);
        $userComm = User::findOrFail($request->user_id);

        User::findOrFail($post->user->id)->Notify(new NotifyPostOwner($post, $userComm));

        return response()
            ->json([
                'saved' => true
            ]);
    }
}
