<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('sales', function (Blueprint $table) {
            $table->id();
            $table->foreignId('cashier_id')->nullable()->constrained('cashiers');
            $table->foreignId('person_id')->nullable()->constrained('people');
            $table->foreignId('branch_id')->nullable()->constrained('branches');

            $table->string('code')->nullable();
            $table->string('typeSale')->nullable(); //Venta, Proforma

            $table->decimal('amountReceived', 10, 2)->nullable(); //monto recivido
            $table->decimal('amountChange', 10, 2)->nullable();//monto de cambio
            $table->decimal('amount', 10, 2)->nullable(); //monto total
            $table->text('observation')->nullable();

            $table->dateTime('dateSale')->nullable();

            $table->string('status')->default('Pendiente');

            $table->timestamps();            
            $table->foreignId('registerUser_id')->nullable()->constrained('users');
            $table->string('registerRole')->nullable();

            $table->softDeletes();
            $table->foreignId('deleteUser_id')->nullable()->constrained('users');
            $table->string('deleteRole')->nullable();
            $table->text('deleteObservation')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('sales');
    }
};
