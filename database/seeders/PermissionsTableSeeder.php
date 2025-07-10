<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use TCG\Voyager\Models\Permission;

class PermissionsTableSeeder extends Seeder
{

    /**
     * Auto generated seed file
     *
     * @return void
     */
    public function run()
    {
        

        \DB::table('permissions')->delete();
        
        Permission::firstOrCreate([
            'key'        => 'browse_admin',
            'keyDescription'=>'vista de acceso al sistema',
            'table_name' => 'admin',
            'tableDescription'=>'Panel del Sistema'
        ]);

        $keys = [
            // 'browse_admin',
            'browse_bread',
            'browse_database',
            'browse_media',
            'browse_compass',
            'browse_clear-cache',
        ];

        foreach ($keys as $key) {
            Permission::firstOrCreate([
                'key'        => $key,
                'table_name' => null,
            ]);
        }

        Permission::generateFor('menus');

        Permission::generateFor('roles');
        Permission::generateFor('permissions');
        Permission::generateFor('settings');

        Permission::generateFor('users');


        $permissions = [
            'browse_cashiers' => 'Ver lista de cajas',
            'read_cashiers' => 'Ver detalles de cajas',
            'edit_cashiers' => 'Editar información de cajas',
            'add_cashiers' => 'Agregar nuevas cajas',
            'delete_cashiers' => 'Eliminar cajas',
        ];

        foreach ($permissions as $key => $description) {
            Permission::firstOrCreate([
                'key'        => $key,
                'keyDescription'=> $description,
                'table_name' => 'cashiers',
                'tableDescription'=>'Cajas'
            ]);
        }

        $permissions = [
            'browse_sales' => 'Ver lista de ventas',
            'read_sales' => 'Ver detalles de ventas',
            'edit_sales' => 'Editar información de ventas',
            'add_sales' => 'Agregar nuevas ventas',
            'delete_sales' => 'Eliminar ventas',
        ];

        foreach ($permissions as $key => $description) {
            Permission::firstOrCreate([
                'key'        => $key,
                'keyDescription'=> $description,
                'table_name' => 'sales',
                'tableDescription'=>'Ventas'
            ]);
        }



        // Administracion
        $permissions = [
            'browse_people' => 'Ver lista de personas',
            'read_people' => 'Ver detalles de una persona',
            'edit_people' => 'Editar información de personas',
            'add_people' => 'Agregar nuevas personas',
            'delete_people' => 'Eliminar personas',
        ];

        foreach ($permissions as $key => $description) {
            Permission::firstOrCreate([
                'key'        => $key,
                'keyDescription'=> $description,
                'table_name' => 'people',
                'tableDescription'=>'Personas'
            ]);
        }




        // ##################################################       PARAMETROS      ################################################
        $permissions = [
            'browse_presentations' => 'Ver lista de presentación',
            'read_presentations' => 'Ver detalles de presentación',
            'edit_presentations' => 'Editar información de presentación',
            'add_presentations' => 'Agregar nuevas presentación',
            'delete_presentations' => 'Eliminar presentación',
        ];

        foreach ($permissions as $key => $description) {
            Permission::firstOrCreate([
                'key'        => $key,
                'keyDescription'=> $description,
                'table_name' => 'presentations',
                'tableDescription'=>'Presentación'
            ]);
        }

        $permissions = [
            'browse_categories' => 'Ver lista de categorias',
            'read_categories' => 'Ver detalles de categorias',
            'edit_categories' => 'Editar información de categorias',
            'add_categories' => 'Agregar nuevas categorias',
            'delete_categories' => 'Eliminar categorias',
        ];

        foreach ($permissions as $key => $description) {
            Permission::firstOrCreate([
                'key'        => $key,
                'keyDescription'=> $description,
                'table_name' => 'categories',
                'tableDescription'=>'Categorias'
            ]);
        }

        $permissions = [
            'browse_brands' => 'Ver lista de marcas',
            'read_brands' => 'Ver detalles de marcas',
            'edit_brands' => 'Editar información de marcas',
            'add_brands' => 'Agregar nuevas marcas',
            'delete_brands' => 'Eliminar marcas',
        ];

        foreach ($permissions as $key => $description) {
            Permission::firstOrCreate([
                'key'        => $key,
                'keyDescription'=> $description,
                'table_name' => 'brands',
                'tableDescription'=>'Marcas'
            ]);
        }

        $permissions = [
            'browse_items' => 'Ver lista de accesorios / items',
            'read_items' => 'Ver detalles de accesorios / items',
            'edit_items' => 'Editar información de accesorios / items',
            'add_items' => 'Agregar nuevos accesorios / items',
            'delete_items' => 'Eliminar accesorios / items',
        ];

        foreach ($permissions as $key => $description) {
            Permission::firstOrCreate([
                'key'        => $key,
                'keyDescription'=> $description,
                'table_name' => 'items',
                'tableDescription'=>'Accesorios /Items'
            ]);
        }




        // ##################################################       HERRAMIENTAS      ################################################
        $permissions = [
            'browse_branches' => 'Ver lista de sucursales',
            'read_branches' => 'Ver detalles de sucursales',
            'edit_branches' => 'Editar información de sucursales',
            'add_branches' => 'Agregar nuevas sucursales',
            'delete_branches' => 'Eliminar sucursales',
        ];

        foreach ($permissions as $key => $description) {
            Permission::firstOrCreate([
                'key'        => $key,
                'keyDescription'=> $description,
                'table_name' => 'branches',
                'tableDescription'=>'Sucursales'
            ]);
        }




     



        
        
    }
}