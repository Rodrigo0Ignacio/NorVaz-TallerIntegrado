
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%  
HttpSession sesion = request.getSession();
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


/*Variables para cambiar las opciones de sesion (al estar en una sesion cambaran las opciones)*/
String sesionIniciada = null;
String sinSesion = null;
// SI EL USUARIO INICIA SESION DE DESPLIEGA EL MENU DE OPCIONES QUE POSEE
if(usuario == null){
    estilo = "style=\"display: none\"";
    sesionIniciada = "style=\"display: none\"";
} else{
    sinSesion = "style=\"display: none\"";
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/Contactanos-estilos.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
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
                    <li><a href="index.jsp?cerrar=true"> Cerrar Sesion </a></li>
                </ul>

                <ul <%=sinSesion%>>
                    <li><a href=" "> Iniciar Sesion</a></li>
                    <li><a href=" "> Crear una cuenta</a></li>
                    <li><a href=" "> olvidaste tu contraseña</a></li>
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
        </div>
              
   
        <div id="publicidad">
           publicidad
    
        </div>
        <div id="contenido">
            <article class="producto">
    
                <div id="imagenProducto">
                    <img src="img/atencioncliewnte.jpg" alt="">
    
                </div>
                
                <div id="detalles">
                    <ul>
                        <li>Telefono:</li>
                        <li>Email:</li>
                        <li>Direccion:</li>
                        <li>Servicio al cliente:</li>      
                    </ul>
                
                </div>
                <div id="Boton">
                    <button>Facebook</button>
                </div>
                <div id="Boton">
                    <button>whasapp</button>
                </div>
                
    
            </article>     
        </div>
    
        <div id="fooster">
            datos 
    
        </div>
    
        
    </div>

    </body>
</html>
