
package controlador;

import Entidad.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Crud_Producto;

/**
 *
 * @author Rodrigo
 */
public class Servlet_Producto extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String parametro = request.getParameter("param");
        Crud_Producto product = new Crud_Producto();
        ArrayList<Producto> listarcategoria = product.buscarCategoria(parametro);
        
        request.setAttribute("listaC", listarcategoria);
        
        getServletContext().getRequestDispatcher("/Productos.jsp").forward(request, response);

        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Servlet_productos</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Servlet_productos at " + request.getContextPath() + "</h1>");
            listarcategoria.forEach((e) -> {
                out.println("<h1>" + e.getNombre() + "<br>" + e.getDescripcion() + "<br>" + e.getCategoria() + "<br>" + e.getPeso() + "<br>" + e.getUrl() + "</h1>");
            });
            out.println("</body>");
            out.println("</html>");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
