
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
        <link href="css/agregar-producto-css.css" rel="stylesheet" type="text/css"/>
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
             <div class="contenidoText">
                 <h3>Nota</h3>
                 <hr>
                <p>
                Al momento de insertar un producto debe llenar todos los campos,
                y escribir todo valor numerico sin puntos, de lo contrario, el sistema
                lo rechazara.
                el campo "Ingresar Imagen" se puede dejar en blanco, pero no es recomendable
                ya que el producto se ingresara sin su respectiva imagen, en el caso de dejar en blanco
                en la opcion Editar producto se podra modificar dicho campo.
                </p>
            </div>

            <div class="Registrarse">
                <h2> Ingresar Producto </h2>
                <form method="post" action="" >
                    <table>
                        <tr><td><br></td><td></td></tr>
                        <tr><td>Codigo de producto* </td><td><input type="text" value="" name="txt_code"></td></tr>
                        <tr><td><br></td><td></td></tr>
                        <tr><td>Nombre* </td><td><input type="text" value="" name="txt_nombre"></td></tr>
                        <tr><td><br></td><td></td></tr>
                        <tr><td>Stock* </td><td><input type="number" value="" name="txt_stock"></td></tr>
                        <tr><td><br></td><td></td></tr>
                        <tr><td>Precio (IVA incluido)* </td><td><input type="number" value="" name="txt_precio" placeholder="ingrese valores sin punto"></td></tr>
                        <tr><td><br></td><td></td></tr>
                        <tr><td>Peso en Kilogramos* </td><td><input type="text" value="" name="txt_peso" placeholder="1,3K o 3K"></td></tr>
                        <tr><td><br></td><td></td></tr>
                        <tr><td>Categoria* </td><td><select name="categoria">
                                    <option>Seleccione una categoria</option>
                                    <option>Sofás</option>
                                    <option>Mesas</option>
                                    <option>Sillas</option>
                                    <option>Camas</option>
                                    <option>Escritorios</option>
                                    <option>Cómodas</option>
                                    <option>Otomanas</option>
                                    <option>Mesas de comedor</option>
                                    <option>Sofás seccionales</option>
                                    <option>Muebles de televisor</option>
                                    <option>Bibliotecas</option>
                                    <option>Futones</option>
                                    <option>Literas</option>
                                    <option>Mesitas de café</option>
                                    <option>Taburetes</option>
                                    <option>Mesas auxiliares de salón</option>
                                    <option>Beladores</option>
                                    <option>Mini bar</option>
                                    <option>Islas para cocina</option>
                                    <option>Armarios</option>
                                    <option>Organizadores de juguetes</option>
                                    <option>Percheros de pared</option>
                                    <option>Muebles para jardín</option>
                                    <option>Otros</option>
                                </select></td></tr>
                        <tr><td><br></td><td></td></tr>
                        <tr><td>Descripcion* </td><td><textarea name="descripcion" rows="4" cols="36" placeholder="Ingrese una breve descripcion"></textarea></td></tr>
                        <tr><td><br></td><td></td></tr>
                        <tr><td>Oferta</td><td><input type="number" name="oferta" placeholder="Ingrese datos sin puntos"></td></tr>
                        <tr><td><br></td><td></td></tr>
                        <tr><td>Ingresar Imagen </td><td><input type="text" name="img" placeholder="imagen.jpg"></td></tr>
                        <tr><td><br></td><td></td></tr>
                        <tr><td></td><td> <input type="submit" name="btn_regisProducto" value="Ingresar Producto"></td></tr>
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
