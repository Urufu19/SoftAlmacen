<template>
            <main class="main">
            <!-- Breadcrumb -->
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Escritorio</a></li>
            </ol>
            <div class="container-fluid">
                <!-- Ejemplo de tabla Listado -->
                <div class="card">
                    <div class="card-header">
                        <i class="fa fa-align-justify"></i> Orden de Compras
                        <button type="button" @click="abrirModal('ordencompra','registrar')" class="btn btn-secondary">
                            <i class="icon-plus"></i>&nbsp;Nuevo
                        </button>
                    </div>
                    <div class="card-body">
                        <div class="form-group row">
                            <div class="col-md-6">
                                <div class="input-group">
                                    <select class="form-control col-md-3" v-model="criterio">
                                      <option value="nombre">Nombre</option>
                                      <option value="descripcion">Descripción</option>
                                    </select>
                                    <input type="text" v-model="buscar" @keyup.enter="listarOrdenCompra(1,buscar,criterio)" class="form-control" placeholder="Texto a buscar">
                                    <button type="submit" @click="listarOrdeCompra(1,buscar,criterio)" class="btn btn-primary"><i class="fa fa-search"></i> Buscar</button>
                                </div>
                            </div>
                        </div>
                        <table class="table table-bordered table-striped table-sm">
                            <thead>
                                <tr>
                                    <th>Opciones</th>
                                    <th>Numero</th>
                                    <th>Nombre</th>
                                    <th>Fecha</th>
                                    <th>Direccion</th>
                                    <th>Descripción</th>
                                    <th>Referencia</th>
                                    <th>Estado</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr v-for="ordencompra in arrayOrdenCompra" :key="ordencompra.id">
                                    <td>
                                        <button type="button" @click="abrirModal('ordencompra','actualizar',ordencompra)" class="btn btn-warning btn-sm">
                                          <i class="icon-pencil"></i>
                                        </button> &nbsp;
                                        <template v-if="ordencompra.condicion">
                                            <button type="button" class="btn btn-danger btn-sm" @click="desactivarOrdenCompra(ordencompra.id)">
                                                <i class="icon-trash"></i>
                                            </button>
                                        </template>
                                        <template v-else>
                                            <button type="button" class="btn btn-info btn-sm" @click="activarOrdenCompra(ordencompra.id)">
                                                <i class="icon-check"></i>
                                            </button>
                                        </template>
                                    </td>
                                    <td v-text="ordencompra.numero"></td>
                                    <td v-text="ordencompra.nombre"></td>
                                    <td v-text="ordencompra.fecha"></td>
                                    <td v-text="ordencompra.direccion"></td>
                                    <td v-text="ordencompra.descripcion"></td>
                                    <td v-text="ordencompra.referencia"></td>
                                    <td>
                                        <div v-if="ordencompra.condicion">
                                            <span class="badge badge-success">Activo</span>
                                        </div>
                                        <div v-else>
                                            <span class="badge badge-danger">Desactivado</span>
                                        </div>
                                        
                                    </td>
                                </tr>                                
                            </tbody>
                        </table>
                        <nav>
                            <ul class="pagination">
                                <li class="page-item" v-if="pagination.current_page > 1">
                                    <a class="page-link" href="#" @click.prevent="cambiarPagina(pagination.current_page - 1,buscar,criterio)">Ant</a>
                                </li>
                                <li class="page-item" v-for="page in pagesNumber" :key="page" :class="[page == isActived ? 'active' : '']">
                                    <a class="page-link" href="#" @click.prevent="cambiarPagina(page,buscar,criterio)" v-text="page"></a>
                                </li>
                                <li class="page-item" v-if="pagination.current_page < pagination.last_page">
                                    <a class="page-link" href="#" @click.prevent="cambiarPagina(pagination.current_page + 1,buscar,criterio)">Sig</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- Fin ejemplo de tabla Listado -->
            </div>
            <!--Inicio del modal agregar/actualizar-->
            <div class="modal fade" tabindex="-1" :class="{'mostrar' : modal}" role="dialog" aria-labelledby="myModalLabel" style="display: none;" aria-hidden="true">
                <div class="modal-dialog modal-primary modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" v-text="tituloModal"></h4>
                            <button type="button" class="close" @click="cerrarModal()" aria-label="Close">
                              <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <form action="" method="post" enctype="multipart/form-data" class="form-horizontal">
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Numero</label>
                                    <div class="col-md-9">
                                        <input type="text" v-model="numero" class="form-control" placeholder="Numero">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Nombre</label>
                                    <div class="col-md-9">
                                        <input type="text" v-model="nombre" class="form-control" placeholder="Nombre"> 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Fecha</label>
                                    <div class="col-md-9">
                                        <input type="text" v-model="fecha" class="form-control" placeholder="Fecha"> 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="text-input">Direccion</label>
                                    <div class="col-md-9">
                                        <input type="text" v-model="direccion" class="form-control" placeholder="Dirección"> 
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="email-input">Descripción</label>
                                    <div class="col-md-9">
                                        <input type="email" v-model="descripcion" class="form-control" placeholder="Descripción">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-3 form-control-label" for="email-input">Referencia</label>
                                    <div class="col-md-9">
                                        <input type="email" v-model="referencia" class="form-control" placeholder="Referencia">
                                    </div>
                                </div>
                                <div v-show="errorOrdenCompra" class="form-group row div-error">
                                    <div class="text-center text-error">
                                        <div v-for="error in errorMostrarMsjOrdenCompra" :key="error" v-text="error">

                                        </div>
                                    </div>
                                </div>

                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" @click="cerrarModal()">Cerrar</button>
                            <button type="button" v-if="tipoAccion==1" class="btn btn-primary" @click="registrarOrdenCompra()">Guardar</button>
                            <button type="button" v-if="tipoAccion==2" class="btn btn-primary" @click="actualizarOrdenCompra()">Actualizar</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!--Fin del modal-->
        </main>
