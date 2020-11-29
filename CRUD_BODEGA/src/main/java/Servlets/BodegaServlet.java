package Servlets;

import Beans.Pedido;
import Beans.Producto;
import Daos.DaoPedido;
import Daos.DaoProducto;
import OtrasFunciones.Validaciones;
import javafx.animation.ParallelTransition;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
@MultipartConfig
@WebServlet(name = "BodegaServlet", urlPatterns = "/BodegaServlet")
public class BodegaServlet extends HttpServlet {
    Producto p = new Producto();
    String nombre="arriba Peru";
    private String rucBodega="12534467813";
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DaoProducto dp = new DaoProducto();
        DaoPedido daoPedido=new DaoPedido();
        String action = (String) request.getParameter("action");
        Validaciones v = new Validaciones();
        int contador = 0;
        int cantidad = 0;
        double precio = 0.0;
        String nombre = "";
        String descripcion = "";

        boolean verificador = true;
        boolean verificador2 = true;
        boolean verificador3=true;
        boolean verificador4=true;
        //boolean formValidMaxSalary = true;

        if (action == null) {
            action = "search";
        } else {
            action = (String) request.getParameter("action");
        }


        switch (action) {
            case "enviar":
                nombre = request.getParameter("nombre");
                descripcion = request.getParameter("descrip");
                Part part=request.getPart("fileFoto");
                InputStream inputStream=part.getInputStream();

                try {

                    precio = Double.parseDouble(request.getParameter("precio"));

                } catch (NumberFormatException e) {
                    System.out.println("mal");
                    verificador = false;
                }
                try{
                    cantidad = Integer.parseInt(request.getParameter("cant"));
                    verificador2 = v.validarCantidad(cantidad);
                }catch (NumberFormatException e){
                    System.out.println("Mal");;
                    verificador2 = false;
                }
                if (verificador & verificador2) {
                    contador++;
                    dp.guardarProducto(nombre, descripcion, cantidad, precio, contador,rucBodega,inputStream);
                    response.sendRedirect(request.getContextPath() + "/BodegaServlet");
                } else {
                    request.setAttribute("verificador", verificador);
                    request.setAttribute("verificador2", verificador2);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("bootstrap/registrarProducto.jsp");
                    dispatcher.forward(request, response);
                }
                break;
            case "editar":
                String id = request.getParameter("idproducto");

                int cantidad2=0;
                double precio2=0;
                try {

                     precio2 = Double.parseDouble(request.getParameter("precio"));


                } catch (NumberFormatException e) {

                    verificador4=false;
                }
                try {
                    cantidad2 = Integer.parseInt(request.getParameter("unidades"));
                    verificador3 = v.validarCantidad(cantidad2);
                }catch (NumberFormatException e2){
                    verificador3=false;
                }
                if (verificador3 & verificador4) {
                    //contador++;
                    dp.editarProducto(id, cantidad2,precio2);
                    response.sendRedirect(request.getContextPath() + "/BodegaServlet");
                } else {
                    request.setAttribute("verificador3", verificador3);
                    request.setAttribute("verificador4", verificador4);
                    request.setAttribute("producto",p);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("bootstrap/editarProducto.jsp");
                    dispatcher.forward(request, response);
                }
                break;
            case "eliminar":
                String id2 = request.getParameter("idproducto");
                System.out.println(id2);
                dp.eliminarProducto(id2);
                response.sendRedirect(request.getContextPath() + "/BodegaServlet");
                break;
            case "modificarEstadoPedido":
                String codigoPedido=request.getParameter("codigoPedido");
                String codPedido=request.getParameter("codPedido");
                System.out.println(codigoPedido);
                System.out.println(codPedido);
                if(codigoPedido!=null){
                    //Entregar
                    daoPedido.cambiarEstadoPedido(codigoPedido,"ENTREGADO");
                    response.sendRedirect(request.getContextPath() + "/BodegaServlet?action=verPedido");
                }
                if (codPedido!=null){
                    //Cancelar
                    daoPedido.cambiarEstadoPedido(codPedido,"CANCELADO");
                    response.sendRedirect(request.getContextPath() + "/BodegaServlet?action=verPedido");
                }
                break;
            case "entregarPedido":
                String idPedido2 = request.getParameter("idPedido");
                System.out.println(idPedido2);
                String estado1="ENTREGADO";
                daoPedido.cambiarEstadoPedido(idPedido2,estado1);
                response.sendRedirect(request.getContextPath() + "/BodegaServlet?action=verPedido");
                break;
            case "cancelarPedido":
                String idPedido3 = request.getParameter("idPedido");
                System.out.println(idPedido3);
                String estado2="CANCELADO";
                daoPedido.cambiarEstadoPedido(idPedido3,estado2);
                response.sendRedirect(request.getContextPath() + "/BodegaServlet?action=verPedido");
                break;
        }

    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        DaoProducto dp = new DaoProducto();
        DaoPedido daoPedido=new DaoPedido();
        String codigo_mayor = dp.obtenerMayorCodigo();
        Date ahora = new Date();
        SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yyyy");
        String nombre_bodega=dp.obtenerNombreBodega(rucBodega);

