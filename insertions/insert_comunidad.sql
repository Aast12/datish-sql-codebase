set @nombre = "Tecnológico de Monterrey";
set @descripcion = "Universidad en Monterrey";

INSERT INTO datish.comunidad(nombre, descripcion, fecha_registro)
VALUES(@nombre, @descripcion, CURRENT_DATE());