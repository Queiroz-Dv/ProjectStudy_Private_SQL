USE [Curso];
-- Cria a tabela 
DROP TABLE [Aluno];
CREATE TABLE [dbo].[Aluno]
(
  [Id] INT,
  [Nome] NVARCHAR(80) NOT NULL,
  [Email] NVARCHAR(100) NOT NULL,
  [Nascimento] DATETIME NULL,
  [Active] BIT NOT NULL DEFAULT(0),

  CONSTRAINT [PK_Aluno] PRIMARY KEY([Id]),
  CONSTRAINT [UQ_Aluno_Email] UNIQUE ([Email]),
);




USE [Curso]

ALTER TABLE [Aluno]
    ADD [Document] NVARCHAR(11)


-- Drop '[Document]' da tabela '[Aluno]' no banco '[Curso]'
ALTER TABLE [dbo].[Aluno]
    DROP COLUMN [Document]
GO

ALTER TABLE [Aluno]
    ALTER COLUMN [Document] CHAR(11)