
package modelo;
import java.sql.*;
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
            
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prueba_norvaz","root","");
                
            } catch (ClassNotFoundException | SQLException ex ) { 
               JOptionPane.showMessageDialog(null, "Error en la conexion");
            }        
            return con; 
  }
 
 protected void desconectar() throws SQLException{   
            con.close();
            st.close();
            rs.close();
 }
 
 
     
     
    
    
}
