<%-- 
    Document   : home
    Created on : 25/04/2020, 05:56:32 PM
    Author     : b22br
--%>

<%@page import="model.User"%>
<%@page import="model.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="../assets/css/style.css">
        <title>JSP Page</title>
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
        <nav class="topnav">
            <a href="home.html" class="">Logo</a>
            <a href="#" class="">About</a>
            <a href="#" class="">Values</a>
            <a href="#" class="">News</a>
            <a href="#" class="">Contact</a>
            <a href="home_jobhunter.html" class="">Clients</a>
            <a href="#" class="">Partners</a>
        </nav>
        
        <h2>Perfil</h2>
        <p><%=user.getType()%></p>
        
        <footer class="footer">
            <p>&copy; 2020 Kysuphanmem</p>
        </footer>
    </body>
</html>
