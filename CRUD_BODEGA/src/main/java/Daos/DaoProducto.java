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

public class DaoProducto extends DaoBase{
    public void guardarProducto(String nombre, String descripcion, int cantidad, double precio, int contador, String ruc, InputStream foto) {
        DaoProducto dp = new DaoProducto();
        String codigo_mayor = dp.obtenerMayorCodigo();

        java.util.Date ahora = new Date();
        SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yyyy");

        String fecha = formateador.format(ahora);
        String[] parte = fecha.split("-");

        int anio;
        anio = Integer.parseInt(parte[2]) % 100;
        String codigoAc = anio + parte[1] + parte[0];
        String codigo1 = "0";
        String codigoProducto = "";
        if (Integer.parseInt(codigoAc) >= Integer.parseInt(codigo1)) {
            codigo1 = codigoAc;
            int codigo2 = (int) ((Double.parseDouble(codigo_mayor)) % 100000);
            codigo2 += contador;
            codigoProducto = (codigo1 + codigo2);
            System.out.println(codigoProducto);
        }

        String sql = "insert into producto(idProducto, nombreProducto,descripcion,bodega_ruc,cantidad,precio,borrado,foto) values(?,?,?,?,?,?,?,?);";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, codigoProducto);
            pstmt.setString(2, nombre);
            pstmt.setString(3, descripcion);
            pstmt.setString(4, ruc);
            pstmt.setInt(5, cantidad);
            pstmt.setDouble(6, precio);
            pstmt.setByte(7, (byte) 0);
            pstmt.setBlob(8, foto);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int obtenerTamanioListaProducto(String ruc,String text) {
        ArrayList<Producto> lista = new ArrayList<>();
        String sql1 = "SELECT idProducto,nombreProducto, descripcion,cantidad,precio FROM producto,bodega " +
                " where bodega.ruc=? and producto.bodega_ruc=? and producto.borrado='0'  and upper(nombreProducto) " +
                "like upper(?)";
        String sql2="select idProducto,nombreProducto, descripcion,cantidad,precio from bodega,producto where bodega.ruc=?" +
                "and producto.bodega_ruc= ? and producto.borrado='0'";
        String sql;

        if(text==null){
            sql=sql2;

        }else {
            sql=sql1;

        }
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);)
              {
                  ResultSet rs;
                  if (sql==sql1){
                      pstmt.setString(3,"%"+text+"%");
                      pstmt.setString(1,ruc);
                      pstmt.setString(2,ruc);
                      pstmt.executeQuery();
                      rs= pstmt.executeQuery();}
                  else {
                      pstmt.setString(1,ruc);
                      pstmt.setString(2,ruc);
                      rs = pstmt.executeQuery();
                  }

            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getString(1));
                p.setNombre(rs.getString(2));
                p.setDescripcion(rs.getString(3));
                p.setCantidad(rs.getInt(4));
                p.setPrecio(rs.getDouble(5));

                lista.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista.size();
    }

    public ArrayList<Producto> obtenerListaProductos(String ruc, int pagina) {
        ArrayList<Producto> listaProductos = new ArrayList<>();

        String sql="select idProducto,nombreProducto, descripcion,cantidad,precio from bodega,producto where bodega.ruc=?" +
                " and producto.bodega_ruc=? and producto.borrado='0' limit " + ((10 * pagina ) - 10) + ",10;";


        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {


            pstmt.setString(1,ruc);
            pstmt.setString(2,ruc);

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getString(1));
                p.setNombre(rs.getString(2));
                p.setDescripcion(rs.getString(3));
                p.setCantidad(rs.getInt(4));
                p.setPrecio(rs.getDouble(5));

                listaProductos.add(p);
            }
        } catch ( SQLException e) {
            e.printStackTrace();
        }
        /*try (Connection conn = DriverManager.getConnection(url, user, pass);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            Class.forName("com.mysql.cj.jdbc.Driver");
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
        }*/
        return listaProductos;
    }

    public Producto mostrarProducto(String idproducto) {
        Producto p = new Producto();
        String sql = "select idProducto,nombreProducto, descripcion,cantidad,precio, foto from producto where idProducto=?;";

        try (Connection conn = this.getConection()) {

            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, idproducto);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                p.setId(rs.getString(1));
                p.setNombre(rs.getString(2));
                p.setDescripcion(rs.getString(3));
                p.setCantidad(rs.getInt(4));
                p.setPrecio(rs.getDouble(5));
                p.setFotoProducto(rs.getBinaryStream(6));
            }
        } catch ( SQLException e) {
            e.printStackTrace();
        }
        return p;
    }

    public void listarImgProducto(String idProducto, HttpServletResponse response) {
        InputStream inputStream = null;
        OutputStream outputStream = null;
        BufferedInputStream bufferedInputStream = null;
        BufferedOutputStream bufferedOutputStream = null;
        response.setContentType("image/*");

        String sql = "select foto from producto where idProducto=" + idProducto;
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {


            outputStream = response.getOutputStream();

            if (rs.next()) {
                inputStream = rs.getBinaryStream(1);
            }
            bufferedInputStream = new BufferedInputStream(inputStream);
            bufferedOutputStream = new BufferedOutputStream(outputStream);
            int i = 0;
            while ((i = bufferedInputStream.read()) != -1) {
                bufferedOutputStream.write(i);
            }
        } catch ( SQLException | IOException e) {
            e.printStackTrace();
        }
    }

    public String obtenerMayorCodigo() {
        String var = "";
        ResultSet rs = null;
        Connection conn = null;
        Statement stmt = null;
        try {

            conn = this.getConection();
            stmt = conn.createStatement();
            rs = stmt.executeQuery("select max(idProducto) from producto");
            if (rs.next()) {
                var = (rs.getString(1));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        return var;

    }

    public Producto editarProducto(String idproducto, int cantidad, double precio) {
        Producto p = new Producto();

        String sql = "update producto set cantidad=? ,precio=? where idProducto=?;";

        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {


            pstmt.setString(3, idproducto);
            pstmt.setInt(1, cantidad);
            pstmt.setDouble(2, precio);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return p;
    }

    public void eliminarProducto(String idproducto) {
        Producto p = new Producto();

        String sql = "update producto set borrado='1' where idProducto=?;";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1, idproducto);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public Bodega DatosBodega(String ruc){
        Bodega bodega =new Bodega();
        try {

            Connection conn = this.getConection();

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
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bodega;
    }
    public ArrayList<Producto> buscarProducto(String buscar, int pagina,String ruc){
        ArrayList<Producto> productos = new ArrayList<>();
        String sql="SELECT idProducto,nombreProducto, descripcion,cantidad,precio FROM producto,bodega " +
            " where bodega.ruc=? and producto.bodega_ruc=? and producto.borrado='0'  and upper(nombreProducto) " +
            "like upper(?)  limit " + ((10 * pagina) - 10) + ",10;";
        System.out.println(sql);
        //String sql="SELECT idProducto,nombreProducto, descripcion,cantidad,precio FROM producto where upper(nombreProducto) like upper(?) and bodega_ruc=? and producto.borrado='0'";
        try (Connection conn = this.getConection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {

            pstmt.setString(1,ruc);
            pstmt.setString(2,ruc);
            pstmt.setString(3,"%"+buscar+"%");
            pstmt.executeQuery();
            System.out.println(buscar);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                Producto p = new Producto();
                p.setId(rs.getString(1));
                p.setNombre(rs.getString(2));
                p.setDescripcion(rs.getString(3));
                p.setCantidad(rs.getInt(4));
                p.setPrecio(rs.getDouble(5));

                productos.add(p);
            }
        } catch ( SQLException e) {
            e.printStackTrace();
        }
        return productos;
    }
    }
