<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrdenCompra extends Model
{
   //protected $table = 'categorias';
    //protected $primaryKey = 'id';
    protected $fillable = ['numero','nombre','fecha','direccion','descripcion','referencia','condicion'];

    public function articulos()
    {
        return $this->hasMany('App\Articulo');
    }
}
