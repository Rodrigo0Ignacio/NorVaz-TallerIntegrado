
<%@page import="Entidad.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%
HttpSession sesion = request.getSession();
/* capturamos la sesion del usuario*/
String usuario = null;
String rol = "0";
String estiloU = null;
String estiloA = null;
String sesionIniciada = null;
String sinSesion = null;

if(sesion.getAttribute("rol") != null && sesion.getAttribute("usuario") != null ){
    rol = sesion.getAttribute("rol").toString();
    usuario = sesion.getAttribute("usuario").toString();
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
        <link href="css/InicioSesion-estilos.css" rel="stylesheet" type="text/css"/>
        <title>NorVaz - Sesion</title>
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
                        <li><a href="InicioSesion.jsp"> Bienvenid@ <%=usuario%> </a></li>
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
        <div id="contenido">
            <div class="InisiarSesion">
                <h2>Iniciar Sesion</h2>
                <form action="Servlet_InicioSesion" method="post">
                <table>
                       <tr><br><td><br></td><td></td></tr>
                       <tr><td><br></td><td></td></tr>
                       <tr><td>Usuario* </td><td><input type="text" value="" name="txt_verificarUsuario" placeholder="ejemplo: roberto.farias@dominio.cl"></td></tr>
                       <tr><td><br></td><td></td></tr>
                       <tr><td>Contraseña* </td><td><input type="password" value="" name="txt_verificarPassword"></td></tr>
                       <tr><td><br></td><td></td></tr>
                       
                       <tr><td></td><td> <input type="submit" name="btn_Validar" value="Inciar Sesion"></td></tr>
                </table>
                </form>


            </div>
                <div class="Registrarse">
                    <h2> Registrarse </h2>
                    <form method="post" action="Servlet_InicioSesion" >
                    <table>
                        <tr><br> <h3> <td><br></td><td></td></tr>
                           <tr><td><br></td><td></td></tr>
                           <tr><td>Nombre* </td><td><input type="text" value="" name="txt_regisNombre"></td></tr>
                           <tr><td><br></td><td></td></tr>
                           <tr><td>Apellidos* </td><td><input type="text" value="" name="txt_regisApellido"></td></tr>
                           <tr><td><br></td><td></td></tr>
                           <tr><td>Email* </td><td><input type="email" value="" name="txt_regisEmail" placeholder="ejemplo: roberto.farias@dominio.cl"></td></tr>
                           <tr><td><br></td><td></td></tr>
                           <tr><td>Rut* </td><td><input type="text" value="" name="txt_regisRut" placeholder="ejemplo: 12.111.222-4"></td></tr>
                           <tr><td><br></td><td></td></tr>
                           <tr><td>Telefono* </td><td><input type="tel" value="" name="txt_regisTelefono" placeholder="ejemplo: 98745632"></td></tr>
                           <tr><td><br></td><td></td></tr>
                           <tr><td>Contraseña* </td><td><input type="password" value="" name="txt_regisContrasena"></td></tr>
                           <tr><td><br></td><td></td></tr>
                           <tr><td>Confirma contraseña* </td><td><input type="password" value="" name="txt_regisConfirmaContrasena"></td></tr>
                           <tr><td><br></td><td></td></tr>
                           
                           <tr><td></td><td> <input type="submit" name="btn_Registrar" value="Registrarse"></td></tr>
        
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
