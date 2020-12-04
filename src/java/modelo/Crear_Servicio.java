
package modelo;

import Entidad.Servicio;
import Entidad.Usuario;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author Rodrigo
 */
public class Crear_Servicio extends Conexion{
    
    
   public int registrarServicio(Servicio servicio){
        super.query = "INSERT INTO servicio VALUES('"+ servicio.getRut()+"','"+ servicio.getTipo()+"','"
                +servicio.getPoblacion()+"','"+servicio.getCalle()+
                "','"+servicio.getNroHome()+"','"+servicio.getTelefono()+"','"+servicio.getDescripcion()+"')";
        try {
            super.st = (Statement) conectar().createStatement();
            super.resultado = st.executeUpdate(query);

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null,"Error al ingresar un servicio");
        }
        
        //desconectar();
        
        if(resultado == 1){
            return 1;
            
        } else{
            return 0;
        }
    
    }
    
    
    
}
