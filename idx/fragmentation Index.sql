--23set21

--USE dbSigaUKLINK;

SELECT
	OBJECT_NAME(ind.OBJECT_ID) AS TableName,
	ind.name AS IndexName,
	indexstats.index_type_desc AS IndexType,
	indexstats.avg_fragmentation_in_percent,
	'ALTER INDEX ' + QUOTENAME(ind.name) + ' ON ' + QUOTENAME(object_name(ind.object_id)) +
	CASE
		WHEN indexstats.avg_fragmentation_in_percent>30 THEN ' REBUILD;'
		WHEN indexstats.avg_fragmentation_in_percent >= 5 THEN ' REORGANIZE;'
		ELSE NULL
	END as [SQLQuery]
	-- if <5 not required, so no query needed
FROM
	sys.dm_db_index_physical_stats(DB_ID(),
	NULL,
	NULL,
	NULL,
	NULL) indexstats
INNER JOIN sys.indexes ind ON
	ind.object_id = indexstats.object_id
	AND ind.index_id = indexstats.index_id
WHERE
	indexstats.avg_fragmentation_in_percent > 5
	AND ind.Name is not null
	--AND OBJECT_NAME(ind.OBJECT_ID) = 'TbFaseNotaAluno'
ORDER BY
	indexstats.avg_fragmentation_in_percent DESC
	-- ORDER BY OBJECT_NAME(ind.OBJECT_ID), indexstats.avg_fragmentation_in_percent DESC
	