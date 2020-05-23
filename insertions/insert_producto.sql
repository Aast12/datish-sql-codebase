-- Insertar un producto en un punto de venta
set @nombre = "Fuze Tea";
set @descripcion = "";
set @costo = 18;
set @id_punto_de_venta = 8;

INSERT INTO datish.producto(id_punto_de_venta, nombre, descripcion, costo)
VALUES(@id_punto_de_venta, @nombre, @descripcion, @costo);
