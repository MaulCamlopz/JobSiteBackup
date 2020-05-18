<%-- 
    Document   : adminHome
    Created on : 4/05/2020, 11:42:25 PM
    Author     : b22br
--%>

<%@page import="model.user.User"%>
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
                                    <a class="nav-link active" href="adminHome.jsp">Home
                                        <span class="sr-only">(current)</span>
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link" href="adminUser.jsp">Usuarios</a>
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
                                    <a class="nav-link d-flex" href="login_jobsite.html">
                                        <i class="far fa-user mr-2 tm-logout-icon"></i>
                                        <span>Salir</span>
                                    </a>
                                </li>
                            </ul>

                        </div>
                    </nav>
                </div>
            </div>
            

            <br>
            <h1 class="text-white">Aviso!</h1>
            <p class="text-white">El acceso a este sistema es solo para usuarios autorizados, si usted no esta expresamente autorizado, por favor desconectese inmediatamente. Los accesos no autorizados están en contra de la ley, y pueden estar sujetos a penas criminales o civiles.</p>
            <p class="text-white">Toda la actividad es registrada, si no esta de acuerdo desconectese inmediatamente.</p>
            <p class="text-white">Para mas información, contacte a kysuphanmem.company@gmail.com</p>
            <br>
            <h1 class="text-white">Warning!</h1>
            <p class="text-white">Access to this system is for authorized users only. If you are not expressly authorized, please disconnect immediately. Unauthorized access is against the law, and may be subject to criminal or civil penalties.</p>
            <p class="text-white">All activity is logged, if you do not agree, please disconnect immediately.</p>
            <p class="text-white">For more information, contact kysuphanmem.company@gmail.com</p>
            
            <form action="LogoutController">
                <input type="submit" class="btn btn-primary tm-table-mt" value="SALIR" />
            </form>

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


<!--
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Inicio</title>
    </head>
    <body>
        <div class="topnav">
            <a href="adminHome.jsp" class="">Logo</a>
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
                    <a href="#">Nuevos usuarios</a>
                    <a href="viewUsers.jsp">Usuarios</a>
                    <a href="#">Nuevas Vacantes</a>
                    <a href="#">Vacantes</a>
                </nav>              
            </div>
            <main class="column middle">
                <h1>Aviso!</h1>
                <p>El acceso a este sistema es solo para usuarios autorizados, si usted no esta expresamente autorizado, por favor desconectese inmediatamente. Los accesos no autorizados están en contra de la ley, y pueden estar sujetos a penas criminales o civiles.</p>
                <p>Toda la actividad es registrada, si no esta de acuerdo desconectese inmediatamente.</p>
                <p>Para mas información, contacte a kysuphanmem.company@gmail.com</p>
                <br>
                <h1>Warning!</h1>
                <p>Access to this system is for authorized users only. If you are not expressly authorized, please disconnect immediately. Unauthorized access is against the law, and may be subject to criminal or civil penalties.</p>
                <p>All activity is logged, if you do not agree, please disconnect immediately.</p>
                <p>For more information, contact kysuphanmem.company@gmail.com</p>
                <br>
                <form action="LogoutController">
                    <input type="submit" value="SALIR" />
                </form>
            </main>
        </div>
        <footer class="footer"><p>&copy; 2020 Kysuphanmem</p></footer>
    </body>
</html>
-->