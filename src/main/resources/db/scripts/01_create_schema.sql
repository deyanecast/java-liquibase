-- Crear esquema si no existe
CREATE SCHEMA IF NOT EXISTS bootcamp;

-- Asignar permisos al esquema
GRANT ALL ON SCHEMA bootcamp TO postgres;
GRANT ALL ON SCHEMA bootcamp TO public; 