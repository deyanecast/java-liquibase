-- Changeset deyane:20241112120029651
-- Comment: bootcamp
-- Cambioset para insertar datos
INSERT INTO bootcamp.project (name, description)
VALUES ('Project 3', 'ORGANIZACION DE ARQUITECTURA')
ON CONFLICT (name) DO NOTHING;