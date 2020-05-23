set @id_usuario = 3;
set @id_repartidor = 5;

INSERT INTO datish.pedido(id_usuario, id_repartidor, fecha)
VALUES(@id_usuario, @id_repartidor, NOW());