<!DOCTYPE html>
<html lang="en">
<!--Administracion index -->
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
        integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous">
    </script>
    <link href="css/style.css" rel="stylesheet">
    <link rel="icon" href="../images/favicon.png" type="image/x-icon">

</head>

<body>
<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="imagenes/result.png" id="icon" alt="User Icon" />
    </div>

    <!-- Login Form -->
    <form action="validar.php" method="post">
      <input type="text" id="usuario" class="fadeIn second" name="usuario" placeholder="Usuario">
      <input type="password" id="contrasena" class="fadeIn third" name="contrasena" placeholder="Contraseña">
      <input type="submit" class="fadeIn fourth" value="Acceder">
    </form>

    <!-- Remind Passowrd 
    <div id="formFooter">
      <a class="underlineHover" href="#">Olvido su contraseña?</a>
    </div>-->

  </div>
</div>

</body>

</html>