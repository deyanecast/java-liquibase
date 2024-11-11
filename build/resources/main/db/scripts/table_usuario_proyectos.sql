-- SQL script for table_usuario_proyectos
CREATE TABLE bootcamp.usuario_proyectos (
    usuario_id INT REFERENCES bootcamp.usuarios(id) ON DELETE CASCADE,
    proyecto_id INT REFERENCES bootcamp.proyectos(id) ON DELETE CASCADE,
    PRIMARY KEY (usuario_id, proyecto_id)
);

