CREATE DATABASE [MX-Target School]
GO

USE [MX-Target School]
GO

CREATE TABLE Escola
(
    CNPJ VARCHAR(14) NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    Rua VARCHAR(30),
    Numero INT,
    Bairro VARCHAR(30),
    Cidade VARCHAR(30),
    UF CHAR(2),
    CEP VARCHAR(10)
)
GO

ALTER TABLE Escola 
    ADD CONSTRAINT PK_Escola_CNPJ
        PRIMARY KEY (CNPJ)
GO

CREATE TABLE Professor
(
    Matricula VARCHAR(10) NOT NULL,
    Nome VARCHAR(30) NOT NULL,
    CPF VARCHAR(11)
)
GO

ALTER TABLE Professor 
    ADD CONSTRAINT PK_Professor_Matricula 
        PRIMARY KEY(Matricula)
GO

ALTER TABLE Professor 
    ADD CONSTRAINT UQ_Professor_CPF
        UNIQUE(CPF)
GO

CREATE TABLE Escola_Professor
(
    DataAdmissao DATE,
    FK_CNPJ VARCHAR(14) NOT NULL,
    -- Todo Professor pertecence a uma Escola 
    FK_Matricula VARCHAR(10) NOT NULL,
    -- Todo Professor tem uma Matricula
)
GO

ALTER TABLE Escola_Professor
    ADD CONSTRAINT FK_Escola_Professor_Escola
        FOREIGN KEY (FK_CNPJ)
            REFERENCES Escola(CNPJ)
GO

ALTER TABLE Escola_Professor
    ADD CONSTRAINT FK_Escola_Professor_Professor
        FOREIGN KEY (FK_Matricula)
            REFERENCES Professor(Matricula)
GO

CREATE TABLE Disciplina
(
    Codigo INT IDENTITY,
    Nome VARCHAR(30) NOT NULL,
    CargaHoraria INT,
    Ementa VARCHAR(200)
)
GO

ALTER TABLE Disciplina 
    ADD CONSTRAINT PK_Disciplina_Codigo
        PRIMARY KEY (Codigo)
GO

CREATE TABLE Professor_Disciplina
(
    FK_Matricula VARCHAR(10) NOT NULL,
    FK_Codigo INT NOT NULL
)
GO

ALTER TABLE Professor_Disciplina 
    ADD CONSTRAINT FK_Professor_Disciplina_Professor
        FOREIGN KEY (FK_Matricula)
            REFERENCES Professor(Matricula)
GO

ALTER TABLE Professor_Disciplina
    ADD CONSTRAINT FK_Professor_Disciplina_Disciplina
        FOREIGN KEY (FK_Codigo)
            REFERENCES Disciplina(Codigo)
GO

CREATE TABLE Turma
(
    Codigo INT IDENTITY NOT NULL,
    NumeroSala INT,
    Turno VARCHAR(10),
    FK_CNPJE VARCHAR(14)
)
GO

ALTER TABLE Turma
    ADD CONSTRAINT PK_Turma_Codigo
        PRIMARY KEY (Codigo)
GO

ALTER TABLE Turma
    ADD CONSTRAINT FK_Turma_Escola
        FOREIGN KEY (FK_CNPJE)
            REFERENCES Escola(CNPJ)
GO

CREATE TABLE Disciplina_Turma
(
    DataInicio DATE,
    DataTermino DATE,
    FK_CodigoT INT,
    FK_CodigoD INT
)
GO

ALTER TABLE Disciplina_Turma
    ADD CONSTRAINT FK_Disciplina_Turma_Turma
        FOREIGN KEY (FK_CodigoT)
            REFERENCES Turma(Codigo)
GO

ALTER TABLE Disciplina_Turma
    ADD CONSTRAINT FK_Disciplina_Turma_Disciplina
        FOREIGN KEY (FK_CodigoD)
            REFERENCES Disciplina(Codigo)
GO

CREATE TABLE Aluno
(
    Matricula VARCHAR(15) NOT NULL,
    Nome VARCHAR(30),
    Rua VARCHAR(30),
    Bairro VARCHAR(30),
    Numero INT,
    Cidade VARCHAR(30),
    UF CHAR(2),
    CEP VARCHAR(10),
    FK_CNPJ VARCHAR(14),
    FK_CodigoT INT

)
GO

