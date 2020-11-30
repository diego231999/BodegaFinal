<%@ page import="java.util.ArrayList" %>
<%@ page import="Beans.Pedido" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.math.BigDecimal" %>
<%@ page import="java.math.RoundingMode" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: ibiblio
  Date: 12/11/2020
  Time: 07:13 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="pedidos" scope="request" type="Beans.Pedido"/>
<% double montoTotal = 0.00;%>
<%ArrayList<Pedido> listaProductoPedido = (ArrayList<Pedido>) request.getAttribute("listar_Producto_Pedidos");%>
<jsp:useBean id="bodega" type="Beans.Bodega" scope="request"/>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="shortcut icon" href="<%=request.getContextPath()%>/bootstrap/img/icono_shop.ico" type="image/x-icon">
    <title>Detalle Pedido</title>

    <link href="bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!--Custom styles for this template -->
    <link type="text/css" href="css/sb-admin-2.min.css" rel="stylesheet">

    <link href="bootstrap/css/sb-admin-2.min.css" rel="stylesheet" type="text/css"/>

    <!--Custom styles for this page-->
    <link href="bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

<body id="page-top">

<!-- Page Wrapper -->
<div id="wrapper">

    <!-- Sidebar -->
    <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

        <!-- Sidebar - Brand -->
        <text class="sidebar-brand d-flex align-items-center justify-content-center">
            <div class="sidebar-brand-icon rotate-n-15">
                <i class="fas fa-store"></i>
            </div>
            <div class="sidebar-brand-text mx-3"><strong></strong>BODEGA<strong></strong></div>
        </text>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">


        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed text-lg-left" href="<%=request.getContextPath()%>/BodegaServlet">
                <i class="fas fa-table"></i>
                <span>Productos</span>
            </a>
        </li>

        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed text-lg-left"
               href="<%=request.getContextPath()%>/BodegaServlet?action=registrar">
                <i class="fas fa-plus"></i>
                <span>Registrar producto</span>
            </a>
        </li>

        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed text-lg-left"
               href="<%=request.getContextPath()%>/BodegaServlet?action=verPedido">
                <i class="fas fa-eye"></i>
                <span>Ver pedidos</span>
            </a>
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider my-0">
        <li class="nav-item">
            <a class="nav-link collapsed text-lg-left" href="#logoutModal" data-toggle="modal"
               data-target="#logoutModal">
                <i class="fas fa-sign-out-alt"></i>
                <span>Cerrar sesión</span>
            </a>
        </li>

        <!-- Sidebar Toggler (Sidebar) -->
        <div class="text-center d-none d-md-inline">
            <button class="rounded-circle border-0" id="sidebarToggle"></button>
        </div>

    </ul>
    <!-- End of Sidebar -->

    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

        <!-- Main Content -->
        <div id="content">

            <!-- Topbar -->
            <nav class="navbar navbar-expand navbar-light bg-gradient-primary topbar mb-4 static-top shadow">
                <h1 class="text-right h3 mb-1 text-light"><strong><strong>DETALLE DE PEDIDO</strong></strong></h1>
                <!-- Sidebar Toggle (Topbar) -->
                <form class="form-inline">
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                </form>

                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">
                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <div class="sidebar-brand-text mx-3 text-light"><%=bodega.getNombre() %>
                            </div>
                            <div class="sidebar-brand-icon text-light"><i class="fas fa-user-alt"></i></div>
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="#Credencial" data-toggle="modal" data-target="#Credencial">
                                <i class="fas fa-check fa-sm fa-fw mr-2 text-gray-500"></i>
                                Credenciales
                            </a>

                        </div>

                    </li>
                </ul>

            </nav>


            <!-- Begin Page Content -->
            <div class="container-fluid content">
                <!-- DataTales Example -->
                <div class="card shadow mb-4 ">
                    <div class="card-header bg-primary">
                        <table class="bg-primary" width="100%" cellspacing="0">
                            <td >
                                <ul class="list-group col-10 bg-primary">
                                    <li class="text-light bg-primary list-group-item d-flex justify-content-between align-items-center">
                                        <h5><b>Pedido</b></h5>
                                        <span class="text-light "><h6><%=pedidos.getCodigoPedido()%></h6></span>
                                    </li>
                                    <li class="text-light bg-primary list-group-item d-flex justify-content-between align-items-center">
                                        <h5><b>Estado</b></h5>
                                        <span class="text-light"><h6><%=pedidos.getEstado()%></h6></span>
                                    </li>
                                </ul>
                            </td>
                            <td>
                                <ul class="list-group col-10 bg-primary">
                                    <li class="text-light bg-primary list-group-item d-flex justify-content-between align-items-center">
                                        <h5><b>Cliente DNI</b></h5>
                                        <span class="text-light"><h6><%=pedidos.getClienteDNI()%></h6></span>
                                    </li>
                                    <li class="text-light bg-primary list-group-item d-flex justify-content-between align-items-center">
                                        <h5><b>Distrito</b></h5>
                                        <span class="text-light "><h6><%=pedidos.getNombreDistrito()%></h6></span>
                                    </li>
                                </ul>
                            </td>
                        </table>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>
                                        <div style=text-align:center>Productos</div>
                                    </th>
                                    <th>
                                        <div style=text-align:center>Cantidad</div>
                                    </th>
                                    <th>
                                        <div style=text-align:center>Precio Unitario</div>
                                    </th>
                                    <th>
                                        <div style=text-align:center>Precio Total</div>
                                    </th>

                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    for (Pedido productos : listaProductoPedido) {
                                %>

                                <tr>
                                    <td><%=productos.getNombreProducto()%>
                                    </td>
                                    <td>
                                        <div style="text-align:center"><%=productos.getCantidadProducto()%>
                                        </div>
                                    </td>
                                    <td>
                                        <div style=text-align:center><%="S/. " + productos.getMonto()%>
                                        </div>
                                    </td>
                                    <td>
                                        <div style=text-align:center><%="S/. " + productos.getMontoTotal()%>
                                        </div>
                                    </td>


                                </tr>

                                <%
                                        montoTotal = montoTotal + productos.getMontoTotal();
                                    }
                                    BigDecimal montofinal = new BigDecimal(montoTotal).setScale(2, RoundingMode.UP);
                                %>
                                <tr>
                                    <td colspan="3" style="text-align:center" bgcolor="#F5F5F5"><b
                                            style="color: #2e2f37">Total</b>
                                    </td>
                                    <td style="text-align:center" bgcolor="#F5F5F5"><b
                                            style="color: #2e2f37"><%="S/. " + montofinal.doubleValue()%>
                                    </b>
                                    </td>
                                </tr>
                                <table class="table">
                                    <thead>
                                    <%
                                        Date ahora = new Date();
                                        SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yyyy");
                                        boolean bool = false;
                                        String fechahoy = formateador.format(ahora);
                                        String[] parte = fechahoy.split("-");
                                        String fechapedido = pedidos.getFechaEntrega();
                                        System.out.println(fechapedido);
                                        String[] parte2 = fechapedido.split("-");
                                        if ((Integer.parseInt(parte[2]) >= Integer.parseInt(parte2[0])) & (Integer.parseInt(parte[1]) >= Integer.parseInt(parte2[1])) & (Integer.parseInt(parte[0]) > Integer.parseInt(parte2[2]))) {
                                            bool = true;
                                        }%>
                                    <div style="text-align: center">
                                        <% if (pedidos.getEstado().equalsIgnoreCase("PENDIENTE")) {%>
                                        <div class="btn-group">
                                            <form id="eliminar" method="POST"
                                                  action="<%=request.getContextPath()%>/BodegaServlet?action=entregarPedido&idPedido=<%=pedidos.getCodigoPedido()%>">
                                                <div class="btn-group" role="group" aria-label="Basic example">
                                                    <button type="button" class="btn btn-success"><i
                                                            class="fas fa-clipboard-check"></i></button>
                                                    <a class="btn-outline-success" role="button"
                                                       style="text-decoration: none" data-toggle="modal"
                                                       href="#Modal-Entregar" role="button">
                                                        <button type="submit" class="btn btn-outline-success">Entregar
                                                            Pedido
                                                        </button>
                                                    </a>
                                                </div>
                                            </form>
                                        </div>
                                        <%if (bool) {%>
                                        <div class="btn-group">
                                            <form id="cancelar" method="POST"
                                                  action="<%=request.getContextPath()%>/BodegaServlet?action=cancelarPedido&idPedido=<%=pedidos.getCodigoPedido()%>">
                                                <div class="btn-group" role="group" aria-label="Basic example">
                                                    <button type="button" class="btn btn-danger"><i
                                                            class="far fa-file-excel"></i></button>
                                                    <!--<button type="submit" class="btn btn-outline-danger"><a  class="btn-outline-danger" style="text-decoration: none" data-toggle="modal" href="#Modal-Cancelar-Pedido" role="button" >Cancelar Pedido</a></button>-->
                                                    <a class="btn-outline-danger" style="text-decoration: none"
                                                       data-toggle="modal" href="#Modal-Cancelar-Pedido" role="button">
                                                        <button type="submit" class="btn btn-outline-danger">Cancelar
                                                            Pedido
                                                        </button>
                                                    </a>
                                                </div>
                                            </form>
                                        </div>
                                        <div class="btn-group" role="group" aria-label="Basic example">
                                            <button type="button" class="btn btn-primary"><i
                                                    class="far fa-caret-square-left"></i></button>
                                            <!-- <button type="button" class="btn btn-outline-primary"><a style="text-decoration: none" class="btn-outline-primary" href="<%=request.getContextPath()%>/BodegaServlet?action=verPedido" role="button" >Regresar</a></button>-->
                                            <a style="text-decoration: none" class="btn-outline-primary"
                                               href="<%=request.getContextPath()%>/BodegaServlet?action=verPedido"
                                               role="button">
                                                <button type="button" class="btn btn-outline-primary">Regresar</button>
                                            </a>
                                        </div>
                                        <%} else {%>

                                        <div class="btn-group" role="group" aria-label="Basic example">
                                            <button type="button" class="btn btn-primary"><i
                                                    class="far fa-caret-square-left"></i></button>
                                            <a style="text-decoration: none" class="btn-outline-primary"
                                               href="<%=request.getContextPath()%>/BodegaServlet?action=verPedido"
                                               role="button">
                                                <button type="button" class="btn btn-outline-primary">Regresar</button>
                                            </a>
                                        </div>
                                        <%
                                            }
                                        } else {
                                        %>

                                        <div class="btn-group" role="group" aria-label="Basic example">
                                            <button type="button" class="btn btn-primary"><i
                                                    class="far fa-caret-square-left"></i></button>
                                            <a style="text-decoration: none" class="btn-outline-primary"
                                               href="<%=request.getContextPath()%>/BodegaServlet?action=verPedido"
                                               role="button">
                                                <button type="button" class="btn btn-outline-primary">Regresar</button>
                                            </a>
                                        </div>
                                        <%}%>
                                    </div>
                                    </thead>
                                </table>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>


    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Alerta cierre sesion-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Sesión</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Cerrar">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Usted esta a punto de salir ¿Desea continuar?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                    <a class="btn btn-primary" href="<%=request.getContextPath()%>/BodegaServlet?action=login">Cerrar
                        Sesión</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal1-->
    <div class="modal fade" id="Modal-Entregar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel2">El pedido será entregado</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-footer">
                    <button type="submit" form="eliminar" class="btn btn-primary">Entregar</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal2-->
    <!-- Modal3-->
    <div class="modal fade" id="Modal-Cancelar-Pedido" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel4">¿Desea cancelar el pedido?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">No</button>
                    <button class="btn btn-primary" type="submit" form="cancelar">Sí</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="Credencial" tabindex="-1" role="dialog" aria-labelledby="exampleCredencial"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content bg-gradient-light static-top shadow text-black">
                <div class="modal-header bg-gradient-primary mb-4 static-top shadow text-light">
                    <h5 class="modal-title " id="exampleCredencial">Credenciales de Bodega</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Cerrar">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body"><h4>Nombre: </h4><%=bodega.getNombre()%>

                </div>
                <div class="modal-body"><h4>RUC: </h4><%=bodega.getRuc()%>

                </div>
                <div class="modal-body"><h4>Correo: </h4><%=bodega.getCorreo()%>

                </div>
                <div class="modal-body"><h4>Dirección: </h4><%=bodega.getDireccion()%>

                </div>
                <div class="modal-body"><h4>Distrito: </h4><%=bodega.getDistrito()%>

                </div>
                <div class="modal-body"><h4>Valoracion: </h4><%=bodega.getValoracion()%>

                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">OK</button>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="bootstrap/vendor/jquery/jquery.min.js"></script>
<script src="bootstrap/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="bootstrap/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="bootstrap/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="bootstrap/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="bootstrServletDiegoap/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="bootstrap/js/demo/datatables-demo.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.3.5/sweetalert2.all.min.js%22%3E"></script>

</body>

</html>
