-- SQL script for tabla_rol_permisos
-- SQL script for creating the role_permissions table (many-to-many between roles and permissions)
CREATE TABLE bootcamp.rol_permisos (
    rol_id INT REFERENCES bootcamp.roles(id) ON DELETE CASCADE,
    permiso_id INT REFERENCES bootcamp.permisos(id) ON DELETE CASCADE,
    PRIMARY KEY (rol_id, permiso_id)
);
