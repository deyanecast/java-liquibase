-- SQL script for tabla_permisos
-- SQL script for creating the permissions table
CREATE TABLE bootcamp.permisos (
    id SERIAL PRIMARY KEY,
    permiso_nombre VARCHAR(100) NOT NULL
);
