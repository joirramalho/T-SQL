--10fev22 - NO TEST DROP
--21set21
--	https://www.mssqltips.com/sqlservertip/5202/safely-dropping-unused-sql-server-indexes/

-- UNUSED indexes in SQL Server (updated indexes not used in any seeks, scan or lookup operations)
-- https://www.sqlshack.com/how-to-identify-and-monitor-unused-indexes-in-sql-server/
-- WHERE to exclude the primary and unique keys from being listed as unused and potentially deleted
-- index was updated as the application has carried some changes to data

-- USE dbCrmActivesoft;


	SELECT DB_NAME() AS [database_name], 
--   DB_ID() AS database_id,
--   OBJECT_SCHEMA_NAME(i.[object_id]) AS [schema_name], 
   OBJECT_NAME(i.[object_id]) AS [object_name], 
--   iu.[object_id],
   i.[name], 
   CASE WHEN (iu.user_seeks + iu.user_scans + iu.user_lookups) > 0
        THEN iu.user_updates/( iu.user_seeks + iu.user_scans + iu.user_lookups )
        ELSE iu.user_updates END AS update_to_use_ratio,
   iu.user_updates,
   	'USE [' + DB_NAME(database_id) + '];
	DROP INDEX ' + OBJECT_NAME(i.[object_id]) + '.' + i.name AS Drop_Index,
--   i.index_id, 
   i.[type_desc],
		IIF( is_primary_key = 1, 'sim', '' ) AS 'pk',
		IIF( type = 1, 'sim', '' ) AS 'cluster',
		IIF( is_unique = 1, 'sim', '' ) AS 'unique',
   iu.user_seeks, 
   iu.user_scans, 
   iu.user_lookups
--   i.is_unique_constraint,
--   iu.user_seeks + iu.user_scans + iu.user_lookups AS total_uses,
FROM sys.dm_db_index_usage_stats iu
RIGHT JOIN sys.indexes i ON iu.index_id = i.index_id AND iu.[object_id] = i.[object_id]
WHERE 
   OBJECTPROPERTY(iu.[object_id], 'IsUserTable') = 1
   AND iu.database_id = DB_ID()
ORDER BY 
   CASE WHEN (iu.user_seeks + iu.user_scans + iu.user_lookups) > 0
        THEN iu.user_updates/( iu.user_seeks + iu.user_scans + iu.user_lookups )
        ELSE iu.user_updates END DESC 
        
        
--SELECT
--	DB_Name(database_id) AS [DatabaseName],
--	objects.name AS Table_name,
--	indexes.name AS Index_name,
--	dm_db_index_usage_stats.user_updates, 
--	dm_db_index_usage_stats.user_seeks,
--	dm_db_index_usage_stats.user_scans,
--	dm_db_index_usage_stats.user_lookups,
--	'USE [' + DB_NAME(database_id) + '];
--	DROP INDEX ' + OBJECT_NAME(dm_db_index_usage_stats.object_id)+ '.' + indexes.name AS Drop_Index
--FROM
--	sys.dm_db_index_usage_stats
--INNER JOIN sys.objects ON
--	dm_db_index_usage_stats.OBJECT_ID = objects.OBJECT_ID
--INNER JOIN sys.indexes ON
--	indexes.index_id = dm_db_index_usage_stats.index_id
--	AND dm_db_index_usage_stats.OBJECT_ID = indexes.OBJECT_ID
--WHERE
--	indexes.is_primary_key = 0
--	--This line excludes primary key constarint
--	AND indexes. is_unique = 0
--	--This line excludes unique key constarint
--	AND dm_db_index_usage_stats.user_updates <> 0
--	-- This line excludes indexes SQL Server hasn’t done any work with
--	AND dm_db_index_usage_stats.user_lookups = 0
--	AND dm_db_index_usage_stats.user_seeks = 0
--	AND dm_db_index_usage_stats.user_scans = 0
--
--	--    AND objects.NAME = 'TbLancamentoCobranca'
--ORDER BY
--	dm_db_index_usage_stats.user_updates DESC