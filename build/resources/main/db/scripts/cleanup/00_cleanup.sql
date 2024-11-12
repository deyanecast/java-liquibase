-- Eliminar tablas existentes
DROP TABLE IF EXISTS usuario_roles CASCADE;
DROP TABLE IF EXISTS rol_permisos CASCADE;
DROP TABLE IF EXISTS usuario_proyectos CASCADE;
DROP TABLE IF EXISTS tareas CASCADE;
DROP TABLE IF EXISTS proyectos CASCADE;
DROP TABLE IF EXISTS usuarios CASCADE;
DROP TABLE IF EXISTS roles CASCADE;
DROP TABLE IF EXISTS permisos CASCADE;

-- Limpiar tablas de control de Liquibase
DROP TABLE IF EXISTS bootcamp.databasechangelog CASCADE;
DROP TABLE IF EXISTS bootcamp.databasechangeloglock CASCADE;

-- Eliminar el esquema y recrearlo
DROP SCHEMA IF EXISTS bootcamp CASCADE;
CREATE SCHEMA bootcamp; 