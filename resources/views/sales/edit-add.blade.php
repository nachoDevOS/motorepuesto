@extends('voyager::master')

@section('page_title', 'Añadir Venta')

@section('page_header')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-body" style="padding: 0px">
                        <div class="col-md-8" style="padding: 0px">
                            <h1 class="page-title">
                                <i class="fa-solid fa-cart-shopping"></i> Añadir Venta
                            </h1>
                        </div>
                        <div class="col-md-4 text-right" style="margin-top: 30px">
                            <a href="{{ route('sales.index') }}" class="btn btn-warning">
                                <i class="voyager-plus"></i> <span>Volver</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop

@section('content')
    <div class="page-content edit-add container-fluid">
        <form id="form-sale" action="{{ route('sales.store') }}" method="post">
            @csrf
            <div class="row">
                @if (setting('ventas.cashier_required') && !$cashier)
                    <div class="col-md-12" style="margin-bottom: 5px">
                        <div class="panel panel-bordered" style="border-left: 5px solid #CB4335">
                            <div class="panel-body" style="padding: 10px">
                                <div class="col-md-12">
                                    <h5 class="text-danger">Advertencia</h5>
                                    <h4>Debe abrir caja antes de registrar ventas. &nbsp; <a href="{{ route('cashiers.create') }}?redirect=admin/sales/create" class="btn btn-success">Abrir ahora <i class="voyager-plus"></i></a></h4>
                                </div>
                            </div>
                        </div>
                    </div>
                @endif
                <div class="col-md-8">
                    <div class="panel panel-bordered">
                        <div class="panel-body">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label for="product_id">Buscar producto</label>
                                    <select class="form-control" id="select-product_id"></select>
                                </div>
                            </div>
                            <div class="col-md-12" style="height: 800px; max-height: 400px; overflow-y: auto">
                                <div class="table-responsive">
                                    <table id="dataTable" class="table table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th style="width: 30px">N&deg;</th>
                                                <th>Detalles</th>
                                                <th style="text-align: center; width:15%">Precio</th>
                                                <th style="text-align: center; width:12%">Cantidad</th>
                                                <th style="text-align: center; width:10%">Subtotal</th>
                                                <th style="width: 30px"></th>
                                            </tr>
                                        </thead>
                                        <tbody id="table-body">
                                            <tr id="tr-empty">
                                                <td colspan="6" style="height: 320px">
                                                    <h4 class="text-center text-muted" style="margin-top: 50px">
                                                        <i class="glyphicon glyphicon-shopping-cart" style="font-size: 50px"></i> <br><br>
                                                        Lista de venta vacía
                                                    </h4>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="form-group col-md-12">
                                <textarea name="observation" class="form-control" rows="2" placeholder="Observaciones"></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="panel panel-bordered">
                        <div class="panel-body" style="padding: 10px 0px">
                            
                            <div class="form-group col-md-12">
                                <label for="person_id">Cliente</label>
                                <div class="input-group">
                                    <select name="person_id" id="select-person_id" class="form-control"></select>
                                    <span class="input-group-btn">
                                        <button id="trash-person" class="btn btn-danger" title="Quitar Clientes" data-toggle="modal" style="margin: 0px" type="button">
                                            <i class="voyager-trash"></i>
                                        </button>
                                        <button class="btn btn-primary" title="Nuevo cliente" data-target="#modal-create-person" data-toggle="modal" style="margin: 0px" type="button">
                                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                        </button>
                                    </span>
                                </div>
                            </div>
                            
                            <div class="form-group col-md-12">
                                <label for="date">Tipo</label>
                                <select class="form-control select2" name="typeSale" id="typeSale" onchange="funtion_typeSale()" required>
                                    <option value="" disabled selected>--Selecione una opción--</option>
                                    <option value="Venta">Venta</option>
                                    <option value="Proforma">Proforma</option>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="payment_type">Método de pago</label>
                                <select name="payment_type" id="select-payment_type" class="form-control" required>
                                    <option value="" disabled selected>--Seleccione una opción--</option>
                                    <option value="Efectivo">Efectivo</option>
                                    <option value="Qr">Qr/Transferencia</option>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="date">Monto recibido</label>
                                <input type="number" name="amountReceived" id="amountReceived" style="text-align: right" min="0" value="0" step="0.01" class="form-control" placeholder="Monto recibo Bs." required>
                            </div>

                            <div class="form-group col-md-12">
                                <h3 class="text-right" id="change-message-error" style="display: none;"><small  style="color: red !important">Ingrese un Monto igual o mayor al total de la venta</small></h3>
                                <h3 class="text-right" id="change-message"><small>Cambio: Bs.</small> <b id="change-amount">0.00</b></h3>
                                <h3 class="text-right"><small>Total a cobrar: Bs.</small> <b id="label-total">0.00</b></h3>
                                <input type="hidden" id="amountTotalSale" name="amountTotalSale" value="0">
                                <label class="checkbox-inline">
                                    <input type="checkbox" required>Confirmar registro..!
                                </label>
                            </div>
                            <div class="form-group col-md-12 text-center">
                                <button type="submit" id="btn-submit" class="btn btn-primary btn-block" data-toggle="modal" data-target="#modal-confirm">Registrar <i class="voyager-basket"></i></button>
                                <a href="{{ route('sales.index') }}" >Volver a la lista</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>          
        </form>
    </div>

    {{-- Popup para imprimir el recibo --}}
    <div id="popup-button">
        <div class="col-md-12" style="padding-top: 5px">
            <h4 class="text-muted">Desea imprimir el recibo?</h4>
        </div>
        <div class="col-md-12 text-right">
            <button onclick="javascript:$('#popup-button').fadeOut('fast')" class="btn btn-default">Cerrar</button>
            <a id="btn-print" href="#" target="_blank" title="Imprimir" class="btn btn-danger">Imprimir <i class="glyphicon glyphicon-print"></i></a>
        </div>
    </div>

    {{-- Modal crear cliente --}}
    @include('partials.modal-registerPerson')
