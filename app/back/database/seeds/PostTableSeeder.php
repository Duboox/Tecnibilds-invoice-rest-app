<?php

use Illuminate\Database\Seeder;

use Faker\Factory; // Faker
use Tbappback\Post; // DB Model
use Tbappback\User; // DB Model
class PostTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Factory::create(); // Create a instance of the faker/factory

       // Post::delete(); // Deletes al rows in DB

        /* Create 1->25 Posts */
        foreach (range(1, 2) as $i) {
            Post::create([
                'user_id' => User::all()->random()->id,
                'content' => $faker->sentence
            ]);
        }
    }
}
