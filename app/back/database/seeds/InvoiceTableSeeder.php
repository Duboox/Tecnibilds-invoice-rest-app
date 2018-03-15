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

     //   Invoice::delete(); // Deletes al rows in DB
      //  InvoiceItem::delete(); // Deletes al rows in DB

        /* Create 1->25 Invoice's */
        foreach (range(1, 3) as $i) {

            $discount = $faker->numberBetween(0, 100); // $discount = 54
            $subTotal = $faker->numberBetween(500, 1000); // $subTotal = 756

            $iva_percent = $faker->numberBetween(10, 12); // $iva_percent = 12
            $iva = ($subTotal * $iva_percent) / 100;

            /* Create 25 Invoice */
            $invoice = Invoice::create([
                'customer_id' => Tbappback\Customer::all()->random()->id,
                'number' => $faker->numberBetween(0, 9999999),
                'title' => $faker->sentence,
                'date' => '2017-'.mt_rand(1, 12).'-'.mt_rand(1, 28), // Math Random
                'due_date' => '2017-'.mt_rand(1, 12).'-'.mt_rand(1, 28), // Math Random
                'status' => $faker->numberBetween(0, 3),
                'iva_percent' => $iva_percent,
                'iva' => $iva,
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
