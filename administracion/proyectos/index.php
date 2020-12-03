<?php 
    require 'proyectos.php';
    require 'proyectos_detalle.php';

?>

<div class="container">
    <form method="post" action="" enctype="multipart/form-data">
        <!--Se reenvia los datos del formulario a la misma hoja cuando se coloca action=""-->

        <!-- Modal -->
        <div class="modal fade bs-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Productos</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-row">
                            <input type="hidden" required name="txt_id" value="<?php echo $txt_id?>" placeholder=""
                                id="txt_id" require="">

                            <div class="form-group col-md-12">
                                <label for="">Nombre Proyecto:</label>
                                <input class="form-control <?php echo (isset($error['name']))?"is-invalid":"";?>"
                                    type="text" name="txt_name_proyect" value="<?php echo $txt_name_proyect?>" placeholder=""
                                    id="txt_name_proyect" require="">
                                <div class="invalid-feedback">
                                    <?php echo (isset($error['name']))?$error['name']:"";?>
                                </div>
                                <br>
                            </div>

                            <div class="form-group col-md-12">
                                <label for="">Descripcion:</label>
                                <input class="form-control" type="text" name="txt_description_proyect" value="<?php echo $txt_description_proyect?>"
                                    placeholder="" required id="txt_description_proyect" require="">
                                <br>
                            </div>

                            <div class="form-group col-md-12">
                                <label for="">Imagen:</label>

                                <?php if($txt_image!="") {?>
                                <br />
                                <img class="img-thumbnail rounded mx-auto d-block" width="100px"
                                    src="../imagenes/proyectos/<?php echo $txt_image;?>">
                                <br />
                                <br />
                                <?php }?>

                                <input class="form-control" type="file" accept="image/*" name="txt_image"
                                    value="<?php echo $txt_image?>" placeholder="" id="txt_image" require="">
                                <br>
                            </div>

                            <!-- Tabla de los detalles de producto-->
                            <button type="button" class="btn btn-primary" <?php echo $accionAgregarDetalleHome?>
                                data-toggle="modal" data-target="#classModal">
                                Agregar Ambientes +
                            </button>

                        </div>

                        <br>

                        <div class="row">
                            <table class="table table-hover table-bordered">
                                <thead class="thead-dark">

                                    <tr>
                                        <th>Ambiente</th>
                                        <th>Nombre</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <!-- Aqui empieza los detalles de los productos -->
                                <?php foreach($lista_productos_detalle as $producto_detalle) {?>
                                <tr>
                                    <td><img class="img-thumbnail" width="100px"
                                            src="../imagenes/productos_detalle/<?php echo $producto_detalle['environment'];?>">
                                    </td>
                                    <td><?php echo $producto_detalle['name'];?></td>
                                    <td>

                                        <!--este formulario envia la informacion al formulario que esta en la parte de abajo-->
                                        <form action="" method="post">

                                            <input type="hidden" required name="txt_id_detalle"
                                                value="<?php echo $producto_detalle['id']?>" placeholder=""
                                                id="txt_id_detalle" require="">

                                            <!--boton que envia la informacion l otro formulario-->
                                            <!--<input class="btn btn-info" type="submit" value="Detalle"
                                                name="accion_detalle_producto">-->
                                            <button class="btn btn-info" value="btnSeleccionDetalle" type="submit"
                                                name="accion_detalle_producto">Seleccionar Detalle</button>
                                            <button class="btn btn-danger" value="btnEliminarDetalle" type="submit"
                                                name="accion_detalle_producto">Eliminar</button>


                                        </form>
                                    </td>
                                </tr>
                                <?php }?>
                            </table>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-success" <?php echo $accionAgregar?> value="btnAgregar" type="submit"
                            name="accion">Agregar</button>
                        <button class="btn btn-warning" <?php echo $accionModificar?> value="btnModificar" type="submit"
                            name="accion">Modificar</button>
                        <button class="btn btn-danger" <?php echo $accionEliminar?> value="btnEliminar" type="submit"
                            name="accion">Eliminar</button>
                        <button class="btn btn-primary" <?php echo $accionCancelar?> value="btnCancelar" type="submit"
                            name="accion">Cancelar</button>
                    </div>
                </div>
            </div>
        </div>
</div>
<br />
<br />
<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
    Agregar Proyectos +
</button>
<br />
<br />
</form>

