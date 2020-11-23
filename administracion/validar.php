<?php
    include '../global/config.php';
    include '../global/conexion.php';
?>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="../images/favicon.png" type="image/x-icon">

</head>


<?php
// print_r($_POST);


    $usuario=$_POST['usuario'];
    $contrasena=$_POST['contrasena'];

    session_start();
    $_SESSION['usuario']=$usuario;

    //print_r($usuario);


    $request_user=$pdo->prepare("SELECT * FROM usuarios where usuario= :p_usuario and contraseña=:p_contrasena");
    $request_user->bindParam('p_usuario',$usuario);
    $request_user->bindParam('p_contrasena',$contrasena);


    $request_user->execute();

    $list_users= $request_user->fetch(PDO::FETCH_LAZY);

    if($list_users){
        header('Location: usuarios/index.php');
    }else{
        
        include("index.php");
         
    }
?>

