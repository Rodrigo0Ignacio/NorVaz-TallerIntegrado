
package modelo;

import java.sql.SQLException;
import java.sql.Statement;
import javax.swing.JOptionPane;

/**
 *
 * @author Rodrigo
 */
public class Leer_Email extends Conexion{
    
    // Comprueba si existe un correo en la base de datos.
       public int ComprobarCorreo(String correo) throws SQLException {
        String verificaConsulta = null;
        super.query = "SELECT email FROM usuario WHERE email = '" + correo + "'";
        try {
            super.st = (Statement) conectar().createStatement();
            super.rs = st.executeQuery(query);

            if (rs.next()) {
                verificaConsulta = rs.getString("email");

            }

        } catch (SQLException ex) {
            return 0;
        }
        st.close();
        return 1;

    }
       
       // SI EL CORREO COINCIDE SE MODIFICARA EL PASSWROD
       public int ModificarCorreo(String correo, String password) throws SQLException{
           super.query = "update usuario set contrasena = '"+password+"' where email ='"+correo+"'";
           
           try {
               super.st = (Statement) conectar().createStatement();
               super.resultado = st.executeUpdate(query);

           } catch (SQLException ex) {
               JOptionPane.showMessageDialog(null, "error");
           }
           st.close();
           
           // si encuenta el correo arojara 1 y posteriormente crearemos la contraseña de numeros
          
           if (resultado == 1) {

                return 1;
               }
            else {
               return 0;
           }
        }
      
    
}
