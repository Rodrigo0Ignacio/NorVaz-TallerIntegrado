
<%@page import="java.util.ArrayList"%>
<%@page import="Entidad.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
HttpSession sesion = request.getSession();
/* capturamos la sesion del usuario*/
String nombre = null;
String usuario = null;
String rol = "0";
String estiloU = null;
String estiloA = null;
String sesionIniciada = null;
String sinSesion = null;

if(sesion.getAttribute("rol") != null && sesion.getAttribute("usuario") != null ){
    rol = sesion.getAttribute("rol").toString();
    usuario = sesion.getAttribute("usuario").toString();
    nombre = sesion.getAttribute("nombre").toString();
}
// capturamos los atributos entrantes del usuario a editar
ArrayList<Usuario> lista = (ArrayList<Usuario>) request.getAttribute("lista");

// capturamos la variable para ocultar un form
String formBuscarCUenta = null;
if(request.getAttribute("ocultarForm") != null){
    formBuscarCUenta = "style=\"display: none\"";
}


switch (rol){
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
        <link href="css/editar-cuenta-administrador-estilos.css" rel="stylesheet" type="text/css"/>
        <title>NorVaz - Editar una Cuenta</title>
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
                    <div class="InisiarSesion" <%=formBuscarCUenta%> >
                         <h2> Buscar Cuenta </h2>
                         <br>
                         <form method="post" action="servlet_EditarAdministrador" >
                             <table>
                                 <tr>
                                 <tr><td><br></td><td></td></tr>
                                 <tr><td>RUT&nbsp;&nbsp;</td><td><input type="text"
                                 name="txt_rut" placeholder="Ingrese el rut de la cuenta a editar"></td></tr>
                                 <tr><td><br></td><td></td></tr>
                                 <tr><td></td><td> <input type="submit" name="btn_buscar" value="Buscar Cuenta"></td></tr>
                                 <tr><td><br></td><td></td></tr>
                                 
                             </table>
                         </form>

                     </div>
                    
                    <%if (lista != null) {%>
                    <%for (Usuario i : lista) {%>
                    <div class="cuenta" >
                        <h2> Editar Cuenta </h2>
                        <br>
                        <form method="post" action="servlet_EditarAdministrador"  >
                            <table>
                                <tr><td><br></td><td></td></tr>
                                <tr><td><input type="hidden" value="<%=i.getId_usuario()%>" name="id"></td></tr>
                                <tr><td><br></td><td></td></tr>
                                <tr><td>RUT* </td><td><input type="text" value="<%=i.getRut()%>" name="txt_rutM"></td></tr>
                                <tr><td><br></td><td></td></tr>
                                <tr><td>Nombre* </td><td><input type="text" value="<%=i.getNombre()%>" name="txt_nombreM"></td></tr>
                                <tr><td><br></td><td></td></tr>
                                <tr><td>Apellidos* </td><td><input type="text" value="<%=i.getApellidos()%>" name="txt_apellidoM"></td></tr>
                                <tr><td><br></td><td></td></tr>
                                <tr><td>Email* </td><td><input type="email" value="<%=i.getEmail()%>" name="txt_emailM" placeholder="ejemplo: roberto.farias@dominio.cl"></td></tr>
                                <tr><td><br></td><td></td></tr>
                                <tr><td>Telefono* </td><td><input type="tel" value="<%=i.getTelefono()%>" name="txt_telefonoM" placeholder="ejemplo: 98745632"></td></tr>
                                <tr><td><br></td><td></td></tr>

                                <tr><td></td><td> <input type="submit" name="btn_editar" value="Editar Cuenta"></td></tr>
                                <tr><td><br></td><td></td></tr>
                                <tr><td></td><td> <input type="submit" name="btn_eliminar" value="Eliminar Cuenta"></td></tr>    
                            </table>
                        </form>
                    </div>
                    <%}%>
                    <%}%>
                    <%if (lista != null) {%>
                    <%if (lista.isEmpty()) {%>
                        <h1>Usuario no encontrado</h1>

                    <%}%>
                    <%}%>
                </div>


        <div id="fooster">
            datos 

        </div>
    </div>

    </body>
    <!--JS DE VETANA FLOTANTE-->
    <script src="js/ventana-flotante.js" type="text/javascript"></script>
</html>
