<?php

namespace Tbappback;

use Illuminate\Database\Eloquent\Model;

class Post extends Model
{
    protected $fillable = [
        'user_id', 'content', 'image', 'video'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function postComments()
    {
        return $this->hasMany(PostComment::class);
    }

    public function likes()
    {
        return $this->hasMany(Like::class);
    }
}
