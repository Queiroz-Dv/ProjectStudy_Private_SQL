	CREATE DATABASE Escola
	GO

	USE Escola
	GO

	CREATE TABLE Aluno 
	(
	RA VARCHAR(12) NOT NULL UNIQUE,
	Nome NVARCHAR(40)NOT NULL ,
	Cidade NVARCHAR(30)NOT NULL,
	Estado CHAR(2)NOT NULL,
	Sexo CHAR(1)NOT NULL,
	CPF VARCHAR(11) NOT NULL UNIQUE
	)
	GO

	INSERT INTO Aluno(RA, Nome, Cidade, Estado, Sexo, CPF) VALUES
	('123456', 'Eduardo', 'Rio de Janeiro', 'RJ', 'M', '123456789'),
	('521459', 'Larissa', 'São Paulo', 'SP', 'F', '256874195'),
	('28967843', 'Mayra', 'Aurora Do Pará', 'PR', 'F', '15477886320');

SELECT * FROM ALUNO
	
ALTER TABLE Aluno DROP COLUMN Bairro

