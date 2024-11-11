-- SQL script for tabla_tareas
CREATE TABLE bootcamp.tareas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    estado VARCHAR(50) CHECK (estado IN ('Pendiente', 'En Progreso', 'Completada')),
    fecha_inicio DATE,
    fecha_fin DATE,
    proyecto_id INT REFERENCES bootcamp.proyectos(id) ON DELETE CASCADE,
    asignado_a INT REFERENCES bootcamp.usuarios(id) ON DELETE SET NULL
);
