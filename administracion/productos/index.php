<?php 
    require 'productos.php';
    require 'productos_detalle.php';

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
                                <label for="">Nombre:</label>
                                <input class="form-control <?php echo (isset($error['name']))?"is-invalid":"";?>"
                                    type="text" name="txt_name" value="<?php echo $txt_name?>" placeholder=""
                                    id="txt_name" require="">
                                <div class="invalid-feedback">
                                    <?php echo (isset($error['name']))?$error['name']:"";?>
                                </div>
                                <br>
                            </div>

                            <div class="form-group col-md-6">
                                <label for="">Precio:</label>
                                <input class="form-control" type="text" name="txt_price" value="<?php echo $txt_price?>"
                                    placeholder="" required id="txt_price" require="">
                                <br>
                            </div>

                            <div class="form-group col-md-6">
                                <label for="">Codigo:</label>
                                <input class="form-control" type="text" name="txt_code" required
                                    value="<?php echo $txt_code?>" placeholder="" id="txt_code" require="">
                                <br>
                            </div>

                            <div class="form-group col-md-12">
                                <label for="">Foto:</label>

                                <?php if($txt_image!="") {?>
                                <br />
                                <img class="img-thumbnail rounded mx-auto d-block" width="100px"
                                    src="../imagenes/productos/<?php echo $txt_image;?>">
                                <br />
                                <br />
                                <?php }?>

                                <input class="form-control" type="file" accept="image/*" name="txt_image"
                                    value="<?php echo $txt_image?>" placeholder="" id="txt_image" require="">
                                <br>
                            </div>

                            <!-- Tabla de los detalles de producto-->
                            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#classModal">
                                Agregar Detalles
                            </button>


                        </div>
                                                
                        <br>
                        <br>
                        <div class="row">
                                <table class="table table-hover table-bordered">
                                    <thead class="thead-dark">
                                   
                                        <tr>
                                            <th>Ambiente</th>
                                            <th>Descripcion</th>
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

                                            <!--este formulario envia la informacion al formulario que esta en la parte de arriba-->
                                            <form action="" method="post">

                                                <input type="hidden" name="txt_id_detalle" value="<?php echo $producto_detalle['id']?>">

                                                <input class="btn btn-info" type="submit" value="Seleccionar"
                                                    name="accion">
                                                <!--boton que envia la informacion l otro formulario-->
                                                <button class="btn btn-danger" value="btnEliminar" type="submit"
                                                    name="accion">Eliminar</button>

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


        <div id="classModal" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog"
            aria-labelledby="classInfo" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Detalles Productos</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                            ×
                        </button>
                    </div>
                    <div class="modal-body">
                        <input type="hidden" required name="txt_id" value="<?php echo $txt_id?>" placeholder=""
                            id="txt_id" require="">


                        <thead>
                        </thead>
                        <tbody>
                            <tr>
                                <td>CLN</td>
                                <td>Last Updated Date</td>
                                <td>Class Name</td>
                                <td># Tests</td>
                                <td>Test Coverage (Instruction)</td>
                                <td>Test Coverage (Complexity)</td>
                                <td>Complex Covered</td>
                                <td>Complex Total</td>
                                <td>Category</td>
                            </tr>
                        </tbody>
                        </table>
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
            Agregar Producto +
        </button>
        <br />
        <br />
    </form>


    <div class="row">
        <table class="table table-hover table-bordered">
            <thead class="thead-dark">
                <tr>
                    <th>Foto</th>
                    <th>Nombre</th>
                    <th>Codigo</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <!-- Aqui empieza los detalles de los productos -->
            <?php foreach($lista_productos as $producto) {?>
            <tr>
                <td><img class="img-thumbnail" width="100px"
                        src="../imagenes/productos/<?php echo $producto['image'];?>">
                </td>
                <td><?php echo $producto['name'];?></td>
                <td><?php echo $producto['real_code'];?></td>
                <td>

                    <!--este formulario envia la informacion al formulario que esta en la parte de arriba-->
                    <form action="" method="post">

                        <input type="hidden" name="txt_id" value="<?php echo $producto['id']?>">

                        <input class="btn btn-info" type="submit" value="Seleccionar" name="accion">
                        <!--boton que envia la informacion l otro formulario-->
                        <button class="btn btn-danger" value="btnEliminar" type="submit" name="accion">Eliminar</button>

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

    <?php if($mostrarModalDetalle) {?>
    <script>
    $('#classModal').modal('show');
  </script>
    <?php }?>
    
</div>


<?php
include '../templates/pie-pagina.php';
?>