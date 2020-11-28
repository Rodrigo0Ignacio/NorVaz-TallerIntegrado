
package modelo;

import Entidad.RegistroUsuario;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;


/**
 *
 * @author Rodrigo
 */
public class Crear_Usuario extends Conexion{
    

// Registro solo para usuarios
    public int RegistrarUsuario(RegistroUsuario usuario) throws SQLException{
        super.query = "INSERT INTO usuario VALUES(1,'"+usuario.getRut()+"','"+usuario.getNombre()+"','"
                +usuario.getApellidos()+"','"+usuario.getEmail()+"','"+usuario.getTelefono()+"','"+
                usuario.getContrasena()+"')";
        try {
            super.st = (Statement) conectar().createStatement();
            super.resultado = st.executeUpdate(query);

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null,"error registraUsuario");
        }
        st.close();
        if(resultado == 1){
            return 1;
            
        } else{
            return 0;
        }
    
    }
    
    // Registro solo para Administradores
    public int RegistrarAdministrador(RegistroUsuario usuario) throws SQLException{
        super.query = "INSERT INTO usuario VALUES(2,'"+usuario.getRut()+"','"+usuario.getNombre()+"','"
                +usuario.getApellidos()+"','"+usuario.getEmail()+"','"+usuario.getTelefono()+"','"+
                usuario.getContrasena()+"')";
        try {
            super.st = (Statement) conectar().createStatement();
            super.resultado = st.executeUpdate(query);

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null,"error");
        }
        st.close();
        if(resultado == 1){
            return 1;
            
        } else{
            return 0;
        }
    
    }
}
