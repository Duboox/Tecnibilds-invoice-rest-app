<?php

use Illuminate\Database\Seeder;
use Faker\Factory; // Faker
use Tbappback\Product; // DB Model

class ProductTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Factory::create(); // Create a instance of the faker/factory

        Product::truncate(); // Deletes al rows in DB

        foreach (range(1, 4) as $i) {
            Product::create([
                'user_id' => Tbappback\User::all()->random()->id,
                'cod' => $faker->ean8,
                'name' => $faker->firstName,
                'brand' => $faker->company,
                'rating' => $faker->numberBetween(1, 5),
                'stock' => $faker->numberBetween(1, 1000),
                'description' => $faker->sentence,
                'unit_price' => $faker->numberBetween(100, 400)
            ]);
        }
    }
}
