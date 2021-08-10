-- CREATE DATABASE dbSigaExportado


-- USE [dbSigaBancoOrigem]


IF (OBJECT_ID('tempdb..#TabelasExportacao') IS NOT NULL) DROP TABLE #TabelasExportacao
CREATE TABLE #TabelasExportacao ( 
    NomeTabela VARCHAR(64)
)

INSERT INTO #TabelasExportacao (NomeTabela) VALUES ('TbAluno')
INSERT INTO #TabelasExportacao (NomeTabela) VALUES ('TbProfessor')
INSERT INTO #TabelasExportacao (NomeTabela) VALUES ('TbUnidade')

-- SELECT * FROM #TabelasExportacao



DECLARE @database_name  varchar(100);
DECLARE @table_name     varchar(100);

SET @database_name = 'dbSigaExportado'

DECLARE c CURSOR FOR SELECT * FROM #TabelasExportacao ORDER BY NomeTabela
OPEN c
FETCH NEXT FROM c INTO @table_name
WHILE @@FETCH_STATUS =0
BEGIN
	EXEC ( N'SELECT * INTO [' + @database_name + '].[dbo].[' + @table_name + '] FROM DBO.' + @table_name )

	FETCH NEXT FROM c INTO @table_name
END
CLOSE c
DEALLOCATE c