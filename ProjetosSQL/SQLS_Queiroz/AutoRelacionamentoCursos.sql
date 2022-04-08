CREATE DATABASE [MX-Target-Courses]
GO
USE [MX-Target-Courses]
GO
-- Estudo de auto relacionamento
CREATE TABLE Curso
(
    IdCurso INT IDENTITY PRIMARY KEY,
    Nome VARCHAR(30),
    Duracao INT,
    FK_IdCurso INT,
    FOREIGN KEY(FK_IdCurso) REFERENCES Curso(IdCurso)
)
GO

INSERT INTO Curso
VALUES
    ('BD', 50, NULL),
    ('Logica de Programacao', 30, NULL),
    ('Java Basico', 30, 2),
    ('Java Avançado', 30, 3),
    ('CSharp', 30, 2)
GO

SELECT *
FROM Curso
DROP TABLE Curso


------ 1 : 1 --- Um requisito pode pertencer a apenas um curso
CREATE TABLE Curso
(
    IdCurso INT IDENTITY PRIMARY KEY,
    Nome VARCHAR(30),
    Duracao INT,
    -- Ela não podera se repetir com o uso do UNIQUE
    FK_IdCurso INT UNIQUE,
    FOREIGN KEY(FK_IdCurso) REFERENCES Curso(IdCurso)
)
GO
-- Erro de duplicidade
INSERT INTO Curso
VALUES
    ('BD', 50, NULL),
    ('Logica de Programacao', 30, NULL),
    ('Java Basico', 30, 2),
    ('Java Avançado', 30, 3),
    ('CSharp', 30, 2)
GO

SELECT *
FROM Curso
GO


----- N:N -- Varios requisitos podem pertencer a varios cursos (+ adequado)
CREATE TABLE Cursos
(
    IdCurso INT IDENTITY PRIMARY KEY,
    Nome VARCHAR(30),
    Duracao INT,
    --FOREIGN KEY(FK_IdCurso) REFERENCES Curso(IdCurso)
)
GO
-- Tabela que coleta as duas FOREIGN KEY referenciando ela mesma
CREATE TABLE Curso_Requisito
(
    FK_IdCurso INT,
    FK_IdRequisito INT,
    FOREIGN KEY(FK_IdCurso) REFERENCES Cursos(IdCurso),
    FOREIGN KEY(FK_IdRequisito) REFERENCES Cursos(IdCurso)
)
GO

INSERT INTO Cursos
VALUES
    -- 1
    ('BD', 30),
    -- 2
    ('Logica de Programacao', 20),
    -- 3
    ('Java Basico', 35),
    -- 4
    ('Java Avançado', 30),
    -- 5
    ('CSharp', 50)

GO

INSERT INTO Curso_Requisito
VALUES
    (1, NULL),
    (2, NULL),
    (3, 2),
    (4, 3),
    (4, 2),
    (5, 2)
GO

SELECT * FROM Cursos
SELECT * FROM Curso_Requisito
GO
DROP TABLE Curso_Requisito 
DROP TABLE Cursos