@stop

@section('css')
    <style>
        .form-group{
            margin-bottom: 10px !important;
        }
        .label-description{
            cursor: pointer;
        }
        #popup-button {
            position: fixed;
            bottom: 20px;
            right: 20px;
            width: 400px;
            height: 100px;
            background-color: white;
            box-shadow: 5px 5px 15px grey;
            z-index: 1000;

            /* Mostrar/ocultar popup */
            @if(session('sale_id'))
            animation: show-animation 1s;
            @else
            right: -500px;
            @endif
        }

        @keyframes show-animation {
            0% {
                right: -500px;
            }
            100% {
                right: 20px;
            }
        }
    </style>
@endsection

@section('javascript')

    <script src="{{ asset('js/include/person-select.js') }}"></script>
    <script src="{{ asset('js/include/person-register.js') }}"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/locale/es.min.js"></script>



    <script src="{{ asset('vendor/tippy/popper.min.js') }}"></script>
    <script src="{{ asset('vendor/tippy/tippy-bundle.umd.min.js') }}"></script>
    <script>
        document.getElementById('form-sale').addEventListener('submit', function(e) {
            // Validar el formulario manualmente si es necesario
            if(this.checkValidity()) {
                const submitBtn = document.getElementById('btn-submit');
                submitBtn.innerHTML = 'Registrando <i class="voyager-basket"></i>';
                submitBtn.disabled = true;
            }
            // Si no pasa la validación, el formulario no se enviará y el botón no cambiará
        });
    </script>
    <script>
        var productSelected, customerSelected;
 
        $(document).ready(function(){
            $('#select-product_id').select2({
                placeholder: '<i class="fa fa-search"></i> Buscar...',
                escapeMarkup : function(markup) {
                    return markup;
                },
                language: {
                    inputTooShort: function (data) {
                        return `Por favor ingrese ${data.minimum - data.input.length} o más caracteres`;
                    },
                    noResults: function () {
                        return `<i class="far fa-frown"></i> No hay resultados encontrados`;
                    }
                },
                quietMillis: 250,
                minimumInputLength: 2,
                ajax: {
                    url: "{{ url('admin/sales/item/stock/ajax') }}",      

                    processResults: function (data) {
                        let results = [];
                        data.map(data =>{
                            results.push({
                                ...data,
                                disabled: false
                            });
                        });
                        return {
                            results
                        };
                    },
                    cache: true
                },
                templateResult: formatResultProducts,
                templateSelection: (opt) => {
                    productSelected = opt;
                    return opt.name;
                }
            }).change(function(){

                if($('#select-product_id option:selected').val()){
                    let product = productSelected;
                    // alert(product.id)
                    let image = "{{ asset('images/default.jpg') }}";
                    if(product.image){
                        image = "{{ asset('storage') }}/"+product.image.replace('.', '-medium.');
                    }
                    if($('.table').find(`#tr-item-${product.id}`).val() === undefined){
                        $('#table-body').append(`
                            <tr class="tr-item" id="tr-item-${product.id}">
                                <td class="td-item"></td>
                                <td>
                                    <input type="hidden" name="products[${product.id}][id]" value="${product.id}"/>
                                    <div style="display: flex; align-items: center;">
                                        <div style="margin-right: 15px; flex-shrink: 0;">
                                            <img src="${image}" width="60px" style="border-radius: 4px;"/>
                                        </div>
                                        <div style="flex-grow: 1;">
                                            <div style="font-size: 14px; font-weight: bold; margin-bottom: 1px;">${product.name}</div>
                                            <div style="margin-bottom: 0px;"><small>Categoría: ${product.category.name}</small></div>
                                            <div style="color: #666;"><b>Marca/Motocicleta:</b> ${product.brand.name}</div>
                                        </div>
                                    </div>
                                </td>
                                <td width="100px" style="vertical-align: middle;">
                                    <input type="number" name="products[${product.id}][price]" step="0.1" min="0.5" style="text-align: right" class="form-control" id="input-price-${product.id}" value="${product.price}" onkeyup="getSubtotal(${product.id})" onchange="getSubtotal(${product.id})" required/>
                                </td>
                                <td width="100px" style="vertical-align: middle;">
                                    <input type="number" name="products[${product.id}][quantity]" step="1" min="1" style="text-align: right" class="form-control" id="input-quantity-${product.id}" value="1" max="${product.total_stock}" onkeyup="getSubtotal(${product.id})" onchange="getSubtotal(${product.id})" required/>
                                </td>

                                <td width="120px" class="text-right">
                                    <input type="hidden" name="products[${product.id}][subtotal]" id="subTotal-${product.id}" />
                                    <h4 class="label-subtotal" id="label-subtotal-${product.id}">${product.price}</h4>
                                </td>
                                <td width="50px" class="text-right" style="vertical-align: middle;">
                                    <button type="button" onclick="removeTr(${product.id})" class="btn btn-link">
                                        <i class="voyager-trash text-danger"></i>
                                    </button>
                                </td>
                            </tr>
                        `);

                        setNumber();
                        getSubtotal(product.id);

                        $(`#select-price-${product.id}`).select2({tags: true});
                        
                        
                        toastr.success(`+1 ${product.name}`, 'Producto agregado');
                    }else{
                        toastr.info('EL producto ya está agregado', 'Información')
                    }

                    $('#select-product_id').val('').trigger('change');
                }
            });
            $('#form-sale').submit(function(e){
                $('.btn-confirm').val('Guardando...');
                $('.btn-confirm').attr('disabled', true);
            });
        });

        $('#amountReceived').on('click', function () {
            $('#amountReceived').val('');
        });

        $('#amountReceived').on('change keyup', function() {
            calculateChange();
        });

        function getSubtotal(id){
            let price = $(`#input-price-${id}`).val() ? parseFloat($(`#input-price-${id}`).val()) : 0;
            let quantity = $(`#input-quantity-${id}`).val() ? parseFloat($(`#input-quantity-${id}`).val()) : 0;

            $(`#label-subtotal-${id}`).text((price * quantity).toFixed(2));
            $(`#subTotal-${id}`).val((price * quantity).toFixed(2));

            getTotal();
        }

        function funtion_typeSale() {
            let typeSale = $('#typeSale').val();
            $('#amountReceived').attr('readonly', typeSale=='Venta'?false:true);
            $('#select-payment_type').attr('readonly', typeSale=='Venta'?false:true);
            // getTotal();
        }

        function getTotal(){
            let total = 0;
            // let discount = $('#input-discount').val() ? parseFloat($('#input-discount').val()) : 0;
            $(".label-subtotal").each(function(index) {
                total += parseFloat($(this).text());
            });
            $('#amountReceived').attr('min', total.toFixed(2));
            $('#amountReceived').val((total).toFixed(2));


            $('#label-total').text((total).toFixed(2));
            $('#amountTotalSale').val((total).toFixed(2));

            calculateChange();
        }

        // Función para calcular y mostrar el cambio
        function calculateChange() {
            const amountReceived = parseFloat($('#amountReceived').val()) || 0;
            const total = parseFloat($('#amountTotalSale').val()) || 0;
            const change = amountReceived - total;
            
            if (amountReceived >= total) {
                $('#change-message-error').hide();
                $('#change-amount').text(change.toFixed(2));
            }
            else {
                $('#change-message-error').show();
                $('#change-amount').text(0);
            }
        }

        function setNumber(){

            var length = 0;
            $(".td-item").each(function(index) {
                $(this).text(index +1);
                length++;
            });

            if(length > 0){
                $('#tr-empty').css('display', 'none');
            }else{
                $('#tr-empty').fadeIn('fast');
            }
        }
        function removeTr(id){
            $(`#tr-item-${id}`).remove();
            $('#select-product_id').val("").trigger("change");
            setNumber();
            getTotal();

            toastr.info('Producto eliminado del carrito', 'Eliminado');

        }

        function formatResultProducts(option){
            // Si está cargando mostrar texto de carga
            if (option.loading) {
                return '<span class="text-center"><i class="fas fa-spinner fa-spin"></i> Buscando...</span>';
            }
            let image = window.defaultImage;
            if(option.image){
                image = "{{ asset('storage') }}/"+option.image.replace('.', '-cropped.');
            }

            // Mostrar las opciones encontradas
            return $(`  <div style="display: flex">
                            <div style="margin: 0px 10px">
                                <img src="${image}" width="60px" />
                            </div>
                            <div>
                                <b style="font-size: 15px">${option.name}&nbsp&nbsp|&nbsp&nbsp<small>Bs. ${option.price} c/u</small>&nbsp&nbsp|&nbsp&nbsp<small>Stock. ${option.total_stock}</small></b><br>
                                <span style="font-size: 13px"><b>Categoría</b>: ${option.category.name}</span><br>
                                <span style="font-size: 13px"><b>Marca/Motocicleta</b>: ${option.brand.name}</span><br>
                            </div>
                        </div>`);
        }

        $('#trash-person').on('click', function () {
            $('#input-dni').val('');
            $('#select-person_id').val('').trigger('change');
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "newestOnTop": false,
                "progressBar": true,
                "positionClass": "toast-bottom-right",
                "preventDuplicates": false,
                "onclick": null,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "1000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            };
            
            toastr.success('Cliente eliminado', 'Eliminado');
        });
    </script>
@stop
