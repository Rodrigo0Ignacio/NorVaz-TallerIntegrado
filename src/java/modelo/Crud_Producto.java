
package modelo;

import Entidad.Producto;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Rodrigo
 */
public class Crud_Producto extends Conexion{
    
    public ArrayList productosAll() {

        ArrayList<Producto> lista;
        lista = new ArrayList();
        try {
            super.query = "SELECT * FROM producto";
            super.st = (Statement) conectar().createStatement();
            super.rs = st.executeQuery(query);

            while (rs.next()) {
                lista.add(new Producto(
                        rs.getString("id_pro"),
                        rs.getString("nombre_pro"),
                        rs.getString("categoria_pro"),
                        rs.getString("descripcion_pro"),
                        rs.getString("peso_pro"),
                        rs.getInt("precio_pro"),
                        rs.getInt("stock_pro"),
                        rs.getInt("oferta_pro"),
                        rs.getString("url"))
                );
            }
            return lista;
        } catch (SQLException e) {
            return null;
        } catch (Exception e) {
            return null;
        }
    }
    
    
    public ArrayList buscarCategoria(String categoria) {

        ArrayList<Producto> lista;
        lista = new ArrayList();
        try {
            super.query = "SELECT * FROM producto where categoria_pro='"+categoria+"'";
            super.st = (Statement) conectar().createStatement();
            super.rs = st.executeQuery(query);

            while (rs.next()) {
                lista.add(new Producto(
                        rs.getString("id_pro"),
                        rs.getString("nombre_pro"),
                        rs.getString("categoria_pro"),
                        rs.getString("descripcion_pro"),
                        rs.getString("peso_pro"),
                        rs.getInt("precio_pro"),
                        rs.getInt("stock_pro"),
                        rs.getInt("oferta_pro"),
                        rs.getString("url"))
                );
            }
            return lista;
        } catch (SQLException e) {
            return null;
        } catch (Exception e) {
            return null;
        }
    }

    
    public ArrayList listarcomentados() {

        ArrayList<Producto> lista;
        lista = new ArrayList();
        try {
            super.query = "SELECT id_pro,nombre_pro,categoria_pro,descripcion_pro,peso_pro,precio_pro,stock_pro,oferta_pro,url FROM producto,valoracion where id_pro=id_pro2";
            super.st = (Statement) conectar().createStatement();
            super.rs = st.executeQuery(query);

            while (rs.next()) {
                lista.add(new Producto(
                        rs.getString("id_pro"),
                        rs.getString("nombre_pro"),
                        rs.getString("categoria_pro"),
                        rs.getString("descripcion_pro"),
                        rs.getString("peso_pro"),
                        rs.getInt("precio_pro"),
                        rs.getInt("stock_pro"),
                        rs.getInt("oferta_pro"),
                        rs.getString("url"))
                );
            }
            return lista;
        } catch (SQLException e) {
            return null;
        } catch (Exception e) {
            return null;
        }
    }
    
    
    public ArrayList ListarCategoria() {

        ArrayList<Producto> lista;
        lista = new ArrayList();
        try {
            super.query = "SELECT DISTINCT categoria_pro FROM producto";
            super.st = (Statement) conectar().createStatement();
            super.rs = st.executeQuery(query);

            while (rs.next()) {
                lista.add(new Producto(
                        rs.getString("categoria_pro"))
                );
            }
            return lista;
        } catch (SQLException e) {
            return null;
        } catch (Exception e) {
            return null;
        }
    }
    
    public Producto buscarProducto(String id) {

        Producto lista;
        lista = new Producto();
        try {
            super.query = "SELECT * FROM producto where id_pro='"+id+"'";
            super.st = (Statement) conectar().createStatement();
            super.rs = st.executeQuery(query);

            while (rs.next()) {
                lista.setCodigo(rs.getString("id_pro"));
                lista.setNombre(rs.getString("nombre_pro"));
                lista.setCategoria(rs.getString("categoria_pro"));
                lista.setDescripcion(rs.getString("descripcion_pro"));
                lista.setPeso(rs.getString("peso_pro"));
                lista.setPrecio(rs.getInt("precio_pro"));
                lista.setStock(rs.getInt("stock_pro"));
                lista.setOferta(rs.getInt("oferta_pro"));
                lista.setUrl(rs.getString("url"));
            }
            return lista;
        } catch (SQLException e) {
            return null;
        } catch (Exception e) {
            return null;
        }
    }
    
    public ArrayList buscarcomentarios(String id) {

        ArrayList lista;
        lista = new ArrayList();
        try {
            super.query = "SELECT * FROM valoracion where id_2pro='"+id+"' ORDER BY id_2pro DESC";
            super.st = (Statement) conectar().createStatement();
            super.rs = st.executeQuery(query);

            while (rs.next()) {
                lista.add(rs.getString("comentario"));
            }
            return lista;
        } catch (SQLException e) {
            return null;
        } catch (Exception e) {
            return null;
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
