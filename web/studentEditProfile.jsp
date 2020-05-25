<%-- 
    Document   : studentEditProfile
    Created on : 24/05/2020, 10:09:35 PM
    Author     : b22br
--%>

<%@page import="model.student.Student"%>
<%@page import="model.user.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Profile - Jobsite</title>
    
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
            <div class="row">
                <div class="col-12">
                    <nav class="navbar navbar-expand-xl navbar-light bg-light">
                        
                        <a class="navbar-brand" href="studentHome.jsp">
                            <h1 class="tm-site-title mb-0">Jobsite</h1>
                        </a>
                        <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mx-auto">
                                
                                <li class="nav-item">
                                    <a class="nav-link" href="studentHome.jsp">Home</a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="studentVacancy.jsp">Vacantes</a>
                                </li>

                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                        Soporte
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#">Ayuda</a>
                                        <a class="dropdown-item" href="#">Contáctanos</a>
                                        <a class="dropdown-item" href="#">Acerca de Kysuphanmem</a>
                                    </div>
                                </li>
                                
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                        Configuración
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item active" href="studentProfile.jsp">Perfil</a>
                                        <a class="dropdown-item" href="studentCV.jsp">CV</a>
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
        <div class="row tm-mt-big">
            
            <% Student student = (Student)session.getAttribute("student");%>

            <div class="col-xl-8 col-lg-10 col-md-12 col-sm-12">
                <div class="bg-light tm-block">
                    
                    <div class="row">
                        <div class="col-12">
                            <h2 class="tm-block-title d-inline-block">Editar información</h2>
                        </div>
                    </div>
                    
                    <div class="row mt-4 tm-edit-product-row">

                        <div class="col-xl-7 col-lg-7 col-md-12">
                            <form action="StudentController" method="post" class="tm-edit-product-form">
                                
                                <div class="input-group mb-3">
                                    <label class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Nombre</label>
                                    <input placeholder="<%=student.getName()%>" name="name" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7">
                                </div>
                                
                                <div class="input-group mb-3">
                                    <label class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Apellido</label>
                                    <input placeholder="<%= student.getLastName() %>" name="lastName" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7">
                                </div>
                                
                                <div class="input-group mb-3">
                                    <label class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Teléfono</label>
                                    <input placeholder="<%= student.getPhone() %>" name="phone" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7">
                                </div>
                                
                                <div class="input-group mb-3">
                                    <label class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Email</label>
                                    <input placeholder="<%= student.getEmail() %>" name="email" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7">
                                </div>
                                
                                <div class="input-group mb-3">
                                    <label class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Universidad</label>
                                    <input placeholder="<%= student.getUniversity() %>" name="university" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7">
                                </div>
                                
                                <div class="input-group mb-3">
                                    <label class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Carrera</label>
                                    <input placeholder="<%= student.getCareer() %>" name="career" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7">
                                    <div class="ml-auto col-xl-8 col-lg-8 col-md-8 col-sm-7 pl-0 tm-btn-right">
                                        <a href="Controller?action=editStudent&edit=country">Editar</a>
                                    </div>
                                </div>
                                    
                                <div class="input-group mb-3">
                                    <label class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Domicilio</label>
                                    <input placeholder="<%= student.getAddress() %>" name="address" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7">
                                    <div class="ml-auto col-xl-8 col-lg-8 col-md-8 col-sm-7 pl-0 tm-btn-right">
                                        <a href="Controller?action=editStudent&edit=country">Editar</a>
                                    </div>
                                </div>
                                    
                                <div class="input-group mb-3">
                                    <label class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">País</label>
                                    <input placeholder="<%= student.getCountry() %>" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7">
                                    <div class="ml-auto col-xl-8 col-lg-8 col-md-8 col-sm-7 pl-0 tm-btn-right">
                                        <a href="Controller?action=editStudent&edit=country">Editar</a>
                                    </div>
                                </div>
                                    
                                <div class="input-group mb-3">
                                    <label class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Estado</label>
                                    <input placeholder="<%= student.getCity() %>" name="city" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7">
                                    <div class="ml-auto col-xl-8 col-lg-8 col-md-8 col-sm-7 pl-0 tm-btn-right">
                                        <a href="Controller?action=editStudent&edit=country">Editar</a>
                                    </div>
                                </div>
                                    
                                <input name="idStudent" type="hidden" value="<%= student.getId() %>">
                                
                                <div class="row">
                                    <div class="col-12 col-sm-4">
                                        <button type="submit" name="action" value="deleteStudent" class="btn btn-danger">Borrar</button>
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
    <script src="js/tooplate-scripts.js"></script>
    
</body>
</html>
