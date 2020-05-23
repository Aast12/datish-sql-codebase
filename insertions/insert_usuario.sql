set @nombre = "Rodrigo";
set @apellido = "Martínez";
set @email = "rodmtz@gmail.com";
set @es_repartidor = 1;

INSERT INTO datish.usuario(nombre, apellido, email, es_repartidor, fecha_registro)
VALUES(@nombre, @apellido, @email, @es_repartidor, CURRENT_DATE());