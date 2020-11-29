<%--
  Created by IntelliJ IDEA.
  User: Diego
  Date: 11/11/2020
  Time: 11:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bodega" type="Beans.Bodega" scope="request"/>
<%
    boolean verificador = request.getAttribute("verificador") != null ?
            ((boolean) request.getAttribute("verificador")) : true;
%>
<%
    boolean verificador2 = request.getAttribute("verificador2") != null ?
            ((boolean) request.getAttribute("verificador2")) : true;
%>


<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Productos Cliente</title>

    <!-- Custom fonts for this template-->
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
                <span>Registro producto</span>
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
            <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                <!-- Sidebar Toggle (Topbar) -->
                <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                    <i class="fa fa-bars"></i>
                </button>

                <h2 class="navbar-dark mb-1 text-gray-800"><strong><strong>REGISTRO DE PRODUCTO</strong></strong></h2>


                <!-- Topbar Navbar -->
                <ul class="navbar-nav ml-auto">
                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%=bodega.getNombre()%></span>
                            <i class="fas fa-user-alt"></i>
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
            <div class="container-fluid">

            </div>
            <!-- /.container-fluid -->
            <form method="post" action="<%=request.getContextPath()%>/BodegaServlet?action=enviar"
                  enctype="multipart/form-data">
                <div class="container-fluid">
                    <div class="form-group ">
                        <div class="col-2 mb-3 mb-sm-1">
                            <h4 class="h4 mb-3 text-gray-800">Producto :</h4>
                        </div>

                        <div class="col-4 mb-3 mb-sm-1">
                            <input name="nombre" type="text" class="form-control form-control" id="exampleProducto"
                                   placeholder="Producto..."
                                   id="nombre" <%=request.getParameter("nombre") != null?"value='"+request.getParameter("nombre")+"'":""%>
                                   required>
                        </div>
                    </div>

                    <div class="input">
                        <div class="col-2 mb-3 mb-sm-1">
                            <h4 class="h4 mb-3 text-gray-800">Descripción :</h4>
                        </div>
                    </div>
                    <div class="input-group col-10 mb-3">
                        <input name="descrip" class="col-5 form-control" aria-label="With textarea"
                               placeholder="Descripción..."
                               id="descrip" <%=request.getParameter("descrip") != null?"value='"+request.getParameter("descrip")+"'":""%>
                               required>
                    </div>

                    <div class="form-group">
                        <div class="col-2 mb-3 mb-sm-1">
                            <h4 class="h4 mb-3 text-gray-800">Cantidad :</h4>
                        </div>
                    </div>
                    <div class="input-group col-3 mb-3">
                        <input name="cant" type="number" class="form-control <%=verificador2?"":"is-invalid"%>"
                               placeholder="Cantidad..."
                               aria-label="Cantidad..." aria-describedby="basic-addon2"
                               id="cant" <%=request.getParameter("cant") != null?"value='"+request.getParameter("cant")+"'":""%>
                               aria-label="Precio" aria-describedby="validationServer04Feedback" required>
                        <div class="input-group-append">
                            <span class="input-group-text" id="basic-addon2">uni.</span>
                        </div>
                        <div id="validationServer04Feedback" class="invalid-feedback">
                            Numero debe estar entre 0 y 1000
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-2 mb-4 mb-sm-1">
                            <h4 class="h4 mb-3 text-gray-800">Precio Unitario :</h4>
                        </div>
                    </div>
                    <div class="input-group mb-4 col-2">
                        <div class="input-group-prepend">
                            <span class="input-group-text">S/.</span>
                        </div>
                        <input name="precio" type="text" class="form-control <%=verificador?"":"is-invalid"%>"
                               aria-label="Precio"<%=request.getParameter("precio") != null?"value='"+request.getParameter("precio")+"'":""%>
                               aria-describedby="validationServer03Feedback" required>
                        <div id="validationServer03Feedback" class="invalid-feedback">
                            Debe ser un número
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-2 mb-5 mb-sm-1">
                            <h4 class="h4 mb-3 text-gray-800">Imagen referencial :</h4>
                        </div>
                    </div>
                    <div class="input-group col-6 mb-5">
                        <input type="file" name="fileFoto" class="form-control" placeholder="Recipient's username"
                               aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary" data-toggle="modal"
                            href="<%=request.getContextPath()%>/BodegaServlet?action=search">Registrar
                        producto
                    </button>
                    <div class="modal fade" id="RegistroExitoso" tabindex="-1" role="dialog"
                         aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title text-center" id="exampleModalRegistro">Registro
                                        exitoso</h5>
                                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <div class="modal-body">Su producto se ha registrado correctamente</div>
                                <div class="modal-footer">
                                    <a class="btn btn-primary" href="tables.html">OK</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <a class="btn btn-group-toggle" href="<%=request.getContextPath()%>/BodegaServlet" role="button">Cancelar</a>
                    <div class="modal fade" id="CancelarRegistro" tabindex="-1" role="dialog"
                         aria-labelledby="exampleModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title text-center" id="exampleModalCancelarRegistro"
                                        data-dismiss="modal">Cancelar</h5>
                                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">×</span>
                                    </button>
                                </div>
                                <div class="modal-body">¿Desea cancelar el registro?</div>
                                <div class="modal-footer">
                                    <a class="btn btn-primary" href="tables.html">Si</a>
                                    <a class="btn btn-group-sm" href="RegistroProducto.html">No</a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </form>
        </div>
        <!-- End of Main Content -->


    </div>
    <!-- End of Content Wrapper -->

</div>
<!-- End of Page Wrapper -->

<!-- Scroll to Top Button-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>

<!-- Logout Modal-->
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
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleCredencial">Credenciales de Bodega</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Cerrar">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body"><%="Nombre: "+bodega.getNombre()%></div>
            <div class="modal-body"><%="RUC: "+bodega.getRuc()%></div>
            <div class="modal-body"><%="Correo: "+bodega.getCorreo()%></div>
            <div class="modal-body"><%="Direccion: "+bodega.getDireccion()%></div>
            <div class="modal-body"><%="Distrito: "+bodega.getDistrito()%></div>
            <div class="modal-body"><%="Valoracion: "+bodega.getValoracion()%></div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">OK</button>
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
<script src="js/demo/datatables-demo.js"></script>

</body>
</html>
