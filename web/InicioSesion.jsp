

<%@page import="Entidad.RegistroUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%

HttpSession sesion = request.getSession();
/*Variables para cambiar las opciones de sesion (al estar en una sesion cambaran las opciones)*/
String sesionIniciada = null;
String sinSesion = null;

/* capturamos la sesion del usuario*/
String usuario = null;
String estilo = null;

if(sesion.getAttribute("usuario") != null){
    usuario = sesion.getAttribute("usuario").toString(); 
}

//Cerrar sesion
if(request.getParameter("cerrar") != null){
    sesion.invalidate();
    response.sendRedirect("index.jsp");
}

// SI EL USUARIO INICIA SESION DE DESPLIEGA EL MENU DE OPCIONES QUE POSEE
if(usuario == null){
    estilo = "style=\"display: none\"";
    sesionIniciada = "style=\"display: none\"";
} else{
    sinSesion = "style=\"display: none\"";
    response.sendRedirect("index.jsp");
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
            <div id="contenedor">
        <div id="header">

            <div id="logo">
                <img src="img/logo_destornillador.PNG" alt="">
            </div>

            <div id="CuentaUser">
                <ul>
                    <li><img class="central" src="img/usuario.png" alt=""></li>
                </ul>
                
                <!--APARTADO DE OPCIONES DE SESION-->
                
                <ul <%=sesionIniciada%> >
                    <li><a href="InicioSesion.jsp"> Bienvenid@ <%=usuario%> </a></li>
                    <li><a href="index.jsp?cerrar=true" > Cerrar Sesion </a></li>
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
              <div id="barra-usuario1" class="barra-usuario" <%= estilo%>  >
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
</html>
