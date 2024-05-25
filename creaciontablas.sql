--Tabla Categoria: 
CREATE TABLE categorias (
   IdCategoria INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    NombreCategoria VARCHAR(15) NOT NULL,
    Descripcion VARCHAR(200)
);

--Tabla Productos
CREATE TABLE productos (
    IdProducto INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    NombreProducto VARCHAR(15) NOT NULL,
    Categorias_IdCategoria INT NOT NULL,
    CantidadPorUnidad VARCHAR(20),
    PrecioUnidad DECIMAL(5, 2) NOT NULL,
    UnidadEnExistencia SMALLINT,
	UnidadEnPedido SMALLINT,
    Suspendido TINYINT(1)
);
