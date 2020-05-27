<%-- 
    Document   : companyProfile
    Created on : 2/05/2020, 02:33:18 PM
    Author     : b22br
--%>

<%@page import="model.company.CompanyDAO"%>
<%@page import="model.user.User"%>
<%@page import="model.company.Company"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">

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
                        <a class="navbar-brand" href="companyHome.jsp">
                            <h1 class="tm-site-title mb-0">Jobsite</h1>
                        </a>
                        <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mx-auto">
                                
                                <li class="nav-item">
                                    <a class="nav-link active" href="companyHome.jsp">Home</a>
                                </li>
                                
                                <li class="nav-item">
                                    <a class="nav-link" href="companyVacancy.jsp">Vacantes</a>
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
                                        <a class="dropdown-item" href="companyProfile.jsp">Perfil</a>
                                      
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
            CompanyDAO daoCompany = new CompanyDAO();
            Company company = daoCompany.read(user.getId());
            session.setAttribute("company", company);
            
            
            String name = company.getName()==null?"Se requiere actualizar los datos":company.getName();
            String email = company.getEmail()==null?"- - -":company.getEmail();
            String phone = company.getPhone()==null?"- - -":company.getPhone();
            String address = company.getAddress()==null?"- - -":company.getAddress();
            %>

            
            <!-- row -->
        <div class="row tm-content-row tm-mt-big">
            
            <div class="tm-col tm-col-big">
                <div class="bg-white tm-block">
                    <div class="row">
                        <div class="col-12">
                            <h2 class="tm-block-title">Información de perfil</h2>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            
                            <h3><%= name %></h3>
                            <hr>
                            <br>
                            <p>Email: <%= email %></p>
                            <p>Teléfono: <%= phone %></p>
                            <p>Dirección: <%= address %></p>
                            <br>
                            <secction action="" method="post" class="tm-signup-form">
                                <div class="row">
                                    <div class="col-12 col-sm-4">
                                        <a href="<%= company.getId()!=0?"#":"companyAddProfile.jsp" %>" class="btn btn-primary">Actualizar</a>
                                    </div>
                                    <div class="col-12 col-sm-8 tm-btn-right">
                                        <a href="#" class="btn btn-danger">Borrar</a>
                                    </div>
                                </div>
                            </secction>
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
    <script src="js/bootstrap.min.js"></script>
    <script src="js/tooplate-scripts.js"></script>
    
</body>
</html>