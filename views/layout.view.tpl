<!DOCTYPE html>
<html>
  <head>
    <meta name="viewport" content="width=device-width">
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lato:Bold">
    <link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lato:Thin">
    <script type="text/javascript" src="public/js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="public/js/boimcoAbout.js"></script>
    <script type="text/javascript" src="public/js/login.js"></script>
    <script type="text/javascript" src="public/js/validarTelefono.js"></script>
    <script type="text/javascript" src="public/js/validarTexto.js"></script>
  </head>
  <link rel="stylesheet" href="public/css/estilo1.css">
  <body>
        <!-- Login Starts Here -->
        <div id="loginContainer">
            <a href="#" id="loginButton"><span>Ingresar</span><em></em></a>
            <a href="index.php?page=registro" id="signUpButton"><span>Registrarse</span><em></em></a>
            <div style="clear:both"></div>
            <div id="loginBox">
                <form id="loginForm" method="post">
                    <fieldset id="body">
                        <fieldset>
                            <label for="email">Correo Electronico</label>
                            <input type="email" name="email" id="email" />
                        </fieldset>
                        <fieldset>
                            <label for="password">Contraseña</label>
                            <input type="password" name="password" id="password" />
                        </fieldset>
                        <input type="submit" name="btnLogin" id="login" value="Sign in" />
                    </fieldset>
                    <span><a href="index.php?page=contactus">Olvidaste tu contraseña?</a></span>
                </form>
            </div>
        </div>
        <!-- Fin del login -->
    <div class="HomeHeader">
          <div class="LogoHome"></div>
        <div class="Menu">
          <li><a href="index.php?page=home">Inicio</a></li>
          <li><a href="index.php?page=nosotros">Sobre Nososotros</a></li>
          <li><a href="index.php?page=services">Servicios</a></li>
          <li><a href="index.php?page=productos">Productos</a></li>
          <li><a href="index.php?page=contactus">Contáctanos</a></li>
        </div>
    </div>
    <div class="contenido">
        {{{page_content}}}
    </div>
      </body>
</html>
