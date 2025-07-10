@extends('voyager::master')

@section('page_title', 'Añadir Caja')

@section('page_header')
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-bordered">
                    <div class="panel-body" style="padding: 0px">
                        <div class="col-md-8" style="padding: 0px">
                            <h1 class="page-title">
                                <i class="fa-solid fa-cash-register"></i> Añadir Caja
                            </h1>
                        </div>
                        <div class="col-md-4 text-right" style="margin-top: 30px">
                            <a href="{{ route('cashiers.index') }}" class="btn btn-warning">
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
        <form class="form-submit" id="form-subtmit" action="{{ route('cashiers.store') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-bordered">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-md-6" style="padding-top:0;max-height:600px;overflow-y:auto">
                                    <table class="table table-hover" id="dataTable">
                                        <thead>
                                            <tr>
                                                <th>Corte</th>
                                                <th>Cantidad</th>
                                                <th>Sub Total</th>
                                            </tr>
                                        </thead>
                                        <tbody id="lista_cortes"></tbody>
                                    </table>
                                </div>

                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="col-md-12 form-group">
                                            <small>Cajero</small>
                                            <select name="user_id" class="form-control select2" required>
                                                <option value="">Seleccione al usuario</option>
                                                @foreach (\App\Models\User::where('status', 1)->where('branch_id', '!=', null)->where('deleted_at', null)->get() as $user)
                                                    <option value="{{ $user->id }}">{{ $user->name }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <small>Nombre de la caja</small>
                                            <input type="text" name="title" placeholder="Nombre de la Caja o Cobrador" class="form-control text" placeholder="Caja 1" required>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <input type="hidden" name="amount" id="input-total">
                                            <h2 class="text-right" id="label-total">0.00</h2>
                                        </div>
                                        <div class="col-md-12 form-group">
                                            <small>Observaciones</small>
                                            <textarea name="observations" class="form-control text" rows="5"></textarea>
                                        </div>
                                    </div>
                                </div>                                
                            </div>
                            <div class="panel-footer text-right">
                                {{-- <button type="submit" class="btn btn-primary save">Guardar <i class="voyager-check"></i> </button> --}}
                                <input type="submit" class="btn btn-primary btn-form-subtmit" value="Guardar">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>       
    </div>
    



@stop

@section('css')
@stop

@section('javascript')
    <script>
        const APP_URL = '{{ url('') }}';
    </script>
    <script src="{{ asset('js/cash_value.js') }}"></script>

    <script>
        $(document).ready(function(){   
            $('#form-subtmit').submit(function(e){
                $('.btn-form-subtmit').attr('disabled', true);
                $('.btn-form-subtmit').val('Guardando...');
            });
        });
    </script>
    
@stop