set @nombre = "Centrales";
set @descripcion = "Cafetería del Tec de Monterrey";
set @id_comunidad = (SELECT id_comunidad FROM datish.comunidad WHERE nombre = "Tecnológico de Monterrey");

INSERT INTO datish.agrupacion(nombre, descripcion,  id_comunidad, fecha_registro)
VALUES(@nombre, @descripcion, @id_comunidad, CURRENT_DATE());

SELECT * FROM datish.agrupacion;