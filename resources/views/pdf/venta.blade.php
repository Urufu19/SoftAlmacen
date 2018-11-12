<!DOCTYPE>
<html>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Reporte de venta</title>
    <style>
 

       body {
        margin-top: 0;
        width:100%;
  font-family: 'helvetica', lato, sans-serif;
  font-size: 10px;
}

p{
    font-size: 14px;
}

table {
  width: 100%;
  margin: 0;
  border-collapse: collapse;
}

.biotalent-info {
  width: 8%;
}
.logo {
  width: 8%;
  padding-left: 50px;
}


.customer {
  padding: 1em 0;
  width: 100%;
}
.customer .customer-info {
  padding-left: 2em;
}
.customer .company-name {
  font-weight: bold;
}

.invoice-info {
  float: right;
  width: 40%;
}

.invoice-info h3{
    font-size: 25px;
    padding-bottom: 0;
    margin-bottom: .5em;
  }
.invoice-info th,
.invoice-info td {
  text-align: left;
  padding: .15em;
}

.invoice-items  {
  border: 1px solid;
}
.invoice-items thead tr{
  background-color: #ddd;
}
.invoice-items th, td {
    padding: 3px;
    text-align: center;
}
.invoice-items th {
  border: 1px solid;
}
.invoice-items td {
  border-right: 1px solid;
  border-left: 1px solid;
}
.invoice-items .invoice-comment,
.invoice-items .invoice-amount-label,
.invoice-items .invoice-amount {
  border-top: 1px solid;
}

.invoice-items .invoice-comment {
  text-align: left;
}
.invoice-items .invoice-amount-label {
  background-color: #ddd;
  width: 100px;
}
.invoice-items .invoice-amount {
  width: 80px;
}

.biotalent-GST {
  width: 100%;
  padding: .5em;
}

        }
    </style>
    <body>
        
 
    








        @foreach ($venta as $v)
        
        <center><h1>PEDIDO - COMPROBANTE DE SALIDA</h1></center>
    <img class="logo" src="http://www.iestpvictoralvarezhuapaya.edu.pe/alumnos/img/logo.png" >
    <div class="invoice-info">
    
        <table class="table-invoice">
          <tr>
            <th>{{$v->tipo_comprobante}} Nº:</th>
            <td><strong><p>{{$v->num_comprobante}}</p></strong></td>
          </tr>
          <tr>
            <th>FECHA (AAAA-MM-DD):</th>
            <td><p>{{$v->fecha_hora}}</p></td>
          </tr>
      </table>
    </div>

    <div class="customer">
      <div class="customer-info">
        <div class=""><strong>DEPENDENCIA SOLICITANTE:</strong>  &nbsp;&nbsp;&nbsp;&nbsp;DPTO. DE ADMINISTRACION</div>
        <div class=""><strong>SOLICITA ENTREGAR A:</strong>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{$v->nombre}}</div>
        
        <div class=""><strong>CON DESTINO A:</strong>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{$v->cargo}}</div>
        <div class=""><strong>ORDEN DE COMPRA Nº:</strong>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{{$v->asunto}}</div>
        <div class=""><strong>LO SIGUIENTE:</strong>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ORDEN ADMINISTRACION</div>
        
        
    </div>

    <br>

    <table class="invoice-items" border="1">
      <thead class="table-header">
        <tr>
          
          <th colspan="7">PRODUCTO</th>
         
          <th colspan="2">VALOR</th>
        </tr>
        <tr>
          
          <th width="2">CANT.</th>
          <th >DESCRIPCION</th>
          <th>MARCA</th>
          <th>MODELO</th>
          <th>SERIE</th>
          <th>ORD.COMP.</th>
          <th>UNIDAD</th>
          <th width="2">UNITARIO</th>
          <th width="2"> TOTAL</th>
        </tr>
       </thead>
       @foreach ($detalles as $det)
                        <tr>
                            
                            <td>{{$det->cantidad}}</td>
                            <td align="left">{{$det->articulo}}</td>
                            <td>{{$det->marca}}</td>
                            <td>{{$det->modelo}}</td>
                            <td>{{$det->serie}}</td>
                            <td>{{$det->numero_ordencompra.': '.$det->fecha_ordencompra}}</td>
                            <td>{{$det->unidad}}</td>
                            <td>{{$det->precio}}</td>
                            <td>{{number_format((float)($det->cantidad*$det->precio), 2, '.', '')}}</td>   
                        </tr>
                        @endforeach
       
      
      
      <tr>
        <td class="invoice-comment" colspan="7"><strong>TOTAL DE FILAS: {{count($detalles)}}</strong> </td>
        <td class="invoice-amount-label"><strong>TOTAL</strong></td>
        <td class="invoice-amount">S/. {{$v->total}}</td>
      </tr>
    </table>
    <table border="1">
      <tr>
         <td ><strong>SOLICITANTE</strong></td>
        <td ><strong>JEFE DE ADMINISTRACIÓN</strong></td>
        <td ><strong>JEFE DE ALMACÉN</strong></td>
        <td ><strong>RECIBI CONFORME</strong></td>
      </tr>
      <tr>
         <td HEIGHT="50"></td>
        <td></td>
        <td></td>
        <td></td>
      </tr>
     </table>
        @endforeach
    
        


    </body>
</html>