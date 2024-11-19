-- Crear la base de datos
CREATE DATABASE CoinkDB;

-- Conectarse a la base de datos
\c CoinkDB;

-- Crear las tablas

-- Tabla de países
CREATE TABLE pais (
    id_pais SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de departamentos
CREATE TABLE departamento (
    id_departamento SERIAL PRIMARY KEY,
    id_pais INTEGER NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_pais) REFERENCES pais(id_pais)
);

-- Tabla de municipios
CREATE TABLE municipio (
    id_municipio SERIAL PRIMARY KEY,
    id_departamento INTEGER NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    estado BOOLEAN DEFAULT true,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_departamento) REFERENCES departamento(id_departamento)
);

-- Tabla de usuarios
CREATE TABLE usuario (
    id_usuario SERIAL PRIMARY KEY, 
    nombre VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    direccion VARCHAR(200),
    id_municipio INTEGER NOT NULL,
    estado BOOLEAN DEFAULT true,
    fecha_creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_municipio) REFERENCES municipio(id_municipio)
);

-- Insertar datos iniciales en la tabla de pais
INSERT INTO pais (nombre) VALUES 
('Colombia'),
('México'),
('Argentina');

-- Insertar datos iniciales en la tabla de departamento
INSERT INTO departamento (id_pais, nombre) VALUES 
(1, 'Cundinamarca'),
(1, 'Antioquia'),
(1, 'Valle del Cauca');

-- Insertar datos iniciales en la tabla de municipio
INSERT INTO municipio (id_departamento, nombre) VALUES 
(1, 'Bogotá'),
(2, 'Medellín'),
(3, 'Cali');

-- Crear el procedimiento almacenado para agregar un usuario
CREATE OR REPLACE FUNCTION agregar_usuario(
    p_nombre TEXT,
    p_telefono TEXT,
    p_direccion TEXT,
    p_id_municipio INT,
    p_estado BOOLEAN
)
RETURNS void AS $$
BEGIN
    INSERT INTO public.usuario (
        nombre, telefono, direccion, id_municipio, estado, fecha_creacion
    )
    VALUES (
        p_nombre, p_telefono, p_direccion, p_id_municipio, p_estado, NOW()
    );       
END;
$$ LANGUAGE plpgsql;
