USE [master];

DECLARE @kill varchar (8000) = '';
SELECT @kill = @kill + 'kill' + CONVERT(varchar(5), session_id)
FROM sys.dm_exec_sesssions
WHERE database_id = db_id('Curso')

EXEC(@kill)

DROP DATABASE [Curso]