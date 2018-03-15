<?php

use Illuminate\Database\Seeder;

use Faker\Factory; // Faker
use Tbappback\Post; // DB Model
use Tbappback\PostComment; // DB Model
use Tbappback\User; // DB Model

class Post_CommentsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Factory::create(); // Create a instance of the faker/factory

       // PostComment::delete(); // Deletes al rows in DB

        /* Create 1->25 Posts */
        foreach (range(1, 3) as $i) {
            PostComment::create([
                'post_id' => Post::all()->random()->id,
                'user_id' => User::all()->random()->id,
                'content' => $faker->sentence
            ]);
        }
    }
}
