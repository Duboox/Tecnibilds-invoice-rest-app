<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateInvoicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('invoices', function (Blueprint $table) {
            $table->increments('id');
            $table->bigInteger('number')->default(000000000);
            $table->integer('customer_id')->unsigned();
            $table->string('title');
            $table->date('date');
            $table->date('due_date');
            $table->integer('status')->default(0);
            $table->integer('iva_percent')->default(0);
            $table->bigInteger('iva')->default(0);
            $table->bigInteger('discount')->default(0);
            $table->bigInteger('sub_total');
            $table->bigInteger('total');
            $table->timestamps();

            $table->foreign('customer_id')
                ->references('id')
                ->on('customers')
                ->onDelete('cascade')
                ->onUpdate('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('invoices');
    }
}
