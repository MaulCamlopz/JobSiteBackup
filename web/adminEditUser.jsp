<%-- 
    Document   : adminEditUser
    Created on : 19/05/2020, 12:55:45 AM
    Author     : b22br
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Admin</title>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
    <!-- https://fonts.google.com/specimen/Open+Sans -->

    <link rel="stylesheet" href="css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->

    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->

    <link rel="stylesheet" href="css/tooplate.css">

</head>

<body id="reportsPage">
    <div class="" id="home">
        <div class="container">

            <!-- navtop -->
            <div class="row">
                <div class="col-12">
                    <nav class="navbar navbar-expand-xl navbar-light bg-light">

                        <a class="navbar-brand" href="adminHome.jsp">
                            <!-- <i class="fas fa-3x fa-tachometer-alt tm-site-icon"></i> -->
                            <h1 class="tm-site-title mb-0">Jobsite</h1>
                        </a>

                        <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">

                            <ul class="navbar-nav mx-auto">

                                <li class="nav-item">
                                    <a class="nav-link" href="adminHome.jsp">Home</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link active" href="adminUser.jsp">Usuarios</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="adminVacancy.jsp">Vacantes</a>
                                </li>

                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                        Configuración
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#">Perfil</a>
                                    </div>
                                </li>

                            </ul>

                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link d-flex" href="index.jsp">
                                        <i class="far fa-user mr-2 tm-logout-icon"></i>
                                        <span>Salir</span>
                                    </a>
                                </li>
                            </ul>

                        </div>
                    </nav>
                </div>
            </div>
            

            <!-- row -->
            <div class="row tm-content-row tm-mt-big">
                
                <% 
                    String email = request.getParameter("email");
                    String id = request.getParameter("id");
                %>

                <!-- Edit New User -->
                <div class="col-xl-8 col-lg-10 col-md-12 col-sm-12">
                    <div class="bg-white tm-block">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">Correo electrónico registrado <%= email %></h2>
                            </div>
                        </div>
                        <div class="row mt-4 tm-edit-product-row">
                            <div class="col-xl-7 col-lg-7 col-md-12">
                                <form action="AdminController" method="post" class="tm-edit-product-form">
                                    
                                    <input name="id" type="hidden" value="<%= id%>">
                                    
                                    <div class="input-group mb-3">
                                        <label class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Clave</label>
                                        <input name="nickname" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7" required>
                                    </div>

                                    <div class="input-group mb-3">
                                        <label class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Contraseña</label>
                                        <input name="password" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7" required>
                                    </div>
                                    
                                    <div class="input-group mb-3">
                                        <label class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Tipo de usuario</label>
                                        <select name="type-user" class="custom-select col-xl-9 col-lg-8 col-md-8 col-sm-7">
                                            <option value="company">Empresa</option>
                                            <option value="student">Estudiante/Egresado</option>
                                            <option value="admin">Administrador</option>
                                        </select>
                                    </div>
                                    
                                    <div class="input-group mb-3">
                                        <label class="col-xl-4 col-lg-4 col-md-4 col-sm-5 mb-2">Comentario</label>
                                        <textarea name="commentary" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7" rows="3"></textarea>
                                    </div>

                                    <div class="input-group mb-3">
                                        <div class="ml-auto col-xl-8 col-lg-8 col-md-8 col-sm-7 pl-0">
                                            <button type="submit" name="action" value="addUser" class="btn btn-primary">Enviar</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                
            </div>
            
           
            <footer class="row tm-mt-big">
                <div class="col-12 font-weight-light">
                    <p class="d-inline-block tm-bg-black text-white py-2 px-4">
                        Copyright &copy; 2020 Jobsite. Created by Kysuphanmem Company.
                    </p>
                </div>
            </footer>

        </div>
    </div>

    <script src="js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->

    <script src="js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->

</body>
</html>
