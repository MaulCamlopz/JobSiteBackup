<%-- 
    Document   : studentVacancy
    Created on : 18/05/2020, 07:49:56 PM
    Author     : b22br
--%>

<%@page import="model.student.StudentDAO"%>
<%@page import="model.student.Student"%>
<%@page import="model.company.Company"%>
<%@page import="model.company.CompanyDAO"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.vacancy.Vacancy"%>
<%@page import="java.util.List"%>
<%@page import="model.vacancy.VacancyDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Vacancy - Jobsite</title>
    
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

            <!-- Content -->
            <div class="row tm-content-row tm-mt-big">
                
                <%
                    
                    Student student = (Student)session.getAttribute("student");
                    StudentDAO daoStudent = new StudentDAO();
                    List<Integer> selectedVacancies = daoStudent.ListSelectedVacancies(student.getId());
                    Iterator<Integer> iterSelectedVacancies = selectedVacancies.iterator();
                    
                    VacancyDAO daoVacancy = new VacancyDAO();
                    List<Vacancy> list = daoVacancy.listForActive();
                    Iterator<Vacancy> iter = list.iterator();
                    Vacancy vacancy = null;
                    
                    CompanyDAO daoCompany = new CompanyDAO();
                    Company company = new Company();
                %>
                
                <!-- Vacantes -->
                <div class="col-xl-8 col-lg-12 tm-md-12 tm-sm-12 tm-col">
                    <div class="bg-white tm-block h-100">
                        <div class="row">
                            <div class="col-md-8 col-sm-12">
                                <h2 class="tm-block-title d-inline-block">Vacantes</h2>
                            </div>
                        </div>
                        <div class="table-responsive">
                            <table class="table table-hover table-striped tm-table-striped-even mt-3">
                                <thead>
                                    <tr class="tm-bg-gray">
                                        <th scope="col">Empresa</th>
                                        <th scope="col">Puesto</th>
                                        <th scope="col">Descripción</th>
                                        <th scope="col">Sueldo</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                    while(iter.hasNext()){
                                    vacancy = iter.next();
                                    company = daoCompany.readCompany(vacancy.getIdCompany());
                                    %>
                                    <tr>
                                        <td><%= company.getName()%></td>
                                        <td>
                                            <a href="studentApplyVacancy.jsp?id=<%= vacancy.getId()%>"><%= vacancy.getWorkstation()%></a>
                                        </td>
                                        <td><%= vacancy.getDescription()%></td>
                                        <td>$<%= vacancy.getSalary()%> mensuales</td>
                                    </tr>
                                    <%}%>
                                    
                                </tbody>
                            </table>
                        </div>

                        <!-- <div class="tm-table-mt tm-table-actions-row">
                            <div class="tm-table-actions-col-right">
                                <span class="tm-pagination-label">Page</span>
                                <nav aria-label="Page navigation" class="d-inline-block">
                                    <ul class="pagination tm-pagination">
                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item">
                                            <span class="tm-dots d-block">...</span>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#">13</a></li>
                                        <li class="page-item"><a class="page-link" href="#">14</a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div> -->
                    </div>
                </div>

                <!-- Postulaciones -->
                <div class="col-xl-4 col-lg-12 tm-md-12 tm-sm-12 tm-col">
                    <div class="bg-white tm-block h-100">
                        <h2 class="tm-block-title d-inline-block">Postulaciones</h2>
                        <table class="table table-hover table-striped mt-3">
                            <tbody>
                                <%
                                int i;
                                while(iterSelectedVacancies.hasNext()){
                                i = iterSelectedVacancies.next();
                                vacancy = daoVacancy.read(String.valueOf(i));
                                %>
                                <tr>
                                    <td><%= i%>. <%= vacancy.getWorkstation() %></td>
                                    <td class="tm-trash-icon-cell"><i class="fas fa-trash-alt tm-trash-icon"></i></td>
                                </tr>
                                <%}%>
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
    <script src="js/tooplate-scripts.js"></script>
    
</body>
</html>