<%-- 
    Document   : index
    Created on : 25/04/2020, 06:33:48 PM
    Author     : b22br
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login - Jobsite</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
    <!-- https://fonts.google.com/specimen/Open+Sans -->
    <link rel="stylesheet" href="css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/tooplate.css">
</head>

<body>
    <div class="container">
        <div class="row tm-mt-big">
            <div class="col-12 mx-auto tm-login-col">
                <div class="bg-white tm-block">
                    <div class="row">
                        <div class="col-12 text-center">
                            <h2 class="tm-block-title mt-3">Iniciar sesión</h2>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <div class="col-12">
                            <form action="loginController" method="post" class="tm-login-form">
                                <div class="input-group">
                                    <label class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Clave</label>
                                    <input name="txtUser" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7" required>
                                </div>
                                <div class="input-group mt-3">
                                    <label for="password" class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Contraseña</label>
                                    <input name="txtPass" type="password" class="form-control validate" required>
                                </div>
                                <div class="input-group mt-3">
                                    <button type="submit" name="action" value="login" class="btn btn-primary d-inline-block mx-auto">Entrar</button>
                                </div>
                                <div class="input-group mt-3">
                                    <p>
                                        <em>¿Aún no tienes clave y contraseña? <a href="signup.jsp" class="tm-footer-link">Registrate</a>
                                        </em>
                                    </p>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="row tm-mt-big">
            <div class="col-12 font-weight-light text-center">
                <p class="d-inline-block tm-bg-black text-white py-2 px-4">
                    Copyright &copy; 2020 Jobsite. Created by Kysuphanmem Company.
                </p>
            </div>
        </footer>
    </div>
</body>

</html>
