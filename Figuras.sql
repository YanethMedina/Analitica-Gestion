Use Figuras;

CREATE TABLE Figuras(
	ID INT NOT NULL PRIMARY KEY,
	Nombre VARCHAR(50),
	Tipo VARCHAR(50),
	Lado DECIMAL(18,2), 
	Altura DECIMAL(18,2),
	Diametro DECIMAL(18,2),
	Apotema DECIMAL(18,2)
);

CREATE TABLE Areas(
	ID INT NOT NULL PRIMARY KEY,
	Nombre VARCHAR(50),
	Area DECIMAL(18,2)
);

INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Altura) VALUES ('1', 'Cuadrado1', 'Cuadrado', '5', '5');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Altura) VALUES ('2', 'Cuadrado2', 'Cuadrado', '13', '13');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Altura) VALUES ('3', 'Cuadrado3', 'Cuadrado', '7', '7');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Altura) VALUES ('4', 'Cuadrado4', 'Cuadrado', '4.8', '4.8');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Altura) VALUES ('5', 'Cuadrado5', 'Cuadrado', '3', '3');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Altura) VALUES ('6', 'Cuadrado6', 'Cuadrado', '9', '9');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Altura) VALUES ('7', 'Rectangulo1', 'Rectangulo', '2', '8');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Altura) VALUES ('8', 'Rectangulo2', 'Rectangulo', '6', '5');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Altura) VALUES ('9', 'Rectangulo3', 'Rectangulo', '2.3', '4.8');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Altura) VALUES ('10', 'Rectangulo4', 'Rectangulo', '9.1', '7.5');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Altura) VALUES ('11', 'Rectangulo5', 'Rectangulo', '15', '8');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Altura) VALUES ('12', 'Rectangulo6', 'Rectangulo', '10', '3');
INSERT INTO Figuras (ID, Nombre, Tipo, Diametro) VALUES ('13', 'Circulo1', 'Circulo', '5');
INSERT INTO Figuras (ID, Nombre, Tipo, Diametro) VALUES ('14', 'Circulo2', 'Circulo', '4');
INSERT INTO Figuras (ID, Nombre, Tipo, Diametro) VALUES ('15', 'Circulo3', 'Circulo', '7');
INSERT INTO Figuras (ID, Nombre, Tipo, Diametro) VALUES ('16', 'Circulo4', 'Circulo', '5');
INSERT INTO Figuras (ID, Nombre, Tipo, Diametro) VALUES ('17', 'Circulo5', 'Circulo', '8');
INSERT INTO Figuras (ID, Nombre, Tipo, Diametro) VALUES ('18', 'Circulo6', 'Circulo', '13');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Apotema) VALUES ('19', 'Pentagono1', 'Poligono', '10', '8.5');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Apotema) VALUES ('20', 'Pentagono2', 'Poligono', '8', '3.5');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Apotema) VALUES ('21', 'Pentagono3', 'Poligono', '6', '4.1');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Apotema) VALUES ('22', 'Pentagono4', 'Poligono', '3', '2');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Apotema) VALUES ('23', 'Pentagono5', 'Poligono', '15', '2');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Apotema) VALUES ('24', 'Pentagono6', 'Poligono', '25', '3.4');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Altura) VALUES ('25', 'Triangulo1', 'Triangulo', '6', '6');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Altura) VALUES ('26', 'Triangulo2', 'Triangulo', '45', '5');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Altura) VALUES ('27', 'Triangulo3', 'Triangulo', '3', '8');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Altura) VALUES ('28', 'Triangulo4', 'Triangulo', '14', '5.8');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Altura) VALUES ('29', 'Triangulo5', 'Triangulo', '12', '18');
INSERT INTO Figuras (ID, Nombre, Tipo, Lado, Altura) VALUES ('30', 'Triangulo6', 'Triangulo', '10', '15');

SELECT * FROM Figuras;

-->Crear Store Procedure para Insertar Datos
CREATE PROCEDURE InsertarDatos
	(
	@ID INT,
	@Nombre VARCHAR(50),
	@Tipo VARCHAR(50),
	@Lado DECIMAL(18,2), 
	@Altura DECIMAL(18,2),
	@Diametro DECIMAL(18,2),
	@Apotema DECIMAL(18,2)
	)
AS
BEGIN
insert into Figuras(ID, Nombre, Tipo, Lado, Altura, Diametro, Apotema) values(@ID, @Nombre, @Tipo, @Lado, @Altura, @Diametro, @Apotema);
END

EXEC InsertarDatos '31', 'Cubo', 'Cuadrado', '25', '25', '0', '0';

-->Crear Funcion Para Calcular Area
DROP FUNCTION IF EXISTS CalcularArea;
CREATE FUNCTION CalcularArea(@ID INT)
RETURNS DECIMAL(18,2)
AS
BEGIN 
	DECLARE @Area DECIMAL(18,2);
	DECLARE @Lado DECIMAL(18,2);
	DECLARE @Altura DECIMAL(18,2);
	DECLARE @Diametro DECIMAL(18,2);
	DECLARE @Apotema DECIMAL(18,2);
	DECLARE @Tipo VARCHAR(50);

	SELECT @Lado = Lado, @Altura = Altura, @Diametro = Diametro, @Apotema = Apotema, @Tipo = Tipo FROM Figuras WHERE ID = @ID;
	IF (@Tipo = 'Cuadrado')
		SET @Area = @Lado * @Altura;
	ELSE IF (@Tipo = 'Rectangulo')
		SET @Area = @Lado * @Altura ;
	ELSE IF (@Tipo = 'Circulo')
		SET @Area =  0.25 * 3.14 * @Diametro;
	ELSE IF (@Tipo = 'Poligono')
		SET	@Area = ((5 * @Lado) * @Apotema ) /2;
	ELSE IF (@Tipo = 'Triangulo')
		SET @Area = (@Lado * @Altura) / 2 ;
	ELSE  
		SET @Area = NULL;
	RETURN @Area;
END;

DECLARE @Area DECIMAL(18,2);
SET @Area = dbo.CalcularArea(15);
SELECT @Area as Area FROM Figuras;

-->Crear Store Procedure para Insertar Datos a Tabla Areas
-->Tabla Areas
	--ID
	--Nombre
	--Area
CREATE PROCEDURE Prueba3(@ID INT, @Nombre VARCHAR(50), @Area DECIMAL(18,2))
AS
BEGIN
    IF OBJECT_ID('dbo.AreasIns', 'U') IS NOT NULL
        DROP TABLE dbo.AreasIns;
    SELECT 
        @ID = ID,
		@Nombre = Nombre,
		@Area = dbo.CalcularArea(@ID)  
    FROM Figuras
	Where @ID = ID;
    insert into Areas(ID, Nombre, Area) values(@ID, @Nombre, @Area);
    PRINT 'Tabla creada exitosamente.';
END;

EXEC Prueba3 '32', 'Circulito', '36.3';

select * from Areas;