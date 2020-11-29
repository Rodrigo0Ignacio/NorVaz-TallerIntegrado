
package modelo;

import Entidad.Usuario;
import java.sql.*;
import java.util.ArrayList;
import javax.swing.JOptionPane;


/**
 *
 * @author Rodrigo
 */
public class Leer_Usuario extends Conexion{
   
    // SI RETORNA UN 0 ES POR QUE NO SE ENCONTRO NINGUN NIVEL POR ENDE
    // EL USUARIO NO EXISTE
    public int validarUsuarios(Usuario usuario){
        int verificaConsulta = 0;
        
        try {
            super.query = "SELECT id FROM usuario WHERE email ='" + usuario.getEmail()
                    + "' AND contrasena = '" + usuario.getContrasena() + "'";

            super.st = (Statement) conectar().createStatement();
            super.rs = st.executeQuery(query);

            if (rs.next()) {
                verificaConsulta = rs.getInt("id");
            }

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "error verificaUsuario");
        }

        return verificaConsulta;

    }

    public int listarDatosUsuario(Usuario usuario) throws SQLException {
        try {
            super.query = "SELECT * FROM usuario"
                    + " WHERE email = '" + usuario.getEmail() + "'";

            super.st = (Statement) conectar().createStatement();
            super.rs = st.executeQuery(query);

            while (rs.next()) {
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellidos(rs.getString("apellidos"));
                usuario.setEmail(rs.getString("email"));
                usuario.setTelefono(rs.getString("telefono"));
            }
            
         
        } catch (SQLException ex) {
            return 0;

        }
        return 1;
    }


  
}
