-- Crear tabla piloto
CREATE TABLE IF NOT EXISTS piloto (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    licencia VARCHAR(50) NOT NULL,
    fecha_ingreso DATE
);
