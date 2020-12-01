<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos</title>
    <link rel="icon" href="../../images/favicon.png" type="image/x-icon">

</head>

<?php 
    
    include '../../global/config.php';
    include '../../global/conexion.php';
    include '../templates/cabecera.php';

    //variable  de productos para almacenar en la base de datos
    $txt_id=(isset($_POST['txt_id']))?$_POST['txt_id']:"";
    $txt_name=(isset($_POST['txt_name']))?$_POST['txt_name']:"";
    $txt_price=(isset($_POST['txt_price']))?$_POST['txt_price']:"";
    $txt_code=(isset($_POST['txt_code']))?$_POST['txt_code']:"";
    $txt_image=(isset($_FILES["txt_image"]["name"]))?$_FILES["txt_image"]["name"]:""; // para recepcionar tipos de imagenes usar $_FILES 
    $txt_category=(isset($_POST['txt_category']))?$_POST['txt_category']:null;

    $accion=(isset($_POST['accion']))?$_POST['accion']:""; // validar si accion tiene valor en productos

    $error=array();

    $accionAgregar=""; // manera para habilitar los botones
    $accionModificar=$accionEliminar=$accionCancelar=$accionAgregarDetalleHome="disabled"; //manera para desahilitar los botones
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

            $sentencia=$pdo->prepare("INSERT INTO productos 
                            (name, price, real_code, image, id_category)
                             VALUES (:name, :price, :real_code, :image, :id_category);");

            $sentencia->bindParam(':name',$txt_name);
            $sentencia->bindParam(':price',$txt_price);
            $sentencia->bindParam(':real_code',$txt_code);
            $sentencia->bindParam(':image',$txt_image);
            if ($txt_category == null){
                $sentencia->bindParam(':id_category',$txt_category,PDO::PARAM_NULL);
            }else{
                $sentencia->bindParam(':id_category',$txt_category);
            }

            //$lastIdProduct=$pdo->lastInsertId();

            //echo('Este es el ultimo id de insersion'.$lastIdProduct);


            $Fecha=new DateTime(); //obtener la fecha
            $nombreArchivo=($txt_image!="")?$Fecha->getTimestamp()."_".$_FILES["txt_image"]["name"]:"product.png"; //obtener y validar el nombre de la fotografía asignar un tiempo en el que el usuario sube la foto para que no exista un  nombre igual

            error_reporting(error_reporting() & ~E_NOTICE);
            
            $tmpPhoto=$_FILES["txt_image"]["tmp_name"]; //Recolectar la fotografia que php me devuelve de acuerdo al formulario

                if($tmpPhoto!=""){
                    move_uploaded_file($tmpPhoto,"../imagenes/productos/".$nombreArchivo); // mover la imagen al servidor en alguna carpeta en especifica
                }

            $sentencia->bindParam(':image',$nombreArchivo);
            $sentencia->execute();

            header('Location: index.php');

            echo "Presionaste btnAgregar";
        break;

        case 'btnModificar':

            
            if($txt_name==""){
                $error['name']="Escribe el nombre";
            }

        
            if(count($error)>0){
                $mostrarModal=true;
            break;
            }

            $sentencia=$pdo->prepare(" UPDATE productos SET
                name =:name,
                price =:price,
                real_code =:real_code,
                id_category =:id_category
                WHERE id=:id");

            $sentencia->bindParam(':name',$txt_name);
            $sentencia->bindParam(':price',$txt_price);
            $sentencia->bindParam(':real_code',$txt_code);
            $sentencia->bindParam(':id',$txt_id);
            if ($txt_category == null){
                $sentencia->bindParam(':id_category',$txt_category,PDO::PARAM_NULL);
            }else{
                $sentencia->bindParam(':id_category',$txt_category);
            }
            $sentencia->execute();

            

            $Fecha=new DateTime(); //obtener la fecha
            $nombreArchivoModificado=($txt_image!="")?$Fecha->getTimestamp()."_".$_FILES["txt_image"]["name"]:"product.png";

            $tmpPhoto=$_FILES["txt_image"]["tmp_name"]; //Recoletar la fotografia que php me devuelve de acuerdo al formulario

                if($tmpPhoto!=""){ //Existe un archivo temporal que el usuario selecciono?
                    
                    // mover la imagen al servidor en alguna carpeta en especifica
                    move_uploaded_file($tmpPhoto,"../imagenes/productos/".$nombreArchivoModificado); 

                    // se eliminar la fotografía anterior
                    $sentencia=$pdo->prepare("SELECT image FROM productos WHERE id= :id");
                    $sentencia->bindParam(':id',$txt_id);
                    $sentencia->execute();
        
                    $producto=$sentencia->fetch(PDO::FETCH_LAZY);
        
                   if(isset($producto["image"])){
                        if(file_exists("../imagenes/productos/".$producto["image"])){
                            if($producto['image']!="product.png"){
                                unlink("../imagenes/productos/".$producto["image"]); // borrar imagen fisica consultando desde la base de datos
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
           
            $sentencia=$pdo->prepare("SELECT image FROM productos WHERE id= :id");
            $sentencia->bindParam(':id',$txt_id);
            $sentencia->execute();

            $producto=$sentencia->fetch(PDO::FETCH_LAZY);

           if(isset($producto["image"])){
                if(file_exists("../imagenes/productos/".$producto["image"])){
                    if ($producto['image']!="product.png") {
                        unlink("../imagenes/productos/".$producto["image"]); // borrar imagen fisica consultando desde la base de datos
                    }
                }
            }

           
            $sentencia=$pdo->prepare("DELETE FROM `productos` WHERE `id` = :id");
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

            $sentencia=$pdo->prepare("SELECT * FROM productos WHERE id= :id");
            $sentencia->bindParam(':id',$txt_id);
            $sentencia->execute();

            $producto=$sentencia->fetch(PDO::FETCH_LAZY);

            $txt_name=$producto['name'];
            $txt_price=$producto['price'];
            $txt_code=$producto['real_code'];
            $txt_image=$producto['image'];
        break;
    }

    $sentencia=$pdo->prepare("SELECT * FROM productos");
    $sentencia->execute();

    $lista_productos= $sentencia->fetchAll(PDO::FETCH_ASSOC);

    $sentenciaCat=$pdo->prepare("SELECT * FROM categoria where id_category_parent is null");
    $sentenciaCat->execute();

    $lista_categoria= $sentenciaCat->fetchAll(PDO::FETCH_ASSOC);

    

?>


