USE [Curso]

-- Cria uma nova tabela chamada '[Aluno]' no banco '[Curso]'
-- Excluí a tabela se ela já existe
IF OBJECT_ID('[dbo].[Aluno]', 'U') IS NOT NULL
DROP TABLE [dbo].[Aluno]
GO
-- Cria a tabela 
CREATE TABLE [dbo].[Aluno]
(
    [Id] INT,
    [Nome] NVARCHAR(80),
    [Nascimento] DATETIME,
    [Active] BIT,
);
GO