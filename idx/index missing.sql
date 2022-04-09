--15fev22
	--It’s All in the Name, Index Naming Conventions
	--https://sqlespresso.com/2018/01/10/index-naming-conventions/

	--Collecting, aggregating, and analyzing missing SQL Server Index Stats
	--https://www.sqlshack.com/collecting-aggregating-analyzing-missing-sql-server-index-stats/

--EXEC  sp_help 'TbFaseNotaAluno'

--USE [dbLogMonitor];  NOT MASTER


		--FACHO
		--TbDiarioFrequencia
		--CREATE NONCLUSTERED INDEX [missing_index_243_TbDiarioFrequencia] ON TbDiarioFrequencia ([IdAluno], [StPresencaFalta]) INCLUDE ([IdDiarioAula])
		
		--dbCantinaPPasso
		--TbLancamentoCredito
		--CREATE NONCLUSTERED INDEX [missing_index_18_TbLancamentoCredito] ON TbLancamentoCredito ([IdCaixaMovimentacao]) INCLUDE ([IdConta], [IdLancamentoConsumo], [Valor])
		
		--dbBibFACHO
		--TbBibExemplar
		--CREATE NONCLUSTERED INDEX [missing_index_8_TbBibExemplar] ON TbBibExemplar ([IdBibFasciculo]) INCLUDE ([IdBibExemplarSituacao], [IdBiblioteca])


DECLARE @DatabaseName 	sysname = NULL, @TableName		sysname = NULL

--SET @DatabaseName = 'dbActiveBibSaleJuvenal%'
--SET @TableName = 'TbLancamentoCobranca' -- TbLancamentoCobranca		TbTituloCobranca

 
SELECT DB_NAME(c.database_id) as DatabaseName,
	OBJECT_NAME(c.object_id, c.database_id) as TableName ,
	CONVERT(INT, (AVG_TOTAL_USER_COST * (a.avg_user_impact / 100.0) * (USER_SEEKS + USER_SCANS)) ) AS [Impacto],
	a.USER_SEEKS as [Seeks],
--	a.USER_SCANS AS [scans],
	ISNULL(c.equality_columns, '') AS [EqualityColumns],
	ISNULL(c.inequality_columns, '') AS [InequalityColumns],
	ISNULL(c.included_columns, '') AS [IncludedColumns],
	'USE [' + DB_NAME(c.database_id) + '];
	CREATE INDEX IX_' + OBJECT_NAME(c.object_id, c.database_id) + '_'
	+ REPLACE(REPLACE(REPLACE(REPLACE(ISNULL(equality_columns, '')
	+ ISNULL(c.inequality_columns, ''),
	', ', '_'), '[', ''), ']', ''), ' ',
	'') + ' ON [' + SCHEMA_NAME(d.schema_id) + '].['
	+ OBJECT_NAME(c.object_id, c.database_id) + ']
	(' + ISNULL(equality_columns, '')
	+ CASE 
		WHEN c.equality_columns IS NOT NULL AND c.inequality_columns IS NOT NULL THEN ', '
		ELSE ''
	END + ISNULL(c.inequality_columns, '') + ')
	' + CASE WHEN included_columns IS NOT NULL
	THEN 'INCLUDE (' + included_columns + ')'
	ELSE ''
	END + '
	WITH (FILLFACTOR=90)' as CreateIndexStmt,
	a.LAST_USER_SEEK,
	a.LAST_USER_SCAN
FROM sys.dm_db_missing_index_group_stats a
JOIN sys.dm_db_missing_index_groups b ON a.group_handle = b.index_group_handle
JOIN sys.dm_db_missing_index_details c ON b.index_handle = c.index_handle
JOIN sys.objects d ON c.object_id = d.object_id
WHERE
	c.database_id > 4
	AND (AVG_TOTAL_USER_COST * (a.avg_user_impact / 100.0) * (USER_SEEKS + USER_SCANS)) > 10
	AND DB_Name(c.database_id) LIKE ISNULL( @DatabaseName, DB_Name(c.database_id) ) 		
	AND OBJECT_NAME(c.object_id, c.database_id) LIKE ISNULL( @TableName, OBJECT_NAME(c.object_id, c.database_id) ) 	
ORDER BY IMPACTO DESC




--SELECT
--	CONVERT(int,
--	migs.avg_total_user_cost * (migs.avg_user_impact / 100.0) * (migs.user_seeks + migs.user_scans) ) AS [Impact], 
--	mid.statement AS [Query Text],
--	'CREATE INDEX [IX_' + LEFT (PARSENAME(mid.statement,
--	1),
--	32)+ '_'
--  	+ ISNULL(REPLACE(REPLACE(REPLACE(REPLACE(mid.equality_columns, '[', ''), ',', '_'), ']', ''), ' ', ''),
--	'')+
--  	+ ISNULL('_' + REPLACE(REPLACE(REPLACE(REPLACE(mid.inequality_columns, '[', ''), ',', '_'), ']', ''), ' ', ''),
--	'')+ ']'
--  	+ ' ON ' + mid.statement
--  	+ ' (' + ISNULL (mid.equality_columns,
--	'')
--  	+
--	CASE
--		WHEN mid.equality_columns IS NOT NULL
--		AND mid.inequality_columns IS NOT NULL THEN ','
--		ELSE ''
--	END
--  	+ ISNULL (mid.inequality_columns,
--	'')
--  	+ ')'
--  	+ ISNULL (' INCLUDE (' + mid.included_columns + ')',
--	'') AS [Index Create Script]
--FROM
--	sys.dm_db_missing_index_groups mig
--INNER JOIN sys.dm_db_missing_index_group_stats migs ON
--	migs.group_handle = mig.index_group_handle
--INNER JOIN sys.dm_db_missing_index_details mid ON
--	mig.index_handle = mid.index_handle
--WHERE
--	migs.avg_total_user_cost * (migs.avg_user_impact / 100.0) * (migs.user_seeks + migs.user_scans) > 10
--	and mid.database_id = DB_ID()
--	--  AND mid.statement LIKE '%TbAccessToken%'
--ORDER BY
--	migs.avg_total_user_cost * migs.avg_user_impact * (migs.user_seeks + migs.user_scans) DESC
