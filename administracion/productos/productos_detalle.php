
<?php 

    $sentenciaDetalle=$pdo->prepare("SELECT * FROM productos_detalle where id_producto=:id_producto");
    $sentenciaDetalle->bindParam(':id_producto',$txt_id);
    $sentenciaDetalle->execute();

    $lista_productos_detalle= $sentenciaDetalle->fetchAll(PDO::FETCH_ASSOC);

    //print_r($lista_empleados);


?>