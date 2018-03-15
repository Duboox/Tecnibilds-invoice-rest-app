<?php

use Illuminate\Database\Seeder;
use Faker\Factory; // Faker
use Tbappback\ChatMessage; // DB Model

use Illuminate\Support\Facades\DB; // class for truncate(delete)

class ChatMessageTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Factory::create(); // Create a instance of the faker/factory

       // DB::table('chat_messages')->delete();

       // ChatMessage::truncate(); // Deletes al rows in DB

        foreach (range(1, 2) as $i) {
            ChatMessage::create([
                'user_id' => Tbappback\User::all()->random()->id,
                'message' => $faker->sentence,
            ]);
        }
    }
}
