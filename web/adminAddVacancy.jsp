<%-- 
    Document   : adminAddVacancy
    Created on : 24/05/2020, 12:10:50 AM
    Author     : b22br
--%>

<%@page import="model.vacancy.Vacancy"%>
<%@page import="model.vacancy.VacancyDAO"%>
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
                                    <a class="nav-link" href="adminUser.jsp">Usuarios</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link active" href="adminVacancy.jsp">Vacantes</a>
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
                    String id = request.getParameter("id");
                    VacancyDAO daoVacancy = new VacancyDAO();
                    Vacancy vacancy = daoVacancy.read(id);
                        
                %>

                <!-- Edit New User -->
                <div class="col-xl-8 col-lg-12 col-md-12 col-sm-12">
                    <div class="bg-white tm-block">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">Datos de vacante <%= id %></h2>
                            </div>
                        </div>
                        <div class="row mt-4 tm-edit-product-row">
                            
                            <div class="col-xl-12 col-lg-12 col-md-12">
                                <form action="AdminController" method="post" class="tm-edit-product-form">
                                    
                                    <input name="id" type="hidden" value="<%= id%>">
                                    
                                    <h3>Puesto: <%= vacancy.getWorkstation() %></h3>
                                    <hr>
                                    <br>
                                    <p>Descripción: <%= vacancy.getDescription() %></p>
                                    <br>
                                    <p>Salario: <%= vacancy.getSalary() %></p>
                                    <br>
                                    <p>Horas laborales: <%= vacancy.getWorkHours() %></p>
                                    <br>
                                    <p>Zona de trabajo: <%= vacancy.getAddress() %></p>
                                    <br>
                                    <p>Información adicional: <%= vacancy.getInformation() %></p>
                                    
                                    <br>
                                    <div class="input-group mb-1">
                                        <button type="submit" name="action" value="addVacancy" class="btn btn-primary">Aceptar</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                
                
                <!-- Requisitos -->
                <div class="col-xl-4 col-lg-12 tm-md-12 tm-sm-12 tm-col">
                    <div class="bg-white tm-block h-100">
                        <h2 class="tm-block-title d-inline-block">Requisitos</h2>
                        <table class="table table-hover table-striped mt-3">
                            <tbody>
                                <tr>
                                    <td>1. Ser estudiante de sistemas, computación o afín.</td>
                                </tr>
                                <tr>
                                    <td>2. Deseable contar con prácticas escolares en Java, SQL o manejo de bases de datos.</td>
                                </tr>
                                <tr>
                                    <td>3. Contar con seguro facultativo.</td>
                                </tr>
                                <tr>
                                    <td>1. Ser estudiante de sistemas, computación o afín.</td>
                                </tr>
                                <tr>
                                    <td>2. Deseable contar con prácticas escolares en Java, SQL o manejo de bases de datos.</td>
                                </tr>
                                <tr>
                                    <td>3. Contar con seguro facultativo.</td>
                                </tr>
                                <tr>
                                    <td>1. Ser estudiante de sistemas, computación o afín.</td>
                                </tr>
                                <tr>
                                    <td>2. Deseable contar con prácticas escolares en Java, SQL o manejo de bases de datos.</td>
                                </tr>
                                <tr>
                                    <td>3. Contar con seguro facultativo.</td>
                                </tr>
                                
                            </tbody>
                        </table>
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

