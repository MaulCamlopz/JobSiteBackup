<%-- 
    Document   : viewUsers
    Created on : 5/05/2020, 12:23:56 AM
    Author     : b22br
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.user.User"%>
<%@page import="model.user.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Usuarios</title>
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
                <%
                    UserDAO dao = new UserDAO();
                    List<User> list = dao.listAdmin();
                    Iterator<User> iter = list.iterator();
                    User user = null;
                    while(iter.hasNext()){
                        user = iter.next();
                %>
                <article class="">
                    <p><%= user.getCode()%></p>
                </article>
                <br>
                <button class="button button2">Borrar</button>
                <hr>
                <%}%>
            </main>
        </div>
        <footer class="footer"><p>&copy; 2020 Kysuphanmem</p></footer>
    </body>
</html>
