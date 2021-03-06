
package modelo;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author Rodrigo
 */
public class Conexion {
    public Connection con = null;
    public Statement st = null;
    public ResultSet rs = null;
    public String query = null;
    public int resultado = 0;

    public Conexion() {
    }
    

 protected Connection conectar() {
       try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/norvaz","root","");
                
            } catch (ClassNotFoundException | SQLException ex ) { 
               JOptionPane.showMessageDialog(null, "Error en la conexion");
            }        
            return con; 
  }
 
 protected void desconectar(){   
        try {
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
 }

    
}
