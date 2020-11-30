<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administración</title>
    <link rel="icon" href="../../images/favicon.png" type="image/x-icon">

</head>

<?php 
    
    include '../../global/config.php';
    include '../../global/conexion.php';
    include '../templates/cabecera.php';
    
    //print_r($_POST); 

    //variable para almacenar en la base de datos
    $txt_id=(isset($_POST['txt_id']))?$_POST['txt_id']:"";
    $txt_name=(isset($_POST['txt_name']))?$_POST['txt_name']:"";
    $txt_paternal_surname=(isset($_POST['txt_paternal_surname']))?$_POST['txt_paternal_surname']:"";
    $txt_maternal_surname=(isset($_POST['txt_maternal_surname']))?$_POST['txt_maternal_surname']:"";
    $txt_email=(isset($_POST['txt_email']))?$_POST['txt_email']:"";
    $txt_photo=(isset($_FILES["txt_photo"]["name"]))?$_FILES["txt_photo"]["name"]:""; // para recepcionar tipos de imagenes usar $_FILES 


    $accion=(isset($_POST['accion']))?$_POST['accion']:""; // validar si accion tiene valor.

    $error=array();

    $accionAgregar=""; // manera para habilitar los botones
    $accionModificar=$accionEliminar=$accionCancelar="disabled"; //manera para desahilitar los botones
    $mostrarModal=false;
    
    switch($accion){
        case 'btnAgregar':

            if($txt_name==""){
                $error['name']="Escribe el nombre";
            }

            if(count($error)>0){
                $mostrarModal=true;
            break;
            }

            $sentencia=$pdo->prepare("INSERT INTO empleados 
                            (name, paternal_surname, maternal_surname, email,photo)
                             VALUES (:name, :paternal_surname, :maternal_surname, :email, :photo);");

            $sentencia->bindParam(':name',$txt_name);
            $sentencia->bindParam(':paternal_surname',$txt_paternal_surname);
            $sentencia->bindParam(':maternal_surname',$txt_maternal_surname);
            $sentencia->bindParam(':email',$txt_email);

            $Fecha=new DateTime(); //obtener la fecha
            $nombreArchivo=($txt_photo!="")?$Fecha->getTimestamp()."_".$_FILES["txt_photo"]["name"]:"imagen.jpg"; //obtener y validar el nombre de la fotografía asignar un tiempo en el que el usuario sube la foto para que no exista un  nombre igual

            error_reporting(error_reporting() & ~E_NOTICE);
            
            $tmpPhoto=$_FILES["txt_photo"]["tmp_name"]; //Recolectar la fotografia que php me devuelve de acuerdo al formulario

                if($tmpPhoto!=""){
                    move_uploaded_file($tmpPhoto,"../imagenes/usuarios/".$nombreArchivo); // mover la imagen al servidor en alguna carpeta en especifica
                }

            $sentencia->bindParam(':photo',$nombreArchivo);
            $sentencia->execute();
            header('Location: index.php');

            echo "Presionaste btnAgregar";
        break;

        case 'btnModificar':

            
            if($txt_name==""){
                $error['name']="Escribe el nombre";
            }

            if($txt_paternal_surname==""){
                $error['paternal_surname']="Escribe el Apellido Paterno";
            }
        
            if(count($error)>0){
                $mostrarModal=true;
            break;
            }

            $sentencia=$pdo->prepare(" UPDATE empleados SET
             name =:name,
             paternal_surname =:paternal_surname,
             maternal_surname =:maternal_surname,
             email =:email 
             WHERE id=:id");

            $sentencia->bindParam(':name',$txt_name);
            $sentencia->bindParam(':paternal_surname',$txt_paternal_surname);
            $sentencia->bindParam(':maternal_surname',$txt_maternal_surname);
            $sentencia->bindParam(':email',$txt_email);
            $sentencia->bindParam(':id',$txt_id);
            $sentencia->execute();

            

            $Fecha=new DateTime(); //obtener la fecha
            $nombreArchivoModificado=($txt_photo!="")?$Fecha->getTimestamp()."_".$_FILES["txt_photo"]["name"]:"imagen.jpg";

            $tmpPhoto=$_FILES["txt_photo"]["tmp_name"]; //Recoletar la fotografia que php me devuelve de acuerdo al formulario

                if($tmpPhoto!=""){ //Existe un archivo temporal que el usuario selecciono?
                    
                    // mover la imagen al servidor en alguna carpeta en especifica
                    move_uploaded_file($tmpPhoto,"../imagenes/usuarios/".$nombreArchivoModificado); 

                    // se eliminar la fotografía anterior
                    $sentencia=$pdo->prepare("SELECT photo FROM empleados WHERE id= :id");
                    $sentencia->bindParam(':id',$txt_id);
                    $sentencia->execute();
        
                    $empleado=$sentencia->fetch(PDO::FETCH_LAZY);
        
                   if(isset($empleado["photo"])){
                        if(file_exists("../imagenes/usuarios/".$empleado["photo"])){
                            if($empleado['photo']!="imagen.jpg"){
                                unlink("../imagenes/usuarios/".$empleado["photo"]); // borrar imagen fisica consultando desde la base de datos
                            }
                        }
                    }
                    
                    //modificar la foto
                    $sentencia=$pdo->prepare(" UPDATE empleados SET photo =:photo WHERE id=:id");
                    $sentencia->bindParam(':photo',$nombreArchivoModificado);
                    $sentencia->bindParam(':id',$txt_id);
                    $sentencia->execute();
                    
                }

            header('Location: index.php'); //redireccion a la ubicacion que queremos en este caso index.php
            echo "Presionaste btnModificar";
        break;

        case 'btnEliminar':
           
            $sentencia=$pdo->prepare("SELECT photo FROM empleados WHERE id= :id");
            $sentencia->bindParam(':id',$txt_id);
            $sentencia->execute();

            $empleado=$sentencia->fetch(PDO::FETCH_LAZY);

           if(isset($empleado["photo"])){
                if(file_exists("../imagenes/usuarios/".$empleado["photo"])){
                    if ($empleado['photo']!="imagen.jpg") {
                        unlink("../imagenes/usuarios/".$empleado["photo"]); // borrar imagen fisica consultando desde la base de datos
                    }
                }
            }

           
            $sentencia=$pdo->prepare("DELETE FROM `empleados` WHERE `empleados`.`id` = :id");
            $sentencia->bindParam(':id',$txt_id);
            $sentencia->execute();
            header('Location: index.php');
        break;

        case 'btnCancelar':
            header('Location: index.php');
        break;

        case 'Seleccionar':
            $accionAgregar="disabled";
            $accionModificar=$accionEliminar=$accionCancelar="";
            $mostrarModal=true;

            $sentencia=$pdo->prepare("SELECT * FROM empleados WHERE id= :id");
            $sentencia->bindParam(':id',$txt_id);
            $sentencia->execute();

            $empleado=$sentencia->fetch(PDO::FETCH_LAZY);

            $txt_name=$empleado['name'];
            $txt_paternal_surname=$empleado['paternal_surname'];
            $txt_maternal_surname=$empleado['maternal_surname'];
            $txt_email=$empleado['email'];
            $txt_photo=$empleado['photo'];

        break;
    }

    $sentencia=$pdo->prepare("SELECT * FROM categoria");
    $sentencia->execute();

    $lista_categoria= $sentencia->fetchAll(PDO::FETCH_ASSOC);

    //print_r($lista_empleados);

?>


