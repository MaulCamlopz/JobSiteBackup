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
        <title>Form login</title>
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <div id="contenedor1">
            <h1>Iniciar Sesion</h1>
            <form id="form1" action="loginController" method="post">
                <img src="imagen/usuario.png" alt="" width="30px" height="30px"/>
                <input type="text" name="txtUser" placeholder="username"/>
                <hr>
                <img src="imagen/bloquear.png" alt="" width="30px" height="30px"/>
                <input type="password" name="txtPass" placeholder="Password"/>
                <hr>
                <input type="submit" name="action" value="Iniciar sesion"/>
            </form>
        </div>
        <div id="conetendor2">
            <form id="form2">
                <input type="submit" value="Create Account" />
            </form>
            <div id="referencias">
                <a>KySuPhanMem</a>
                <a href="">Term of Use</a>
                <a href="">Privacy Policy</a>

            </div>
        </div>
    </body>
</html>
