set @id_punto_de_venta = 7;
set @id_usuario = 2;

INSERT INTO datish.admin_punto_venta(id_punto_de_venta, id_usuario)
VALUES(@id_punto_de_venta, @id_usuario);
