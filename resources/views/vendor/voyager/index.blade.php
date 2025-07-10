@extends('voyager::master')

@section('page_header')
    <div class="page-content container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <h2>Hola, {{ Auth::user()->name }}</h2>
                            </div>                        
                        </div>                        
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop

@section('content')
    @php
        $meses = array('', 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre');       
    @endphp
    
    <div class="page-content container-fluid">
        @include('voyager::alerts')
        @include('voyager::dimmers')


        @php
            $cashier = \App\Models\Cashier::with(['cashierMovements' => function($q){
                $q->where('deleted_at', NULL);
            },'cashierDetails' => function($q){
                $q->where('deleted_at', NULL)
                ->where('type', 'Apertura')
                ->with(['cashierDetailCashes']);
            }, 'cashierDetailsOne'])
            ->where('user_id', Auth::user()->id)
            ->where('status', '<>', 'cerrada')
            ->where('deleted_at', NULL)
            ->first();            
        @endphp


        @if ($cashier)
            @if ($cashier->status == 'Apertura Pendiente')
                <div class="row" id="rowCashierOpen">
                    <div class="col-md-12">
                        <div class="panel panel-bordered">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h2 id="h2"><i class="fa-solid fa-wallet"></i> {{ $cashier->title }}</h2>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6" style="margin-top: 50px">
                                        <table class="table table-hover" id="dataTable">
                                            <thead>
                                                <tr>
                                                    <th style="text-align: center">Corte</th>
                                                    <th style="text-align: center">Cantidad</th>
                                                    <th style="text-align: center">Sub Total</th>
                                                </tr>
                                            </thead>
                                            @php
                                                $cash = ['200', '100', '50', '20', '10', '5', '2', '1', '0.5', '0.2', '0.1'];
                                                $totalBill = 0;
                                                $totalCash = 0;
                                            @endphp
                                            <tbody>
                                                @foreach ($cash as $item)
                                                <tr>
                                                    <td><h4 style="margin: 0px"><img src=" {{ url('images/cash/'.$item.'.jpg') }} " alt="{{ $item }} Bs." width="70px"> {{ $item }} Bs. </h4></td>
                                                    <td style="text-align: right">
                                                        @php
                                                            $details = null;
                                                            if($cashier->cashierDetailsOne){
                                                                $details = $cashier->cashierDetailsOne->cashierDetailCashes->where('cash_value', $item)->first();
                                                            }
                                                        @endphp
                                                        {{ number_format($details ? $details->quantity : 0, 2, ',', '.') }}
                                                    </td>
                                                    <td style="text-align: right">
                                                        {{ $details ? number_format($details->quantity * $item, 2, ',', '.') : 0 }}
                                                        {{-- <input type="hidden" name="cash_value[]" value="{{ $item }}">
                                                        <input type="hidden" name="quantity[]" value="{{ $details ? $details->quantity : 0 }}"> --}}
                                                    </td>
                                                    @php
                                                    if($details){
                                                        $totalCash += $details->quantity * $item;
                                                        $totalBill += $details->quantity;
                                                    }
                                                    @endphp
                                                </tr>
                                                @endforeach
                                            </tbody>
                                            <tfoot>
                                                <tr>
                                                    <th style="text-align: right">Total</th>
                                                    <th style="text-align: right">Cantidad Billetes {{ number_format($totalBill, 2, ',', '.') }}</th>
                                                    <th style="text-align: right">Bs. {{ number_format($totalCash, 2, ',', '.') }}</th>
                                                </tr>
                                            </tfoot>
                                        </table>
                                    </div>
                                    <div class="col-md-6">
                                        <br>
                                        <div class="alert alert-info">
                                            <strong>Información:</strong>
                                            <p>Si la cantidad de de cortes de billetes coincide con la cantidad entregada por parte del administrador(a) de vóbeda, acepta la apertura de caja, caso contrario puedes rechazar la apertura.</p>
                                        </div>
                                        <br>
                                        {{-- <h2 id="h3" class="text-right">Total en caja: Bs. {{ number_format($total, 2, '.', '') }} </h2> --}}
                                        <br>
                                        <div class="text-right">
                                            <button type="button" data-toggle="modal" data-target="#refuse_cashier-modal" class="btn btn-danger">Rechazar apertura <i class="voyager-x"></i></button>
                                            <button type="button" data-toggle="modal" data-target="#open_cashier-modal" class="btn btn-success">Aceptar apertura <i class="voyager-key"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                {{-- Aceptar apertura de caja --}}
                <form action="{{ route('cashiers.change.status', ['cashier' => $cashier->id]) }}" class="form-submit" method="post">
                    @csrf
                    <input type="hidden" name="status" value="Abierta">
                    <div class="modal fade" tabindex="-1" id="open_cashier-modal" role="dialog">
                        <div class="modal-dialog modal-success">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" style="color:rgb(255, 255, 255) !important"><i class="fa-solid fa-wallet"></i> Aceptar apertura de caja</h4>
                                </div>
                                <div class="modal-body">
                                    <p class="text-muted"></p>
                                    <p><b>Esta a punto de aceptar que posee todos los cortes de billetes descritos en la lista, ¿Desea continuar?</b></p>

                                    <label class="checkbox-inline">
                                        <input type="checkbox" required>Confirmar..!
                                    </label>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                    <input type="submit" class="btn btn-success btn-form-submit" value="Si, aceptar">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                {{-- Rechazar apertura de caja --}}
                <form action="{{ route('cashiers.change.status', ['cashier' => $cashier->id]) }}" class="form-submit" method="post">
                    @csrf
                    <input type="hidden" name="status" value="Rechazada">
                    <div class="modal modal-danger fade" tabindex="-1" id="refuse_cashier-modal" role="dialog">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Cerrar"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" style="color:rgb(255, 255, 255) !important"><i class="fa-solid fa-wallet"></i> Rechazar apertura de caja</h4>
                                </div>
                                <div class="modal-body">
                                    <p class="text-muted"></p>
                                    <p><b>Esta a punto de rechazar la apertura de caja, ¿Desea continuar?</b></p>
                                    
                                    <label class="checkbox-inline">
                                        <input type="checkbox" required>Confirmar..!
                                    </label>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                                    <input type="submit" class="btn btn-danger btn-form-submit" value="Si, rechazar">
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            @endif


        @else
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-bordered">
                        <div class="panel-body">
                            <h1 class="text-center">No tienes caja abierta</h1>
                        </div>
                    </div>
                </div>
            </div>
        @endif






        <div class="row">
            <!-- Gráfico de ventas mensuales -->
            <div class="col-md-6">
                <div class="panel panel-bordered">
                    <div class="panel-heading">
                        <h3 class="panel-title">Ventas Mensuales</h3>
                    </div>
                    <div class="panel-body">
                        <canvas id="ventasMensualesChart" height="250"></canvas>
                    </div>
                </div>
            </div>

            <!-- Gráfico de productos más vendidos -->
            <div class="col-md-6">
                <div class="panel panel-bordered">
                    <div class="panel-heading">
                        <h3 class="panel-title">Productos Más Vendidos</h3>
                    </div>
                    <div class="panel-body">
                        <canvas id="topProductosChart" height="250"></canvas>
                    </div>
                </div>
            </div>

            <!-- Gráfico de ventas por día de la semana -->
            <div class="col-md-6">
                <div class="panel panel-bordered">
                    <div class="panel-heading">
                        <h3 class="panel-title">Ventas por Día de la Semana</h3>
                    </div>
                    <div class="panel-body">
                        <canvas id="ventasDiasChart" height="250"></canvas>
                    </div>
                </div>
            </div>

            <!-- Gráfico de comparación año actual vs año anterior -->
            <div class="col-md-6">
                <div class="panel panel-bordered">
                    <div class="panel-heading">
                        <h3 class="panel-title">Comparación Anual</h3>
                    </div>
                    <div class="panel-body">
                        <canvas id="comparacionAnualChart" height="250"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
@stop

@section('javascript')
    <!-- Incluir Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>
        $(document).ready(function(){   
            $('.form-submit').submit(function(e){
                $('.btn-form-submit').attr('disabled', true);
                $('.btn-form-submit').val('Guardando...');
            });

            // Datos de ejemplo (debes reemplazarlos con tus datos reales)
            const ventasMensualesData = {
                labels: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                datasets: [{
                    label: 'Ventas 2023',
                    data: [120000, 190000, 150000, 180000, 210000, 230000, 250000, 220000, 240000, 260000, 280000, 300000],
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1
                }]
            };

            const topProductosData = {
                labels: ['Hamburguesa', 'Pizza', 'Ensalada', 'Bebida', 'Postre'],
                datasets: [{
                    label: 'Unidades Vendidas',
                    data: [1200, 800, 500, 1500, 300],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)'
                    ],
                    borderWidth: 1
                }]
            };

            const ventasDiasData = {
                labels: ['Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado', 'Domingo'],
                datasets: [{
                    label: 'Ventas promedio',
                    data: [80000, 85000, 90000, 95000, 120000, 150000, 130000],
                    backgroundColor: 'rgba(75, 192, 192, 0.2)',
                    borderColor: 'rgba(75, 192, 192, 1)',
                    borderWidth: 1
                }]
            };

            const comparacionAnualData = {
                labels: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                datasets: [
                    {
                        label: '2022',
                        data: [100000, 150000, 130000, 160000, 190000, 210000, 230000, 200000, 220000, 240000, 260000, 280000],
                        borderColor: 'rgba(201, 203, 207, 1)',
                        backgroundColor: 'rgba(201, 203, 207, 0.2)',
                        borderWidth: 1
                    },
                    {
                        label: '2023',
                        data: [120000, 190000, 150000, 180000, 210000, 230000, 250000, 220000, 240000, 260000, 280000, 300000],
                        borderColor: 'rgba(54, 162, 235, 1)',
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderWidth: 1
                    }
                ]
            };

            // Configuración común para los gráficos
            const chartOptions = {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            };

            // Crear los gráficos
            new Chart(document.getElementById('ventasMensualesChart'), {
                type: 'bar',
                data: ventasMensualesData,
                options: chartOptions
            });

            new Chart(document.getElementById('topProductosChart'), {
                type: 'pie',
                data: topProductosData,
                options: chartOptions
            });

            new Chart(document.getElementById('ventasDiasChart'), {
                type: 'line',
                data: ventasDiasData,
                options: chartOptions
            });

            new Chart(document.getElementById('comparacionAnualChart'), {
                type: 'line',
                data: comparacionAnualData,
                options: chartOptions
            });
        });
    </script>
@stop