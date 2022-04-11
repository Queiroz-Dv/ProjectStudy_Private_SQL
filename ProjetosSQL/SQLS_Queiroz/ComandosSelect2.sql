SELECT * FROM Aluno
GO
 -- Alter Table Aluno e Drop Column
ALTER TABLE Aluno ADD Estado CHAR(2) DEFAULT 'RJ';
ALTER TABLE Aluno ADD Salario NUMBER(8,2) DEFAULT 620;
GO

UPDATE Aluno
  SET
     Estado = 'AC',
     Salario = 250
WHERE IdAluno = 1
GO

UPDATE Aluno
  SET
     Estado = 'MT',
     Salario = 2000
WHERE IdAluno = 2
GO

UPDATE Aluno
  SET
     Estado = 'RJ',
     Salario = 3250
WHERE IdAluno = 3
GO

UPDATE Aluno
  SET
     Estado = 'SP',
     Salario = 800
WHERE IdAluno = 4
GO

SELECT * FROM Aluno
COMMIT;

----------------------------
SELECT * FROM Aluno
WHERE Estado <> 'RS' -- diferente de RS
AND Salario <= 800
ORDER BY Salario DESC
GO

INSERT INTO Aluno (IdAluno, Nome, Cidade)
VALUES (4, 'Valdo', 'Quatro Irmaos')
GO

INSERT INTO Aluno (IdAluno, Nome, Cidade)
VALUES (5, 'Aldo', 'Dois Irmaos')
GO

INSERT INTO Aluno (IdAluno, Nome, Cidade)
VALUES (6, 'Frida', 'Canoas')
GO

UPDATE Aluno
 SET
  Estado = 'SP',
  Salario = 900,
  Nome = 'Pedro'
WHERE IdAluno = 5
GO

SELECT
  Estado,
  Salario,
  Nome
FROM Aluno
ORDER BY Estado, Salario DESC
GO

-- DATAS
ALTER TABLE Aluno ADD Nascimento DATE DEFAULT SYSDATE - 1000;
GO

SELECT SYSDATE - SYSDATE - 100 FROM DUAL;
GO

UPDATE ALUNO SET
Nascimento = '10/10/2001'
WHERE IdAluno = 1
GO

SELECT * FROM Aluno

UPDATE ALUNO SET
Nascimento = '10/08/2000'
WHERE IdAluno = 2
GO

-- Não retorna nenhum valor porque não tem a hora
SELECT
  IdAluno,
  Nascimento,
  Nascimento,
  Nome
FROM Aluno
WHERE Trunc(Nascimento) = '25/10/2010'
GO

-- TRUNC retira a hora
SELECT
  IdAluno,
  Nascimento,
  Trunc(Nascimento),
  Nome
FROM Aluno
WHERE Nascimento
  BETWEEN TO_DATE('21/05/2019 15:00', 'DD/MM/YYYY HH24:MI')
    AND TO_DATE('21/05/2019 21:00', 'DD/MM/YYYY HH24:MI')
GO
------------
SELECT
  IdContrato,
  Data,
  Total,
  Desconto,
  Desconto + 1000 AS Calculo
FROM Contrato
WHERE Total <= Desconto + 1000
GO
---------
SELECT * FROM Contrato
----------
UPDATE Contrato SET
Desconto = NULL
WHERE IdContrato = 2
---------
SELECT * FROM Contrato
WHERE Desconto IS NULL
----------
SELECT * FROM Contrato
WHERE Desconto IS NOT NULL
---------
SELECT * FROM Contrato
WHERE Desconto BETWEEN 0 AND 10
---------

SELECT
  IdContrato,
  Total,
  Desconto,
  Nvl(Desconto, 0)
FROM Contrato
WHERE Nvl(Desconto, 0) BETWEEN 0 AND 10

-----------------------
-- Mesmo efeito com between
SELECT * FROM Contrato
WHERE Desconto >= 0
AND Desconto <= 10
-----------------

-- IN /// NOT IN
SELECT * FROM Item
WHERE IdCurso IN(1,2,4)

-- Que não esteja na lista
SELECT * FROM Item
WHERE IdCurso NOT IN(1, 2, 4)


INSERT INTO Curso VALUES(5, 'Windows', 1000, 50)
SELECT * FROM Curso
----
-- Cursos Não vendidos
SELECT * FROM Curso
WHERE IdCurso NOT IN (SELECT IdCurso FROM Item)

-- Cursos Vendidos
SELECT * FROM Curso
WHERE IdCurso IN(SELECT IdCurso FROM Item)

--- Equivalente ao select in
SELECT * FROM Item
WHERE IdCurso = 1
OR IdCurso = 2
OR IdCurso = 4

-- Somente onde a segunda letra seja A
SELECT * FROM Curso WHERE Nome LIKE 'W%'   -- Registros que inicia com  W
SELECT * FROM Curso

ALTER TABLE Curso ADD Pre_Req INTEGER

COMMIT;

UPDATE Curso SET
Pre_Req = 1
WHERE IdCurso = 2

UPDATE Curso SET
Pre_Req = 3
WHERE IdCurso = 4

-- Cursos sem pre requisito
SELECT * FROM Curso WHERE Pre_Req IS NULL

-- Curso com pre requisitos
SELECT * FROM Curso WHERE Pre_Req IS NOT NULL

-- Precedência de operadores
-- 1 ()
-- 2 AND
-- 3 OR
SELECT * FROM Curso
WHERE Valor > 750 OR Valor < 1000 AND CargaHoraria = 25
----------

SELECT * FROM Curso
WHERE (Valor > 750 OR Valor < 1000) AND CargaHoraria = 25