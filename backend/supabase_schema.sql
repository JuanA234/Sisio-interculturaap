-- Crear tabla aves en Supabase
-- Ejecutar en el SQL Editor de Supabase: https://supabase.com/dashboard/project/_/sql

CREATE TABLE aves (
    id SERIAL PRIMARY KEY,
    nombre_cientifico TEXT NOT NULL,
    nombre_espanol TEXT,
    nombre_nativo TEXT,
    lengua TEXT,
    significado_ancestral TEXT,
    rol_cosmovision TEXT,
    habitat TEXT,
    imagen_url TEXT,
    audio_url TEXT
);

-- Crear índice para búsquedas por nombre científico
CREATE INDEX idx_aves_nombre_cientifico ON aves (nombre_cientifico);