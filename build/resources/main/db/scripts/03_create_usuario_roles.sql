CREATE TABLE IF NOT EXISTS usuario_roles (
    usuario_id INTEGER REFERENCES usuarios(id),
    rol_id INTEGER REFERENCES roles(id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (usuario_id, rol_id)
);

-- Asignar permisos
GRANT ALL ON ALL TABLES IN SCHEMA bootcamp TO postgres;
GRANT ALL ON ALL TABLES IN SCHEMA bootcamp TO public; 