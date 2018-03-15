<?php

use Illuminate\Database\Seeder;
use Faker\Factory; // Faker
use Tbappback\Provider; // DB Model

class ProviderTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Factory::create(); // Create a instance of the faker/factory

        // Provider::delete(); // Deletes al rows in DB

        foreach (range(1, 5) as $i) {
            Provider::create([
                'name' => $faker->firstName,
                'last_name' => $faker->lastName,
                'address' => $faker->address,
                'company' => $faker->company,
                'phone' => $faker->phoneNumber,
                'gender' => $faker->randomElement(['male', 'female']),
                'email' => $faker->email,
            ]);
        }
    }
}
