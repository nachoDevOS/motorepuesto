@extends('voyager::master')

@section('page_title', __('voyager::generic.'.(isset($dataTypeContent->id) ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular'))

@section('css')
    <meta name="csrf-token" content="{{ csrf_token() }}">
@stop

@section('page_header')
    <h1 class="page-title">
        <i class="{{ $dataType->icon }}"></i>
        {{ __('voyager::generic.'.(isset($dataTypeContent->id) ? 'edit' : 'add')).' '.$dataType->getTranslatedAttribute('display_name_singular') }}
    </h1>
@stop

@section('content')
    <div class="page-content container-fluid">
        <form class="form-edit-add" role="form"
              action="@if(!is_null($dataTypeContent->getKey())){{ route('voyager.'.$dataType->slug.'.update', $dataTypeContent->getKey()) }}@else{{ route('voyager.'.$dataType->slug.'.store') }}@endif"
              {{-- action="@if(!is_null($dataTypeContent->getKey())){{ route('update.users', $dataTypeContent->getKey()) }}@else{{ route('store.users') }}@endif" --}}
              method="POST" enctype="multipart/form-data" autocomplete="off">
            <!-- PUT Method if we are editing -->
            @if(isset($dataTypeContent->id))
                {{ method_field("PUT") }}
            @endif
            {{ csrf_field() }}

            <div class="row">
                <div class="col-md-8">
                    <div class="panel panel-bordered">
                    {{-- <div class="panel"> --}}
                        @if (count($errors) > 0)
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif

                        <div class="panel-body">

                            @if (!$dataTypeContent->getKey())
                                <div class="form-group">
                                    <label for="customer_id">Persona</label>
                                    <div class="input-group">
                                        <select name="person_id" id="select-person_id" required class="form-control"></select>
                                        <span class="input-group-btn">
                                            <button class="btn btn-primary" title="Nueva persona" data-target="#modal-create-person" data-toggle="modal" style="margin: 0px" type="button">
                                                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                            </button>
                                        </span>
                                    </div>
                                </div>
                            @endif
                            
                            {{-- <div class="form-group">
                                <label for="name">{{ __('voyager::generic.name') }}</label>
                                <input type="text" class="form-control" id="name" name="name" placeholder="{{ __('voyager::generic.name') }}"
                                       value="{{ old('name', $dataTypeContent->name ?? '') }}">
                            </div> --}}

                            <div class="form-group">
                                <label for="email">{{ __('voyager::generic.email') }}</label>
                                <input type="email" class="form-control" id="email" name="email" {{$dataTypeContent->getKey()?'disabled':''}} placeholder="{{ __('voyager::generic.email') }}"
                                       value="{{ old('email', $dataTypeContent->email ?? '') }}">
                            </div>

                            <div class="form-group">
                                <label for="password">{{ __('voyager::generic.password') }}</label>
                                @if(isset($dataTypeContent->password))
                                    <br>
                                    <small>{{ __('voyager::profile.password_hint') }}</small>
                                @endif
                                <input type="password" class="form-control" id="password" name="password" value="" autocomplete="new-password">
                            </div>
                            @if($dataTypeContent)
                                @if ($dataTypeContent->id != 1 && $dataTypeContent->id!=2)
                                    <div class="form-group">
                                    <label for="branch_id">Sucursal</label>
                                    <select name="branch_id" id="branch_id" class="form-control select2" required>
                                        <option value="" disabled >--Seleccione una opción--</option>
                                        @foreach(\App\Models\Branch::where('deleted_at', null)->get() as $item)
                                            <option value="{{ $item->id }}" @if($dataTypeContent) {{$dataTypeContent->branch_id==$item->id?'selected':''}} @endif>{{ $item->name }}</option>
                                        @endforeach
                                    </select>
                                </div>
                                @endif
                            @endif
                            
                            @php
                                $rol_id = Auth::user()->role->id;
                                $role = TCG\Voyager\Models\Role::whereRaw($rol_id!=1? 'id != 1':1)
                                        ->get();
                            @endphp
                            @can('editRoles', $dataTypeContent)  
                            
                                <div class="form-group">
                                    <label>Rol predeterminado</label>
                                    <select name="role_id" id="role_id" class="form-control select2" required>
                                        <option value="" disabled selected>Ninguno</option>
                                        @foreach ($role as $item)
                                            <option value="{{$item->id}}" @if($dataTypeContent) {{$dataTypeContent->role_id==$item->id? 'selected':''}} @endif >{{$item->name}}</option>  
                                        @endforeach
                                    </select>
                                </div>   
                                {{-- <div class="form-group">
                                    <label for="default_role">{{ __('voyager::profile.role_default') }}</label>
                                    @php
                                        $dataTypeRows = $dataType->{(isset($dataTypeContent->id) ? 'editRows' : 'addRows' )};

                                        $row     = $dataTypeRows->where('field', 'user_belongsto_role_relationship')->first();
                                        $options = $row->details;
                                    @endphp
                                    @include('voyager::formfields.relationship')
                                </div> --}}
                                {{-- <div class="form-group">
                                    <label for="additional_roles">{{ __('voyager::profile.roles_additional') }}</label>
                                    @php
                                        $row     = $dataTypeRows->where('field', 'user_belongstomany_role_relationship')->first();
                                        $options = $row->details;
                                    @endphp
                                    @include('voyager::formfields.relationship')
                                </div> --}}
                            @endcan
                            @php
                            if (isset($dataTypeContent->locale)) {
                                $selected_locale = $dataTypeContent->locale;
                            } else {
                                $selected_locale = config('app.locale', 'en');
                            }

                            @endphp
                            <div class="form-group" style="display: none">
                                <label for="locale">{{ __('voyager::generic.locale') }}</label>
                                <select class="form-control select2" id="locale" name="locale">
                                    @foreach (Voyager::getLocales() as $locale)
                                    <option value="{{ $locale }}"
                                    {{ ($locale == $selected_locale ? 'selected' : '') }}>{{ $locale }}</option>
                                    @endforeach
                                </select>
                            </div>
                            @if ($dataTypeContent->getKey())
                                <div class="form-group">
                                    <label for="status">Estado</label> <br>
                                    <input type="checkbox" name="status" class="toggleswitch" 
                                        @if(isset($dataTypeContent->id))
                                            {{ $dataTypeContent->status==1 ? 'checked' : '' }} 
                                        @else 
                                            checked
                                        @endif
                                        data-on="Habilitado" data-off="Inhabilitado">
                                </div>
                            @endif                            
                        </div>
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="panel panel panel-bordered panel-warning">
                        <div class="panel-body">
                            <div class="form-group">
                                @if(isset($dataTypeContent->avatar))
                                    <img src="{{ filter_var($dataTypeContent->avatar, FILTER_VALIDATE_URL) ? $dataTypeContent->avatar : Voyager::image( $dataTypeContent->avatar ) }}" style="width:200px; height:auto; clear:both; display:block; padding:2px; border:1px solid #ddd; margin-bottom:10px;" />
                                @endif
                                <input type="file" data-name="avatar" name="avatar">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <button type="submit" class="btn btn-primary pull-right save">
                {{ __('voyager::generic.save') }}
            </button>
        </form>
        <div style="display:none">
            <input type="hidden" id="upload_url" value="{{ route('voyager.upload') }}">
            <input type="hidden" id="upload_type_slug" value="{{ $dataType->slug }}">
        </div>
    </div>


    @include('partials.modal-registerPerson')

@stop

@section('javascript')

    <script src="{{ asset('js/include/person-select.js') }}"></script>
    <script src="{{ asset('js/include/person-register.js') }}"></script>
    <script>
        $('document').ready(function () {
            $('.toggleswitch').bootstrapToggle();
        });
    </script>
@stop
