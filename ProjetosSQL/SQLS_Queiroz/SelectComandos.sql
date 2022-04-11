-- Selecionando colunas específias
SELECT
  IdAluno,
  Nome,
  Cidade
FROM Aluno;
GO

-- Selecionando e usando Alias
SELECT
  IdAluno AS "Codigo",
  Nome AS "Nome do ALuno"
FROM Aluno;
GO

-- Selecionando com Distinct
-- ANTES
SELECT
  Cidade
FROM Aluno
GO

-- Depois
SELECT DISTINCT
  Cidade
FROM Aluno
GO

-- Cálculos
SELECT
   Nome AS Curso,
   Valor,
   Valor/CargaHoraria,
   Round(Valor/CargaHoraria,2) AS ValorHora
FROM
    Curso
ORDER BY ValorHora     -- Apelido de coluna só funciona com ORDER BY
GO

SELECT * FROM Contrato

UPDATE Contrato SET
Desconto = NULL
WHERE IdContrato = 4;
GO
-- Exemplo de valor nulo
SELECT
  IdContrato,
  Total,
  Desconto,
  Total+Desconto
FROM Contrato
GO

-- Exemplo de uso do NVL para dados nulos
SELECT
  IdContrato,
  Desconto,
  Nvl(Desconto,0),
  Total,
  Total + NVL(Desconto,0) AS TotalMaisDesconto
FROM Contrato
GO
