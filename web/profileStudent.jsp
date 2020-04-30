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
            UserDAO dao = new UserDAO();
            String code = (String)request.getAttribute("code");
            String pass = (String)request.getAttribute("pass");
            System.out.println("Code Pre-User: "+code);
            System.out.println("Pass Pre-User: "+pass);
            User user = dao.read(code,pass);
            System.out.println("ID User: "+user.getId());
            StudentDAO sDao = new StudentDAO();
            Student student = sDao.read(user.getId());
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
                <h1>Welcome <%=student.getName()%></h1>
            </main>
        </div>
        <footer class="footer"><p>&copy; 2020 Kysuphanmem</p></footer>
    </body>
</html>
