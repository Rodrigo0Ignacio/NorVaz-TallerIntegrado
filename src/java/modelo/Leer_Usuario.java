
package modelo;

import Entidad.RegistroUsuario;
import java.sql.*;
import javax.swing.JOptionPane;


/**
 *
 * @author Rodrigo
 */
public class Leer_Usuario extends Conexion{
    
    public int validarUsuarios(RegistroUsuario usuario){
        try {
            super.query = "SELECT id FROM usuario WHERE email ='"+usuario.getEmail()+
                    "' AND contrasena = '"+usuario.getContrasena()+"'";
            
            super.st = (Statement) conectar().createStatement();
            super.resultado = st.executeUpdate(query);
               
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "error");
        }
        
        return resultado;


        
    }
    
    
    
    
    
}
