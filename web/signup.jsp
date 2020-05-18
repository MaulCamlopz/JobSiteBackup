<%-- 
    Document   : signup
    Created on : 17/05/2020, 08:21:36 PM
    Author     : b22br
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign up - Jobsite</title>
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600">
    <!-- https://fonts.google.com/specimen/Open+Sans -->
    <link rel="stylesheet" href="css/fontawesome.min.css">
    <!-- https://fontawesome.com/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- https://getbootstrap.com/ -->
    <link rel="stylesheet" href="css/tooplate.css">
</head>

<body class="bg05">
    <div class="container">
        <!-- formulario -->
        <div class="row tm-mt-big">
            <div class="col-xl-8 col-lg-10 col-md-12 col-sm-12">
                <div class="bg-white tm-block">
                    <div class="row">
                        <div class="col-12">
                            <h2 class="tm-block-title d-inline-block">Registro</h2>
                        </div>
                    </div>
                    <div class="row mt-4 tm-edit-product-row">
                        <div class="col-xl-7 col-lg-7 col-md-12">
                            <form action="signupController" method="post" class="tm-edit-product-form">

                                <div class="input-group mb-3">
                                    <label class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Correo electrónico</label>
                                    <input name="email" type="text" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7" required>
                                </div>
                                
                                <div class="input-group mb-3">
                                    <label class="col-xl-4 col-lg-4 col-md-4 col-sm-5 col-form-label">Tipo de usuario</label>
                                    <select name="type_user" class="custom-select col-xl-9 col-lg-8 col-md-8 col-sm-7" required>
                                        <option value="1">Empresa</option>
                                        <option value="2">Estudiante/Egresado</option>
                                    </select>
                                </div>
                                
                                <div class="input-group mb-3">
                                    <label class="col-xl-4 col-lg-4 col-md-4 col-sm-5 mb-2">Comentario</label>
                                    <textarea name="commentary" class="form-control validate col-xl-9 col-lg-8 col-md-8 col-sm-7" rows="3"></textarea>
                                </div>
                                
                                <div class="input-group mb-3">
                                    <div class="ml-auto col-xl-8 col-lg-8 col-md-8 col-sm-7 pl-0">
                                        <button name="action" type="submit" value="signup" class="btn btn-primary">Aceptar</button>
                                    </div>
                                </div>
                            </form>

                            <label>Recibiras un correo con tu clave y contraseña cuando estos sean aprobados en maximo 48hrs.</label>

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="row tm-mt-big">
            <div class="col-12 font-weight-light">
                <p class="d-inline-block tm-bg-black text-white py-2 px-4">
                    Copyright &copy; 2020 Jobsite. Created by Kysuphanmem Company.
                </p>
            </div>
        </footer>

    </div>
</body>

</html>