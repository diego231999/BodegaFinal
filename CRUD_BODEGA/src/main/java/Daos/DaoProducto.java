package Daos;

import Beans.Bodega;
import Beans.Producto;
import com.sun.xml.internal.bind.v2.runtime.reflect.Lister;

import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class DaoProducto {
    public void guardarProducto(String nombre, String descripcion, int cantidad, double precio, int contador, String ruc, InputStream foto) {
        DaoProducto dp = new DaoProducto();
        String codigo_mayor=dp.obtenerMayorCodigo();
        java.util.Date ahora = new Date();
        SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yyyy");

        String fecha=formateador.format(ahora);
        String [] parte=fecha.split("-");

        int anio;
        anio=Integer.parseInt(parte[2])%100;
        String codigoAc= anio+parte[1]+parte[0];
        String codigo1="0";
        String codigoProducto = "";
        if(Integer.parseInt(codigoAc)>=Integer.parseInt(codigo1)){
            codigo1=codigoAc;
            int codigo2=(int) ((Double.parseDouble(codigo_mayor))%100000);
            codigo2+=contador;
             codigoProducto = (codigo1+codigo2);
            System.out.println(codigoProducto);
        }


        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://127.0.0.1:3306/grupo1_db?serverTimezone=America/Lima";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);


            String sql = "insert into producto(idProducto, nombreProducto,descripcion,bodega_ruc,cantidad,precio,borrado,foto) values(?,?,?,?,?,?,?,?);";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, codigoProducto);
            pstmt.setString(2, nombre);
            pstmt.setString(3, descripcion);
            pstmt.setString(4, ruc);
            pstmt.setInt(5, cantidad);
            pstmt.setDouble(6, precio);
            pstmt.setByte(7, (byte) 0);
            pstmt.setBlob(8,foto);

            pstmt.executeUpdate();

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    public int obtenerTamanioListaProducto(String ruc) {
        ArrayList<Producto> lista = new ArrayList<>();
        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://127.0.0.1:3306/grupo1_db?serverTimezone=America/Lima";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("select idProducto,nombreProducto, descripcion,cantidad,precio from bodega,producto where bodega.ruc=\"12534467819\"\n" +
                    "and producto.bodega_ruc= "+ruc+" and producto.borrado='0'");

            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getString(1));
                p.setNombre(rs.getString(2));
                p.setDescripcion(rs.getString(3));
                p.setCantidad(rs.getInt(4));
                p.setPrecio(rs.getDouble(5));

                lista.add(p);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return lista.size();
    }

    public ArrayList<Producto> obtenerListaProductos(String ruc, int pagina) {
        ArrayList<Producto> listaProductos = new ArrayList<>();

        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://127.0.0.1:3306/grupo1_db?serverTimezone=America/Lima";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("select idProducto,nombreProducto, descripcion,cantidad,precio from bodega,producto where bodega.ruc=\"12534467819\"\n" +
                    "and producto.bodega_ruc="+ruc+" and producto.borrado='0' limit "+((10*pagina)-10)+",10;");

            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getString(1));
                p.setNombre(rs.getString(2));
                p.setDescripcion(rs.getString(3));
                p.setCantidad(rs.getInt(4));
                p.setPrecio(rs.getDouble(5));

                listaProductos.add(p);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return listaProductos;
    }

    public Producto mostrarProducto(String idproducto) {
        Producto p = new Producto();

        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://127.0.0.1:3306/grupo1_db?serverTimezone=America/Lima";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();

            String sql = "select idProducto,nombreProducto, descripcion,cantidad,precio, foto from producto where idProducto=?;";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, idproducto);
            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    p.setId(rs.getString(1));
                    p.setNombre(rs.getString(2));
                    p.setDescripcion(rs.getString(3));
                    p.setCantidad(rs.getInt(4));
                    p.setPrecio(rs.getDouble(5));
                    p.setFotoProducto(rs.getBinaryStream(6));
                }
            }

            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
            return p;
        }

        public void listarImgProducto(String idProducto, HttpServletResponse response){
            InputStream inputStream=null;
            OutputStream outputStream=null;
            BufferedInputStream bufferedInputStream=null;
            BufferedOutputStream bufferedOutputStream=null;
            response.setContentType("image/*");
            try {
                String user = "root";
                String pass = "root";
                String url = "jdbc:mysql://127.0.0.1:3306/grupo1_db?serverTimezone=America/Lima";
                String sql="select foto from producto where idProducto="+idProducto;
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url, user, pass);
                outputStream=response.getOutputStream();
                PreparedStatement pstmt = conn.prepareStatement(sql);
                ResultSet rs=pstmt.executeQuery();

                if (rs.next()){
                    inputStream=rs.getBinaryStream(1);
                }
                bufferedInputStream=new BufferedInputStream(inputStream);
                bufferedOutputStream=new BufferedOutputStream(outputStream);
                int i=0;
                while ((i=bufferedInputStream.read())!=-1){
                    bufferedOutputStream.write(i);
                }
            }catch (ClassNotFoundException | SQLException | IOException e){
                e.printStackTrace();
            }
        }
        public String obtenerMayorCodigo(){
            String var="";
            try {
                String user = "root";
                String pass = "root";
                String url = "jdbc:mysql://127.0.0.1:3306/grupo1_db?serverTimezone=America/Lima";

                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(url, user, pass);
                Statement stmt = conn.createStatement();

                ResultSet rs = stmt.executeQuery("select max(idProducto) from producto;");

                if(rs.next()) {
                    var=(rs.getString(1));
                }

            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
            }
            return var;

        }
    public Producto editarProducto(String idproducto,int cantidad, double precio) {
        Producto p = new Producto();

        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://127.0.0.1:3306/grupo1_db?serverTimezone=America/Lima";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);

            String sql = "update producto set cantidad=? ,precio=? where idProducto=?;";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(3, idproducto);
            pstmt.setInt(1, cantidad);
            pstmt.setDouble(2, precio);

            pstmt.executeUpdate();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return p;
    }
    public void eliminarProducto(String idproducto) {
        Producto p = new Producto();

        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://127.0.0.1:3306/grupo1_db?serverTimezone=America/Lima";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);

            String sql = "update producto set borrado='1' where idProducto=?;";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, idproducto);
            pstmt.executeUpdate();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public Bodega DatosBodega(String ruc){
        Bodega bodega =new Bodega();
        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://127.0.0.1:3306/grupo1_db?serverTimezone=America/Lima";


            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);

            String sql = "select * from bodega,distrito where ruc=? and bodega.idDistrito=distrito.idDistrito ;";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, ruc);
            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    bodega.setRuc(rs.getString(1));
                    bodega.setNombre(rs.getString(2));
                    bodega.setValoracion(rs.getInt(4));
                    bodega.setDireccion(rs.getString(5));
                    bodega.setDistrito(rs.getString(10));
                    bodega.setCorreo(rs.getString(7));
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return bodega;
    }
    public void buscarProducto(String nombre, String ruc){
        String sql="SELECT * FROM producto where upper(nombreProducto) like upper('%?%') and bodega_ruc='?';";

    }
}
