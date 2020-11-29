
package modelo;

import Entidad.RegistroUsuario;
import java.sql.*;
import javax.swing.JOptionPane;


/**
 *
 * @author Rodrigo
 */
public class Leer_Usuario extends Conexion{
   
    // SI RETORNA UN 0 ES POR QUE NO SE ENCONTRO NINGUN NIVEL POR ENDE
    // EL USUARIO NO EXISTE
    public int validarUsuarios(RegistroUsuario usuario){
        int verificaConsulta = 0;
        
        try {
            super.query = "SELECT id FROM usuario WHERE email ='"+usuario.getEmail()+
                    "' AND contrasena = '"+usuario.getContrasena()+"'";
       
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
  
}
