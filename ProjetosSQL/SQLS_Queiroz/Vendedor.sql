CREATE TABLE Vendedor 
(
IdVendedor INT IDENTITY PRIMARY KEY,
Nome VARCHAR (30),
Sexo CHAR(1),
Janeiro FLOAT,
Fevereiro FLOAT,
CHECK(Sexo IN('M', 'F')) -- Limita o que precisa estar em uma coluna 
 )
 GO

 INSERT INTO Vendedor VALUES
 ('Roberto', 'M', 2000.00,1300.00),
 ('Ana', 'F', 5200.00,1200.00),
 ('Paulo', 'M', 1000.00,2700.00),
 ('Maria', 'F', 2000.00,2000.00)
 GO

 SELECT * FROM Vendedor

 -- Uso do Max em Janeiro
 SELECT MAX(Janeiro) AS 'TotalVendas' FROM Vendedor
 GO

 -- Uso do Max em Fevereiro
 SELECT MAX(Fevereiro) AS 'TotalVendas' FROM Vendedor
 GO

  -- Uso do MIN em Janeiro
 SELECT MIN(Janeiro) AS 'TotalVendas' FROM Vendedor
 GO

 -- Uso do MIN em Fevereiro
 SELECT MIN(Fevereiro) AS 'TotalVendas' FROM Vendedor
 GO

  -- Uso do Sum em Janeiro
 SELECT SUM(Janeiro) AS 'TotalVendas' FROM Vendedor
 GO

 -- Uso do Sum em Fevereiro
 SELECT SUM(Fevereiro) AS 'TotalVendas' FROM Vendedor
 GO

  -- Uso do Avg em Janeiro
 SELECT AVG(Janeiro) AS 'TotalVendas' FROM Vendedor
 GO

 -- Uso do Avg em Fevereiro
 SELECT AVG(Fevereiro) AS 'TotalVendas' FROM Vendedor
 GO