ALTER TABLE Aluno 
    ADD CONSTRAINT PK_Aluno_Matricula
        PRIMARY KEY (Matricula)
GO

ALTER TABLE Aluno
    ADD CONSTRAINT FK_Aluno_Escola
        FOREIGN KEY (FK_CNPJ)
            REFERENCES Escola(CNPJ)
GO

ALTER TABLE Aluno
    ADD CONSTRAINT FK_Aluno_Turma
        FOREIGN KEY (FK_CodigoT)
            REFERENCES Turma(Codigo)
GO

CREATE TABLE Telefone
(
    Celular VARCHAR(15),
    Residencial VARCHAR(15),
    Comercial VARCHAR(15),
    FK_CNPJ VARCHAR(14),
    -- Não pode ser not null
    FK_MatriculaA VARCHAR(15),
    -- Não pode ser not null
    FK_MatriculaP VARCHAR(10)
    -- Não pode ser not null
)
GO

ALTER TABLE Telefone
    ADD CONSTRAINT FK_Telefone_Escola
        FOREIGN KEY (FK_CNPJ)
            REFERENCES Escola(CNPJ)
GO

ALTER TABLE Telefone
    ADD CONSTRAINT FK_Telefone_Aluno
        FOREIGN KEY (FK_MatriculaA)
            REFERENCES Aluno(Matricula)
GO

ALTER TABLE Telefone
    ADD CONSTRAINT FK_Telefone_Professor
        FOREIGN KEY (FK_MatriculaP)
            REFERENCES Professor(Matricula)
GO

-------------------------------------------------------------

INSERT INTO Escola
VALUES
    ('11111111111111', 'Cursos POP', 'Aveneida Joao', 32, 'Jd Villa', 'Campinas', 'SP', '10101010'),
    ('22222222222222', 'Ingles Star', 'Rua Paulo Souza', 515, 'Jd Carlos', 'Santo Andre', 'SP', '12121212'),
    ('33333333333333', 'Curso JSharp', 'Rua Doutor Luis', 87, 'Villa Rica', 'Osasco', 'SP', '56565656'),
    ('44444444444444', 'Escola Ruby Start', 'Rua Carmo', 90, 'Jd Euza', 'Rio de Janeiro', 'RJ', '40404040'),
    ('55555555555555', 'TopLearn PHP', 'Rua Pangua', 330, 'Jd Antonio', 'Bom Jardim', 'RJ', '70745896'),
    ('66666666666666', 'StarScript Inc', 'Rua do Sol', 144, 'Jd Frederick', 'Carmo', 'RJ', '48978541')
GO

INSERT INTO Professor
VALUES
    ('H0746985', 'Jose Paulo', '12345678910'),
    ('G5471008', 'Mariana', '10987654321'),
    ('S4125521', 'Lucas', '14587458236'),
    ('R4125458', 'Larissa', '96857412354'),
    ('CX154878', 'Rafael', '20202587458'),
    ('E4125411', 'Ana', '11147785456'),
    ('U5474577', 'Marcos', '88857458965')
GO

INSERT INTO Escola_Professor
-- Qual Professor lecionou em qual escola?
VALUES
    ('01/08/2002', '22222222222222', 'U5474577'),
    ('22/09/2004', '11111111111111', 'E4125411'),
    ('13/05/2000', '22222222222222', 'G5471008'),
    ('02/12/2013', '33333333333333', 'CX154878'),
    ('17/10/2013', '66666666666666', 'R4125458'),
    ('25/01/2017', '33333333333333', 'S4125521'),
    ('14/05/2002', '22222222222222', 'H0746985'),
    ('22/06/2003', '33333333333333', 'G5471008'),
    ('07/07/2001', '44444444444444', 'CX154878'),
    ('06/02/2013', '55555555555555', 'R4125458'),
    ('04/11/2000', '66666666666666', 'U5474577')
GO

INSERT INTO Disciplina
VALUES
    ('Ingles', 150, '5 Modulos'),
    ('Espanhol', 60, 'Espanhol Basico'),
    ('Marketing', 80, 'Curso Basico ao Intermediario'),
    ('Programação', 120, '5 Modulos'),
    ('Tecnico em Informatica', 200, '5 Modulos'),
    ('Excel', 30, '5 Modulos'),
    ('Jogos', 100, '5 Modulos'),
    ('Engenharia Civil', 250, '5 Modulos'),
    ('Terapia', 80, '5 Modulos'),
    ('Violao', 100, '5 Modulos')
