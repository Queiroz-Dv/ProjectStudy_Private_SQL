USE [Curso]

ALTER TABLE [Aluno]
    ADD [Document] NVARCHAR(11)


-- Drop '[Document]' da tabela '[Aluno]' no banco '[Curso]'
ALTER TABLE [dbo].[Aluno]
    DROP COLUMN [Document]
GO

ALTER TABLE [Aluno]
    ALTER COLUMN [Document] CHAR(11)