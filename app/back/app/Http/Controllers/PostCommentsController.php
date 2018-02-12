<?php

namespace Tbappback\Http\Controllers;

use Illuminate\Http\Request;
use Tbappback\PostComment;

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

        return response()
            ->json([
                'saved' => true
            ]);
    }
}
