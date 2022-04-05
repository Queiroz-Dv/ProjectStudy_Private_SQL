

-- 1. Comando Create DDL --
CREATE DATABASE NomeBanco

CREATE TABLE NomeTabela 
(
NomeDoCampo Tipo Regra,
NomeDoCampo Tipo Regra,
NomeDoCampo Tipo Regra,
Restrições
)

-- 2. Comando Alter DDL --

-- Inclusão--
ALTER TABLE NomeTabela ADD Coluna Tipo Restrição;
-- Exclusão(Para excluir um campo não pode conter dados inseridos)--
ALTER TABLE NomeTabela DROP Coluna

-- 3. DROP DDL --
DROP DATABASE NomeBanco
DROP TABLE NomeTabela
-------------------------------------------------------------

-- 1. Comando Insert - DML --
INSERT INTO NomeTabela(Colunas, NULL) Values (Valores);
INSERT INTO NomeTabela Values (Valores);

-- 2. Comando Update - DML --
UPDATE NomeTabela SET Coluna = NovoValor WHERE COndição;

-- 3. Comando Delete - DML --
DELETE FROM NomeTabela Where Condição