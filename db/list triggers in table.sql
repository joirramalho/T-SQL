--04out21
--https://stackoverflow.com/questions/4305691/need-to-list-all-triggers-in-sql-server-database-with-table-name-and-tables-sch
--https://www.mssqltips.com/sqlservertip/5950/how-do-sql-server-triggers-work-for-insert-update-delete-and-truncate/

SELECT
	OBJECT_NAME(parent_obj) AS table_name
	,sysobjects.name AS trigger_name
	--    ,USER_NAME(sysobjects.uid) AS trigger_owner 
	--    ,s.name AS table_schema 
	--    ,OBJECTPROPERTY(id, 'ExecIsTriggerDisabled') AS [disabled] 
    ,
	CASE 
		WHEN OBJECTPROPERTY(id,
		'ExecIsTriggerDisabled') = 1 THEN 'Disabled'
		ELSE '-- no --'
	END AS 'disabled'
    ,
	OBJECTPROPERTY( id,
	'ExecIsUpdateTrigger') AS isupdate 
    ,
	OBJECTPROPERTY( id,
	'ExecIsDeleteTrigger') AS isdelete 
    ,
	OBJECTPROPERTY( id,
	'ExecIsInsertTrigger') AS isinsert 
	,
	CASE 
		WHEN OBJECTPROPERTY( id,
		'ExecIsAfterTrigger') = 1 THEN 'yes'
		ELSE '-- no --'
	END AS ExecIsAfterTrigger

	,
	CASE 
		WHEN OBJECTPROPERTY( id,
		'ExecIsInsteadOfTrigger') = 1 THEN 'yes'
		ELSE '-- no --'
	END AS isinsteadof
FROM
	sysobjects
INNER JOIN sysusers 
    ON
	sysobjects.uid = sysusers.uid
INNER JOIN sys.tables t 
    ON
	sysobjects.parent_obj = t.object_id
INNER JOIN sys.schemas s 
    ON
	t.schema_id = s.schema_id
WHERE
	sysobjects.type = 'TR'
	
	AND OBJECT_NAME(parent_obj) IN ('TbDiarioFrequencia')
	
ORDER BY
	OBJECT_NAME(parent_obj)