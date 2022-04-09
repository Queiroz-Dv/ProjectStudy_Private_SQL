--- Estudo de Trigger para colunas ---
CREATE DATABASE [Target-Musical-Company]
GO
USE [Target-Musical-Company]
GO

CREATE TABLE Produto
(
    IdProduto INT IDENTITY PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL,
    Categoria VARCHAR(30) NOT NULL,
    Preco MONEY NOT NULL
)
GO

INSERT INTO Produto
VALUES
    ('Violao', 'Instrumentos de corda', 450.00),
    ('Violino', 'Instrumentos clássicos', 350.00),
    ('Teclado', 'Instrumentos eletrônicos', 500.00),
    ('Flauta', 'Instrumentos de sopro', 200.00)
GO

CREATE TABLE HistoricoPreco
(
    IdProduto INT,
    PrecoAntigo MONEY,
    PrecoNovo MONEY,
    DataAlteracao DATETIME,
    Usuario VARCHAR(30)
)
GO

SELECT *
FROM Produto
GO

-- TRIGGER UPDATE -- Apenas a coluna preco
CREATE TRIGGER TRG_PRECO
ON Produto
FOR UPDATE AS 
IF UPDATE(Preco) -- Vigia apenas a coluna preco
BEGIN
    DECLARE @Id INT,
            @PrecoA MONEY,
            @PrecoN MONEY,
            -- GetDATE()
            @Data DATETIME, 
            -- suser_name()
            @Usuario VARCHAR(30)

    -- Inserir valores na variavel
    SELECT @Id = IdProduto
    FROM DELETED
    SELECT @PrecoA = Preco
    FROM DELETED
    SELECT @PrecoN = Preco
    FROM INSERTED

    SET @Data = GETDATE()
    SET @Usuario = suser_name()

    -- Repassando valores para a tabela 
    INSERT INTO HistoricoPreco
    VALUES
        (
            @Id,
            @PrecoA,
            @PrecoN,
            @Data,
            @Usuario
            
        )
END
    PRINT 'Trigger realizada com sucesso'
GO