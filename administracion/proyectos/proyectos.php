<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Proyectos</title>
    <link rel="icon" href="../../images/favicon.png" type="image/x-icon">

</head>

<?php 
    
    include '../../global/config.php';
    include '../../global/conexion.php';
    include '../templates/cabecera.php';

    //variable  de productos para almacenar en la base de datos
    $txt_id=(isset($_POST['txt_id']))?$_POST['txt_id']:"";
    $txt_name_proyect=(isset($_POST['txt_name_proyect']))?$_POST['txt_name_proyect']:"";
    $txt_description_proyect=(isset($_POST['txt_description_proyect']))?$_POST['txt_description_proyect']:"";
    $txt_image=(isset($_FILES["txt_image"]["name"]))?$_FILES["txt_image"]["name"]:""; // para recepcionar tipos de imagenes usar $_FILES 

    $accion=(isset($_POST['accion']))?$_POST['accion']:""; // validar si accion tiene valor en productos

    $error=array();

    $accionAgregar=""; // manera para habilitar los botones
    $accionModificar=$accionEliminar=$accionCancelar=$accionAgregarDetalleHome="disabled"; //manera para desahilitar los botones
    $mostrarModal=false;
       
    switch($accion){
        case 'btnAgregar':

            if($txt_name_proyect==""){
                $error['name']="Escribe el nombre";
            }
        
            if(count($error)>0){
                $mostrarModal=true;
            break;
            }

            $sentencia=$pdo->prepare("INSERT INTO proyecto 
                            (name, description, imagen)
                             VALUES (:name, :description, :image);");

            $sentencia->bindParam(':name',$txt_name_proyect);
            $sentencia->bindParam(':description',$txt_description_proyect);
            

            $Fecha=new DateTime(); //obtener la fecha
            $nombreArchivo=($txt_image!="")?$Fecha->getTimestamp()."_".$_FILES["txt_image"]["name"]:"building-project.png"; //obtener y validar el nombre de la fotografía asignar un tiempo en el que el usuario sube la foto para que no exista un  nombre igual

            error_reporting(error_reporting() & ~E_NOTICE);
            
            $tmpPhoto=$_FILES["txt_image"]["tmp_name"]; //Recolectar la fotografia que php me devuelve de acuerdo al formulario

                if($tmpPhoto!=""){
                    move_uploaded_file($tmpPhoto,"../imagenes/proyectos/".$nombreArchivo); // mover la imagen al servidor en alguna carpeta en especifica
                }

            $sentencia->bindParam(':image',$nombreArchivo);
            $sentencia->execute();

            header('Location: index.php');

            echo "Presionaste btnAgregar";
        break;

        case 'btnModificar':

            
            if($txt_name_proyect==""){
                $error['name']="Escribe el nombre";
            }

        
            if(count($error)>0){
                $mostrarModal=true;
            break;
            }

            $sentencia=$pdo->prepare(" UPDATE proyecto SET
                name =:name,
                description =:description
                WHERE id=:id");

            $sentencia->bindParam(':name',$txt_name_proyect);
            $sentencia->bindParam(':description',$txt_description_proyect);
            $sentencia->bindParam(':id',$txt_id);
            $sentencia->execute();

            

            $Fecha=new DateTime(); //obtener la fecha
            $nombreArchivoModificado=($txt_image!="")?$Fecha->getTimestamp()."_".$_FILES["txt_image"]["name"]:"building-project.png";

            $tmpPhoto=$_FILES["txt_image"]["tmp_name"]; //Recoletar la fotografia que php me devuelve de acuerdo al formulario

                if($tmpPhoto!=""){ //Existe un archivo temporal que el usuario selecciono?
                    
                    // mover la imagen al servidor en alguna carpeta en especifica
                    move_uploaded_file($tmpPhoto,"../imagenes/proyectos/".$nombreArchivoModificado); 

                    // se eliminar la fotografía anterior
                    $sentencia=$pdo->prepare("SELECT imagen FROM proyectos WHERE id= :id");
                    $sentencia->bindParam(':id',$txt_id);
                    $sentencia->execute();
        
                    $proyecto=$sentencia->fetch(PDO::FETCH_LAZY);
        
                   if(isset($proyecto["imagen"])){
                        if(file_exists("../imagenes/proyectos/".$proyecto["imagen"])){
                            if($proyecto['imagen']!="building-project.png"){
                                unlink("../imagenes/proyectos/".$proyecto["imagen"]); // borrar imagen fisica consultando desde la base de datos
                            }
                        }
                    }
                    
                    //modificar la foto
                    $sentencia=$pdo->prepare(" UPDATE productos SET image =:image WHERE id=:id");
                    $sentencia->bindParam(':image',$nombreArchivoModificado);
                    $sentencia->bindParam(':id',$txt_id);
                    $sentencia->execute();
                    
                }

            header('Location: index.php'); //redireccion a la ubicacion que queremos en este caso index.php
            echo "Presionaste btnModificar";
        break;

        case 'btnEliminar':
           
            $sentencia=$pdo->prepare("SELECT imagen FROM proyecto WHERE id= :id");
            $sentencia->bindParam(':id',$txt_id);
            $sentencia->execute();

            $proyecto=$sentencia->fetch(PDO::FETCH_LAZY);

           if(isset($proyecto["imagen"])){
                if(file_exists("../imagenes/proyectos/".$proyecto["imagen"])){
                    if ($proyecto['imagen']!="building-pro.png") {
                        unlink("../imagenes/proyectos/".$proyecto["imagen"]); // borrar imagen fisica consultando desde la base de datos
                    }
                }
            }

            $sentencia=$pdo->prepare("DELETE FROM `proyecto` WHERE `id` = :id");
            $sentencia->bindParam(':id',$txt_id);
            $sentencia->execute();
            header('Location: index.php');
        break;

        case 'btnCancelar':
            header('Location: index.php');
        break;

        case 'Seleccionar':
            $accionAgregar="disabled";
            $accionModificar=$accionEliminar=$accionCancelar=$accionAgregarDetalleHome="";
            $mostrarModal=true;

            $sentencia=$pdo->prepare("SELECT * FROM proyecto WHERE id= :id");
            $sentencia->bindParam(':id',$txt_id);
            $sentencia->execute();

            $proyecto=$sentencia->fetch(PDO::FETCH_LAZY);

            $txt_name_proyect=$proyecto['name'];
            $txt_description_proyect=$proyecto['description'];
            $txt_image=$proyecto['imagen'];
        break;
    }

    $sentencia=$pdo->prepare("SELECT * FROM proyecto");
    $sentencia->execute();

    $lista_proyectos= $sentencia->fetchAll(PDO::FETCH_ASSOC);

?>


