--- INNER JOIN COM 3 TABELAS ---

SELECT
    -- O que precisa?
    E.Nome AS NomeEscola, -- Nome da Escola
    A.Nome AS NomeAluno, -- Nome do Aluno
    T.Turno
-- Nome do Turno 
FROM Escola E -- De qual tabela?
    INNER JOIN Aluno A -- Primeira tabela
    ON E.CNPJ = A.FK_CNPJ -- Onde CNPJ da Escola seja igual ao do Aluno
    INNER JOIN Turma T -- Segunda tabela 
    ON T.Codigo = A.FK_CodigoT -- Onde Turno seja igual ao do Aluno
GO

-- INNER JOIN N:N --
SELECT P.Nome, D.Nome
FROM Professor P
INNER JOIN Professor_Disciplina DP
ON P.Matricula = DP.FK_Matricula
INNER JOIN Disciplina D
ON D.Codigo = DP.FK_Codigo