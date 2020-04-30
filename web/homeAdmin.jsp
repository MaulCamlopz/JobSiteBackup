<%-- 
    Document   : homeAdmin
    Created on : 27/04/2020, 08:27:58 PM
    Author     : b22br
--%>
<%@page import="model.user.UserDAO"%>
<%@page import="model.user.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Inicio</title>
    </head>
    <body>
        <%
            UserDAO dao = new UserDAO();
            String code = (String)request.getAttribute("code");
            String pass = (String)request.getAttribute("pass");
            System.out.println("Code Pre-User: "+code);
            System.out.println("Pass Pre-User: "+pass);
            User user = dao.read(code,pass);
            System.out.println("ID User: "+user.getId());
        %>
        <div class="topnav">
            <a href="home.html" class="">Logo</a>
            <a href="#" class="">About</a>
            <a href="#" class="">Values</a>
            <a href="#" class="">News</a>
            <a href="#" class="">Contact</a>
            <a href="home_jobhunter.html" class="">Clients</a>
            <a href="#" class="">Partners</a>
        </div>
        
        <div class="row">
            <div class="column side" >
                <nav class="sidebar">
                    <a href="#"><%=user.getType()%></a>
                    <a href="#">Usuarios</a>
                    <a href="#">Vacantes</a>
                </nav>              
            </div>
            <main class="column middle">
                <article class="">
                    <h1>Vacante</h1>
                    <li>El título del puesto vacante</li>
                    <li>Define las competencias generales y específicas</li>
                    <li>Identifica los puntos clave</li>
                    <li>Un puesto, una oferta</li>
                </article>
                <br>
                <button>Aceptar</button>
                <button>Rechazar</button>
                <hr>
                <article class="">
                    <h1>Vacante</h1>
                    <li>El título del puesto vacante</li>
                    <li>Define las competencias generales y específicas</li>
                    <li>Identifica los puntos clave</li>
                    <li>Un puesto, una oferta</li>
                </article>
                <br>
                <button>Aceptar</button>
                <button>Rechazar</button>
                <hr>
                <br>
                <!-- Pagination -->
                <div class="">
                    <div class="">
                        <a class="link" href="#">1</a>
                        <a class="link" href="#">2</a>
                        <a class="link" href="#">3</a>
                        <a class="link" href="#">4</a>
                        <a class="link" href="#">5</a>
                        <a class="link" href="#">»</a>
                    </div>
                </div>
            </main>
        </div>
        <footer class="footer"><p>&copy; 2020 Kysuphanmem</p></footer>
    </body>
</html>
