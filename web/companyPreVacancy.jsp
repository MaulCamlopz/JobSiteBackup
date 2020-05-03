<%-- 
    Document   : companyPreVacancy
    Created on : 2/05/2020, 11:18:08 PM
    Author     : b22br
--%>

<%@page import="model.company.Company"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Nuevas Vacantes</title>
    </head>
    <%
        Company company = (Company)session.getAttribute("company");
    %>
    <body>
        <div class="topnav">
            <a href="#" class="">Logo</a>
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
                    <a href="companyProfile.jsp">Perfil</a>
                    <a href="companyPreVacancy.jsp">Nuevas Vacantes</a>
                    <a href="companyVacancy.jsp">Mis Vacantes</a>
                </nav>              
            </div>
            <main class="column middle">
                <h2>Nuevas vacantes</h2>
                <form>
                    <input type="submit" value="Crear nueva vacante" />
                </form>
                <hr>
                <h2>Vacantes en proceso de autorización</h2>
                <p>...</p>
            </main>
        </div>
        <footer class="footer"><p>&copy; 2020 Kysuphanmem</p></footer>
    </body>
</html>
