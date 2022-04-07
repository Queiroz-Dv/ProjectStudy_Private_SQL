CREATE TABLE Editor
(
    EditorId INT IDENTITY PRIMARY KEY,
    Nome VARCHAR(30)
)
GO

CREATE TABLE Livro
(
    LivroID INT IDENTITY PRIMARY KEY,
    Nome Varchar(30),
    Paginas INT,
    FK_EditorId INT ,
    FOREIGN key(FK_EditorId) 
        REFERENCES Editor(EditorId)
)
GO

INSERT INTO Editor
VALUES
    ('Mario'),
    ('Joao'),
    ('Paulo'),
    ('Ana'),
    ('Beatriz'),
    ('Carlos'),
    ('Alexandre'),
    ('Marli')
GO

INSERT INTO Livro
VALUES
    ('Java', 500, 1),
    ('CSharp', 300, 2),
    ('Ruby', 150, 3),
    ('BD', 60, 4),
    ('Informatica', 80, 5),
    ('Culinaria', 120, 6),
    ('Java 2008', 300, 7),
    ('Java 2016', 400, 8)
GO

SELECT *
FROM Editor
SELECT *
FROM Livro
GO

----- TABELA 1:N -----
-- SEM INNER JOIN | FORMA ERRADA

SELECT Editor.Nome, Livro.Nome, Paginas
FROM Editor, Livro
WHERE Editor.EditorId = Livro.FK_EditorId
GO

-- COM INNER JOIN | FORMA CORRETA

SELECT Editor.Nome, Livro.Nome, Paginas
FROM Editor -- De qual tabela?
    INNER JOIN Livro -- Com quem quero unir?
    ON Editor.EditorId = Livro.FK_EditorId  -- Com qual condição?
GO

-- COM INNER JOIN | USO DO ALIAS
SELECT
    E.Nome AS NomeEditor,
    L.Nome AS NomeLivro,
    L.Paginas
FROM Editor AS E -- Editor identificado como "E"
    INNER JOIN Livro AS L -- Livro identificado como "L"
    ON E.EditorId = L.FK_EditorId
GO