set @id_comunidad = 1;
set @id_usuario = 4;

INSERT INTO datish.admin_comunidad(id_comunidad, id_usuario)
VALUES(@id_comunidad, @id_usuario);

select * from datish.admin_comunidad;
