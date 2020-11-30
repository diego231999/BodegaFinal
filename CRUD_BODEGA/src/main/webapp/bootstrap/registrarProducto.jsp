<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="bodega" scope="request" type="Beans.Bodega"/>
<%
    boolean imagen = request.getAttribute("imagen") != null ?
            ((boolean) request.getAttribute("imagen")) : true;
%>
<%
    boolean verificador = request.getAttribute("verificador") != null ?
            ((boolean) request.getAttribute("verificador")) : true;
%>
<%
    boolean verificador2 = request.getAttribute("verificador2") != null ?
            ((boolean) request.getAttribute("verificador2")) : true;

    boolean errorNameB = request.getAttribute("errorNombre") != null ?
            ((boolean) request.getAttribute("errorNombre")) : true;

    boolean errorNameD = request.getAttribute("errorNombreD") != null ?
            ((boolean) request.getAttribute("errorNombreD")) : true;

    boolean errorImage = request.getAttribute("errorImage") != null ?
            ((boolean) request.getAttribute("errorImage")) : true;

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
                    <a class="nav-link collapsed text-lg-left"
                       href="<%=request.getContextPath()%>/BodegaServlet">
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


                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>


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
                    <div class="container-fluid">
                        <!-- Page Heading -->
                        <div class="card shadow mb-4">
                            <div class="p-3  bg-primary text-white"
                                 style="text-align:center">
                                <h3 class="h3 font-weight-bold  text-white text-xl-center">REGISTRAR PRODUCTO</h3>
                            </div>
                            <div class="card-body">
                                <div class="text-xl-left">
                                    <div class="container">


                                        <!-- formulario -->
                                        <div class="row">

                                            <form method="POST"
                                                  action="<%=request.getContextPath()%>/BodegaServlet?action=enviar"
                                                  enctype="multipart/form-data">
                                                <div class="form-row justify-content-center">


                                                    <div class="col-md-5 mb-4 ml-5">
                                                        <label for="nombre">Producto:</label>
                                                        <input type="text"
                                                               class="form-control <%=errorNameB?"":"is-invalid"%>"
                                                               id="nombre" placeholder="Producto..."
                                                               name="nombre"  <%=request.getParameter("nombre") != null?"value='"+request.getParameter("nombre")+"'":""%>
                                                               aria-describedby="validationServer05Feedback">
                                                        <div id="validationServer05Feedback"
                                                             class="invalid-feedback">
                                                            Este campo es obligatorio
                                                        </div>
                                                    </div>


                                                    <div class="col-md-5 mb-4">
                                                        <label for="descrip">Descripción:</label>
                                                        <input name="descrip" type="text"
                                                               class="form-control <%=errorNameD?"":"is-invalid"%>"
                                                               aria-label="With textarea"
                                                               placeholder="Descripción..."
                                                               id="descrip" <%=request.getParameter("descrip") != null?"value='"+request.getParameter("descrip")+"'":""%>
                                                               aria-describedby="validationServer06Feedback">
                                                        <div id="validationServer06Feedback"
                                                             class="invalid-feedback">
                                                            Este campo es obligatorio
                                                        </div>
                                                    </div>

                                                    <div class="col-md-5 mb-4 ml-5">
                                                        <label for="cant">Cantidad:</label>
                                                        <div class="input-group">
                                                            <input name="cant" type="text"
                                                                   class="form-control <%=verificador2?"":"is-invalid"%>"
                                                                   placeholder="Cantidad..."
                                                                   aria-label="Cantidad..."
                                                                   aria-describedby="basic-addon2"
                                                                   id="cant" <%=request.getParameter("cant") != null?"value='"+request.getParameter("cant")+"'":""%>
                                                                   aria-describedby="validationServer04Feedback">
                                                            <div class="input-group-append">
                                                                <span class="input-group-text"
                                                                      id="basic-addon2">uni.</span>
                                                            </div>
                                                            <div id="validationServer04Feedback"
                                                                 class="invalid-feedback">
                                                                Debe ingresarse un número entre 0 y 1000
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-5 mb-4">
                                                        <label for="precio">Precio unitario:</label>
                                                        <div class="input-group">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text">S/.</span>
                                                            </div>
                                                            <input name="precio" type="text" id="precio"
                                                                   placeholder="Precio unitario..."
                                                                   class="form-control <%=verificador?"":"is-invalid"%>"
                                                                   aria-label="Precio"
                                                                <%=request.getParameter("precio") != null?"value='"+request.getParameter("precio")+"'":""%>
                                                                   aria-describedby="validationServer03Feedback">
                                                            <div id="validationServer03Feedback"
                                                                 class="invalid-feedback">
                                                                Debe ingresarse un número
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <div class="col-md-10 mb-4 ml-5">
                                                        <label for="imagen">Imagen referencial:</label>
                                                        <div class="input-group">
                                                            <input type="file" name="fileFoto" class="form-control <%=errorImage?"":"is-invalid"%>"
                                                                   id="imagen"
                                                                   placeholder="Recipient's username"
                                                                   aria-label="imagen"
                                                                <%=request.getParameter("fileFoto") != null?"value='"+request.getParameter("fileFoto")+"'":""%>
                                                                   aria-describedby="validationFoto">
                                                            <div id="validationFoto"
                                                                 class="invalid-feedback">
                                                                Debe subir una imagen
                                                            </div>
                                                            <div class="input-group-append">
                                                            </div>
                                                        </div>
                                                    </div>


                                                    <button type="submit"
                                                            class="btn btn-primary mb-4 mr-2 "
                                                            data-toggle="modal"
                                                            href="<%=request.getContextPath()%>/BodegaServlet?action=search">
                                                        Registrar
                                                        producto
                                                    </button>
                                                    <div class="modal fade" id="RegistroExitoso" tabindex="-1"
                                                         role="dialog"
                                                         aria-labelledby="exampleModalLabel"
                                                         aria-hidden="true">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title text-center"
                                                                        id="exampleModalRegistro">
                                                                        Registro
                                                                        exitoso</h5>
                                                                    <button class="close" type="button"
                                                                            data-dismiss="modal"
                                                                            aria-label="Close">
                                                                        <span aria-hidden="true">×</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">Su producto se ha registrado
                                                                    correctamente
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <a class="btn btn-primary"
                                                                       href="tables.html">OK</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <a class="btn btn-danger mb-4"
                                                       href="<%=request.getContextPath()%>/BodegaServlet"
                                                       role="button">Cancelar</a>
                                                    <div class="modal fade" id="CancelarRegistro" tabindex="-1"
                                                         role="dialog"
                                                         aria-labelledby="exampleModalLabel"
                                                         aria-hidden="true">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title text-center"
                                                                        id="exampleModalCancelarRegistro"
                                                                        data-dismiss="modal">Cancelar</h5>
                                                                    <button class="close" type="button"
                                                                            data-dismiss="modal"
                                                                            aria-label="Close">
                                                                        <span aria-hidden="true">×</span>
                                                                    </button>
                                                                </div>
                                                                <div class="modal-body">¿Desea cancelar el registro?
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <a class="btn btn-primary"
                                                                       href="tables.html">Si</a>
                                                                    <a class="btn btn-group-sm"
                                                                       href="RegistroProducto.html">No</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End of Main Content -->
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <!-- Alerta cierre sesion-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
             aria-labelledby="exampleModalLabel"
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
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancelar
                        </button>
                        <a class="btn btn-primary"
                           href="<%=request.getContextPath()%>/BodegaServlet?action=login">Cerrar
                            Sesión</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="Credencial" tabindex="-1" role="dialog"
             aria-labelledby="exampleCredencial"
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

        </div>
    </body>
</html>
