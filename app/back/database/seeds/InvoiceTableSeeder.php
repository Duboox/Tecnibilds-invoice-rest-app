<?php

use Illuminate\Database\Seeder;
use Faker\Factory; // Faker
use Tbappback\Invoice; // DB Model
use Tbappback\InvoiceItem; // DB Model

class InvoiceTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Factory::create(); // Create a instance of the faker/factory

        Invoice::truncate(); // Deletes al rows in DB
        InvoiceItem::truncate(); // Deletes al rows in DB

        /* Create 1->25 Invoice's */
        foreach (range(1, 25) as $i) {

            $discount = $faker->numberBetween(0, 100); // $discount = 54
            $subTotal = $faker->numberBetween(500, 1000); // $subTotal = 756

            /* Create 25 Invoice */
            $invoice = Invoice::create([
                'customer_id' => Tbappback\Customer::all()->random()->id,
                'title' => $faker->sentence,
                'date' => '2017-'.mt_rand(1, 12).'-'.mt_rand(1, 28), // Math Random
                'due_date' => '2017-'.mt_rand(1, 12).'-'.mt_rand(1, 28), // Math Random
                'discount' => $discount,
                'sub_total' => $subTotal,
                'total' => $subTotal - $discount // 756 - 54
            ]);

            /* Create 2-6 Items Per Invoice  */
            foreach (range(1, mt_rand(2,6)) as $j) {
                InvoiceItem::create([
                    'invoice_id' => $invoice->id,
                    'product_id' => Tbappback\Product::all()->random()->id,
                    'qty' => $faker->numberBetween(1, 7),
                ]);
            }
        }
    }
}
