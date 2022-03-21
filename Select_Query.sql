SELECT TOP 100
    [Id], [Nome], [CategoriaId]
FROM
    [Curso]
-- WHERE
--     [CategoriaId] = 1 
ORDER BY
    [Nome] DESC;

--MIN
SELECT TOP 100
    MIN([Id])
FROM
    [Curso];

--MAX
SELECT TOP 100
    MAX([Id])
FROM
    [Curso];

--Count
SELECT TOP 100
    Count([Id])
FROM
    [Curso];

--AVG
SELECT TOP 100
    AVG([Id])
FROM
    [Curso];

--SUM
SELECT TOP 100
    SUM([Id])
FROM
    [Curso];

--LIKE
SELECT TOP 100
    *
FROM
    [Curso]
WHERE
[Nome] LIKE '%Fundamentos%';

-- IN
SELECT TOP 100
    *
FROM
    [Curso]
WHERE
[Id] IN (1,2);

-- BETWEEN

SELECT TOP 100
    *
FROM
    [Curso]
WHERE
[Id] BETWEEN 1 and 10;

-- ALIAS Apelido
SELECT TOP 100
    [Id] AS [Codigo],
    [Nome]
FROM
    [Curso];

-- Inner Join
-- Esse Join pega a intersecção de todos os cursos que esteja na categoria 
SELECT TOP 100
    [Curso].[Id],
    [Curso].[Nome],
    [Categoria].[Id] AS [Categoria],
    [Categoria].[Nome]
FROM
    [Curso]
    INNER JOIN [Categoria]
    ON [Curso].[Categoria] = [Categoria].[Id];

-- Left Join
-- Esse join todos os itens da primeira tabela que é curso
SELECT TOP 100
    [Curso].[Id],
    [Curso].[Nome],
    [Categoria].[Id] AS [Categoria],
    [Categoria].[Nome]
FROM
    [Curso]
    LEFT JOIN [Categoria]
    ON [Curso].[Categoria] = [Categoria].[Id];

-- Right Join
-- Esse join todos os itens da segunda tabela que é categoria
SELECT TOP 100
    [Curso].[Id],
    [Curso].[Nome],
    [Categoria].[Id] AS [Categoria],
    [Categoria].[Nome]
FROM
    [Curso]
    RIGHT JOIN [Categoria]
    ON [Curso].[Categoria] = [Categoria].[Id];

-- FULL Join
-- Esse join pega todos os itens da primeira e da segunda tabela
SELECT TOP 100
    [Curso].[Id],
    [Curso].[Nome],
    [Categoria].[Id] AS [Categoria],
    [Categoria].[Nome]
FROM
    [Curso]
    FULL JOIN [Categoria]
    ON [Curso].[Categoria] = [Categoria].[Id];

-- Union
--Ele uni e agrupa as tabelas 
    SELECT TOP 100
        *
    FROM
        [Curso]
UNION
    -- Precisa de dados similares
    SELECT TOP 100
        *
    FROM
        [Categoria];

-- Group By
SELECT TOP 100
    [Categoria].[Nome],
    COUNT([Curso].[CategoriaId]) AS [Cursos]
FROM
    [Categoria]
    INNER JOIN [Curso]
    ON [Curso].[CategoriaId] = [Categoria].[Id]
GROUP BY
[Categoria].[Nome],
  [Curso].[CategoriaId];

--HAVING
SELECT TOP 100
    [Categoria].[Nome],
    COUNT([Curso].[CategoriaId]) AS [Cursos]
FROM
    [Categoria]
    INNER JOIN [Curso]
    ON [Curso].[CategoriaId] = [Categoria].[Id]
GROUP BY
[Categoria].[Nome],
  [Curso].[CategoriaId]
HAVING -- Filtro 
   COUNT([Curso].[CategoriaId]) > 2;


--VIEW
-- Serve pra criar um snapshot de um select
-- CREATE OR ALTER VIEW vwContagemCursoseCategoria AS
-- SELECT TOP 100
--     [Categoria].[Nome],
--     COUNT([Curso].[CategoriaId]) AS [Cursos]
-- FROM
--     [Categoria]
--     INNER JOIN [Curso]
--     ON [Curso].[CategoriaId] = [Categoria].[Id]
-- GROUP BY
-- [Categoria].[Nome],
--   [Curso].[CategoriaId]
-- HAVING -- Filtro 
--    COUNT([Curso].[CategoriaId]) > 2;
