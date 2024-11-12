-- Tablas principales
CREATE TABLE IF NOT EXISTS "user" (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,
    created_by INTEGER,
    updated_by INTEGER,
    CONSTRAINT uq_user_email UNIQUE (email),
    CONSTRAINT uq_user_username UNIQUE (username)
);

CREATE TABLE IF NOT EXISTS "role" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,
    created_by INTEGER,
    updated_by INTEGER,
    CONSTRAINT uq_role_name UNIQUE (name)
);

CREATE TABLE IF NOT EXISTS "permission" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,
    created_by INTEGER,
    updated_by INTEGER,
    CONSTRAINT uq_permission_name UNIQUE (name)
);

CREATE TABLE IF NOT EXISTS "project" (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,
    created_by INTEGER,
    updated_by INTEGER,
    CONSTRAINT uq_project_name UNIQUE (name)
);

CREATE TABLE IF NOT EXISTS "task" (
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    description TEXT,
    status VARCHAR(20) NOT NULL,
    project_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP,
    deleted_at TIMESTAMP,
    created_by INTEGER,
    updated_by INTEGER,
    CONSTRAINT fk_task_project FOREIGN KEY (project_id) REFERENCES "project"(id),
    CONSTRAINT ck_task_status CHECK (status IN ('PENDING', 'IN_PROGRESS', 'COMPLETED', 'CANCELLED'))
);

-- Tablas de mapeo (relaciones)
CREATE TABLE IF NOT EXISTS "map_user_project" (
    user_id INTEGER,
    project_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER,
    PRIMARY KEY (user_id, project_id),
    CONSTRAINT fk_map_user_project_user FOREIGN KEY (user_id) REFERENCES "user"(id),
    CONSTRAINT fk_map_user_project_project FOREIGN KEY (project_id) REFERENCES "project"(id)
);

CREATE TABLE IF NOT EXISTS "map_role_permission" (
    role_id INTEGER,
    permission_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER,
    PRIMARY KEY (role_id, permission_id),
    CONSTRAINT fk_map_role_permission_role FOREIGN KEY (role_id) REFERENCES "role"(id),
    CONSTRAINT fk_map_role_permission_permission FOREIGN KEY (permission_id) REFERENCES "permission"(id)
);

CREATE TABLE IF NOT EXISTS "map_user_role" (
    user_id INTEGER,
    role_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by INTEGER,
    PRIMARY KEY (user_id, role_id),
    CONSTRAINT fk_map_user_role_user FOREIGN KEY (user_id) REFERENCES "user"(id),
    CONSTRAINT fk_map_user_role_role FOREIGN KEY (role_id) REFERENCES "role"(id)
);

-- Crear índices
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'idx_user_email') THEN
        CREATE INDEX idx_user_email ON "user"(email);
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'idx_user_username') THEN
        CREATE INDEX idx_user_username ON "user"(username);
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'idx_task_project') THEN
        CREATE INDEX idx_task_project ON "task"(project_id);
    END IF;
END $$;

DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_class WHERE relname = 'idx_task_status') THEN
        CREATE INDEX idx_task_status ON "task"(status);
    END IF;
END $$; 