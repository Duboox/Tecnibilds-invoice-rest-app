<?php

use Illuminate\Database\Seeder;
use Faker\Factory; // Faker
use Tbappback\User; // DB Model

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Factory::create(); // Create a instance of the faker/factory

        User::truncate(); // Deletes al rows in DB

        /* Create 1->25 User's */
        static $password;
        foreach (range(1, 15) as $i) {
            User::create([
                'name' => $faker->name,
                'email' => $faker->unique()->safeEmail,
                'password' => $password ?: $password = bcrypt('secret'),
                'remember_token' => str_random(10),
            ]);
        }
    }
}
