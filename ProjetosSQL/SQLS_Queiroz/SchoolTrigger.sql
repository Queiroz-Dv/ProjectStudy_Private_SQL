CREATE DATABASE [Good-High-School]
GO
USE [Good-High-School]

--- Estudos sobre Triggers ---

CREATE TABLE Aluno
(
    IdAluno INT IDENTITY PRIMARY KEY,
    Nome VARCHAR(30),
    Sexo CHAR(1),
    Cidade CHAR(12),
    CHECK(Sexo IN('M', 'F'))
)
GO

INSERT INTO Aluno
VALUES
    ('Joao', 'M', 'SP'),
    ('Jorge', 'M', 'SP'),
    ('Pedro', 'M', 'SP'),
    ('Fatima', 'F', 'SP'),
    ('Lucia', 'F', 'RJ'),
    ('Ana', 'F', 'RJ')
GO

-- Tabela pra onde a trigger vai enviar as informações
CREATE TABLE NovosAlunos
(
    IdAluno INT,
    Nome VARCHAR(30)
)
GO

-- Trigger de Insert
CREATE TRIGGER TRG_NovosCadastros 
ON ALUNO
    FOR INSERT 
    AS
    DECLARE @ID INT, @NOME VARCHAR(30)
    SELECT @ID = IdAluno
FROM inserted 
    SELECT @NOME = Nome
FROM inserted

    INSERT INTO NovosAlunos
VALUES(@ID, @NOME)
    PRINT 'Trigger Running'
GO

-- Teste 
INSERT INTO Aluno
VALUES ('Daniela', 'F', 'SP')
GO

SELECT * FROM Aluno
SELECT * FROM NovosAlunos
GO