</template>

<script>
    export default {
        data (){
            return {
                ordencompra_id: 0,
                numero : '',
                nombre : '',
                fecha : '',
                direccion : '',
                descripcion : '',
                referencia : '',
                arrayOrdenCompra : [],
                modal : 0,
                tituloModal : '',
                tipoAccion : 0,
                errorOrdenCompra : 0,
                errorMostrarMsjOrdenCompra : [],
                pagination : {
                    'total' : 0,
                    'current_page' : 0,
                    'per_page' : 0,
                    'last_page' : 0,
                    'from' : 0,
                    'to' : 0,
                },
                offset : 3,
                criterio : 'nombre',
                buscar : ''
            }
        },
        computed:{
            isActived: function(){
                return this.pagination.current_page;
            },
            //Calcula los elementos de la paginación
            pagesNumber: function() {
                if(!this.pagination.to) {
                    return [];
                }
                
                var from = this.pagination.current_page - this.offset; 
                if(from < 1) {
                    from = 1;
                }

                var to = from + (this.offset * 2); 
                if(to >= this.pagination.last_page){
                    to = this.pagination.last_page;
                }  

                var pagesArray = [];
                while(from <= to) {
                    pagesArray.push(from);
                    from++;
                }
                return pagesArray;             

            }
        },
        methods : {
            listarOrdenCompra (page,buscar,criterio){
                let me=this;
                var url= '/ordencompra?page=' + page + '&buscar='+ buscar + '&criterio='+ criterio;
                axios.get(url).then(function (response) {
                    var respuesta= response.data;
                    me.arrayOrdenCompra = respuesta.ordencompra.data;
                    me.pagination= respuesta.pagination;
                })
                .catch(function (error) {
                    console.log(error);
                });
            },
            cambiarPagina(page,buscar,criterio){
                let me = this;
                //Actualiza la página actual
                me.pagination.current_page = page;
                //Envia la petición para visualizar la data de esa página
                me.listarOrdenCompra(page,buscar,criterio);
            },
            registrarOrdenCompra(){
                if (this.validarOrdenCompra()){
                    return;
                }
                
                let me = this;

                axios.post('/ordencompra/registrar',{
                    'numero': this.numero,
                    'nombre': this.nombre,
                    'fecha': this.fecha,
                    'direccion': this.direccion,
                    'descripcion': this.descripcion,
                    'referencia': this.referencia

                }).then(function (response) {
                    me.cerrarModal();
                    me.listarOrdenCompra(1,'','nombre');
                }).catch(function (error) {
                    console.log(error);
                });
            },
            actualizarOrdenCompra(){
               if (this.validarOrdenCompra()){
                    return;
                }
                
                let me = this;

                axios.put('/ordencompra/actualizar',{
                    'numero': this.numero,
                    'nombre': this.nombre,
                    'fecha': this.fecha,
                    'direccion': this.direccion,
                    'descripcion': this.descripcion,
                    'referencia': this.referencia,
                    'id': this.ordencompra_id
                }).then(function (response) {
                    me.cerrarModal();
                    me.listarOrdenCompra(1,'','nombre');
                }).catch(function (error) {
                    console.log(error);
                }); 
            },
            desactivarOrdenCompra(id){
               swal({
                title: 'Esta seguro de desactivar?',
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Aceptar!',
                cancelButtonText: 'Cancelar',
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false,
                reverseButtons: true
                }).then((result) => {
                if (result.value) {
                    let me = this;

                    axios.put('/ordencompra/desactivar',{
                        'id': id
                    }).then(function (response) {
                        me.listarOrdenCompra(1,'','nombre');
                        swal(
                        'Desactivado!',
                        'El registro ha sido desactivado con éxito.',
                        'success'
                        )
                    }).catch(function (error) {
                        console.log(error);
                    });
                    
                    
                } else if (
                    // Read more about handling dismissals
                    result.dismiss === swal.DismissReason.cancel
                ) {
                    
                }
                }) 
            },
            activarOrdenCompra(id){
               swal({
                title: 'Esta seguro de activar?',
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Aceptar!',
                cancelButtonText: 'Cancelar',
                confirmButtonClass: 'btn btn-success',
                cancelButtonClass: 'btn btn-danger',
                buttonsStyling: false,
                reverseButtons: true
                }).then((result) => {
                if (result.value) {
                    let me = this;

                    axios.put('/ordencompra/activar',{
                        'id': id
                    }).then(function (response) {
                        me.listarOrdenCompra(1,'','nombre');
                        swal(
                        'Activado!',
                        'El registro ha sido activado con éxito.',
                        'success'
                        )
                    }).catch(function (error) {
                        console.log(error);
                    });
                    
                    
                } else if (
                    // Read more about handling dismissals
                    result.dismiss === swal.DismissReason.cancel
                ) {
                    
                }
                }) 
            },
            validarOrdenCompra(){
                this.errorOrdenCompra=0;
                this.errorMostrarMsjOrdenCompra =[];

                if (!this.nombre) this.errorMostrarMsjOrdenCompra.push("El nombre de la Orden de Compra no puede estar vacío.");

                if (this.errorMostrarMsjOrdenCompra.length) this.errorOrdenCompra = 1;

                return this.errorOrdenCompra;
            },
            cerrarModal(){
                this.modal=0;
                this.tituloModal='';
                this.numero='';
                this.nombre='';
                this.fecha='';
                this.direccion='';
                this.descripcion='';
                this.referencia='';
            },
            abrirModal(modelo, accion, data = []){
                switch(modelo){
                    case "ordencompra":
                    {
                        switch(accion){
                            case 'registrar':
                            {
                                this.modal = 1;
                                this.tituloModal = 'Registrar Orden de Compra';
                                this.numero= '';
                                this.nombre= '';
                                this.fecha= '';
                                this.direccion= '';
                                this.descripcion = '';
                                this.referencia= '';
                                this.tipoAccion = 1;
                                break;
                            }
                            case 'actualizar':
                            {
                                //console.log(data);
                                this.modal=1;
                                this.tituloModal='Actualizar Orden de Compra';
                                this.tipoAccion=2;
                                this.ordencompra_id=data['id'];
                                this.numero = data['numero'];
                                this.nombre = data['nombre'];
                                this.fecha = data['fecha'];
                                this.direccion = data['direccion'];
                                this.descripcion= data['descripcion'];
                                this.referencia = data['referencia'];
                                break;
                            }
                        }
                    }
                }
            }
        },
        mounted() {
            this.listarOrdenCompra(1,this.buscar,this.criterio);
        }
    }
</script>
<style>    
    .modal-content{
        width: 100% !important;
        position: absolute !important;
    }
    .mostrar{
        display: list-item !important;
        opacity: 1 !important;
        position: absolute !important;
        background-color: #3c29297a !important;
    }
    .div-error{
        display: flex;
        justify-content: center;
    }
    .text-error{
        color: red !important;
        font-weight: bold;
    }
</style>
