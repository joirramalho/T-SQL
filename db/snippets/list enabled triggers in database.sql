
--13set21
--https://www.mssqltips.com/sqlservertip/5853/find-all-sql-server-triggers-to-quickly-enable-or-disable/

--https://www.mssqltips.com/sqlservertip/5494/script-triggers-from-any-database-in-sql-server/

SELECT 
	t2.[name] TableTriggerReference
	,
	SCHEMA_NAME(t2.[schema_id]) TableSchemaName
	,
	t1.[name] TriggerName
FROM
	sys.triggers t1
INNER JOIN sys.tables t2 ON
	t2.object_id = t1.parent_id
WHERE
	t1.is_disabled = 1
	AND t1.is_ms_shipped = 0
	AND t1.parent_class = 1
	