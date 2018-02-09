<?php

use Illuminate\Database\Seeder;
use Faker\Factory; // Faker
use Tbappback\Employee; // DB Model

class EmployeeTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Factory::create(); // Create a instance of the faker/factory

        Employee::truncate(); // Deletes al rows in DB

        foreach (range(1, 20) as $i) {
            Employee::create([
                'name' => $faker->firstName,
                'last_name' => $faker->lastName,
                'address' => $faker->address,
                'phone' => $faker->phoneNumber,
                'gender' => $faker->randomElement(['male', 'female']),
                'email' => $faker->email,
                'position' => $faker->jobTitle,
                'salary' => $faker->numberBetween(100, 1000),
            ]);
        }
    }
}
