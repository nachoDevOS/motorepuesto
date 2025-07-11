<div class="col-md-12">
    <div class="table-responsive">
        <table id="dataTable" class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th style="text-align: center; width: 15%">Codigo</th>
                    <th style="text-align: center">Cliente</th>
                    <th style="text-align: center">Monto de Venta</th>  
                    <th style="text-align: center">Fecha Venta</th>
                    {{-- <th style="text-align: center">Estado</th> --}}
                    <th style="text-align: center">Acciones</th>
                </tr>
            </thead>
            <tbody>
                @forelse ($data as $item)
                <tr>
                    <td>{{ $item->code }}</td>
                    <td>
                        @if ($item->person)
                            <table>
                                @php
                                    $image = asset('images/default.jpg');
                                    if($item->person->image){
                                        $image = asset('storage/'.str_replace('.', '-cropped.', $item->person->image));
                                    }
                                @endphp
                                <tr>
                                    <td><img src="{{ $image }}" alt="{{ $item->person->first_name }} " style="width: 60px; height: 60px; border-radius: 30px; margin-right: 10px"></td>
                                    <td>
                                        {{ strtoupper($item->person->first_name) }} {{ $item->person->middle_name??strtoupper($item->person->middle_name) }} {{ strtoupper($item->person->paternal_surname) }}  {{ strtoupper($item->person->maternal_surname) }} 
                                    </td>
                                </tr>
                            </table>
                        @else
                            Sin Datos 
                        @endif                        
                    </td>
                    <td style="text-align: center">
                        {{$item->typeSale}} <br>
                        Bs. {{ number_format($item->amount, 2, ',', '.') }}
                    </td>

                    <td style="text-align: center">
                        Registrado por {{$item->register->name}} <br>
                        {{date('d/m/Y h:i:s a', strtotime($item->dateSale))}}<br><small>{{\Carbon\Carbon::parse($item->dateSale)->diffForHumans()}}
                    </td>
          
                    <td style="width: 18%" class="no-sort no-click bread-actions text-right">
                        
                        <a href="{{ route('sales.prinf', ['id' => $item->id]) }}" target="_blank" title="Imprimir" class="btn btn-sm btn-dark view">
                                <i class="fa-solid fa-print"></i>
                        </a>
                    
                        @if (auth()->user()->hasPermission('read_sales'))
                            <a href="{{ route('sales.show', ['sale' => $item->id]) }}" title="Ver" class="btn btn-sm btn-warning view">
                                <i class="voyager-eye"></i>
                            </a>
                        @endif
                        
                        @if (auth()->user()->hasPermission('delete_sales'))
                            <a href="#" onclick="deleteItem('{{ route('sales.destroy', ['sale' => $item->id]) }}')" title="Eliminar" data-toggle="modal" data-target="#modal-delete" class="btn btn-sm btn-danger delete">
                                <i class="voyager-trash"></i>
                            </a>
                        @endif
                    </td>
                </tr>
                @empty
                    <tr>
                        <td colspan="7">
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
        @if(count($data)>0)
            <p class="text-muted">Mostrando del {{$data->firstItem()}} al {{$data->lastItem()}} de {{$data->total()}} registros.</p>
        @endif
    </div>
    <div class="col-md-8" style="overflow-x:auto">
        <nav class="text-right">
            {{ $data->links() }}
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