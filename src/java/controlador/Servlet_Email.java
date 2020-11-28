package controlador;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Leer_Email;

/**
 *
 * @author Rodrigo
 */
public class Servlet_Email extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");

        ArrayList listaErrores = new ArrayList();
        Leer_Email verificaEmail = new Leer_Email();

        String correoReceptor = request.getParameter("email");
        String boton = request.getParameter("enviarCorreo");
      
        // DATOS DEL CORREO REMITENTE
        String correoRemitente = "norvazsancarlos@gmail.com";
        String passwordRemitente = "norvaz2020";
        
        // GENERAR CLAVE ALEATORIA
        String claveAleatoria = UUID.randomUUID().toString().toUpperCase().substring(0,15);

        // CONTENIDO DEL CORREO
        String asunto = "NorVaz - Restablecer contraseña";
        String contenido = "Tu clave es: "+claveAleatoria+"\n-------------------------------------------\n"
                +"Recomendamos al iniciar sesion cambiarla."
                + "\nSaludos cordiales.\n"+"\n-------------------------------------------\n"
                + "NorVaz Tu lo imaginas, nosotros lo creamos :)";

        // PREGUNTAMOS SI LAS VARIABLES ESTAN VACIAS
        if (boton != null) {
            if (correoReceptor != null) {
                if (verificaEmail.ComprobarCorreo(correoReceptor) == 1){

                    verificaEmail.ModificarCorreo(correoReceptor, claveAleatoria);

                    //CORREO
                    Properties props = new Properties();
                    props.setProperty("mail.smtp.host", "smtp.gmail.com");
                    props.setProperty("mail.smtp.starttls.enable", "true");
                    props.setProperty("mail.smtp.port", "587");
                    props.setProperty("mail.smtp.auth", "true");
                    props.setProperty("mail.smtp.user", correoRemitente);
                    props.setProperty("mail.smtp.clave", passwordRemitente);

                    Session session = Session.getDefaultInstance(props);
                    MimeMessage mensaje = new MimeMessage(session);

                    try {
                        mensaje.addRecipient(Message.RecipientType.TO, new InternetAddress(correoReceptor));
                        mensaje.setSubject(asunto);
                        mensaje.setText(contenido);

                        Transport transporte = session.getTransport("smtp");
                        transporte.connect("smtp.gmail.com", correoRemitente, passwordRemitente);
                        transporte.sendMessage(mensaje, mensaje.getAllRecipients());
                        transporte.close();

                        listaErrores.add("se envio un correo a tu cuenta");
                        response.sendRedirect("index.jsp");

                    } catch (Exception e) {
                        listaErrores.add("Error al enviar correo");
                        response.sendRedirect("index.jsp");
                    }
                } else {
                    response.sendRedirect("index.jsp");
                }
            } else {
                listaErrores.add("ingrese su email");
                response.sendRedirect("index.jsp");
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_Email.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Servlet_Email.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
