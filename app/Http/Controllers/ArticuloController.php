<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Articulo;
use App\OrdenCompra;

class ArticuloController extends Controller
{
    public function index(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $buscar = $request->buscar;
        $criterio = $request->criterio;
        
        if ($buscar==''){
            $articulos = Articulo::join('categorias','articulos.idcategoria','=','categorias.id')
            ->join('orden_compra','articulos.idordencompra','=','orden_compra.id')
            ->select('articulos.id','articulos.idcategoria','articulos.codigo','articulos.nombre','categorias.nombre as nombre_categoria','articulos.precio_venta','articulos.stock','articulos.unidad','articulos.marca','articulos.modelo','articulos.serie','orden_compra.numero as numero_ordencompra','orden_compra.fecha as fecha_ordencompra','articulos.idordencompra','articulos.condicion')
            ->orderBy('articulos.id', 'desc')->paginate(15);
        }
        else{
            $articulos = Articulo::join('categorias','articulos.idcategoria','=','categorias.id')
            ->join('orden_compra','articulos.idordencompra','=','orden_compra.id')
            ->select('articulos.id','articulos.idcategoria','articulos.codigo','articulos.nombre','categorias.nombre as nombre_categoria','articulos.precio_venta','articulos.stock','articulos.unidad','articulos.marca','articulos.modelo','articulos.serie','orden_compra.numero as numero_ordencompra','orden_compra.fecha as fecha_ordencompra','articulos.idordencompra','articulos.condicion')
            ->where('articulos.'.$criterio, 'like', '%'. $buscar . '%')
            ->orderBy('articulos.id', 'desc')->paginate(15);
        }
        

        return [
            'pagination' => [
                'total'        => $articulos->total(),
                'current_page' => $articulos->currentPage(),
                'per_page'     => $articulos->perPage(),
                'last_page'    => $articulos->lastPage(),
                'from'         => $articulos->firstItem(),
                'to'           => $articulos->lastItem(),
            ],
            'articulos' => $articulos
        ];
    }
    public function listarArticulo(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $buscar = $request->buscar;
        $criterio = $request->criterio;
        
        if ($buscar==''){
            $articulos = Articulo::join('categorias','articulos.idcategoria','=','categorias.id')
            ->join('orden_compra','articulos.idordencompra','=','orden_compra.id')
            ->select('articulos.id','articulos.idcategoria','articulos.codigo','articulos.nombre','categorias.nombre as nombre_categoria','articulos.precio_venta','articulos.stock','articulos.unidad','articulos.marca','articulos.modelo','articulos.serie','orden_compra.numero as numero_ordencompra','orden_compra.fecha as fecha_ordencompra','articulos.idordencompra','articulos.condicion')
            ->orderBy('articulos.id', 'desc')->paginate(10);
        }
        else{
            $articulos = Articulo::join('categorias','articulos.idcategoria','=','categorias.id')
            ->join('orden_compra','articulos.idordencompra','=','orden_compra.id')
            ->select('articulos.id','articulos.idcategoria','articulos.codigo','articulos.nombre','categorias.nombre as nombre_categoria','articulos.precio_venta','articulos.stock','articulos.unidad','articulos.marca','articulos.modelo','articulos.serie','orden_compra.numero as numero_ordencompra','orden_compra.fecha as fecha_ordencompra','articulos.idordencompra','articulos.condicion')
            ->where('articulos.'.$criterio, 'like', '%'. $buscar . '%')
            ->orderBy('articulos.id', 'desc')->paginate(10);
        }
        

        return ['articulos' => $articulos];
    }
    public function listarArticuloVenta(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $buscar = $request->buscar;
        $criterio = $request->criterio;
        
        if ($buscar==''){
            $articulos = Articulo::join('categorias','articulos.idcategoria','=','categorias.id')
            ->join('orden_compra','articulos.idordencompra','=','orden_compra.id')
            ->select('articulos.id','articulos.idcategoria','articulos.codigo','articulos.nombre','categorias.nombre as nombre_categoria','articulos.precio_venta','articulos.stock','articulos.unidad','articulos.marca','articulos.modelo','articulos.serie','orden_compra.numero as numero_ordencompra','orden_compra.fecha as fecha_ordencompra','articulos.idordencompra','articulos.condicion')
            ->where('articulos.stock','>','0')
            ->orderBy('articulos.id', 'desc')->paginate(10);
        }
        else{
            $articulos = Articulo::join('categorias','articulos.idcategoria','=','categorias.id')
            ->join('orden_compra','articulos.idordencompra','=','orden_compra.id')
            ->select('articulos.id','articulos.idcategoria','articulos.codigo','articulos.nombre','categorias.nombre as nombre_categoria','articulos.precio_venta','articulos.stock','articulos.unidad','articulos.marca','articulos.modelo','articulos.serie','orden_compra.numero as numero_ordencompra','orden_compra.fecha as fecha_ordencompra','articulos.idordencompra','articulos.condicion')
            ->where('articulos.'.$criterio, 'like', '%'. $buscar . '%')
            ->where('articulos.stock','>','0')
            ->orderBy('articulos.id', 'desc')->paginate(10);
        }
        

        return ['articulos' => $articulos];
    }
    public function listarPdf(){
        $articulos = Articulo::join('categorias','articulos.idcategoria','=','categorias.id')
        ->join('orden_compra','articulos.idordencompra','=','orden_compra.id')
        ->select('articulos.id','articulos.idcategoria','articulos.codigo','articulos.nombre','categorias.nombre as nombre_categoria','articulos.precio_venta','articulos.stock','articulos.unidad','articulos.marca','articulos.modelo','articulos.serie','orden_compra.numero as numero_ordencompra','orden_compra.fecha as fecha_ordencompra','articulos.idordencompra','articulos.condicion')
        ->orderBy('articulos.nombre', 'desc')->get();

        $cont=Articulo::count();

        $pdf = \PDF::loadView('pdf.articulospdf',['articulos'=>$articulos,'cont'=>$cont])->setPaper('a4', 'landscape');
        return $pdf->stream('articulos.pdf');
    }
    public function buscarArticulo(Request $request ){
        if (!$request->ajax()) return redirect('/');

        $filtro = $request->filtro;
        $articulos = Articulo::where('codigo','=', $filtro)
        ->select('id', 'nombre')->orderBy('nombre', 'asc')->take(1)->get();

        return ['articulos' => $articulos];
    }
    public function buscarArticuloVenta(Request $request ){
        if (!$request->ajax()) return redirect('/');

        $filtro = $request->filtro;
        $articulos = Articulo::where('codigo','=', $filtro)
        ->select('id', 'nombre','stock','precio_venta')
        ->where('stock','>','0')
        ->orderBy('nombre', 'asc')->take(1)->get();

        return ['articulos' => $articulos];
    }
    public function store(Request $request)
    {
        $request->validate([
            'nombre' => 'required|unique:articulos'
        ]);
        if (!$request->ajax()) return redirect('/');
        $articulo = new Articulo();
        $articulo->idcategoria = $request->idcategoria;
        $articulo->codigo = $request->codigo;
        $articulo->nombre = $request->nombre;
        $articulo->precio_venta = $request->precio_venta;
        $articulo->stock = $request->stock;

        $articulo->unidad = $request->unidad;
        $articulo->marca = $request->marca;
        $articulo->modelo = $request->modelo;
        $articulo->serie = $request->serie;

        $articulo->descripcion = $request->descripcion;
        $articulo->condicion = '1';

        $articulo->idordencompra = $request->idordencompra;
        
        $articulo->save();
    }
    public function update(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $articulo = Articulo::findOrFail($request->id);
        $articulo->idcategoria = $request->idcategoria;
        $articulo->codigo = $request->codigo;
        $articulo->nombre = $request->nombre;
        $articulo->precio_venta = $request->precio_venta;
        $articulo->stock = $request->stock;

        $articulo->unidad = $request->unidad;
        $articulo->marca = $request->marca;
        $articulo->modelo = $request->modelo;
        $articulo->serie = $request->serie;

        $articulo->descripcion = $request->descripcion;
        $articulo->condicion = '1';

        $articulo->idordencompra = $request->idordencompra;

        $articulo->save();
    }

    public function desactivar(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $articulo = Articulo::findOrFail($request->id);
        $articulo->condicion = '0';
        $articulo->save();
    }

    public function activar(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $articulo = Articulo::findOrFail($request->id);
        $articulo->condicion = '1';
        $articulo->save();
    }

}
