
<%@page import="modelo.Fecha"%>
<%@page import="Entidad.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>


<%
    HttpSession sesion = request.getSession();
    /* capturamos la sesion del usuario*/
    String nombre = null;
    String rut = null;
    String usuario = null;
    String rol = "0";
    String estiloU = null;
    String estiloA = null;
    String sesionIniciada = null;
    String sinSesion = null;
    String capturaServicio = null;
    // se declararon estas variables para establecer las opciones de servicio
    String opcion1 = null;
    String opcion2 = null;
    String opcion3 = null;
    String opcion4 = null;
    
    

    if (sesion.getAttribute("rol") != null && sesion.getAttribute("usuario") != null) {
        rol = sesion.getAttribute("rol").toString();
        usuario = sesion.getAttribute("usuario").toString();
        nombre = sesion.getAttribute("nombre").toString();
        rut = sesion.getAttribute("rut").toString();
    }
    // si la sesion es nula me redirecciona a otra pagina, sino
// capturara la variable que viene del servicios
// y establecera la lista de acuerdo a la variable entregada
    if (usuario == null) {
        response.sendRedirect("advertencia.jsp");
    }

    // CAPTURA LA VARIABLE DE ACUERDO AL SERVICIO Y SELECCCIONA EL SERVICIO
    if (request.getParameter("servicio") != null) {
        capturaServicio = request.getParameter("servicio");

        switch (capturaServicio) {
            case "1":
                opcion1 = "selected";

                break;

            case "2":
                opcion2 = "selected";
                break;

            case "3":
                opcion3 = "selected";
                break;

            case "4":
                opcion4 = "selected";
                break;
        }

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
        <link href="css/usuario-servicios-estilos.css" rel="stylesheet" type="text/css"/>
        
        <title>NorVaz - Ingresar un servicio</title>
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
                        <li><a href="index.jsp">Productos </a>
                            <ul class="submenu">
                                <li><a>Mesas</a></li>
                                <li><a>Sillas</a></li>
                                <li><a>Escritorios</a></li>
                                <li><a>Otros</a></li>

                            </ul>

                        </li>
                        <li><a href="Ofertas.jsp">Ofestas </a></li>
                        <li><a href="Contactanos.jsp"> Contactanos </a></li>
                    </ul>
                </nav>
            </div>
            <!--ESTE SUB MENU PERTENECE AL USUARIO-->
            <div id="barra-usuario1" class="barra-usuario" <%= estiloU%>  >
                <nav class="navegacionUser">
                    <ul class="menu2">

                        <li><a href=" "> Editar Perfil </a></li>
                        <li><a href=" "> Cambiar contraseña </a></li>
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
                        <li><a href=" "> Agregar Administrador </a></li>
                        <li><a href=" "> Editar Cuenta Usuario </a></li>
                        <li><a href=" "> Agregar Producto </a></li>
                        <li><a href=" "> Editar Producto </a></li>
                        <li><a href=" "> Administrar Estado </a></li>
                    </ul>
                </nav>


            </div>

            <div id="publicidad">
            </div>
            <div id="contenido">
                <div class="InisiarSesion">
                    <h2>Ingresar un Servicio</h2>
                    <form action="servlet_servicio" method="get">
                        <table>
                                <tr><td><br></td><td></td></tr>
                                <tr><td><br><h3>Servicio</h3></td><td>

                                        <select name="op_servicios">
                                            <option <%=opcion1%>>Servicio de Gafiteria</option>
                                            <option <%=opcion2%>>Mantenimiento</option>
                                            <option <%=opcion3%>>Servicios de Pintura</option>
                                            <option <%=opcion4%>>Servicio de Reparacion</option> 
                                        </select>

                                    </td></tr>

                                <tr><td><br></td><td></td></tr>
                                <tr><td>Poblacion o villa* </td><td><input type="text" value="" name="txt_poblacion_villa" placeholder="ejmplo: San Antonio, cerro arenas,"></td></tr>
                                <tr><td><br></td><td></td></tr>
                                <tr><td>Calle* </td><td><input type="text" name="txt_calle" placeholder="ejmplo: Manuel Blanco Encalada"></td></tr>
                                <tr><td><br></td><td></td></tr>
                                <tr><td>Numero de casa o departamento* </td><td><input type="text" name="txt_NCasa" placeholder=""></td></tr>
                                <tr><td><br></td><td></td></tr>
                                <tr><td>Telefono* </td><td><input type="tel"  name="txt_telefono" placeholder="ejemplo: 98745632"></td></tr>
                                <tr><td><br></td><td></td></tr>
                                <tr><td>Ingrese una descripcion de su problema* </td><td><textarea name="textA_requerimiento" cols="35" rows="6" placeholder="Ingrese su requerimiento, de forma detallada."></textarea>
                                        </textarea></td></tr>
                                <tr><td><br></td><td></td></tr>
                                <tr><td></td><td><input type="hidden" value="<%=rut%>" name="rut"></td></tr>
                                <tr><td></td><td><input type="hidden" value="<%=usuario%>" name="email"></td></tr>
                                <tr><td></td><td> <input type="submit" name="btn_solicitar" value="Solicitar Servicio"> </td></tr>
                                
                               
                        </table>
                    </form>


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