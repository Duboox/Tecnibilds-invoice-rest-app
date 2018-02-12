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
        $posts = User::class->posts()->get();
    }

    /* Create user Post */
    public function createPost(Request $request)
    {
        $user_id = (Auth::user()->id);
        $post_content = $request->input('post_content');
        $post_image = ("");
        $post_video = ("");

        $post = new Post;
        $post->user_id = ($user_id);
        $post->content = ($post_content);
        $post->image = ($post_image);
        $post->video = ($post_video);
        $post->save();

        return back();
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
