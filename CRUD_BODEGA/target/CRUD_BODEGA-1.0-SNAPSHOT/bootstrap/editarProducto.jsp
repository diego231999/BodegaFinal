<%@ page import="Beans.Producto" %>
<%@ page import="Beans.Bodega" %>
<%--

  Created by IntelliJ IDEA.
  User: Diego
  Date: 11/11/2020
  Time: 18:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="producto" scope="request" type="Beans.Producto"/>
<jsp:useBean id="bodega" scope="request" type="Beans.Bodega"/>
<%
    boolean verificador3 = request.getAttribute("verificador3") != null ?
            ((boolean) request.getAttribute("verificador3")) : true;
%>
<%
    boolean verificador4 = request.getAttribute("verificador4") != null ?
            ((boolean) request.getAttribute("verificador4")) : true;
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
    <link type="text/css" href="../webapp/css/sb-admin-2.min.css" rel="stylesheet">
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
            <a class="nav-link collapsed text-lg-left" href="<%=request.getContextPath()%>/BodegaServlet?action=search">
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
        <hr class="sidebar-divider">

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
                <h1 class="text-right h3 mb-1 text-light"><strong><strong>MODIFICAR PRODUCTO</strong></strong></h1>
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
                            <a class="dropdown-item" href="#logoutModal" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Cerrar Sesión
                            </a>
                            <a class="dropdown-item" href="#Credencial" data-toggle="modal" data-target="#Credencial">
                                <i class="fas fa-check fa-sm fa-fw mr-2 text-gray-500"></i>
                                Credenciales
                            </a>

                        </div>

                    </li>
                </ul>

            </nav>

            <!-- End of Topbar -->

            <!-- Begin Page Content -->
            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <div class="card-body">
                        <div class="table-responsive">
                            <h4 class="text-danger text-left h4 mb-4 text-black-500 "><%=producto.getNombre()%>
                            </h4>

                            <TABLE class="table">
                                <TR>
                                    <TD><b>Descripcion: </b></TD>
                                    <td colspan=3><%=producto.getDescripcion()%>
                                    </td>
                                    <TD ROWSPAN=4><img class="img-fluid"
                                                       src="<%=request.getContextPath()%>/BodegaServlet?action=mostrarIMG&idproducto=<%=producto.getId()%>"
                                                       width="250" height="250">
                                    </TD>
                                </TR>
                                <form id="editar" method="post">
                                    <TR>
                                        <div class="form-group">
                                            <TD><b>Cantidad: </b></TD>
                                            <td><%=producto.getCantidad() + " uni."%>
                                            </td>
                                            <td><i class="fas fa-fw fa-arrow-right"></i></td>
                                            <td><input name="unidades" type="text"
                                                       class="text-center form-control <%=verificador3?"":"is-invalid"%> "
                                                       placeholder="Unid." <%=request.getParameter("unidades") != null?"value='"+request.getParameter("unidades")+"'":""%>
                                                       aria-describedby="validationServer04Feedback" required>
                                                <div id="validationServer04Feedback" class="invalid-feedback">
                                                    Debe ser un número entre 0 y 1000
                                                </div>
                                            </td>

                                        </div>
                                    </TR>
                                    <TR>
                                        <div class="form-group">
                                            <TD><b>Precio: </b></TD>
                                            <td><%="S/. " + producto.getPrecio()%>
                                            </td>
                                            <td><i class="fas fa-fw fa-arrow-right"></i></td>
                                            <td><input name="precio" type="text"
                                                       class="text-center form-control <%=verificador4?"":"is-invalid"%> "
                                                       placeholder="Precio"<%=request.getParameter("precio") != null?"value='"+request.getParameter("precio")+"'":""%>
                                                       aria-describedby="validationServer03Feedback" required>
                                                <div id="validationServer03Feedback" class="invalid-feedback">
                                                    Debe ser un número
                                                </div>
                                            </td>

                                        </div>
                                    </TR>
                                </form>
                                <form id="eliminar" method="POST"
                                      action="<%=request.getContextPath()%>/BodegaServlet?action=eliminar&idproducto=<%=producto.getId()%>">

                                    <tr>
                                        <td colspan="1"></td>
                                        <td>
                                            <a class="btn btn-block btn-success" data-toggle="modal" href="#lModal2"
                                               role="button">Actualizar</a>
                                        <td><a class="btn btn-block btn-primary"
                                               href="<%=request.getContextPath()%>/BodegaServlet"
                                               role="button">Cancelar</a></td>
                                        <td><a class="btn btn-block btn-warning" data-toggle="modal" href="#lModal1"
                                               role="button">Eliminar Producto</a></td>
                                    </tr>
                                </form>

                            </TABLE>


                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- End of Content Wrapper -->

        <!-- End of Page Wrapper -->

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
        <div class="modal fade" id="lModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel2">Está seguro que desea eliminar producto?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                        <button type="submit" form="eliminar" class="btn btn-primary">Sí</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal2-->
        <div class="modal fade" id="lModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel3">Está seguro que desea actualizar producto?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar</button>
                        <button type="submit" form="editar" class="btn btn-primary">Sí</button>
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
        <!-- Bootstrap core JavaScript-->
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
    </div>
</div>
</body>

</html>


