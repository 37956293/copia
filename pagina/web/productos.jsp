<%@page import="java.util.HashMap"%>
<%@page import="modelo.Producto " %>
<%@page import="modelo.Marcas" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Productos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style>
    .logo{
        display: block;
        width: 100px;
        height: 50px;
        background-image: url('img/corona.png');
        background-size: contain;
        background-repeat: no-repeat;
        text-indent: -9999px;
        }
    </style>
</head>
<header>
        
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand logo" href="inicio.html">Empresa</a> 
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="inicio.html">Inicio</a>
                        </li>
                        
                    </ul>
                </div>
            </div>
        </nav>
    </header>
<body>
    <center><h1>Lista de Productos</h1></center>
    <div class="container">
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Producto</th>
                    <th>ID Marca</th>
                    <th>Descripción</th>
                    <th>Precio Costo</th>
                    <th>Precio Venta</th>
                    <th>Existencia</th>
                    <th>Fecha Ingreso</th>
                </tr>
            </thead>
            <tbody id="tbl_productos">
                <%
                    Producto producto = new Producto();
                    List<Producto> productos = producto.leerProductos();
                    for (Producto p : productos) {
                %>
                <tr>
                    <td><%= p.getid_producto() %></td>
                    <td><%= p.getproducto() %></td>
                    <td><%= p.getid_marca() %></td>
                    <td><%= p.getdescripcion() %></td>
                    <td><%= p.getprecio_costo() %></td>
                    <td><%= p.getprecio_venta() %></td>
                    <td><%= p.getexistencia() %></td>
                    <td><%= p.getfecha_ingreso() %></td>
                    <td>
                        <form action="sr_productos" method="post" style="display:inline;">
                            <input type="hidden" name="txt_id_producto" value="<%= p.getid_producto() %>">
                            
                        </form>
                        <form action="sr_productos" method="post" style="display:inline;">
                            <input type="hidden" name="txt_id_producto" value="<%= p.getid_producto() %>">
                            
                        </form>
                    </td>
                    </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>


    <center><h1>Formulario Crear Producto</h1></center>
    <br>
    <center><p>En este apartado verificaremos el ingreso de los productos de la empresa</p></center>
    <div class="container">
        <form class="form-group needs-validation" novalidate action="sr_productos" method="post" onsubmit="return handleFormSubmit();">
            <label for="lbl_id_producto" class="form-label"><b>ID Producto</b></label>
            <input type="text" class="form-control" name="txt_id_producto" id="txt_id_producto" value="0" readonly>

            <label for="lbl_producto" class="form-label"><b>Producto</b></label>
            <input type="text" name="txt_producto" id="txt_producto" class="form-control" placeholder="Ej: producto" required>

            <label for="lbl_idMarca" class="form-label"><b>ID Marca</b></label>
            
            <select name="drop_marca" id="drop_marca" class="form-select" required>
                <option selected disable value="">Seleccione</option>
                    <% 
                    Marcas marcas = new Marcas();
                    HashMap<String,String> drop = marcas.drop_marca();
                    for (String i:drop.keySet()){
                        out.println("<option value='"+ i +"'>"+ drop.get(i)+"</option>");    
                    }
                    %>
            </select>

            <label for="lbl_descripcion" class="form-label"><b>Descripción</b></label>
            <input type="text" name="txt_descripcion" id="txt_descripcion" class="form-control" placeholder="Ej: descripción del producto" required>

            <label for="lbl_imagen" class="form-label"><b>Imagen</b></label>
            <input type="text" name="txt_imagen" id="txt_imagen" class="form-control" placeholder="img" required> 
            
            <!--<form>
                <div class="form-group">
                    <label for="exampleFormControlFile1">Example file input</label>
                    <input type="file" class="form-control-file" id="exampleFormControlFile1">
                </div>
            </form>-->

            <label for="lbl_precio_costo" class="form-label"><b>Precio Costo</b></label>
            <input type="number" step="0.01" name="txt_precio_costo" id="txt_precio_costo" class="form-control" placeholder="Ej: 100.00" required>

            <label for="lbl_precioVenta" class="form-label"><b>Precio Venta</b></label>
            <input type="number" step="0.01" name="txt_precio_venta" id="txt_precio_venta" class="form-control" placeholder="Ej: 150.00" required>

            <label for="lbl_existencia" class="form-label"><b>Existencia</b></label>
            <input type="number" name="txt_existencia" id="txt_existencia" class="form-control" placeholder="Ej: 50" required>

            <label for="lbl_fecha_ingreso" class="form-label"><b>Fecha Ingreso</b></label>
            <input type="date" name="txt_fecha_ingreso" id="txt_fecha_ingreso" class="form-control" required>
            <br>
            <button name="btn_crear" id="btn_crear" value="crear" class="btn btn-primary"><i class="bi bi-cloud-download"></i> Crear</button>
            <button name="btn_actualizar" id="btn_actualizar" value="actualizar" class="btn btn-primary"><i class="bi bi-cloud-download"></i> Actualizar</button>
            <button name="btn_borrar" id="btn_borrar" value="borrar" class="btn btn-primary"><i class="bi bi-cloud-download"></i> Borrar</button>
        </form>
    </div>
    
    <script>
        // Función para manejar el envío del formulario
        function handleFormSubmit() {
            // Aquí puedes agregar la lógica para validar el formulario o hacer algo antes de enviar
            // Por ejemplo, puedes guardar un mensaje en la sesión para mostrarlo después
            return true; // Permite que el formulario se envíe
        }

        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (function () {
            'use strict'
            var forms = document.querySelectorAll('.needs-validation')
            Array.prototype.slice.call(forms)
                .forEach(function (form) {
                    form.addEventListener('submit', function (event) {
                        if (!form.checkValidity()) {
                            event.preventDefault()
                            event.stopPropagation()
                        }
                        form.classList.add('was-validated')
                    }, false)
                })                                                                                                  
        })()
        
        // Refrescar la página después de enviar
        window.onload = function() {
            if (window.location.search.indexOf('success=true') > -1) {
                location.reload(); // Refrescar la página si el envío fue exitoso
            }
        }
    </script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
        <script type="text/javascript">
     
</script>
</body>
</html>