CREATE DATABASE Filtros;
GO 
USE Filtros;
GO

CREATE TABLE Pessoa
(
Id INT IDENTITY PRIMARY KEY,
Nome VARCHAR(30) NOT NULL,
Sexo CHAR(1),
Estado CHAR(2),
DataNasc DATE,
QtdFilhos INT,
Telefone VARCHAR(15),
Email VARCHAR(40)
)


INSERT INTO Pessoa VALUES('Joao Paulo', 'M', 'SP', '02/05/1969', 2, NULL, 'JoaoPaulo@gmail.com'),
('Ana Maria', 'F', 'BA', '07/04/1990', 0, '322121321', 'elem@gmail.com'),
('Felipe', 'M', 'SP', '31/12/1992', 1, '55554444', NULL),
('Pedro Rodrigues', 'M', 'RJ', '04/08/1970', 4, '88889999', 'pedro@gmail.com'),
('Carla', 'F', 'AM', '21/04/1997', 2, '77774432', 'silvia@hotmail.com'),
('Ana Carla', 'F', 'SP', '25/09/2000', 0, '158585854', NULL),
('Thiago', 'M', 'RJ', '30/03/1982', 2, '11111111', 'thiago@outlook.com'),
('Alice', 'F', 'AM', '02/03/1989', 3, '22222222', 'aline123@hotmail.com'),
('Andre', 'M', 'RS', '15/05/1990', 2, '33333333', NULL),
('David', 'M', 'RS', '07/01/1993', 1, '44444444', 'David25@hotmail.com'),
('Sabrina', 'F', 'SP', '22/12/1975', 3, '65656565', NULL),
('Raquel', 'F', 'SP', '14/11/1995', 0, NULL, 'Raquel@hotmail.com'),
('Marcos', 'M', 'RJ', '12/11/1993', 1, '36363636',NULL),
('Pablo', 'M', 'RJ', '01/03/1996', 0, NULL,NULL)
GO
-- Todas as pesoas com mais de dois filhos
SELECT * FROM Pessoa WHERE QtdFilhos > 2
GO

-- Todas as pessoas sem filhos
SELECT * FROM Pessoa WHERE QtdFilhos = 0
GO

-- Todos os homens
SELECT * FROM Pessoa WHERE Sexo = 'M'
GO

-- Todos os homens com até um filho
SELECT * FROM Pessoa WHERE Sexo = 'M' AND QtdFilhos IN(0,1)
GO

--  Todas as mulheres com o primeiro nome igual a carla
SELECT * FROM Pessoa WHERE Sexo = 'F' AND Nome LIKE 'carla'
GO

-- % Qualquer caracter ou nenhum
 SELECT * FROM Pessoa WHERE Nome LIKE '%carla'
 GO

 -- Todas as pessoas com trinta anos ou mais
 SELECT * FROM Pessoa WHERE DataNasc <= '31/12/1988'
 GO

 -- Todas as pessoas que não possuem email
 SELECT * FROM Pessoa WHERE Email IS NULL
 GO

 -- Todas as pessoas de vinte a trinta anos
 SELECT * FROM Pessoa WHERE DataNasc BETWEEN '01/01/1988' AND '31/12/1998'
 GO

 -- Relatório com todas as mulheres em ordem alfabética
 SELECT * FROM Pessoa WHERE Sexo = 'F' ORDER BY Nome
 GO

 -- Quantidade de pessoas registradas no banco
 SELECT COUNT(*) AS 'QtdPessoas' FROM Pessoa
 GO

 -- Todas as mulheres com filhos e com telefone
 SELECT * FROM Pessoa WHERE Sexo = 'F' AND QtdFilhos <> 0 AND Telefone IS NOT NULL
 GO

 -- Todas as mulheres que moram em SP e não tem Email
 SELECT * FROM Pessoa WHERE Sexo = 'F' AND Estado = 'SP' AND Email IS NULL
 GO

 -- Mulheres solteiras ou homens sem filhos
 SELECT * FROM Pessoa WHERE Sexo = 'F' AND QtdFilhos = 0 OR Sexo = 'M' AND QtdFilhos = 0
 GO
 
 -- Todas as mulheres com mais de trinta anos de SP ou homens do RS
 SELECT * FROM Pessoa WHERE 
 (Sexo = 'F' AND DataNasc < '31/12/1988' AND Estado = 'SP') OR
 (Sexo = 'M' AND Estado = 'RS')
 GO

 SELECT Sexo, COUNT(*) AS 'Total' FROM Pessoa GROUP BY Sexo