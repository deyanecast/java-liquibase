-- SQL script for tabla_usuario_roles
CREATE TABLE bootcamp.usuario_roles (
    usuario_id INT REFERENCES bootcamp.usuarios(id) ON DELETE CASCADE,
    rol_id INT REFERENCES bootcamp.roles(id) ON DELETE CASCADE,
    PRIMARY KEY (usuario_id, rol_id)
);
