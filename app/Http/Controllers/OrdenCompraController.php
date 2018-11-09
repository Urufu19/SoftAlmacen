<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\OrdenCompra;

class OrdenCompraController extends Controller
{
     /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if (!$request->ajax()) return redirect('/');

        $buscar = $request->buscar;
        $criterio = $request->criterio;
        
        if ($buscar==''){
            $ordencompras = OrdenCompra::orderBy('id', 'desc')->paginate(10);
        }
        else{
            $ordencompras = OrdenCompra::where($criterio, 'like', '%'. $buscar . '%')->orderBy('id', 'desc')->paginate(10);
        }
        

        return [
            'pagination' => [
                'total'        => $ordencompras->total(),
                'current_page' => $ordencompras->currentPage(),
                'per_page'     => $ordencompras->perPage(),
                'last_page'    => $ordencompras->lastPage(),
                'from'         => $ordencompras->firstItem(),
                'to'           => $ordencompras->lastItem(),
            ],
            'ordencompras' => $ordencompras
        ];
    }

    public function selectOrdenCompra(Request $request){
        if (!$request->ajax()) return redirect('/');
        $ordencompras = OrdenCompra::where('condicion','=','1')
        ->select('id','numero','nombre','fecha')->orderBy('numero', 'asc')->get();
        return ['ordencompras' => $ordencompras];
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $ordencompra = new OrdenCompra();
        $ordencompra->numero = $request->numero;
        $ordencompra->nombre = $request->nombre;
        $ordencompra->fecha = $request->fecha;
        $ordencompra->direccion = $request->direccion;
        $ordencompra->descripcion = $request->descripcion;
        $ordencompra->referencia = $request->referencia;
        $ordencompra->condicion = '1';
        $ordencompra->save();
    }
  

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $ordencompra = OrdenCompra::findOrFail($request->id);
        $ordencompra->numero = $request->numero;
        $ordencompra->nombre = $request->nombre;
        $ordencompra->fecha = $request->fecha;
        $ordencompra->direccion = $request->direccion;
        $ordencompra->descripcion = $request->descripcion;
        $ordencompra->referencia = $request->referencia;
        $ordencompra->condicion = '1';
        $ordencompra->save();
    }

    public function desactivar(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $ordencompra = OrdenCompra::findOrFail($request->id);
        $ordencompra->condicion = '0';
        $ordencompra->save();
    }

    public function activar(Request $request)
    {
        if (!$request->ajax()) return redirect('/');
        $ordencompra = OrdenCompra::findOrFail($request->id);
        $ordencompra->condicion = '1';
        $ordencompra->save();
    }

}
