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
            CV cv = new CV();
            CVDAO cvdao = new CVDAO();
            cv.setSkills(cvdao.readSkills(student.getIdCv()));
            student.setCv(cv);
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
                <%
                    Iterator<String> skills = cv.getSkills().iterator();
                    while(skills.hasNext()){                  
                %>
                <tbody>
                    <tr>
                        <td><%=skills.next()%></td>
                        <td>
                            <a class="link" href="#">Borrar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            </main>
        </div>
        <footer class="footer"><p>&copy; 2020 Kysuphanmem</p></footer>
    </body>
</html>