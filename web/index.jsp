<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%  
HttpSession sesion = request.getSession();
/* capturamos la sesion del usuario*/
String usuario = null;
String estilo = null;
String cerrar = "true";
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
        <link href="css/Index-estilos.css" rel="stylesheet" type="text/css"/>
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
                
                <!--APARTADO DE OPCIONES DE SESION-->
                
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
            <article class="producto">

                <div id="imagenProducto">
                    <img src="img/mueble-toto.jpg" alt="">

                </div>
                
                <div id="detalles">
                    <ul>
                        <li>Codigo:</li>
                        <li>Precio:</li>
                        <li>Tipo: </li>
                        <li>Marca: </li>
                        <li>Peso: </li>
                        
                    </ul>
                </div>
                <div id="Boton">
                    <button> Agregar a la bolsa</button>

                </div>
                

            </article>
            <article class="producto">
                
                <div id="imagenProducto">
                    <img src="img/mueble-toto.jpg" alt="">

                </div>
                
                <div id="detalles">
                    <ul>
                        <li>Codigo:</li>
                        <li>Precio:</li>
                        <li>Tipo: </li>
                        <li>Marca: </li>
                        <li>Peso: </li>
                        
                    </ul>
                </div>
                <div id="Boton">
                    <button> Agregar a la bolsa</button>

                </div>

            </article>
            <article class="producto"> 
                
                <div id="imagenProducto">
                    <img src="img/mueble-toto.jpg" alt="">

                </div>
                
                <div id="detalles">
                    <ul>
                        <li>Codigo:</li>
                        <li>Precio:</li>
                        <li>Tipo: </li>
                        <li>Marca: </li>
                        <li>Peso: </li>
                        
                    </ul>
                </div>
                <div id="Boton">
                    <button> Agregar a la bolsa</button>

                </div>

            </article>
            <article class="producto">
                
                <div id="imagenProducto">
                    <img src="img/mueble-toto.jpg" alt="">

                </div>
                
                <div id="detalles">
                    <ul>
                        <li>Codigo:</li>
                        <li>Precio:</li>
                        <li>Tipo: </li>
                        <li>Marca: </li>
                        <li>Peso: </li>
                        
                    </ul>
                </div>
                <div id="Boton">
                    <button> Agregar a la bolsa</button>

                </div>

            </article>

            <article class="producto">
                
                <div id="imagenProducto">
                    <img src="img/mueble-toto.jpg" alt="">

                </div>
                
                <div id="detalles">
                    <ul>
                        <li>Codigo:</li>
                        <li>Precio:</li>
                        <li>Tipo: </li>
                        <li>Marca: </li>
                        <li>Peso: </li>
                        
                    </ul>
                </div>
                <div id="Boton">
                    <button> Agregar a la bolsa</button>

                </div>

            </article>

        </div>

        <div id="fooster">
            datos 

        </div>
    </div>
    
</body>
<script>
    function abrir(){
        document.getElementById("ventana").style.display ="block";
    }
    function cerrar(){
        document.getElementById("ventana").style.display="none";
    }
</script>
       
</html>