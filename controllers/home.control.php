<?php
  require_once("libs/template_engine.php");
  require_once("models/login.model.php");

  function run(){

    if (isset($_POST["btnLogin"])){
      $correo=$_POST['email'];
      $Contrasenia=$_POST['password'];
      $estado=verificacionDeUsuario($correo);
      if (compararDatos($correo,$Contrasenia)){
        $rol = obtenerRol($correo);
        if ($estado=='ACT') {
          mw_setEstaLogueado($correo,true,$rol);
          redirectToUrl("index.php?page=home");
        }
      else {
        $errores[] = array("errmsg"=>"Usuario Inactivo");
        redirectWithMessage("Su Cuenta de Usuario se encuentra Inactiva, Enviar mensaje para reactivacion de cuenta","index.php?page=contactus");
      }
      }
      else{
        $errores[] = array("errmsg"=>"Usuario o Contraseña Incorrecta");
        redirectWithMessage("Error Usuario o Contrasenia Incorrecta","index.php?page=home");
      }


    }

  if (isset($_POST["btnSignOut"])) {
    mw_setEstaLogueado("", false, "");
  redirectToUrl("index.php?page=home");
  }

  renderizar("home",array());
  }
  run();
?>
