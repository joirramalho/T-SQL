--12nov21 - Exists table in database


EXEC dbLogMonitor.dbo.sp_foreachdb N'
    USE ?

--	IF (EXISTS (SELECT * 
--	                 FROM [?].INFORMATION_SCHEMA.columns
--	                 WHERE TABLE_NAME = ''TbTituloCobranca_Persistido'' and column_name = ''ValorDescontoNaoCondicionadoPROUNI'' ))
--	BEGIN
--	    SELECT DB_NAME()
--	END



--	IF EXISTS( SELECT
--	  sys.columns.name AS ColumnName,
--	  tables.name AS TableName
--	FROM
--	  sys.columns
--	JOIN sys.tables ON
--	  sys.columns.object_id = tables.object_id
--	WHERE
--	  sys.columns.name = ''ValorDescontoNaoCondicionadoPROUNI'' )
--	BEGIN
--	    SELECT DB_NAME()
--	END

'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
-- ,@database_list = 'dbSigaOmegaBelem' -- dbSigaExitoNatal -- dbSigaMickeylandia -- dbSigaCEAMOMossoro -- dbSigaSagradoCoracao -- dbSigaCordCNSD
,@name_pattern='dbSiga';     



--How to Find Tables that Contain a Specific Column in SQL Server

--
