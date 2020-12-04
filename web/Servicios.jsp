

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
        <link href="css/Servicios-estilos.css" rel="stylesheet" type="text/css"/>
        <title>NorVaz - Servicios</title>
    </head>
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
                        <li><a href=" "> Cambiar contraseña </a></li>
                        <li><a href=" "> Subir Articulos </a></li>
                        <li><a href=" "> Eliminar Usuarios </a></li>
                        <li><a href=" "> varias cosas </a></li>
                        <li><a href=" "> <img src="img/carrito.png"> ver carrito </a></li>
                    </ul>
                </nav>

            </div>

        <div id="publicidad">
            <img class="imagen-publicitaria" src="img/publicidad.jpg" alt="" height="100%" width="100%">

        </div>
        <div id="contenido">
            <article class="producto">

                <div id="imagenProducto">
                    <img src="img/gafiteria.jpg" alt="">

                </div>
                
                <div id="detalles">
                    <ul>
                        <li>Gafiteria: <p>
                            Servicio Gasfiter profesional, si tienen un problema con tu
                            baño, llaves, cañerias de gas y muchos otros problemas,
                            no dudes en solitiar nuestros servicios. disponible en todo San Antonio
                            y ardedores.
                        </p></li>
                        
                    </ul>
                </div>
                <div id="Boton">
                    <button onclick="location.href='usuario-servicios.jsp?servicio=1';">Solicitar</button>

                </div>
                

            </article>
            <article class="producto">
                
                <div id="imagenProducto">
                    <img src="img/mantenimientojpg.jpg" alt="">

                </div>
                
                <div id="detalles">
                    <ul>
                        <li>Mantenimiento:<p>
                            Servicio de Carpiteria, si tienes muebles viejos 
                            y extrañas verlos nuevamente en tu casa, no dudes en solicitar nuestro
                            servicio de mantenimiento. limpiamos, pulimos y pintamos muebles de todo tipo.
                        </p>
                         </li> 
                    </ul>
                </div>
                <div id="Boton">
                    <button onclick="location.href='usuario-servicios.jsp?servicio=2';"> Solicitar</button>

                </div>

            </article>
            <article class="producto"> 
                
                <div id="imagenProducto">
                    <img src="img/pinturajpg.jpg" alt="">

                </div>
                
                <div id="detalles">
                    <ul>
                        <li>Servicio de Pintura: <p>
                            Profecionales en pintura, si tienes algun mueble que quieras darle otro 
                            estilo o sensillamente por que nunca te gusto su color, contactanos 
                            
                        </p></li>
                       
                    </ul>
                </div>
                <div id="Boton">
                    <button onclick="location.href='usuario-servicios.jsp?servicio=3';"> Solicitar</button>

                </div>

            </article>
            <article class="producto">
                
                <div id="imagenProducto">
                    <img src="img/reparaciones-muebles.png" alt="">

                </div>
                
                <div id="detalles">
                    <ul>
                        <li>Servicio de Reparacion: <a>
                            tenemos los mejores profecionales en carpinteria para
                            realizar todo tipo de repaciones a tus muebles favoritos.
                        </a></li>
                       
                        
                    </ul>
                </div>
                <div id="Boton">
                    <button onclick="location.href='usuario-servicios.jsp?servicio=4';"> Solicitar </button>

                </div>

            </article>

        </div>

        <div id="fooster">
            datos 

        </div>
    </div>
    </body>
     <!--JS DE VETANA FLOTANTE-->
    <script src="js/ventana-flotante.js" type="text/javascript"></script>
</html>
