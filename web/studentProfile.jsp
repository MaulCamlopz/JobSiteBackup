<%-- 
    Document   : studentProfile
    Created on : 1/05/2020, 02:08:52 PM
    Author     : b22br
--%>

<%@page import="model.student.Student"%>
<%@page import="model.user.UserDAO"%>
<%@page import="model.user.User"%>
<%@page import="model.student.StudentDAO"%>
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
                                        <a class="dropdown-item" href="help.html">Ayuda</a>
                                        <a class="dropdown-item" href="#">Contáctanos</a>
                                        <a class="dropdown-item" href="about.html">Acerca de Kysuphanmem</a>
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
            
            <%
            User user = (User)session.getAttribute("user");
            Student student = (Student)session.getAttribute("student");
            int id = student.getId();
            String name = student.getName()==null?"- - -":student.getName();
            String lastName = student.getLastName()==null?"":student.getLastName();
            String university = student.getUniversity()==null?"- - -":student.getUniversity();
            String career = student.getCareer()==null?"- - -":student.getCareer();
            String phone = student.getPhone()==null?"- - -":student.getPhone();
            String email = student.getEmail()==null?"- - -":student.getEmail();
            String address = student.getAddress()==null?"- - -":student.getAddress();
            String country = student.getCountry()==null?"- - -":student.getCountry();
            String city = student.getCity()==null?"- - -":student.getCity();
            %>
            <%=student.getName()%> <%=student.getLastName()%>
            <!-- row -->
            <div class="row tm-content-row tm-mt-big">
                
                <div class="col-xl-8 col-lg-12 tm-md-12 tm-sm-12 tm-col">
                    <div class="bg-white tm-block h-100">
                        <div class="row">
                            <div class="col-md-8 col-sm-12">
                                <h1 class="tm-block-title d-inline-block">Información personal</h1>
                            </div>
                            <div class="col-md-4 col-sm-12 text-right">
                                <a href="<%=id!=0?"studentEditProfile.jsp":"studentAddProfile.jsp"%>" class="btn btn-small btn-primary">Editar</a>
                            </div>
                        </div>
                        
                        <h5>ID User</h5>
                        <p> <%=user.getId()%> <p>
                        <h5>ID Student</h5>
                        <p> <%=id%> <p>
                        <h5>Nombre</h5>
                        <p> <%=name%> <%=lastName%><p>
                        <h5>Universidad</h5>
                        <p><%=university%></p>
                        <h5>Carrera</h5>
                        <p><%=career%></p>
                        <h5>Teléfono</h5>
                        <p><%=phone%></p>
                        <h5>Email</h5>
                        <p><%=email%></p>
                        <h5>Dirección</h5>
                        <p><%=address%></p>
                        <h5>País</h5>
                        <p><%=country%></p>
                        <h5>Estado</h5>
                        <p><%=city%></p>
                        
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