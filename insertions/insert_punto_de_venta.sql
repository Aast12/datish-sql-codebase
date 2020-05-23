set @nombre = "Sr Latino";
set @descripcion = "Resturante de comida latina";
set @id_agrupacion = (SELECT id_agrupacion FROM datish.agrupacion WHERE nombre = "Centrales");
set @id_comunidad = (SELECT id_comunidad FROM datish.comunidad WHERE nombre = "Tecnológico de Monterrey");

INSERT INTO datish.punto_de_venta(nombre, descripcion,  id_agrupacion, id_comunidad, fecha_registro)
VALUES(@nombre, @descripcion, @id_agrupacion, @id_comunidad, CURRENT_DATE());

select * from datish.punto_de_venta;