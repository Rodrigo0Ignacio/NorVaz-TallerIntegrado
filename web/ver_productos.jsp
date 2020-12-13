<%@page import="modelo.Crud_Producto"%>
<%@page import="Entidad.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
    HttpSession sesion = request.getSession();
    /* capturamos la sesion del usuario*/
    String usuario = null;
    String rut = null;
    String nombre = null;
    String rol = "0";
    String estiloU = null;
    String estiloA = null;
    String sesionIniciada = null;
    String sinSesion = null;

    Crud_Producto product = new Crud_Producto();
    Producto producto = (Producto) request.getAttribute("producto");
    ArrayList<Producto> cProductos = product.ListarCategoria();
    ArrayList<Producto> listac;
    ArrayList comentarios = product.buscarcomentarios(producto.getCodigo());

    if (sesion.getAttribute("rol") != null && sesion.getAttribute("usuario") != null) {
        rol = sesion.getAttribute("rol").toString();
        usuario = sesion.getAttribute("usuario").toString();
        nombre = sesion.getAttribute("nombre").toString();
        rut = sesion.getAttribute("rut").toString();
    }

// CIERRA UNA SESION
    if (request.getParameter("cerrar") != null) {
        sesion.invalidate();
        response.sendRedirect("index.jsp");
    }

    switch (rol) {
        case "1":
            estiloA = "style=\"display: none\"";
            sinSesion = "style=\"display: none\"";
            break;

        case "2":
            estiloU = "style=\"display: none\"";
            sinSesion = "style=\"display: none\"";
            break;

        default:
            estiloU = "style=\"display: none\"";
            estiloA = "style=\"display: none\"";
            sesionIniciada = "style=\"display: none\"";
    }

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/productos-estilos.css" rel="stylesheet" type="text/css"/>
        <title>NorVaz</title>
    </head>
    <body>
        <!--VENTANA FLOTANTE-->
        <div class="flotante" id="ventana">
            <div id="cerrar">
                <a href="javascript:cerrar()"><img src="img/boton.png"></a>

                <form method="post" action="servlet_Email">
                    <input class="txt" type="email" name="email" value="" placeholder="Ingresa el Email Asociado a la cuenta"> <br/> <br/>
                    <input class=" " type="submit" name="enviarCorreo" value="Recuperar contraseña"> 
                </form>

            </div>
        </div>

        <div id="contenedor">
            <div id="header">

                <div id="logo">
                    <img src="img/logo_destornillador.PNG" alt="">
                </div>

                <div id="CuentaUser">
                    <ul>
                        <li><img class="central" src="img/usuario.png" alt=""></li>
                    </ul>

                    <!--APARTADO DE OPCIONES DE SESION (USUARIO)-->
                    <ul <%=sesionIniciada%> >
                        <li><a href="InicioSesion.jsp"> Bienvenid@ <%=nombre%> </a></li>
                        <li><a href="index.jsp?cerrar=true">Cerrar Sesion</a></li>
                    </ul>

                    <ul <%=sinSesion%> >
                        <li><a href="InicioSesion.jsp"> Iniciar Sesion</a></li>
                        <li><a href="InicioSesion.jsp"> Crear una cuenta</a></li>
                        <li><a href="javascript:abrir()"> olvidaste tu contraseña</a></li>
                    </ul>


                </div>

            </div>
            <div id="nav1">
                <nav class="navegacion">
                    <ul class="menu">
                        <li><a href="index.jsp">Inicio </a></li>
                        <li><a href="Servicios.jsp">Servicios </a></li>
                        <li><a href="Productos.jsp">Productos </a>
                            <ul class="submenu">
                                <%for (Producto p : cProductos) {%>

                                <li><a href="Servlet_productos?param=<%=p.getCategoria()%>"><%=p.getCategoria()%></a></li>
                                    <%}%>
                            </ul>
                        </li>
                        <li><a href="Ofertas.jsp">Ofertas </a></li>
                        <li><a href="Contactanos.jsp"> Contactanos </a></li>
                    </ul>
                </nav>
            </div>

            <!--ESTE SUB MENU PERTENECE AL USUARIO-->
            <div id="barra-usuario1" class="barra-usuario" <%= estiloU%>  >
                <nav class="navegacionUser">
                    <ul class="menu2">

                        <li><a href="usuario-Editar.jsp"> Editar Perfil </a></li>
                        <li><a href=" "> Sigue tu despacho </a></li>
                        <li><a href=" "> Sigue tu despacho </a></li>
                        <li><a href=" "> Sigue tu despacho </a></li>
                        <li><a href=" "> <img src="img/carrito.png"> ver carrito </a></li>
                    </ul>
                </nav>
            </div> 
            <!--ESTE SUB MENU PERTENECE AL ADMINISTRADOR-->
            <div id="barra-usuario1" class="barra-usuario" <%= estiloA%>  >
                <nav class="navegacionUser">
                    <ul class="menu2">

                        <li><a href=" "> Editar Perfil </a></li>
                        <li><a href=" "> Cambiar contraseña </a></li>
                        <li><a href=" "> Subir Articulos </a></li>
                        <li><a href=" "> Eliminar Usuarios </a></li>
                        <li><a href=" "> varias cosas </a></li>
                        <li><a href=" "> <img src="img/carrito.png"> ver carrito </a></li>
                    </ul>
                </nav>

            </div>
            <div id="publicidad">

            </div>


            <div id="ver_productos">

                <div id="imgproducto">
                    <img src="<%=producto.getUrl()%>" alt="">

                    <table border="0" id="tabla">

                        <tr ID="primerafila">
                            <td></td>
                            <td><p>Codigo de producto: <%=producto.getCodigo()%></p></td>
                        </tr>
                        <tr id="segundafila">

                            <td id="uno"><%=producto.getNombre()%></td>
                            <td id="tres">Descuento : <%=producto.getOferta()%></td>

                        </tr>
                        <tr id="tercerafila">

                            <td id="dos">Tipo : <%=producto.getCategoria()%></td>
                            <td id="cuatro"><p>Precio : <%=producto.getPrecio()%></p></td>

                        </tr>
                        <tr id="tercerafila">

                            <td id="dos">Disponibles : <%=producto.getStock()%></td>
                            <td id="cuatro"><button type="submit" name="codigo" value="<%=producto.getCodigo()%>">Agregar al carrito</button></td>

                        </tr>
                    </table>
                </div>

                <div id="especificaciones">


                    <table id="tabla1">
                        <tr>
                            <th>Informacion del producto</th>
                        </tr>
                        <tr>
                            <td>Tipo : <%=producto.getCategoria()%></td>
                        </tr>
                        <tr>
                            <td>Peso : <%=producto.getPeso()%></td>
                        </tr>
                    </table>

                    <table id="tabla2">

                        <tr>
                            <th>Descripcion del producto</th>
                        </tr>
                        <tr>
                            <td><%=producto.getDescripcion()%></td>
                        </tr>

                    </table>
                </div>
            </div>
            <div id="comentarios">

                <table id="tabla3">
                    <tr>
                        <th>comentarios</th>
                    </tr>
                    <%for(int i=0;i<comentarios.size();i++){%>
                    <tr>
                        <td><%=comentarios.get(i)%></td>
                    </tr>
                    <%}%>
                </table>
            </div>
        </div>
        <div id="fooster">
            datos 

        </div>
    </div>

</body>
<!--JS DE VETANA FLOTANTE-->
<script src="js/ventana-flotante.js" type="text/javascript"></script>
</html>
