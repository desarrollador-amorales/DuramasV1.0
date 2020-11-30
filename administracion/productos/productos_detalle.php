
<?php 

    include '../../global/config.php';
    include '../../global/conexion.php';

    //variable de las texturas de los productos-detalles
    $txt_id=(isset($_POST['txt_id']))?$_POST['txt_id']:"";
    $txt_id_detalle=(isset($_POST['txt_id_detalle']))?$_POST['txt_id_detalle']:"";
    $txt_name_detalle=(isset($_POST['txt_name_detalle']))?$_POST['txt_name_detalle']:"";
    $txt_description_detalle=(isset($_POST['txt_description_detalle']))?$_POST['txt_description_detalle']:"";
    $txt_environment_detalle=(isset($_FILES["txt_environment_detalle"]["name"]))?$_FILES["txt_environment_detalle"]["name"]:""; // para recepcionar tipos de imagenes usar $_FILES 

    $accion_detalle=(isset($_POST['accion_detalle_producto']))?$_POST['accion_detalle_producto']:""; // validar si accion_detalle tiene valor en detalle productos


    $accionAgregarDetalle=""; // manera para habilitar los botones
    $accionModificarDetalle=$accionEliminarDetalle=$accionCancelarDetalle="disabled"; //manera para desahilitar los botones
    $mostrarModalDetalle=false;
    
    switch($accion_detalle){

        case'btnAgregarDetalle':

            $sentenciaIngresarDetalle=$pdo->prepare(
                "INSERT INTO `productos_detalle` 
                (`id`, `id_producto`, `name`, `description`, `environment`) 
                VALUES (NULL, :id_producto, :name, :description, :environment);");
        
           
            $sentenciaIngresarDetalle->bindParam(':id_producto',$txt_id);
            $sentenciaIngresarDetalle->bindParam(':name',$txt_name_detalle);     
            $sentenciaIngresarDetalle->bindParam(':description',$txt_description_detalle);

            

            $Fecha=new DateTime(); //obtener la fecha
            $nombreArchivoDetalle=($txt_environment_detalle!="")?$Fecha->getTimestamp()."_".$_FILES["txt_environment_detalle"]["name"]:"imagen_detalle.png"; //obtener y validar el nombre de la fotografía asignar un tiempo en el que el usuario sube la foto para que no exista un  nombre igual

            error_reporting(error_reporting() & ~E_NOTICE);
            
            $tmpPhoto=$_FILES["txt_environment_detalle"]["tmp_name"]; //Recolectar la fotografia que php me devuelve de acuerdo al formulario

                if($tmpPhoto!=""){
                    move_uploaded_file($tmpPhoto,"../imagenes/productos_detalle/".$nombreArchivoDetalle); // mover la imagen al servidor en alguna carpeta en especifica
                }

            $sentenciaIngresarDetalle->bindParam(':environment',$nombreArchivoDetalle);
            $sentenciaIngresarDetalle->execute();
            header('Location: index.php');
            
        break;

        case 'btnModificarDetalle':
            $sentencia=$pdo->prepare(" UPDATE productos_detalle SET
             name =:name,
             description =:description
             WHERE id=:id_detalle");

            $sentencia->bindParam(':name',$txt_name_detalle);
            $sentencia->bindParam(':description',$txt_description_detalle);
            $sentencia->bindParam(':id_detalle',$txt_id_detalle);
            $sentencia->execute();

            

            $Fecha=new DateTime(); //obtener la fecha
            $nombreArchivoModificadoDetalle=($txt_environment_detalle!="")?$Fecha->getTimestamp()."_".$_FILES["txt_environment_detalle"]["name"]:"imagen_detalle.png";

            $tmpPhoto=$_FILES["txt_environment_detalle"]["tmp_name"]; //Recoletar la fotografia que php me devuelve de acuerdo al formulario

                if($tmpPhoto!=""){ //Existe un archivo temporal que el usuario selecciono?
                    
                    // mover la imagen al servidor en alguna carpeta en especifica
                    move_uploaded_file($tmpPhoto,"../imagenes/productos_detalle/".$nombreArchivoModificadoDetalle); 

                    // se eliminar la fotografía anterior
                    $sentencia=$pdo->prepare("SELECT environment FROM productos_detalle WHERE id= :id_detalle");
                    $sentencia->bindParam(':id_detalle',$txt_id_detalle);
                    $sentencia->execute();
        
                    $producto=$sentencia->fetch(PDO::FETCH_LAZY);
        
                   if(isset($producto["environment"])){
                        if(file_exists("../imagenes/productos_detalle/".$producto["environment"])){
                            if($producto['environment']!="imagen_detalle.png"){
                                unlink("../imagenes/productos_detalle/".$producto["environment"]); // borrar imagen fisica consultando desde la base de datos
                            }
                        }
                    }
                    
                    //modificar la foto
                    $sentencia=$pdo->prepare(" UPDATE productos_detalle SET environment =:environment WHERE id=:id_detalle");
                    $sentencia->bindParam(':environment',$nombreArchivoModificadoDetalle);
                    $sentencia->bindParam(':id_detalle',$txt_id_detalle);
                    $sentencia->execute();
                    
                }

            header('Location: index.php'); //redireccion a la ubicacion que queremos en este caso index.php

        break;

        case 'btnSeleccionDetalle' :
            $accionAgregarDetalle="disabled";
            $accionModificarDetalle=$accionEliminarDetalle=$accionCancelarDetalle="";
            $mostrarModalDetalle=true;

            $sentenciaSeleccionarDetalle=$pdo->prepare("SELECT * FROM productos_detalle WHERE id=:id_detalle");
            $sentenciaSeleccionarDetalle->bindParam(':id_detalle',$txt_id_detalle);
            $sentenciaSeleccionarDetalle->execute();

            $producto_detalle=$sentenciaSeleccionarDetalle->fetch(PDO::FETCH_LAZY);

            $txt_name_detalle=$producto_detalle['name'];
            $txt_description_detalle=$producto_detalle['description'];
            $txt_environment_detalle=$producto_detalle['environment'];

        break;

        case 'btnEliminarDetalle':
           
           
            $sentencia=$pdo->prepare("SELECT environment FROM productos_detalle WHERE id= :id_detalle");
            $sentencia->bindParam(':id_detalle',$txt_id_detalle);
            $sentencia->execute();

            $detalle_producto=$sentencia->fetch(PDO::FETCH_LAZY);

           if(isset($detalle_producto["environment"])){
                if(file_exists("../imagenes/productos_detalle/".$detalle_producto["environment"])){
                    if ($detalle_producto['environment']!="imagen_detalle.png") {
                        unlink("../imagenes/productos_detalle/".$detalle_producto["environment"]); // borrar imagen fisica consultando desde la base de datos
                    }
                }
            }

           
            $sentencia=$pdo->prepare("DELETE FROM `productos_detalle` WHERE `id` = :id_detalle");
            $sentencia->bindParam(':id_detalle',$txt_id_detalle);
            $sentencia->execute();
            header('Location: index.php');
        break;
        
        case 'btnCancelarDetalle':
            header('Location: index.php');
        break;

    }
    
    $sentenciaDetalle=$pdo->prepare("SELECT * FROM productos_detalle where id_producto=:id_producto");
    $sentenciaDetalle->bindParam(':id_producto',$txt_id);
    $sentenciaDetalle->execute();

    $lista_productos_detalle= $sentenciaDetalle->fetchAll(PDO::FETCH_ASSOC);
    //print_r($lista_empleados);


?>