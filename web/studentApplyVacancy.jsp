<%-- 
    Document   : studentApplyVacancy
    Created on : 24/05/2020, 12:53:52 PM
    Author     : b22br
--%>

<%@page import="model.student.Student"%>
<%@page import="model.student.StudentDAO"%>
<%@page import="model.user.User"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.vacancy.Vacancy"%>
<%@page import="model.vacancy.VacancyDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Home - Jobsite</title>
    
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
                                    <a class="nav-link active" href="studentVacancy.jsp">Vacantes</a>
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
                                        <a class="dropdown-item" href="studentProfile.jsp">Perfil</a>
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
            
            <% Student student = (Student)session.getAttribute("student"); %>
            
            
            <!-- container -->
            <div class="row tm-content-row tm-mt-big">
                
                <!-- Información de Vacante -->
                <%
                    String id = request.getParameter("id");
                    VacancyDAO daoVacancy = new VacancyDAO();
                    Vacancy vacancy = daoVacancy.read(id);
                    ArrayList<String> requirements = vacancy.getRequirements();
                    Iterator<String> iter = requirements.iterator();
                %>
                <div class="col-xl-8 col-lg-12 tm-md-12 tm-sm-12 tm-col">
                    <div class="bg-white tm-block h-100">
                        <div class="row">
                            <div class="col-md-8 col-sm-12">
                                <h2 class="tm-block-title d-inline-block"><%= vacancy.getWorkstation() %></h2>      
                            </div>
                        </div>
                            
                            <h5>Descripción</h5>    
                            <p> <%= vacancy.getDescription() %></p>
                            <h5>Salario</h5>    
                            <p> $<%= vacancy.getSalary() %> mensuales</p>
                            <h5>Horario</h5>    
                            <p> <%= vacancy.getWorkHours() %></p>
                            <h5>Zona laboral</h5>    
                            <p> <%= vacancy.getAddress() %></p>
                            <h5>Información adicional</h5>    
                            <p> <%= vacancy.getInformation() %></p>
                            

                        <div class="tm-table-mt tm-table-actions-row">
                            <div class="tm-table-actions-col-left">
                                <form action="StudentController" method="post">
                                    <input name="idStudent" type="hidden" value="<%= student.getId() %>">
                                    <input name="idVacancy" type="hidden" value="<%= id%>">
                                    <button type="submit" name="action" value="applyVacancy" class="btn btn-primary">
                                        Postulate <%= student.getName() %>
                                    </button>
                                </form>
                            </div>
                        </div>
                                
                    </div>
                </div>

                <!-- Requisitos -->
                <div class="col-xl-4 col-lg-12 tm-md-12 tm-sm-12 tm-col">
                    <div class="bg-white tm-block h-100">
                        
                        

                        <h2 class="tm-block-title">Requisitos</h2>
                        <ol class="tm-list-group">
                            <%while(iter.hasNext()){%>
                            <li class="tm-list-group-item"><%= iter.next()%></li>
                            <%}%>
                        </ol>
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
