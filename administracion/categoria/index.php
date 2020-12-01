<?php 
    require 'categoria.php'

?>

<div class="container">
    <form method="post" action="" enctype="multipart/form-data">
        <!--Se reenvia los datos del formulario a la misma hoja cuando se coloca action=""-->

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
            aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
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

                            <div class="form-group col-md-6">
                                <label for="">Nombre Categoría:</label>
                                <input
                                    class="form-control <?php echo (isset($error['name_category']))?"is-invalid":"";?>"
                                    type="text" required name="txt_name_category"
                                    value="<?php echo $txt_name_category?>" placeholder="" id="txt_name_category"
                                    require="">
                                <!-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ sirve para mostrar la informacion que nosotros enviamos a traves del formulario y no se pierda-->
                                <div class="invalid-feedback">
                                    <?php echo (isset($error['name_category']))?$error['name_category']:"";?>
                                </div>
                                <br>
                            </div>

                            <div class="form-group col-md-6">
                                <label for="">Código:</label>
                                <input class="form-control " type="text" name="txt_code_category" required
                                    value="<?php echo $txt_code_category?>" placeholder="" id="txt_code_category"
                                    require="">
                                <br>
                            </div>


                            <div class="form-group col-md-12">
                                <label for="">Descripcion:</label>
                                <input class="form-control" type="text" name="txt_description_category" required
                                    value="<?php echo $txt_description_category?>" placeholder=""
                                    id="txt_description_category" require="">
                                <br>
                            </div>

                            <div class="form-group col-md-6">
                                <label for="">Categoría Padre:</label>
                                <select class="form-control" name="txt_parent_category">
                                    <option value="">Seleccione</option>
                                    <?php foreach($lista_categoria as $categoria) {?>
                                    <option value="<?php echo $categoria['id'];?>">
                                        <?php echo $categoria['id'];?> <?php echo $categoria['name_category'];?>
                                    </option>
                                    <?php }?>
                                </select>
                            </div>
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
        <br />
        <br />

        <!-- Button trigger modal -->
        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
            Agregar Categoria +
        </button>
        <br />
        <br />
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
                    <th>Categoría</th>
                    <th>Codigo</th>
                    <th>Descripción</th>
                    <th>Categoría Padre</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <!-- Aqui empieza los detalles de los empleados -->
            <tbody class="contenidobusqueda">
                <?php foreach($lista_categoria as $categoria) {?>
                <tr>
                    <?php
                    $sentencia=$pdo->prepare("SELECT name_category FROM categoria WHERE id= :id");
                    $sentencia->bindParam(':id',$categoria['id_category_parent']);
                    $sentencia->execute();

                    $parent_category=$sentencia->fetch(PDO::FETCH_LAZY);

                     ?>

                    <td><?php echo $categoria['name_category'];?></td>
                    <td><?php echo $categoria['code'];?></td>
                    <td><?php echo $categoria['description'];?></td>
                    <td><?php echo $parent_category['name_category'];?></td>
                    <td>

                        <!--este formulario envia la informacion al formulario que esta en la parte de arriba-->
                        <form action="" method="post">

                            <input type="hidden" name="txt_id" value="<?php echo $categoria['id']?>">

                            <input class="btn btn-info" type="submit" value="Seleccionar" name="accion">
                            <!--boton que envia la informacion l otro formulario-->
                            <button class="btn btn-danger" value="btnEliminar" type="submit"
                                name="accion">Eliminar</button>

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