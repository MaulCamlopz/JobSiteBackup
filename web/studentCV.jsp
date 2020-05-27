<%-- 
    Document   : studentCV
    Created on : 1/05/2020, 02:07:06 PM
    Author     : b22br
--%>

<%@page import="java.util.Iterator"%>
<%@page import="model.cv.CV"%>
<%@page import="model.cv.CVDAO"%>
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
    <title>CV - Jobsite</title>
    
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
                                        <a class="dropdown-item active" href="studentCV.jsp">CV</a>
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
            
            <!-- Set Student Attributes -->
            <%
            Student student = (Student)session.getAttribute("student");
            CV cv = new CV();
            CVDAO cvdao = new CVDAO();
            cv.setSkills(cvdao.readSkills(student.getIdCv()));
            student.setCv(cv);
            %>
            
            <!-- Content -->
            <div class="row tm-content-row tm-mt-big">

                <div class="col-xl-4 col-lg-12 tm-md-12 tm-sm-12 tm-col">
                    <div class="bg-white tm-block h-100">
                        <h2 class="tm-block-title d-inline-block">Cursos</h2>
                        <table class="table table-hover table-striped mt-3">
                            <tbody>
                                <tr>
                                    <td>1. Introducción a la Inteligencia Artificial</td>
                                    <td class="tm-trash-icon-cell"><i class="fas fa-trash-alt tm-trash-icon"></i></td>
                                </tr>
                                <tr>
                                    <td>2. Bases matemáticas para estudiar ingeniería</td>
                                    <td class="tm-trash-icon-cell"><i class="fas fa-trash-alt tm-trash-icon"></i></td>
                                </tr>
                                <tr>
                                    <td>3. Android: Introducción a la Programación</td>
                                    <td class="tm-trash-icon-cell"><i class="fas fa-trash-alt tm-trash-icon"></i></td>
                                </tr>
                                <tr>
                                    <td>4. Global Software Development</td>
                                    <td class="tm-trash-icon-cell"><i class="fas fa-trash-alt tm-trash-icon"></i></td>
                                </tr>
                            </tbody>
                        </table>
    
                        <a href="#" class="btn btn-primary tm-table-mt">Agregar</a>
                    </div>
                </div>

                <div class="col-xl-4 col-lg-12 tm-md-12 tm-sm-12 tm-col">
                    <div class="bg-white tm-block h-100">
                        <h2 class="tm-block-title d-inline-block">Habilidades</h2>
                        <table class="table table-hover table-striped mt-3">
                            <tbody>
                                <%
                                Iterator<String> skills = cv.getSkills().iterator();
                                int i = 1;
                                while(skills.hasNext()){                  
                                %>
                                <tr>
                                    <td><%=i++%>. <%=skills.next()%></td>
                                    <td class="tm-trash-icon-cell"><i class="fas fa-trash-alt tm-trash-icon"></i></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
    
                        <a href="#" class="btn btn-primary tm-table-mt">Agregar</a>
                    </div>
                </div>


                <div class="col-xl-4 col-lg-12 tm-md-12 tm-sm-12 tm-col">
                    <div class="bg-white tm-block h-100">
                        <h2 class="tm-block-title d-inline-block">Idiomas</h2>
                        <table class="table table-hover table-striped mt-3">
                            <tbody>
                                <tr>
                                    <td>1. Español</td>
                                    <td class="tm-trash-icon-cell"><i class="fas fa-trash-alt tm-trash-icon"></i></td>
                                </tr>
                                <tr>
                                    <td>2. Ingles</td>
                                    <td class="tm-trash-icon-cell"><i class="fas fa-trash-alt tm-trash-icon"></i></td>
                                </tr>
                                <tr>
                                    <td>3. Frances</td>
                                    <td class="tm-trash-icon-cell"><i class="fas fa-trash-alt tm-trash-icon"></i></td>
                                </tr>
                            </tbody>
                        </table>
    
                        <a href="#" class="btn btn-primary tm-table-mt">Agregar</a>
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

<!--
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Perfil</title>
    </head>
    <body>
        
        <div class="topnav">
            <a href="homeStudent.jsp" class="">Logo</a>
            <a href="#" class="">About</a>
            <a href="#" class="">Values</a>
            <a href="#" class="">News</a>
            <a href="#" class="">Contact</a>
            <a href="#" class="">Clients</a>
            <a href="#" class="">Partners</a>
        </div>
        
        <div class="row">
            <div class="column side" >
                <nav class="sidebar">
                    <a href="studentProfile.jsp">Perfil</a>
                    <a href="studentCV.jsp">Mi CV</a>
                    <a href="#">Vacantes</a>
                </nav>              
            </div>
            <main class="column middle">
                <h1>Curriculum </h1>
                <table border="1" >
                <thead>
                    <tr>
                        <th>Habilidades</th>
                        <th><a class="link" href="#">Agregar</a></th>
                    </tr>
                </thead>
                
                <tbody>
                    <tr>
                        <td></td>
                        <td>
                            <a class="link" href="#">Borrar</a>
                        </td>
                    </tr>
                    
                </tbody>
            </table>
            </main>
        </div>
        <footer class="footer"><p>&copy; 2020 Kysuphanmem</p></footer>
    </body>
</html>-->