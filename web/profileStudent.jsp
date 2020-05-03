<%-- 
    Document   : profileStudent
    Created on : 29/04/2020, 10:06:03 PM
    Author     : b22br
--%>

<%@page import="model.student.Student"%>
<%@page import="model.user.UserDAO"%>
<%@page import="model.user.User"%>
<%@page import="model.student.StudentDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Perfil</title>
    </head>
    <body>
        <%
            Student student = (Student)session.getAttribute("student");
        %>
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
                    <a href="profileStudent.jsp">Perfil</a>
                    <a href="#">Mi CV</a>
                    <a href="#">Vacantes</a>
                </nav>              
            </div>
            <main class="column middle">
                <h1>Mis datos</h1>
                <h3>Nombre: <%=student.getName()%> <%=student.getLastName()%></h3>
            </main>
        </div>
        <footer class="footer"><p>&copy; 2020 Kysuphanmem</p></footer>
    </body>
</html>
