USE[QueirozCursos]
SELECT *
FROM [Categoria]

BEGIN TRANSACTION
UPDATE
[Categoria]
SET
[Nome]
= 'WebDeveloper'
 WHERE
 [Id]= 4
COMMIT