GO

INSERT INTO Professor_Disciplina
-- Qual Professor pertence a qual Materia?
VALUES
    ('H0746985', 2),
    ('U5474577', 7),
    ('R4125458', 5),
    ('CX154878', 3),
    ('G5471008', 6),
    ('E4125411', 8),
    ('U5474577', 4),
    ('S4125521', 9),
    ('R4125458', 10),
    ('G5471008', 1)
GO

INSERT INTO Turma
VALUES
    (105, 'Noite', '11111111111111'),
    (106, 'Tarde', '11111111111111'),
    (100, 'Manha', '11111111111111'),
    (4, 'Noite', '22222222222222'),
    (1, 'Noite', '33333333333333'),
    (8, 'Noite', '44444444444444'),
    (22, 'Manha', '55555555555555'),
    (35, 'Tarde', '66666666666666'),
    (5, 'Tarde', '22222222222222'),
    (9, 'Manha', '44444444444444'),
    (105, 'Noite', '11111111111111'),
    (105, 'Noite', '11111111111111')
GO

INSERT INTO Disciplina_Turma
VALUES
    ('02/03/2017', '31/05/2017', 1, 6 ),
    ('15/01/2017', '30/10/2017', 2, 3 ),
    ('02/01/2017', '31/01/2018', 3, 5 ),
    ('02/05/2017', '31/05/2018', 4, 9 ),
    ('05/02/2017', '31/12/2017', 5, 7 ),
    ('04/02/2016', '22/07/2018', 6, 8 ),
    ('15/06/2017', '31/12/2017', 7, 10 ),
    ('20/01/2017', '31/07/2017', 8, 2 ),
    ('25/01/2017', '03/09/2017', 9, 1 ),
    ('06/03/2017', '31/08/2018', 10, 4 ),
    ('02/05/2017', '30/12/2017', 11, 2 ),
    ('12/04/2017', '30/11/2017', 12, 5 )
GO

INSERT INTO Aluno
VALUES
    ('F141414', 'Henrique', 'Rua Anglina Torres', 'Jd Beabá', 15,
        'Guarulhos', 'SP', '15154551', '11111111111111', 1),
    ('q125478', 'Ana Beatriz', 'Rua Das Flores', 'Jd Bela Vista', 202,
        'Campinas', 'SP', '8996650', '11111111111111', 2),
    ('w587968', 'Carlos', 'Rua Do Sol', 'Jd Da Agua Rosa', 101,
        'Sorocaba', 'SP', '80279563', '11111111111111', 3),
    ('e874587', 'Catarina', 'Rua Arco-Iris', 'Jd Campo Grande', 541,
        'Sao Paulo', 'SP', '78784596', '11111111111111', 4),
    ('t745896', 'Emanuelly', 'Rua Joana Mendes', 'Jd Do Belem', 12,
        'Guarulhos', 'SP', '12030325', '22222222222222', 5),
    ('y8858210', 'Davi', 'Rua Sao Joao', 'Jd Brasilandia', 44,
        'Guarulhos', 'SP', '63635585', '22222222222222', 6),
    ('p8787414', 'Andre', 'Rua Benedito', 'Jd Capitao Redondo', 708,
        'Sorocaba', 'SP', '74710258', '22222222222222', 7),
    ('u87874520', 'Muriel', 'Rua Jardini', 'Jd Do Carrao', 985,
        'Sorocaba', 'SP', '52364785', '33333333333333', 8),
    ('v4141288', 'Clara', 'Rua Emanuel Pena', 'Centro', 693,
        'Itaguai', 'RJ', '89744786', '33333333333333', 9),
    ('j8574692', 'Bruno', 'Rua Santo Amarildo', 'Centro', 32,
        'Macae', 'RJ', '87890314', '33333333333333', 10),
    ('l5478555', 'Thiago', 'Coala', 'Jd Barra Da Tijuca', 80,
        'Pirai', 'RJ', '32347586', '44444444444444', 11),
    ('i8578570', 'Levi', 'Sao Pedro', 'Gavea', 27,
        'Quatis', 'RJ', '47414741', '44444444444444', 12),
    ('k5522142', 'Jonathan', 'Rua Josiel', 'Jd Copacabana', 14,
        'Sao Goncalo', 'RJ', '24867593', '44444444444444', 1),
    ('h858520', 'Bruna', 'Rua Gabriel Martins', 'Ipanema', 14,
        'Macae', 'RJ', '28595751', '55555555555555', 2),
    ('z7444444', 'Ana Bela', 'Rua Elite', 'Jd Lapa', 14,
        'Rio das Flores', 'RJ', '63974175', '55555555555555', 3),
    ('c7444758', 'Octavio', 'Rua Vicente', 'Jd Leblon', 521,
        'Rio das Flores', 'RJ', '80859712', '55555555555555', 4),
    ('b57001452', 'Thiago', 'Rua Maria da Penha', 'Jd Santa Tereza', 85,
        'Sao Goncalo', 'RJ', '947485844', '66666666666666', 5),
    ('i5333963', 'Ana Julia', 'Rua Maria do Carmo', 'Jd  Tomé', 96,
        'Sorocaba', 'SP', '69897458', '66666666666666', 6),
    ('r5855230', 'Sofia', 'Rua Laila Souza', 'Jd Rosa', 74,
        'Osasco', 'SP', '89789887', '66666666666666', 7),
    ('d711120', 'Nicolas', 'Rua do Sertao', 'Jd Amaral', 12,
        'Osasco', 'SP', '52521203', '66666666666666', 8),
    ('a74741017', 'Marcelo', 'Rua Fernando', 'Jd Tomé', 100,
        'Campinas', 'SP', '18857412', '11111111111111', 5),
    ('w02125269', 'Isaac', 'Rua Paula Fernandes', 'Jd Leblom', 247,
        'Quatis', 'RJ', '14142302', '22222222222222', 5)
