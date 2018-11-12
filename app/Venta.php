<?php
 
namespace App;
 
use Illuminate\Database\Eloquent\Model;
 
class Venta extends Model
{
    protected $fillable =[
        'idcliente', 
        'idusuario',
        'tipo_comprobante',
        'num_comprobante',
        'fecha_hora',
        'asunto',
        'total',
        'estado'
    ];
}