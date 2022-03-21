
-- Create a new database called 'QueirozCursos'
-- Connect to the 'master' database to run this snippet
USE master
GO
-- Create the new database if it does not exist already
IF NOT EXISTS (
    SELECT name
FROM sys.databases
WHERE name = N'QueirozCursos'
)
CREATE DATABASE QueirozCursos
GO

USE[QueirozCursos]
CREATE TABLE [dbo].[Categoria]
(
  [Id] INT NOT NULL IDENTITY(1, 1),
  [Nome] NVARCHAR(80) NOT NULL,

  CONSTRAINT [PK_Categoria] PRIMARY KEY([Id]),
);
GO

USE[QueirozCursos]
CREATE TABLE[Curso]
(
  [Id] INT NOT NULL IDENTITY(1, 1),
  [Nome] NVARCHAR(88) NOT NULL,
  [CategoriaId] INT NOT NULL,

  CONSTRAINT [PK_Curso] PRIMARY KEY([Id]),
  CONSTRAINT [FK_Curso_Categoria] FOREIGN KEY([CategoriaId])
REFERENCES [Categoria]([Id])
);
GO

USE[QueirozCursos]
INSERT INTO [Categoria]
  ([Nome])
VALUES('Backend')
INSERT INTO [Categoria]
  ([Nome])
VALUES('Frontend')
INSERT INTO [Categoria]
  ([Nome])
VALUES('Mobile')
INSERT INTO [Categoria]
  ([Nome])
VALUES('FullStack')

USE[QueirozCursos]
INSERT INTO [Curso]
  ([Nome],[CategoriaId])
VALUES('Fundamentos de SQL', 1)
INSERT INTO [Curso]
  ([Nome],[CategoriaId])
VALUES('Fundamentos de POO', 1)
INSERT INTO [Curso]
  ([Nome],[CategoriaId])
VALUES('Fundamentos de Vue', 2)
INSERT INTO [Curso]
  ([Nome],[CategoriaId])
VALUES('Fundamentos de HTML, CSS e JS', 4)
INSERT INTO [Curso]
  ([Nome],[CategoriaId])
VALUES('Fundamentos de Android', 3)