GO

INSERT INTO Telefone
VALUES
    -- CEL  | RESI    | COME |   ESCOLA       | ALU | PROF

    -- Escola
    (NULL, '32325698', NULL, '11111111111111', NULL, NULL),
    (NULL, '33698555', NULL, '22222222222222', NULL, NULL),
    (NULL, '358774744', NULL, '33333333333333', NULL, NULL),
    (NULL, '30124578', NULL, '44444444444444', NULL, NULL),
    (NULL, '30363697', NULL, '55555555555555', NULL, NULL),
    (NULL, '30585874', NULL, '66666666666666', NULL, NULL),


    -- Aluno
    ('985748557', NULL, NULL, NULL, 'f141414', NULL),
    ('996858785', NULL, '32363252', NULL, 'q125478', NULL),
    ('996889874', NULL, NULL, NULL, 'w587968', NULL),
    ('988574521', '32321415', NULL, NULL, 'e874587', NULL),
    ('988785864', NULL, NULL, NULL, 't745896', NULL),
    ('981230204', NULL, NULL, NULL, 'y8858210', NULL),
    ('985748557', NULL, NULL, NULL, 'p8787414', NULL),
    ('991478547', NULL, '32363658', NULL, 'u87874520', NULL),
    ('991214212', NULL, NULL, NULL, 'v4141288', NULL),
    ('991032563', '32303696', NULL, NULL, 'j8574692', NULL),
    ('988686969', '35398974', NULL, NULL, 'l5478555', NULL),
    ('985855000', NULL, NULL, NULL, 'k5522142', NULL),
    ('997474745', NULL, NULL, NULL, 'h858520', NULL),
    -- Professor

    ('998955495', NULL, NULL, NULL, NULL, 'H0746985'),
    ('998587458', '30304040', '32365364', NULL, NULL, 'G5471008'),
    ('997858588', NULL, NULL, NULL, NULL, 'S4125521'),
    ('997585858', NULL, NULL, NULL, NULL, 'R4125458'),
    (NULL, '30302525', NULL, NULL, NULL, 'CX154878'),
    ('998574747', NULL, '32326666', NULL, NULL, 'e4125411'),
    ('997010203', NULL, NULL, NULL, NULL, 'U5474577'),
    ('991203650', '32321414', NULL, NULL, NULL, 'S4125521'),
    ('996988896', NULL, NULL, NULL, NULL, 'H0746985')

GO

SELECT * FROM Aluno
SELECT * FROM Professor
SELECT * FROM Turma
SELECT * FROM Disciplina
SELECT * FROM Telefone
SELECT * FROM Escola_Professor
SELECT * FROM Disciplina_Turma
SELECT * FROM Escola
SELECT * FROM Professor_Disciplina