<?php

use Illuminate\Database\Seeder;

use Tbappback\Post; // DB Model
use Tbappback\PostComment; // DB Model
use Tbappback\Like; // DB Model
use Tbappback\User; // DB Model


class LikeTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Like::truncate(); // Deletes al rows in DB

        /* Create 1->25 Like per Post */
        foreach (range(1, 25) as $i) {
            Like::create([
                'user_id' => User::all()->random()->id,
                'post_id' => Post::all()->random()->id,
                'comment_id' => null
            ]);
        }

        /* Create 1->25 Like per Comment */
        foreach (range(1, 25) as $i) {
            Like::create([
                'user_id' => User::all()->random()->id,
                'post_id' => null,
                'comment_id' => PostComment::all()->random()->id
            ]);
        }
    }
}
