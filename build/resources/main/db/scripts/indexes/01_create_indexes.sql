-- Índices para user
CREATE INDEX idx_user_email ON "user"(email);
CREATE INDEX idx_user_username ON "user"(username);

-- Índices para task
CREATE INDEX idx_task_project ON task(project_id);
CREATE INDEX idx_task_status ON task(status);

-- Listar todas las tablas en el esquema bootcamp
SELECT table_name 
FROM information_schema.tables 
WHERE table_schema = 'bootcamp' 
AND table_type = 'BASE TABLE'
ORDER BY table_name;

-- Verificar estructura de la tabla user
\d bootcamp."user"

-- Verificar estructura de la tabla task
\d bootcamp.task

-- Verificar los índices creados
SELECT 
    tablename, 
    indexname, 
    indexdef
FROM pg_indexes
WHERE schemaname = 'bootcamp'
ORDER BY tablename, indexname;