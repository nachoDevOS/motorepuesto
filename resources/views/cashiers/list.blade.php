<div class="col-md-12">
    <div class="table-responsive">
        <table id="dataTable" class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th style="text-align: center">ID</th>
                    <th style="text-align: center">Usuario</th>
                    <th style="text-align: center">Detalle / Descripción</th>                    
                    <th style="text-align: center">Apertura</th>                    
                    <th style="text-align: center">Cierre</th>                    
                    <th style="text-align: center">Detalle de Cierre</th>                    
                    <th style="text-align: center">Estado</th>    
                    <th style="text-align: center">Acciones</th>
                </tr>
            </thead>
            <tbody>                
                @forelse ($cashier as $item)
                    <tr>
                        <td>{{$item->id}}</td>
                        <td style="width: 200pt; text-align: center">{{strtoupper($item->userCashier->name)}}</td>
                        <td style="text-align: center">{{strtoupper($item->title)}}</td>
                        
                        <td style="text-align: center">{{date('d/m/Y h:i:s a', strtotime($item->created_at))}}<br><small>{{\Carbon\Carbon::parse($item->created_at)->diffForHumans()}}</small></td>
                        <td style="text-align: center">@if($item->closed_at){{date('d/m/Y h:i:s a', strtotime($item->closed_at))}}<br><small>{{\Carbon\Carbon::parse($item->closed_at)->diffForHumans()}}@endif </small></td>
                        <td>
                            {{-- @if ($item->amount)
                                <b>Monto de cierre: </b> {{ $item->amount_real }}<br>
                                <b>Saldo: </b> <span class="@if($item->balance > 0) text-success @endif @if($item->balance < 0) text-danger @endif">{{ $item->balance }}</span>
                            @endif --}}
                        </td>
                        <td style="text-align: center">
                            @if ($item->status == 'Abierta')
                                <label class="label label-success">Abierta</label>
                            @endif
                            @if ($item->status == 'Cerrada')
                                <label class="label label-danger">Cerrada</label>
                            @endif

                            @if ($item->status == 'Cierre Pendiente')
                                <label class="label label-primary">Cierre Pendiente</label>
                            @endif

                            @if ($item->status == 'Apertura Pendiente')
                                <label class="label label-warning">Apertura Pendiente</label>
                            @endif

                        </td>
                        <td style="text-align: right">
                            <div class="btn-group">
                                <button type="button" class="btn btn-dark dropdown-toggle" data-toggle="dropdown">
                                    <span class="glyphicon glyphicon-print"></span> Impresión <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="{{ route('print.open', ['cashier' => $item->id]) }}" target="_blank">Apertura</a></li>
                                    @if ($item->status == 'Cerrada')
                                    {{-- <li><a href="{{ route('print.close', ['cashier' => $cashier->id]) }}" target="_blank">Cierre</a></li> --}}
                                    @endif
                                    {{-- <li><a href="{{ route('print.payments', ['cashier' => $cashier->id]) }}" target="_blank">Pagos</a></li> --}}
                                </ul>
                            </div>

                            {{-- <div class="btn-group ">
                                <!-- Botón principal -->
                                <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" >
                                    Opciones <span class="caret"></span>
                                </button>
                                <!-- Menú desplegable -->
                                <div class="dropdown-menu dropdown-menu-right">
                                    @if ($item->status != 'apertura pendiente')
                                    <li><a href="#" onclick="openWindow({{$item->cashierDetailsOne->id}})" style="color: blue"  data-toggle="modal" title="Imprimir Comprobante" ><i class="fa-solid fa-print"></i> Imprimir Comporbante de Apertura</a></li>
                                    @endif
                                    
                                    <li><a href="#" onclick="openWindow({{$item->cashierDetailsOne->id}})" style="color: blue"  data-toggle="modal" title="Imprimir Comprobante" ><i class="fa-solid fa-print"></i> Imprimir Comporbante de Apertura</a></li>

                     
                                </div>
                            </div> --}}


                            {{-- <div class="btn-group" style="margin-right: 3px">
                                <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
                                    Mas <span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu" role="menu" style="left: -90px !important" >
                                    @if ($item->status != 'apertura pendiente')
                                        <li><a href="#" onclick="openWindow({{$item->cashierDetailsOne->id}})" style="color: blue"  data-toggle="modal" title="Imprimir Comprobante" ><i class="fa-solid fa-print"></i> Imprimir Comporbante de Apertura</a></li>

                                    @endif

                                    
                                    @if ($item->status == 'cerrada')
                                        <li><a href="#" onclick="closeWindow({{$item->id}})" style="color: red" data-toggle="modal" title="Imprimir Comprobante de Cierre" ><i class="fa-solid fa-print"></i> Imprimir Comprobante de Cierre</a></li>
                                    @endif
                                </ul>
                            </div> --}}
                            @if ($item->status == 'abierta')
                                {{-- <a href="{{route('cashiers.amount', ['cashier'=>$item->id])}}" title="Editar" class="btn btn-sm btn-success">
                                    <i class="voyager-dollar"></i> <span class="hidden-xs hidden-sm">Abonar</span>
                                </a> --}}
                            @endif
                            @if (auth()->user()->hasPermission('read_cashiers'))
                                <a href="{{route('cashiers.show', ['cashier'=>$item->id])}}" title="Editar" class="btn btn-sm btn-warning">
                                    <i class="voyager-eye"></i> <span class="hidden-xs hidden-sm">Ver</span>
                                </a>
                            @endif
                        </td>
                    </tr>
                @empty
                    <tr>
                        <td colspan="8">
                            <h5 class="text-center" style="margin-top: 50px">
                                <img src="{{ asset('images/empty.png') }}" width="120px" alt="" style="opacity: 0.8">
                                <br><br>
                                No hay resultados
                            </h5>
                        </td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>

<div class="col-md-12">
    <div class="col-md-4" style="overflow-x:auto">
        @if(count($cashier)>0)
            <p class="text-muted">Mostrando del {{$cashier->firstItem()}} al {{$cashier->lastItem()}} de {{$cashier->total()}} registros.</p>
        @endif
    </div>
    <div class="col-md-8" style="overflow-x:auto">
        <nav class="text-right">
            {{ $cashier->links() }}
        </nav>
    </div>
</div>

<script>
   
   var page = "{{ request('page') }}";
    $(document).ready(function(){
        $('.page-link').click(function(e){
            e.preventDefault();
            let link = $(this).attr('href');
            if(link){
                page = link.split('=')[1];
                list(page);
            }
        });
    });
</script>