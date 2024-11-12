-- Tablas base (sin dependencias)
CREATE TABLE IF NOT EXISTS bootcamp.proyectos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(20) DEFAULT 'ACTIVO',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS bootcamp.usuarios (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    activo BOOLEAN DEFAULT true,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS bootcamp.roles (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    descripcion TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS bootcamp.permisos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    descripcion TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tablas con dependencias
CREATE TABLE IF NOT EXISTS bootcamp.tareas (
    id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT,
    estado VARCHAR(20) DEFAULT 'PENDIENTE',
    prioridad VARCHAR(20) DEFAULT 'MEDIA',
    fecha_vencimiento DATE,
    proyecto_id INTEGER REFERENCES bootcamp.proyectos(id),
    usuario_id INTEGER REFERENCES bootcamp.usuarios(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS bootcamp.rol_permisos (
    rol_id INTEGER REFERENCES bootcamp.roles(id),
    permiso_id INTEGER REFERENCES bootcamp.permisos(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (rol_id, permiso_id)
);

CREATE TABLE IF NOT EXISTS bootcamp.usuario_proyectos (
    usuario_id INTEGER REFERENCES bootcamp.usuarios(id),
    proyecto_id INTEGER REFERENCES bootcamp.proyectos(id),
    rol VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (usuario_id, proyecto_id)
);

CREATE TABLE IF NOT EXISTS bootcamp.usuario_roles (
    usuario_id INTEGER REFERENCES bootcamp.usuarios(id),
    rol_id INTEGER REFERENCES bootcamp.roles(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (usuario_id, rol_id)
);

-- Asignar permisos a las tablas
GRANT ALL ON ALL TABLES IN SCHEMA bootcamp TO postgres;
GRANT ALL ON ALL TABLES IN SCHEMA bootcamp TO public;
GRANT ALL ON ALL SEQUENCES IN SCHEMA bootcamp TO postgres;
GRANT ALL ON ALL SEQUENCES IN SCHEMA bootcamp TO public; 