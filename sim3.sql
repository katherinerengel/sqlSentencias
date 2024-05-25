Simulación caso práctico de examen.
/* 1. El siguiente esquema relacional muestra tres tablas relacionadas entre ellas mediante
dos relaciones 1:N (uno a muchos): una entre la tabla clientes y pedidos, y otra entre
compañía_de_envíos y pedidos.

Consideraciones/aclaraciones:
• Las columnas que tienen NN a la derecha no admiten valores NULL.
• Las columnas con icono de una llave a su izquierda son claves primarias en sus
respectivas tablas.
• Todas las claves primarias con AI a la derecha son auto-incrementables.
• Las columnas clave externa son IdCliente y FormaEnvío
• Si se borra una compañía de envíos de su tabla, se deben actualizar automáticamente
con el valor NULL la columna relacionada en la tabla pedidos.
• Escribir las sentencias DDL de creación de ambas tablas. */

-- Tabla clientes
CREATE TABLE clientes (
    IdCliente VARCHAR(5) AUTO_INCREMENT PRIMARY KEY NOT NULL,
    NombreCompania VARCHAR(40),
    NombreContacto VARCHAR(30),
    CargoContacto VARCHAR(30),
    Direccion VARCHAR(60),
    Ciudad VARCHAR(15),
    Region VARCHAR(15),
);

-- Tabla compañía_de_envíos
CREATE TABLE compañía_de_envíos (
    IdCompaníaEnvio INT AUTO_INCREMENT PRIMARY KEY,
    NombreCompanía VARCHAR(40),
    Telefono VARCHAR(24)
);

-- Tabla pedidos
CREATE TABLE pedidos (
    IdPedido INT AUTO_INCREMENT PRIMARY KEY,
    IdCliente INT NOT NULL,
    IdEmpleado INT,
    FechaPedido DATETIME,
    FechaEntrega DATETIME,
    FechaEnvio DATETIME,
    FormaEnvío INT,
    Cargo DOUBLE,
    FOREIGN KEY (IdCliente) REFERENCES clientes(IdCliente),
    FOREIGN KEY (FormaEnvío) REFERENCES compañía_de_envíos(IdCompañía)
        ON DELETE SET NULL
);