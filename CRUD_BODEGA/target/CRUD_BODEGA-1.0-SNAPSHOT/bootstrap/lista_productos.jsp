<%@ page import="java.util.ArrayList" %>

<%@ page import="Beans.Producto" %>
<%@ page import="Beans.Bodega" %>
<%--
  Created by IntelliJ IDEA.
  User: Diego
  Date: 4/11/2020
  Time: 20:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bodega" type="Beans.Bodega" scope="request"/>
<%
    int t = (int) request.getAttribute("tamanio");
    ArrayList<Producto> lista_productos = (ArrayList<Producto>) request.getAttribute("listaProductos");


%>

<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Productos</title>

        <!-- Custom fonts for this template-->
        <link href="bootstrap/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
              rel="stylesheet">

        <!--Custom styles for this template -->
        <link type="text/css" href="css/sb-admin-2.min.css" rel="stylesheet">

        <link href="bootstrap/css/sb-admin-2.min.css" rel="stylesheet" type="text/css"/>

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
                        <span>Productos</span></a>
                </li>


                <!-- Registrar Productos -->

                <li class="nav-item">
                    <a class="nav-link collapsed text-lg-left"
                       href="<%=request.getContextPath()%>/BodegaServlet?action=registrar">
                        <i class="fas fa-plus"></i>
                        <span>Registrar producto</span>
                    </a>
                </li>


                <!-- Ver Pedidos -->
                <li class="nav-item">
                    <a class="nav-link collapsed text-lg-left"
                       href="<%=request.getContextPath()%>/BodegaServlet?action=verPedido">
                        <i class="fas fa-eye"></i>
                        <span>Ver pedidos</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

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
                        <form class="input-group col-5 mb-3 mb-sm-1">

                            <input name="nombreBuscar" type="search" class="form-control"
                                   placeholder="Buscar producto..."
                                   aria-label="Buscar" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="submit" name="accion"><i
                                        class="fas fa-search fa-sm"></i>
                                </button>

                            </div>


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
                                    <a class="dropdown-item" href="#logoutModal" data-toggle="modal"
                                       data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Cerrar Sesión
                                    </a>
                                    <a class="dropdown-item" href="#Credencial" data-toggle="modal"
                                       data-target="#Credencial">
                                        <i class="fas fa-check fa-sm fa-fw mr-2 text-gray-500"></i>
                                        Credenciales
                                    </a>

                                </div>

                            </li>
                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class='container-fluid'>
                        <div class="card shadow mb-4">
                            <div class="p-3  bg-primary text-white"
                                 style="text-align:center">
                                <h3 class="h3 font-weight-bold  text-white text-xl-center">LISTA DE PRODUCTOS
                                    DISPONIBLES</h3>
                            </div>
                            <div class="card-body">
                                <table class="table table-bordered mb-0" width="100%" cellspacing="0"
                                       style="text-align:center">
                                    <tr>
                                        <th>
                                            <div style=text-align:center>Nombre Producto</div>
                                        </th>
                                        <th>
                                            <div style=text-align:center>Descripción</div>
                                        </th>
                                        <th>
                                            <div style=text-align:center>Cantidad</div>
                                        </th>
                                        <th>
                                            <div style=text-align:center>Precio Unitario</div>
                                        </th>
                                        <th>
                                            <div style=text-align:center>Editar</div>
                                        </th>
                                        <th>
                                            <div style=text-align:center>Eliminar</div>
                                        </th>
                                    </tr>
                                    <%
                                        for (Producto productos : lista_productos) {
                                    %>

                                    <tr>
                                        <td><%=productos.getNombre()%>
                                        </td>
                                        <td>
                                            <div><%
                                                String mitexto = productos.getDescripcion();

                                                if (mitexto.length() > 30) {
                                                    mitexto = mitexto.substring(0, 30) + "...";
                                                } else {

                                                }

                                            %>
                                                <%=mitexto%>
                                            </div>
                                        </td>
                                        <td>
                                            <div style=text-align:center><%=productos.getCantidad() + " uni."%>
                                            </div>
                                        </td>
                                        <td>
                                            <div style=text-align:center><%="S/. " + productos.getPrecio()%>
                                            </div>
                                        </td>
                                        <td>

                                            <a href="<%=request.getContextPath()%>/BodegaServlet?action=editar_temp&idproducto=<%=productos.getId()%>">
                                                <button type="button" class="btn btn-warning btn-circle align">
                                                    <svg width="1em" height="1em" viewBox="0 0 16 16"
                                                         class="fas fa-pencil-square"
                                                         fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                                        <path fill-rule="evenodd"
                                                              d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                                    </svg>
                                                </button>
                                            </a>
                                        </td>
                                        <td>
                                            <a href="<%=request.getContextPath()%>/BodegaServlet?action=eliminar&idproducto=<%=productos.getId()%>"
                                               onclick="return confirm('Esta seguro de que desea eliminar')">
                                                <button type="button" class="btn btn-danger btn-circle align">
                                                    <svg width="1em" height="1em" viewBox="0 0 16 16"
                                                         class="fas fa-trash"
                                                         fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
                                                        <path fill-rule="evenodd"
                                                              d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
                                                    </svg>
                                                </button>
                                            </a>

                                        </td>

                                    </tr>

                                    <%
                                        }
                                    %>

                                </table>
                            </div>
                            <nav class="ml-4 mb-2" aria-label="Page navigation example">
                                <ul class="pagination">
                                    <%
                                        int tamaño = (t / 10);
                                        if ((t % 10) != 0) {
                                            tamaño++;
                                        }

                                        for (int i = 1; i <= tamaño; i++) {%>
                                    <li class="page-item"><a class="page-link"
                                                             href="<%=request.getContextPath()%>/BodegaServlet?action=search&pagina=<%=i%>"><%=i%>
                                    </a></li>
                                    <%
                                        }
                                    %>
                                </ul>
                            </nav>
                        </div>
                    </div>

                    <!-- /.container-fluid -->
                    <!-- End of Main Content -->
                </div>
                <!-- End of Content Wrapper -->

            </div>
            <!-- End of Page Wrapper -->
            <!-- Modal advertencia eliminar -->
            <div class="modal fade" id="lModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                 aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel2">Está seguro que desea eliminar
                                producto?</h5>
                            <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                            </button>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                            <button type="submit" class="btn btn-primary">Sí</button>
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





