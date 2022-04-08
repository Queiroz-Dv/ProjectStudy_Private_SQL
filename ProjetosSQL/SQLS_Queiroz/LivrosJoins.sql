CREATE DATABASE [MX-Target-Library]
GO
USE [MX-Target-Library]
GO

CREATE TABLE Autor
(
    IdAutor INT IDENTITY PRIMARY KEY,
    Nome VARCHAR(30)
)
GO

CREATE TABLE Livro
(
    IdLivro INT IDENTITY PRIMARY KEY,
    Titulo VARCHAR(30),
    DataP DATE,
    IdAutor INT,
    FOREIGN KEY(IdAutor) REFERENCES Autor(IdAutor)
)
GO

INSERT INTO Autor
VALUES
    ('Joao'),
    ('Carlos'),
    ('Mariana'),
    ('Ana'),
    ('Elias')

GO

INSERT INTO Livro
VALUES
    ('Java', '20/04/2000', 2),
    ('HTML4', '10/09/2003', 1),
    ('C#', '13/05/2004', 3),
    ('Logica de Programacao', '02/02/2004', NULL),
    ('Linux', '19/05/2013', NULL)
GO

SELECT *
FROM Livro
SELECT *
FROM Autor 
GO

-- EESTUDO SOBRE JOINS --

-- INNER JOIN
/* Todos os campos com correspondência, ou seja,
os campos nulos são descartados */
SELECT
    *
FROM Livro
    INNER JOIN Autor
    ON Autor.IdAutor = Livro.IdAutor
GO

-- LEFT JOIN

-- SELECT Colunas
-- FROM TabelaEsquerda
-- LEFT JOIN TabelaDireita
-- ON TabelaEsquerda.Coluna = TabelaDireita.Coluna

/* Todos os campos da tabela da esquerda mesmo sem
correspondência com a direita, ou seja, ele trará todos os campos nulos.*/
SELECT
    Titulo,
    Nome
FROM Livro -- Tabela da esquerda. Prioridade 
    LEFT JOIN Autor -- Tabela da direita
    ON Autor.IdAutor = Livro.IdAutor
GO

-- LEFT JOIN -- Somente nulos -- Livros sem Autores -- As FKs são nulas
SELECT
    Titulo,
    Nome
FROM Livro -- Tabela da esquerda. Prioridade 
    LEFT JOIN Autor -- Tabela da direita
    ON Autor.IdAutor = Livro.IdAutor
WHERE Autor.IdAutor IS NULL -- Condição que irá trazer apenas os nulos
GO

-- RIGHT  JOIN

-- SELECT Colunas
-- FROM TabelaEsquerda
-- RIGHT JOIN TabelaDireita 
-- ON TabelaEsquerda.Coluna = TabelaDireita.Coluna
SELECT
    Nome AS 'AutorLivro',
    Titulo AS 'Titulo do Livro'
FROM Livro
    RIGHT JOIN Autor
    ON Autor.IdAutor = Livro.IdAutor
GO

-- RIGHT JOIN -- Somente Autores sem livros
SELECT
    Nome AS 'AutorLivro',
    Titulo AS 'Titulo do Livro'
FROM Livro
    RIGHT JOIN Autor
    ON Autor.IdAutor = Livro.IdAutor
WHERE Livro.IdAutor IS NULL -- Livros sem Autores
GO

-- FULL JOIN

-- SELECT Colunas
-- FROM Tabela1
-- FULL JOIN Tabela2
-- ON Tabela1.Coluna = Tabela2.Coluna

-- FULL JOIN -- Prioriza ambas as tabelas 
SELECT
    Nome AS 'AutorLivro',
    Titulo AS 'Titulo do Livro'
FROM Livro
    FULL JOIN Autor
    ON Autor.IdAutor = Livro.IdAutor
GO

-- FULL JOIN -- Com condição para nulos
SELECT
    Nome AS 'AutorLivro',
    Titulo AS 'Titulo do Livro'
FROM Livro
    FULL JOIN Autor
    ON Autor.IdAutor = Livro.IdAutor
    WHERE Livro.IdAutor IS NULL -- Irá trazer os valores nulos de ambas as tabelas
GO