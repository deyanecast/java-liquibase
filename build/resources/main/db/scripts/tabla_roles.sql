-- SQL script for tabla_roles
CREATE TABLE bootcamp.roles (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
);
