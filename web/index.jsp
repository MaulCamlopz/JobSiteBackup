<%-- 
    Document   : index
    Created on : 25/04/2020, 06:33:48 PM
    Author     : b22br
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="assets/css/style.css">
        <title>Login</title>
    </head>
    <body>
        <form action="loginController" method="post">
            <label>Usuario</label><br>
            <input type="text" name="txtUser"><br>
            <label>Contraseña</label><br>
            <input type="password" name="txtPass"><br>
            <input type="submit" name="action" value="login"><br>
        </form>
    </body>
</html>
