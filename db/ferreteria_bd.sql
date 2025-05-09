CREATE DATABASE ferreteria_bd;
USE ferreteria_bd;

CREATE TABLE bitacoras (
    id_bitacora INT AUTO_INCREMENT PRIMARY KEY,
    transaccion VARCHAR(10) NOT NULL,
    usuario VARCHAR(40) NOT NULL,
    Host VARCHAR(40) DEFAULT NULL,
    fecha DATETIME NOT NULL,
    tabla VARCHAR(20) NOT NULL
);
CREATE TABLE Usuarios (
    usuario VARCHAR(20) PRIMARY KEY,
    contraseña VARCHAR(20)
);

CREATE TABLE Calificaciones (
    ID_Calificacion INT AUTO_INCREMENT PRIMARY KEY,
    Calificacion TINYINT NULL,
    Comentario TEXT NULL,
    ID_Producto INT NULL
);

CREATE TABLE Categorias (
    ID_Categoria INT AUTO_INCREMENT PRIMARY KEY,
    NombreCategoria VARCHAR(40) NOT NULL
);

CREATE TABLE Cliente (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Tipo_Cliente VARCHAR(50) NOT NULL
);

CREATE TABLE Compra_factura (
    ID_CompraFactura INT AUTO_INCREMENT PRIMARY KEY,
    N_Factura INT NULL,
    ID_Proveedores INT NULL,
    Fecha DATETIME NULL,
    Imagen LONGBLOB NULL,
    FOREIGN KEY (ID_Proveedores) REFERENCES Proveedores(ID_Proveedores) ON DELETE CASCADE
);

CREATE TABLE Detalle_venta_factura (
    ID_Detalle INT AUTO_INCREMENT PRIMARY KEY,
    ID_Producto INT NOT NULL,
    Cantidad INT NOT NULL,
    NumeroFactura INT NULL,
    PrecioVenta DOUBLE NULL
);

CREATE TABLE DetalleCompraFactura (
    ID_Compra INT AUTO_INCREMENT PRIMARY KEY,
    Cantidad INT NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    ID_CompraFactura INT NULL,
    ID_Producto INT NULL
);

CREATE TABLE Producto (
    ID_Producto INT AUTO_INCREMENT PRIMARY KEY,
    Stock INT NULL,
    ID_Categoria INT NULL,
    PrecioCompra DOUBLE NULL,
    PrecioVenta DOUBLE NULL,
    nombreProducto VARCHAR(30) NULL,
    Descripcion VARCHAR(60) NULL,
    UbicacionFotografia VARCHAR(160) NULL
);

CREATE TABLE Proveedores (
    ID_Proveedores INT AUTO_INCREMENT PRIMARY KEY,
    NombreProveedor VARCHAR(50) NOT NULL,
    Telefono VARCHAR(50) NOT NULL,
    Correo VARCHAR(100) NOT NULL,
    Direccion VARCHAR(150) NOT NULL
);

CREATE TABLE Venta_factura (
    NumeroFactura INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT NULL,
    Fecha DATE NULL
);

-- Insertando registros en la tabla usuarios
insert into Usuarios (usuario,contraseña)Values 
                     ('jose','jose123');

-- Insertando registros en la tabla Categorias
INSERT INTO Categorias (NombreCategoria) VALUES ('Electrónica'), ('Hogar'), ('Deportes');

-- Insertando registros en la tabla Cliente
INSERT INTO Cliente (Nombre, Apellido, Tipo_Cliente) VALUES
('Juan', 'Perez', 'Regular' ),
('Ana', 'Gomez', 'Premium');

-- Insertando registros en la tabla Producto
INSERT INTO Producto (Stock, ID_Categoria, PrecioCompra, PrecioVenta, nombreProducto, Descripcion, UbicacionFotografia) VALUES
(50, 1, 100.00, 150.00, 'Televisor 50"', 'Televisor 4K UHD', 'imagenes/tv50.jpg'),
(20, 2, 30.00, 50.00, 'Lámpara LED', 'Lámpara de escritorio LED', 'imagenes/lampara.jpg');

-- Insertando registros en la tabla Proveedores
INSERT INTO Proveedores (NombreProveedor, Telefono, Correo, Direccion) VALUES
('Tech Supply', '123456789', 'contact@techsupply.com', 'Calle 123, Ciudad'),
('Hogar Express', '987654321', 'info@hogarexpress.com', 'Avenida 456, Ciudad');

-- Insertando registros en la tabla Compra_factura
INSERT INTO Compra_factura (N_Factura, ID_Proveedores, Fecha) VALUES
(1001, 1, '2024-03-10'),
(1002, 2, '2024-03-11');

-- Insertando registros en la tabla Venta_factura
INSERT INTO Venta_factura (ID_Cliente, Fecha) VALUES
(1, '2024-03-15'),
(2, '2024-03-16');
