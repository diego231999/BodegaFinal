<%@ page import="Beans.Pedido" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
  Created by IntelliJ IDEA.
  User: ibiblio
  Date: 12/11/2020
  Time: 06:39 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bodega" type="Beans.Bodega" scope="request"/>
<%
    ArrayList<Pedido> listaPedido = (ArrayList<Pedido>) request.getAttribute("listar_Pedidos");
    int t=(int)request.getAttribute("tamanioP");
%>


<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Pedidos</title>

        <!-- Custom fonts for this template-->
        <link href="bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

        <!--Custom styles for this template -->
        <link type="text/css" href="css/sb-admin-2.min.css" rel="stylesheet">

        <link href="bootstrap/css/sb-admin-2.min.css"rel="stylesheet" type="text/css"/>

        <!--Custom styles for this page-->
        <link href="bootstrap/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

    </head>
    <body>
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

                <!-- Productos -->
                <li class="nav-item">
                    <a class="nav-link collapsed text-lg-left" href="<%=request.getContextPath()%>/BodegaServlet">
                        <i class="fas fa-table"></i>
                        <span>Productos</span>
                    </a>
                </li>


                <!-- Registrar Productos -->

                <li class="nav-item">
                    <a class="nav-link collapsed text-lg-left" href="<%=request.getContextPath()%>/BodegaServlet?action=registrar">
                        <i class="fas fa-plus"></i>
                        <span>Registrar producto</span>
                    </a>
                </li>



                <!-- Ver Pedidos -->
                <li class="nav-item">
                    <a class="nav-link collapsed text-lg-left" href="<%=request.getContextPath()%>/BodegaServlet?action=verPedido">
                        <i class="fas fa-eye"></i>
                        <span>Ver pedidos</span>
                    </a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">
                <li class="nav-item">
                    <a class="nav-link collapsed text-lg-left" href="#logoutModal" data-toggle="modal"
                       data-target="#logoutModal">
                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                        <span>Cerrar Sesión</span>
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
                    <div class='container-fluid'>
                        <div class="card shadow mb-4">
                            <div class="p-3  bg-primary text-white" style="text-align:center">
                                <h3 class="h3 font-weight-bold  text-white text-xl-center">LISTA DE PEDIDOS</h3>
                            </div>
                            <div class="card-body">
                                <table class="table table-bordered mb-0" width="100%" cellspacing="0" style="text-align:center">
                                    <tr>
                                        <th>
                                            <div style=text-align:center>Código Pedido</div>
                                        </th>
                                        <th>
                                            <div style=text-align:center>Fecha de Entrega</div>
                                        </th>
                                        <th>
                                            <div style=text-align:center>Estado</div>
                                        </th>
                                        <th>
                                            <div style=text-align:center>Monto Total</div>
                                        </th>
                                        <th>
                                            <div style=text-align:center>DNI del Cliente</div>
                                        </th>
                                        <th>
                                            <div style=text-align:center>Visualizar</div>
                                        </th>
                                        <th>
                                            <div style=text-align:center>Entregar</div>
                                        </th>
                                        <th>
                                            <div style=text-align:center>Cancelar</div>
                                        </th>
                                    </tr>
                                    <%
                                        for (Pedido pedidos : listaPedido) {
                                    %>

                                    <tr>
                                        <td><%=pedidos.getCodigoPedido()%>
                                        </td>
                                        <td>
                                            <div><%=pedidos.getFechaEntrega()+" "+pedidos.getHoraRecojo()%>
                                            </div>
                                        </td>
                                        <td>
                                            <div style=text-align:center><%=pedidos.getEstado()%>
                                            </div>
                                        </td>
                                        <td>
                                            <div style=text-align:center><%="S/" + pedidos.getMonto()%>
                                            </div>
                                        </td>
                                        <td>
                                            <div style=text-align:center><%=pedidos.getClienteDNI()%>
                                            </div>
                                        </td>
                                        <td>
                                            <%
                                                Date ahora = new Date();
                                                SimpleDateFormat formateador = new SimpleDateFormat("dd-MM-yyyy");
                                                boolean bool=false;
                                                String fechahoy=formateador.format(ahora);
                                                String [] parte=fechahoy.split("-");
                                                String fechapedido= pedidos.getFechaEntrega();
                                                String [] parte2=fechapedido.split("-");
                                                if ((Integer.parseInt(parte[2])>=Integer.parseInt(parte2[0]))&(Integer.parseInt(parte[1])>=Integer.parseInt(parte2[1]))&(Integer.parseInt(parte[0])>Integer.parseInt(parte2[2]))){
                                                    bool=true;
                                            %>
                                            <%
                                                }
                                            %>

                                            <!--Visualizar el detalle del pedido-->

                                            <a href="<%=request.getContextPath()%>/BodegaServlet?action=detallePedido&idPedido=<%=pedidos.getCodigoPedido()%>" class="btn btn-info btn-circle align">
                                                <i class="fas fa-eye"></i>
                                            </a>

                                        </td>
                                        <% if (pedidos.getEstado().equalsIgnoreCase("pendiente")){ %>
                                        <td>

                                            <a href="<%=request.getContextPath()%>/BodegaServlet?action=entregarPedido&idPedido=<%=pedidos.getCodigoPedido()%>" onclick="return confirm('Esta seguro de que desea colocar el pedido en estado Entregado')"  style="color: #dce3f9" class="btn btn-success btn-circle align">
                                                <i class="fas fa-check"></i>
                                            </a>
                                        </td>
                                        <% if (bool) {%>
                                        <td>
                                            <input type="hidden" id="codPedido" value="<%=pedidos.getCodigoPedido()%>">
                                            <a id="btnCancelar" href="<%=request.getContextPath()%>/BodegaServlet?action=cancelarPedido&idPedido=<%=pedidos.getCodigoPedido()%>" onclick="return confirm('Esta seguro de que desea colocar el pedido en estado Cancelado')" class="btn btn-danger btn-circle align">
                                                <i class="fas fa-times"></i>
                                            </a>
                                        </td>
                                        <%}else{%>
                                        <td>
                                            <a data-toggle = "modal" style = "color: #dce3f9"
                                               class="btn btn-danger btn-circle" >
                                                <i class="fas fa-times" ></i >
                                            </a >
                                        </td >
                                        <%}}else{%>
                                        <td>

                                            <button id="btn1" href="#" class="btn btn-success btn-circle">
                                                <i class="fas fa-check"></i>
                                            </button>
                                        </td>

                                        <td>
                                            <a data-toggle = "modal" style = "color: #dce3f9"
                                               class="btn btn-danger btn-circle" >
                                                <i class="fas fa-times" ></i >
                                            </a >
                                        </td >
                                        <%}%>

                                    </tr>

                                    <%
                                        }
                                    %>

                                </table>
                            </div>
                            <nav  class="ml-4 mb-2" aria-label="Page navigation example">
                                <ul class="pagination">
                                    <%
                                        int tamaño=(t/2);
                                        if((t%2)!=0){
                                            tamaño++;
                                        }

                                        for(int i=1; i<=tamaño;i++){%>
                                    <li class="page-item"><a class="page-link" href="<%=request.getContextPath()%>/BodegaServlet?action=verPedido&pag=<%=i%>"><%=i%></a></li>
                                    <%
                                        }
                                    %>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End of Content Wrapper -->

            <!-- End of Page Wrapper -->

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
                            <a class="btn btn-primary" href="<%=request.getContextPath()%>/BodegaServlet?action=login">Cerrar Sesión</a>
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
        <script src="bootstrap/vendor/datatables/dataTables.bootstrap4.min.js"></script>

        <!-- Page level custom scripts -->
        <script src="bootstrap/js/demo/datatables-demo.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.3.5/sweetalert2.all.min.js%22%3E"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="bootstrap/js/sweetAlert2/sweetalert2.all.min.js"></script>
        <script src="bootstrap/js/modales.js" ></script>

    </body>
</html>
