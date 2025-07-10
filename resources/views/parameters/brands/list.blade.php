<div class="col-md-12">
    <div class="table-responsive">
        <table id="dataTable" class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th style="text-align: center; width: 3%">ID</th>
                    <th style="text-align: center; width: 10%">Imagen</th>
                    <th style="text-align: center; width: 20%">Marcas</th>                    
                    <th style="text-align: center">Descripción</th>
                    <th style="text-align: center; width: 5%">Estado</th>
                    <th style="text-align: center; width: 5%">Acciones</th>
                </tr>
            </thead>
            <tbody>
                @forelse ($data as $item)
                <tr>
                    <td style="text-align: center">{{ $item->id }}</td>
                    <td style="text-align: center">
                        @php
                            $image = asset('images/default.jpg');
                            if($item->image){
                                $image = asset('storage/'.str_replace('.', '-small.', $item->image));
                            }
                        @endphp
                        <img src="{{ $image }}" alt="{{ $item->name }}"  class="image-expandable" style="width: 50px; height: 50px; border-radius: 30px; margin-right: 0px">

                    </td>
                    <td style="text-align: center">
                        {{$item->name}}
                    </td>
                        
                    <td> {{ $item->observation }}</td>
             
                    <td style="text-align: center">
                        @if ($item->status==1)  
                            <label class="label label-success">Activo</label>
                        @else
                            <label class="label label-warning">Inactivo</label>
                        @endif                        
                    </td>
                    <td style="width: 18%" class="no-sort no-click bread-actions text-right">
                        @if (auth()->user()->hasPermission('read_brands'))
                            <a href="{{ route('voyager.brands.show', ['id' => $item->id]) }}" title="Ver" class="btn btn-sm btn-warning view">
                                <i class="voyager-eye"></i> <span class="hidden-xs hidden-sm">Ver</span>
                            </a>
                        @endif
                        @if (auth()->user()->hasPermission('edit_brands'))
                            <a href="{{ route('voyager.brands.edit', ['id' => $item->id]) }}" title="Editar" class="btn btn-sm btn-primary edit">
                                <i class="voyager-edit"></i> <span class="hidden-xs hidden-sm">Editar</span>
                            </a>
                        @endif
                        @if (auth()->user()->hasPermission('delete_brands'))
                            <a href="#" onclick="deleteItem('{{ route('voyager.brands.destroy', ['id' => $item->id]) }}')" title="Eliminar" data-toggle="modal" data-target="#modal-delete" class="btn btn-sm btn-danger delete">
                                <i class="voyager-trash"></i> <span class="hidden-xs hidden-sm">Eliminar</span>
                            </a>
                        @endif
                    </td>
                </tr>
                @empty
                    <tr>
                        <td colspan="6">
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