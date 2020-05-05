<%-- 
    Document   : adminHome
    Created on : 4/05/2020, 11:42:25 PM
    Author     : b22br
--%>

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
