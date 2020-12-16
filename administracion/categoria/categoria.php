<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Categorías</title>
    <link rel="icon" href="../../images/favicon.png" type="image/x-icon">

</head>

<?php 
    
    include '../../global/config.php';
    include '../../global/conexion.php';
    include '../templates/cabecera.php';
    

    //variable para almacenar en la base de datos
    $txt_id=(isset($_POST['txt_id']))?$_POST['txt_id']:"";
    $txt_name_category=(isset($_POST['txt_name_category']))?$_POST['txt_name_category']:"";
    $txt_code_category=(isset($_POST['txt_code_category']))?$_POST['txt_code_category']:"";
    $txt_description_category=(isset($_POST['txt_description_category']))?$_POST['txt_description_category']:"";
    $txt_parent_category=(isset($_POST['txt_parent_category']))?$_POST['txt_parent_category']:null;
    // aqui va la variable que se escoge del combobox



    $accion=(isset($_POST['accion']))?$_POST['accion']:""; // validar si accion tiene valor.

    $error=array();

    $accionAgregar=""; // manera para habilitar los botones
    $accionModificar=$accionEliminar=$accionCancelar="disabled"; //manera para desahilitar los botones
    $mostrarModal=false;
    
    switch($accion){ // evalua las acciones que envia el formulario al presionar los botones del mismo..
        case 'btnAgregar':

            if($txt_name_category==""){
                $error['name_category']="Escribe el nombre de la categoria";
            }

            if(count($error)>0){
                $mostrarModal=true;
            break;
            }
            
            $sentencia=$pdo->prepare("INSERT INTO categoria
                    (name_category, code, description, id_category_parent)
                VALUES(:name_category, :code, :description, :id_category_parent);");

            $sentencia->bindParam(':name_category',$txt_name_category);
            $sentencia->bindParam(':code',$txt_code_category);
            $sentencia->bindParam(':description',$txt_description_category);
            
            if ($txt_parent_category == null){
                $sentencia->bindParam(':id_category_parent',$txt_parent_category,PDO::PARAM_NULL);
            }else{
                $sentencia->bindParam(':id_category_parent',$txt_parent_category);
            }
            
            $sentencia->execute();
            header('Location: index.php');
        break;

        case 'btnModificar':

            
            if($txt_name_category==""){
                $error['name']="Escribe el nombre de la categoria";
            }

            if(count($error)>0){
                $mostrarModal=true;
            break;
            }

            $sentencia=$pdo->prepare(" UPDATE categoria SET
             name_category =:name,
             code =:code,
             description =:description,
             id_category_parent =:id_category_parent 
             WHERE id=:id");

            $sentencia->bindParam(':name',$txt_name_category);
            $sentencia->bindParam(':code',$txt_code_category);
            $sentencia->bindParam(':description',$txt_description_category);
            if ($txt_parent_category == null){
                $sentencia->bindParam(':id_category_parent',$txt_parent_category,PDO::PARAM_NULL);
            }else{
                $sentencia->bindParam(':id_category_parent',$txt_parent_category);
            }
            $sentencia->bindParam(':id',$txt_id);
            $sentencia->execute();

            header('Location: index.php'); //redireccion a la ubicacion que queremos en este caso index.php
            echo "Presionaste btnModificar";
        break;

        case 'btnEliminar':
                   
            $sentencia=$pdo->prepare("DELETE FROM categoria WHERE `categoria`.`id` = :id");
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

            $sentencia=$pdo->prepare("SELECT * FROM categoria WHERE id= :id");
            $sentencia->bindParam(':id',$txt_id);
            $sentencia->execute();

            $categoria=$sentencia->fetch(PDO::FETCH_LAZY);

            $txt_name_category=$categoria['name_category'];
            $txt_code_category=$categoria['code'];
            $txt_description_category=$categoria['description'];
            

        break;
    }

    $sentencia=$pdo->prepare("SELECT * FROM categoria");
    $sentencia->execute();

    $lista_categoria= $sentencia->fetchAll(PDO::FETCH_ASSOC);

?>

