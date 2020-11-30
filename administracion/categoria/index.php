<?php 
    require 'categoria.php'

?>

    <div class="container">
        <form method="post" action="" enctype="multipart/form-data">
            <!--Se reenvia los datos del formulario a la misma hoja cuando se coloca action=""-->

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Categoría</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="form-row">
                                <input type="hidden" required name="txt_id" value="<?php echo $txt_id?>" placeholder=""
                                    id="txt_id" require="">

                                <div class="form-group col-md-4">
                                    <label for="">Nombre:</label>
                                    <input class="form-control <?php echo (isset($error['name']))?"is-invalid":"";?>" type="text" name="txt_name" 
                                        value="<?php echo $txt_name?>" placeholder="" id="txt_name" require="">
                                        <div class ="invalid-feedback">
                                            <?php echo (isset($error['name']))?$error['name']:"";?>
                                        </div>
                                    <br>
                                </div>

                                <div class="form-group col-md-4">
                                    <label for="">Apellido Paterno:</label>
                                    <input class="form-control <?php echo (isset($error['paternal_surname']))?"is-invalid":"";?>" type="text" name="txt_paternal_surname"
                                        value="<?php echo $txt_paternal_surname?>" placeholder=""
                                        id="txt_paternal_surname" require="">
                                        
                                        <div class ="invalid-feedback">
                                            <?php echo (isset($error['paternal_surname']))?$error['paternal_surname']:"";?>
                                        </div>

                                    <br>
                                </div>

                                <div class="form-group col-md-4">
                                    <label for="">Apellido Materno:</label>
                                    <input class="form-control" type="text" name="txt_maternal_surname" required
                                        value="<?php echo $txt_maternal_surname?>" placeholder=""
                                        id="txt_maternal_surname" require="">
                                    <br>
                                </div>

                                <div class="form-group col-md-12">
                                    <label for="">Correo:</label>
                                    <input class="form-control" type="email" name="txt_email" required
                                        value="<?php echo $txt_email?>" placeholder="" id="txt_email" require="">
                                    <br>
                                </div>

                                <div class="form-group col-md-12">
                                    <label for="">Foto:</label>
                                    
                                    <?php if($txt_photo!="") {?>
                                        <br/>
                                        <img class="img-thumbnail rounded mx-auto d-block" width="100px" src="../imagenes/usuarios/<?php echo $txt_photo;?>">
                                        <br/>
                                        <br/>
                                    <?php }?>

                                    <input class="form-control" type="file" accept="image/*" name="txt_photo"
                                        value="<?php echo $txt_photo?>" placeholder="" id="txt_photo" require="">
                                    <br>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button class="btn btn-success" <?php echo $accionAgregar?> value="btnAgregar" type="submit"
                                name="accion">Agregar</button>
                            <button class="btn btn-warning" <?php echo $accionModificar?> value="btnModificar"
                                type="submit" name="accion">Modificar</button>
                            <button class="btn btn-danger" <?php echo $accionEliminar?> value="btnEliminar"
                                type="submit" name="accion">Eliminar</button>
                            <button class="btn btn-primary" <?php echo $accionCancelar?> value="btnCancelar"
                                type="submit" name="accion">Cancelar</button>
                        </div>
                    </div>
                </div>
            </div>
            <br/>
            <br/>

            <!-- Button trigger modal -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                Agregar Categoria +
            </button>
            <br/>
            <br/>
        </form>


        <div class="row">
            <table class="table table-hover table-bordered">
                <thead class="thead-dark">
                    <tr>
                        <th>Categoría</th>
                        <th>Descripción</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <!-- Aqui empieza los detalles de los empleados -->
                <?php foreach($lista_categoria as $categoria) {?>
                <tr>
                    <td><?php echo $categoria['name'];?> <?php echo $empleado['paternal_surname'];?>
                        <?php echo $categoria['maternal_surname'];?></td>
                    <td><?php echo $categoria['email'];?></td>
                    <td>

                        <!--este formulario envia la informacion al formulario que esta en la parte de arriba-->
                        <form action="" method="post">

                            <input type="hidden" name="txt_id" value="<?php echo $empleado['id']?>">
                            
                            <input class="btn btn-info" type="submit" value="Seleccionar" name="accion">
                            <!--boton que envia la informacion l otro formulario-->
                            <button class="btn btn-danger" value="btnEliminar" type="submit"
                                name="accion">Eliminar</button>

                        </form>
                    </td>
                </tr>

                <?php }?>

            </table>

        </div>

        <!--funcion que servira para mostrar el registro en el modal cuando el usuario la seleccione-->
        <?php if($mostrarModal) {?>
            <script>
            $('#exampleModal').modal('show');
            </script>
        <?php }?>
    </div>


<?php
include '../templates/pie-pagina.php';
?>

