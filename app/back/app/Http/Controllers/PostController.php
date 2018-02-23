<?php

namespace Tbappback\Http\Controllers;

use Illuminate\Http\Request;

use Tbappback\User;
use Tbappback\Post;
use Tbappback\PostComment;
use Tbappback\Like;

class PostController extends Controller
{
    public function index()
    {
        /* Get user posts */
        $posts = Post::all()->get();
    }

    /* Create user Post */
    public function store(Request $request) {
        $this->validate($request, [
            'title' => 'required',
            'content' => 'required',
            'user_id' => 'required',
        ]);

        $post = Post::create($request->all());

        return response()
            ->json([
                'saved' => true
            ]);
    }

    /* Post Like*/
    public function postLike(Request $request)
    {
        $post_id = $request->input('post-id');
        $user_id = (Auth::user()->id);

        $like = new Like;
        $like->post_id = ($post_id);
        $like->user_id = ($user_id);
        $like->save();

        return back();
    }

    /* Create Comment */
    public function createComment(Request $request)
    {
        $user_id = (Auth::user()->id);
        $content = $request->input('comment');
        $post_id = $request->input('post-id');

        $comment = new Comment;
        $comment->user_id = ($user_id);
        $comment->post_id = ($post_id);
        $comment->content = ($content);
        $comment->save();

        return back();
    }
}
