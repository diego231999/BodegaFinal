package Daos;

import Beans.Pedido;

import java.sql.*;
import java.util.ArrayList;

public class DaoPedido extends DaoBase{
    public ArrayList<Pedido> obtenerListaPedido(String ruc,int pag) {
        ArrayList<Pedido> listaPedidos = new ArrayList<>();

        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://127.0.0.1:3306/grupo1_db?serverTimezone=America/Lima";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT * FROM pedido where bodega_ruc="+ruc+" limit "+((2*pag)-2)+",2;");

            while (rs.next()) {
                Pedido pedido = new Pedido(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getDouble(4), rs.getString(5),
                        rs.getString(7));
                listaPedidos.add(pedido);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return listaPedidos;
    }

    public ArrayList<Pedido> obtenerProductosPedido(String codigoPedido) {
        ArrayList<Pedido> productoPedido = new ArrayList<>();
        System.out.println(codigoPedido);
        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://127.0.0.1:3306/grupo1_db?serverTimezone=America/Lima";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            String sql = "SELECT pr.nombreProducto,ph.cantidadProducto,pr.precio as precioU\n" +
                    ", (pr.precio*ph.cantidadProducto) as montoTotal FROM pedido_has_producto ph, producto pr, pedido pe\n" +
                    "where ph.codigoPedido=? \n" +
                    "and pr.idProducto=ph.idProducto and ph.codigoPedido=pe.codigoPedido;";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, codigoPedido);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Pedido pedido = new Pedido();
                pedido.setNombreProducto(rs.getString(1));
                pedido.setCantidadProducto(rs.getInt(2));
                pedido.setMonto(rs.getDouble(3));
                pedido.setMontoTotal(rs.getDouble(4));
                productoPedido.add(pedido);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return productoPedido;
    }
    public Pedido mostrarPedido(String idproducto) {
        Pedido detallePedidoCabeza = new Pedido();

        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://127.0.0.1:3306/grupo1_db?serverTimezone=America/Lima";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();

            String sql = "SELECT pe.codigoPedido,c.dni,pe.estado,d.nombreDistrito,pe.fechaEntrega FROM pedido pe ,cliente c , distrito d \n" +
                    "where pe.codigoPedido=? \n" +
                    "and c.dni=pe.cliente_dni and\n" +
                    "d.idDistrito=c.idDistrito;";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, idproducto);
            try (ResultSet rs = pstmt.executeQuery()) {

                if (rs.next()) {
                    detallePedidoCabeza.setCodigoPedido(rs.getString(1));
                    detallePedidoCabeza.setClienteDNI(rs.getString(2));
                    detallePedidoCabeza.setEstado(rs.getString(3));
                    detallePedidoCabeza.setNombreDistrito(rs.getString(4));
                    detallePedidoCabeza.setFechaEntrega(rs.getString(5));
                    }
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return detallePedidoCabeza;
    }
    public void cambiarEstadoPedido(String idPedido,String estado) {
       try {
           System.out.println(estado);
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://127.0.0.1:3306/grupo1_db?serverTimezone=America/Lima";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);

            String sql = "UPDATE pedido SET estado = ? WHERE (codigoPedido = ?);";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, estado);
            pstmt.setString(2, idPedido);
            pstmt.executeUpdate();

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public int obtenerTamanioListaPedido(String ruc) {
        ArrayList<Pedido> listaPedidos = new ArrayList<>();

        try {
            String user = "root";
            String pass = "root";
            String url = "jdbc:mysql://127.0.0.1:3306/grupo1_db?serverTimezone=America/Lima";

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(url, user, pass);
            Statement stmt = conn.createStatement();

            ResultSet rs = stmt.executeQuery("SELECT * FROM pedido where bodega_ruc="+ruc+";");

            while (rs.next()) {
                Pedido pedido = new Pedido(rs.getString(1), rs.getString(2),
                        rs.getString(3), rs.getDouble(4), rs.getString(5),
                        rs.getString(7));
                listaPedidos.add(pedido);
            }

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return listaPedidos.size();
    }
}
