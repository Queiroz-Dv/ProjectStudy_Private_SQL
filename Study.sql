USE [Curso];

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

CREATE INDEX [IX_Aluno_Email] ON [Aluno]([Email])
DROP INDEX [IX_Aluno_Email] ON [Aluno]

USE [Curso];

CREATE TABLE [dbo].[ProgressoCurso]
(
    [AlunoId] INT NOT NULL,
    [CursoId] INT NOT NULL,
    [Progresso] INT NOT NULL,
    [UltimaAtualizacao] DATETIME NOT NULL DEFAULT(GETDATE()),

    CONSTRAINT PK_ProgressoCurso PRIMARY KEY([AlunoId], [CursoId])
);
DROP TABLE [ProgressoCurso];

CREATE TABLE [dbo].[Categoria]
(
    [Id] INT,
    [Nome] NVARCHAR(80) NOT NULL,

    CONSTRAINT [PK_Categoria] PRIMARY KEY([Id]),
);


USE[Curso]
GO
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
DROP TABLE[Curso]
