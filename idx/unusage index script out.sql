
--21set21

-- UNUSED indexes in SQL Server (updated indexes not used in any seeks, scan or lookup operations)
-- https://www.sqlshack.com/how-to-identify-and-monitor-unused-indexes-in-sql-server/
-- WHERE to exclude the primary and unique keys from being listed as unused and potentially deleted
-- index was updated as the application has carried some changes to data

-- USE dbCrmActivesoft;

SELECT
	DB_Name(database_id) AS [DatabaseName],
	objects.name AS Table_name,
	indexes.name AS Index_name,
	dm_db_index_usage_stats.user_updates, 
	dm_db_index_usage_stats.user_seeks,
	dm_db_index_usage_stats.user_scans,
	dm_db_index_usage_stats.user_lookups,
		'DROP INDEX ' + OBJECT_NAME(dm_db_index_usage_stats.object_id)+ '.' + indexes.name AS Drop_Index
FROM
	sys.dm_db_index_usage_stats
INNER JOIN sys.objects ON
	dm_db_index_usage_stats.OBJECT_ID = objects.OBJECT_ID
INNER JOIN sys.indexes ON
	indexes.index_id = dm_db_index_usage_stats.index_id
	AND dm_db_index_usage_stats.OBJECT_ID = indexes.OBJECT_ID
WHERE
	indexes.is_primary_key = 0
	--This line excludes primary key constarint
	AND indexes. is_unique = 0
	--This line excludes unique key constarint
	AND dm_db_index_usage_stats.user_updates <> 0
	-- This line excludes indexes SQL Server hasn’t done any work with
	AND dm_db_index_usage_stats.user_lookups = 0
	AND dm_db_index_usage_stats.user_seeks = 0
	AND dm_db_index_usage_stats.user_scans = 0

	--    AND objects.NAME = 'TbLancamentoCobranca'
ORDER BY
	dm_db_index_usage_stats.user_updates DESC