<form method="post" action="" enctype="multipart/form-data">
    <!--Modal fuera del form que esta enviando el detalle producto-->
    <div id="classModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="classInfo"
        aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Detalles Ambientes</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                        ×
                    </button>
                </div>
                <div class="modal-body">
                    <input type="hidden" required name="txt_id_detalle" value="<?php echo $txt_id_detalle?>"
                        placeholder="" id="txt_id_detalle" require="">

                    <input type="hidden" required name="txt_id" value="<?php echo $txt_id?>" placeholder="" id="txt_id"
                        require="">

                    <div class="form-group col-md-12">
                        <label for="">Nombre:</label>
                        <input class="form-control " type="text" name="txt_name_detalle"
                            value="<?php echo $txt_name_detalle?>" placeholder="" required id="txt_name_detalle"
                            require="">
                    </div>

                    <div class="form-group col-md-12">
                        <label for="">Descripcion:</label>
                        <input class="form-control " type="text" name="txt_description_detalle"
                            value="<?php echo $txt_description_detalle?>" placeholder="" required
                            id="txt_description_detalle" require="">
                    </div>

                    <div class="form-group col-md-12">
                        <label for="">Ambiente:</label>

                        <?php if($txt_environment_detalle!="") {?>
                        <br />
                        <img class="img-thumbnail rounded mx-auto d-block" width="100px"
                            src="../imagenes/productos_detalle/<?php echo $txt_environment_detalle;?>">
                        <br />
                        <br />
                        <?php }?>

                        <input class="form-control" type="file" accept="image/*" name="txt_environment_detalle"
                            value="<?php echo $txt_environment_detalle?>" placeholder="" id="txt_environment_detalle"
                            require="">
                        <br>
                    </div>

                </div>


                <div class="modal-footer">
                    <button class="btn btn-success" <?php echo $accionAgregarDetalle?> value="btnAgregarDetalle"
                        type="submit" name="accion_detalle_producto">Agregar</button>
                    <button class="btn btn-warning" <?php echo $accionModificarDetalle?> value="btnModificarDetalle"
                        type="submit" name="accion_detalle_producto">Modificar</button>
                    <button class="btn btn-danger" <?php echo $accionEliminarDetalle?> value="btnEliminarDetalle"
                        type="submit" name="accion_detalle_producto">Eliminar</button>
                    <button class="btn btn-primary" <?php echo $accionCancelarDetalle?> value="btnCancelarDetalle"
                        type="submit" name="accion_detalle_producto">Cancelar</button>
                </div>
            </div>
        </div>
    </div>
</form>


<div class="row">
    <label for="">Filtro :</label>
    <br>
    <div class="input-group"> <span class="input-group-addon"></span>
        <input id="entradafilter" type="text" class="form-control">
        <br/>
        <br/>
    </div>
    <table class="table table-hover table-bordered">
        <thead class="thead-dark">
            <tr>
                <th>Imagen</th>
                <th>Nombre</th>
                <th>Descripcion</th>
                <th>Acciones</th>
            </tr>
        </thead>
        <!-- Aqui empieza los proyectos -->
        <tbody class="contenidobusqueda">
            <?php foreach($lista_proyectos as $proyecto) {?>
            <tr>

                <td><img class="img-thumbnail" width="100px"
                        src="../imagenes/proyectos/<?php echo $proyecto['imagen'];?>">
                </td>
                <td><?php echo $proyecto['name'];?></td>
                <td><?php echo $proyecto['description'];?></td>
                
                <td>

                    <!--este formulario envia la informacion al formulario que esta en la parte de arriba-->
                    <form action="" method="post">

                        <input type="hidden" name="txt_id" value="<?php echo $proyecto['id']?>">

                        <input class="btn btn-info" type="submit" value="Seleccionar" name="accion">
                        <!--boton que envia la informacion l otro formulario-->
                        <button class="btn btn-danger" value="btnEliminar" type="submit" name="accion">Eliminar</button>

                    </form>
                </td>
            </tr>
            <?php }?>
        </tbody>
    </table>

</div>


<!--funcion que servira para mostrar el registro en el modal cuando el usuario la seleccione-->
    <?php if($mostrarModal) {?>
        <script>
        $('#exampleModal').modal('show');
        </script>
    <?php }?>

    <?php if($mostrarModalDetalle) {?>
        <script>
        $('#classModal').modal('show');
        </script>
    <?php }?>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.min.js"></script>

    <script>
    $(document).ready(function() {
        $('#entradafilter').keyup(function() {
            var rex = new RegExp($(this).val(), 'i');
            $('.contenidobusqueda tr').hide();
            $('.contenidobusqueda tr').filter(function() {
                return rex.test($(this).text());
            }).show();

        })

    });
    </script>

</div>


<?php
include '../templates/pie-pagina.php';
?>