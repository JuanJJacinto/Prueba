
USE BD_empresa
--Creacion de Tabla Categoria
CREATE TABLE Categoria(
	CodigoCategoria INT NOT NULL,
	NombreCategoria VARCHAR(50),
	CONSTRAINT pk_Categoria PRIMARY KEY(CodigoCategoria)
)

--ceacion Tabla Producto
CREATE TABLE Producto(
	CodigoProducto INT NOT NULL,
	NombreProducto VARCHAR(60),
	PrecioUnitario DECIMAL(10,2),
	CodigoCategoria INT NOT NULL,
	CONSTRAINT pk_Producto PRIMARY KEY(CodigoProducto),
	CONSTRAINT fk_Producto_Categoria FOREIGN KEY(CodigoCategoria)
		REFERENCES Categoria(CodigoCategoria)
)
GO
INSERT INTO Categoria  VALUES (1,'Bebidas') 
GO

--Se muestra la informacion
SELECT * FROM Categoria
GO

INSERT INTO Categoria(CodigoCategoria, NombreCategoria) VALUES (2, 'Carnes rojas')
INSERT INTO Categoria(NombreCategoria, CodigoCategoria) VALUES ('Harinas', 3)
GO

INSERT INTO Categoria  VALUES 
(4,'Vegetales'),
(5,'Frutas'),
(6,'Mariscos')
GO


--Insercion de productos
INSERT INTO Producto  VALUES 
(1, 'Coca - Cola',  0.60, 1),
(2, 'Carne Lomo',  6.50, 2),
(3, 'Camarones pequeños',  4.50, 6),
(4, 'Harina Doña Blanca',  1.00, 3),
(5, 'Te Verde',  2.00, 1),
(6, 'Carne molida Premium',  3.50, 2),
(7, 'Jugo de naranja',  1.00, 1),
(8, 'Pera',  1.00, 5),
(9, 'Guisquil',  1.25, 4),
(10, 'Manzana gala',  1.50, 5),
(11, 'Zanahoria',  0.75, 4)
GO

SELECT * FROM Producto
GO


SELECT * INTO [Producto CategoriaBebidas]
FROM Producto
WHERE CodigoCategoria = 1
GO

SELECT * FROM [Producto CategoriaBebidas]
GO


CREATE TABLE [Producto CategoriaVegetales]
(
	CodigoProducto INT NOT NULL,
	NombreProducto VARCHAR(60),
	PrecioUnitario DECIMAL(10,2),
	CodigoCategoria INT,
	CONSTRAINT PK_Producto1 PRIMARY KEY (CodigoProducto),
	CONSTRAINT FK_Producto1_Categoria1 FOREIGN KEY (CodigoCategoria)
		REFERENCES Categoria(CodigoCategoria)
)
GO

SELECT * FROM [Producto CategoriaVegetales]
GO



INSERT INTO [Producto CategoriaVegetales]
SELECT CodigoProducto, NombreProducto, PrecioUnitario, CodigoCategoria
FROM Producto
WHERE CodigoCategoria = 4
GO

SELECT * FROM [Producto CategoriaVegetales]
GO