        String fecha = formateador.format(ahora);
        String[] parte = fecha.split("-");

        int anio;
        anio = Integer.parseInt(parte[2]) % 100;

        String action = (String) request.getParameter("action");

        if (action == null) {
            action = "search";
        } else {
            action = (String) request.getParameter("action");
        }
        int tamañoP=daoPedido.obtenerTamanioListaPedido(rucBodega);



        int t= dp.obtenerTamanioListaProducto(rucBodega);

        switch (action) {
            case "search":
                int pagina=1;
                try {
                    pagina = Integer.parseInt(request.getParameter("pagina"));
                }catch (NumberFormatException e){
                    e.getStackTrace();
                }
                ArrayList<Producto> listaProductos = dp.obtenerListaProductos(rucBodega, pagina);
                request.setAttribute("listaProductos", listaProductos);
                request.setAttribute("nombre_bodega", nombre_bodega);
                request.setAttribute("tamanio",t);
                RequestDispatcher view = request.getRequestDispatcher("/bootstrap/lista_productos.jsp");
                view.forward(request, response);
                break;
            case "registrar":
                request.setAttribute("nombre_bodega", nombre_bodega);
                RequestDispatcher view2 = request.getRequestDispatcher("/bootstrap/registrarProducto.jsp");
                view2.forward(request, response);

                break;
            case "editar_temp":

                String id_producto = request.getParameter("idproducto");
                p = dp.mostrarProducto(id_producto);
                if (p.getNombre()!=null){
                    request.setAttribute("nombre_bodega", nombre_bodega);
                    request.setAttribute("producto", p);
                    RequestDispatcher view3 = request.getRequestDispatcher("/bootstrap/editarProducto.jsp");
                    view3.forward(request, response);
                }
                else{
                    response.sendRedirect(request.getContextPath() + "/BodegaServlet");
                }
                break;
            case "eliminar":
                String id = request.getParameter("idproducto");
                dp.eliminarProducto(id);
                response.sendRedirect(request.getContextPath() + "/BodegaServlet");
                break;
            case "login":
                RequestDispatcher view4 = request.getRequestDispatcher("/bootstrap/login.jsp");
                view4.forward(request, response);
                break;
            case "verPedido":
                int pag=1;
                try {
                    pag=Integer.parseInt(request.getParameter("pag"));
                }catch (NumberFormatException e){
                    e.getStackTrace();
                }
                ArrayList<Pedido> listaPedido = daoPedido.obtenerListaPedido(rucBodega,pag);
                request.setAttribute("nombre_bodega", nombre_bodega);
                request.setAttribute("listar_Pedidos", listaPedido);
                request.setAttribute("tamanioP",tamañoP);
                view = request.getRequestDispatcher("/bootstrap/listarPedidosBodega.jsp");
                view.forward(request, response);
                break;
            case "detallePedido":
                String idPedido = request.getParameter("idPedido");
                ArrayList<Pedido> listaProductoPedido = daoPedido.obtenerProductosPedido(idPedido);
                if(listaProductoPedido.isEmpty()){
                    response.sendRedirect(request.getContextPath() + "/BodegaServlet?action=verPedido");
                }
                else {
                    request.setAttribute("nombre_bodega", nombre_bodega);
                    request.setAttribute("listar_Producto_Pedidos", listaProductoPedido);
                    Pedido pedido = new Pedido();
                    pedido = daoPedido.mostrarPedido(idPedido);
                    request.setAttribute("pedidos", pedido);
                    view = request.getRequestDispatcher("/bootstrap/detallePedido.jsp");
                    view.forward(request, response);
                }
                break;
            case "entregarPedido":
                String idPedido2 = request.getParameter("idPedido");
                System.out.println(idPedido2);
                String estado1="ENTREGADO";
                daoPedido.cambiarEstadoPedido(idPedido2,estado1);
                response.sendRedirect(request.getContextPath() + "/BodegaServlet?action=verPedido");
                break;
            case "cancelarPedido":
                String idPedido3 = request.getParameter("idPedido");
                System.out.println(idPedido3);
                String estado2="CANCELADO";
                daoPedido.cambiarEstadoPedido(idPedido3,estado2);
                response.sendRedirect(request.getContextPath() + "/BodegaServlet?action=verPedido");
                break;
            case "mostrarIMG":
                 id = request.getParameter("idproducto");
                dp.listarImgProducto(id,response);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/BodegaServlet");
                break;
        }
    }
}
