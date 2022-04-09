CREATE DATABASE [Target-Premium-Company]
GO
USE [Target-Premium-Company]
GO

CREATE TABLE Cliente
(
    IdCliente INT IDENTITY PRIMARY KEY,
    Nome VARCHAR(30),
    Salario MONEY
)
GO

CREATE TABLE HistoricoSalario
(
    IdCliente INT,
    SalarioAntigo MONEY,
    SalarioAtual MONEY
)
GO

INSERT INTO Cliente
VALUES
    ('Jose Carlos', 2500),
    ('Fernanda', 1500),
    ('Claudia', 2000),
    ('Paulo', 3000)
GO

SELECT *
FROM Cliente
SELECT *
FROM HistoricoSalario
GO

-- Trigger mais simplificada(sem variaveis)

--ANTES (Com variaveis)
CREATE TRIGGER TG_HISTORICO_COM_VARIAVEL
ON Cliente
FOR UPDATE AS
IF UPDATE(Salario)
BEGIN
    -- Declaracao de variaveis
    DECLARE @SalarioAntigo MONEY
    DECLARE @SalarioNovo MONEY

    -- Insercao de valores
    SELECT @SalarioAntigo = Salario
    FROM deleted
    SELECT @SalarioNovo = Salario
    FROM inserted

    -- Insercao na tabela
    INSERT INTO HistoricoSalario
    VALUES
        (
            @SalarioAntigo,
            @SalarioNovo
        )
END
GO

-- DEPOIS(Sem variaveis)
CREATE TRIGGER TG_HISTORICOS_SEM_VARIAVEL
ON Cliente
FOR UPDATE AS
IF UPDATE(Salario)
BEGIN
    -- Insercao na tabela
    INSERT INTO HistoricoSalario
    SELECT D.IdCliente, D.Salario, I.Salario
    FROM deleted D, inserted I
END
GO

DELETE  FROM Cliente
DELETE FROM HistoricoSalario
GO

-- Introdução a Transações -- ROLLBACK TRANSACTION
GO
CREATE TRIGGER TG_HISTORICOS_SEM_VARIAVEL
ON Cliente
FOR INSERT, UPDATE 
AS
    DECLARE 
        @SalarioAntigo MONEY,
        @SalarioNovo MONEY,
        @Id INT

        SELECT @SalarioAntigo = Salario
FROM deleted

        SELECT @SalarioNovo = Salario
FROM inserted

        SELECT @Id = IdCliente
FROM inserted

        IF(@SalarioNovo> 6000)
        BEGIN
    PRINT 'Não aceitamos salarios acima de 6.000,00'
    ROLLBACK TRANSACTION
END
        ELSE
        BEGIN
    INSERT INTO HistoricoSalario
    VALUES
        (
            @Id,
            @SalarioAntigo,
            @SalarioNovo
        )
END