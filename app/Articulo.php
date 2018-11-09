<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Articulo extends Model
{
    protected $fillable =[
        'idcategoria','codigo','nombre','precio_venta','stock','descripcion','unidad','marca','modelo','serie','condicion'
    ];
    public function categoria(){
        return $this->belongsTo('App\Categoria');
    }
    public function ordencompra(){
        return $this->belongsTo('App\OrdenCompra');
    }
}
