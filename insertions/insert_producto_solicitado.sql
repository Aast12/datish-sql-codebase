set @id_producto = 4;
set @id_pedido = 1;
set @cantidad = 2;

INSERT INTO datish.producto_solicitado(id_producto, id_pedido,  cantidad)
VALUES(@id_producto, @id_pedido,  @cantidad);
