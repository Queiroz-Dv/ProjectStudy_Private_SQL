CREATE TABLE [dbo].[User]
(
	[Id] INT NOT NULL IDENTITY(1, 1), 
    [Name] NCHAR(80) NOT NULL, 
    [Email] VARCHAR(200) NOT NULL, 
    [PasswordHash] VARBINARY(255) NOT NULL, 
    [Bio] TEXT NOT NULL, 
    [Image] VARCHAR(2000) NOT NULL, 
    [Slug] VARCHAR(80) NOT NULL

	CONSTRAINT [PK_User]  PRIMARY KEY ([Id]),
	CONSTRAINT [UQ_User_Email] UNIQUE([Email]),
	CONSTRAINT [UQ_User_Slug] UNIQUE([Slug]),
)
