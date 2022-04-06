CREATE TABLE Escola
(
Cnpj VARCHAR(14) NOT NULL,
Nome VARCHAR(30) NOT NULL,
Telefone VARCHAR(15),
Endereco VARCHAR(50)
)
GO

-- Adicionando Constraints

ALTER TABLE Escola ADD CONSTRAINT PK_Escola PRIMARY KEY (Cnpj)
GO

CREATE TABLE Aluno
(
Matricula VARCHAR(12) NOT NULL,
Nome VARCHAR(30) NOT NULL,
Telefone VARCHAR(15),
Endereco VARCHAR(50),
CnpjFK VARCHAR(14) NOT NULL
)

GO
ALTER TABLE Aluno ADD CONSTRAINT PK_Aluno PRIMARY KEY (Matricula)
ALTER TABLE Aluno ADD CONSTRAINT FK_Aluno_Escola FOREIGN KEY (CnpjFK)
REFERENCES Escola(Cnpj)
-- Tabela de Origem(Aluno) e Tabela de Destino(Escola) --
-- REFERENCES --> De quem veio essa chave? -- 
GO

INSERT INTO Escola VALUES
('11111111111111', 'E.E Prof° João', '32323232', 'Rua A, Jd B'),
('22222222222222', 'E.E Prof° Maria Do Carmo', '557485933', 'Rua C'),
('33333333333333', 'E.E Prof° Wilson', '454545454', 'Rua D')
GO

INSERT INTO Aluno VALUES 
('D014258', 'Joaquim', '12541254', 'Jd Paulista SP','11111111111111'),
('H158P96', 'Paula', '69696969', 'Jd Paulista SP', '11111111111111'),
('GT85745', 'Thiago', '85858585', 'Jd Carlos SP', '22222222222222'),
('IP74145', 'Fernando', '7474747474', 'Vila Antonio SP', '33333333333333')
GO
