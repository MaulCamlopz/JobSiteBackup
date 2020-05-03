<%-- 
    Document   : companyVacancy
    Created on : 2/05/2020, 11:17:38 PM
    Author     : b22br
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="model.vacancy.VacancyDAO"%>
<%@page import="model.vacancy.Vacancy"%>
<%@page import="model.company.Company"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>JSP Page</title>
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
                <%
                    VacancyDAO dao = new VacancyDAO();
                    List<Vacancy> list = dao.list(company.getId());
                    Iterator<Vacancy> iter = list.iterator();
                    Vacancy vacancy = null;
                    while(iter.hasNext()){
                        vacancy = iter.next();
                %>
                <article class="">
                    <h2><%= vacancy.getWorkstation()%></h2>
                    <p><%= vacancy.getDescription()%></p>
                    <p><%= vacancy.getWorkHours()%></p>
                    <p>$<%= vacancy.getSalary()%> MXN por mes</p>
                </article>
                <br>
                <button class="button button2">Candidatos</button>
                <hr>
                <%}%>
            </main>
        </div>
        <footer class="footer"><p>&copy; 2020 Kysuphanmem</p></footer>
    </body>
</html>
