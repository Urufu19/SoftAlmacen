@extends('auth.contenido')

@section('login')

<div class="row justify-content-center ">
  
      <div class="col-md-8">
        <div class="card-group mb-0">
          <div class="card p-4" style="background: #00796B;">
          <form class="form-horizontal was-validated" method="POST" action="{{ route('login')}}">
          {{ csrf_field() }}
              <div class="card-body text-white text-center">
              <h1>Ingresar</h1>
              <p class="text-muted">Control de acceso al sistema</p>
              <div class="form-group mb-3{{$errors->has('usuario' ? 'is-invalid' : '')}}">
                <span class="input-group-addon"><i class="icon-user"></i>  Usuario</span>
                <input type="text" value="{{old('usuario')}}" name="usuario" id="usuario" class="form-control" placeholder="Usuario">
                {!!$errors->first('usuario','<span class="invalid-feedback">:message</span>')!!}
              </div>
              <div class="form-group mb-4{{$errors->has('password' ? 'is-invalid' : '')}}">
                <span class="input-group-addon"><i class="icon-lock"></i> Contraseña</span>
                <input type="password" name="password" id="password" class="form-control" placeholder="Password">
                {!!$errors->first('password','<span class="invalid-feedback">:message</span>')!!}
              </div>
              <div class="row">
                <div class="col-6">
                  <button type="submit" class="btn btn-primary form-control "> <b>Acceder</b> </button>
                </div>
              </div>
            </div>
          </form>
          </div>
          <div class="card text-white py-5 d-md-down-none" style="width:44%;background:#4b4b4d;" >
            <div class="card-body text-center">
              <div>

              
              <img src="img/logo.png" width="200" height="200">
                <h3>Sistema de Gestion de Almacen</h3>
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
@endsection
