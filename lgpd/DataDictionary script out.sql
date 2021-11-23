DECLARE @COLUMN_SEARCH 	VARCHAR(64)
DECLARE @TABLE_SEARCH 	VARCHAR(64)
DECLARE @DESCRIPTION 	VARCHAR(512)

SET @COLUMN_SEARCH 	= '%usuario%'
SET @TABLE_SEARCH 	= 'Gen_Setor'

	SELECT
	--  SCHEMA_NAME(TABLELIST.schema_id) AS Schema_Name,
	  	TABLELIST.name AS Table_Name,
	  	COLLIST.column_id,
	  	COLLIST.name AS Column_Name,
		'exec CreateOrUpdateExtendedProperty 	''' +	'table'	+	
	  	''', '''	+	TABLELIST.name	+
	  	''', '''	+	COLLIST.name	+
		''', '''	+	COALESCE( CAST( p.value AS VARCHAR(max) ), cdep.Description ) 
		+ ''''
--		,cdep.Description
	
	FROM 	sys.tables AS TABLELIST
	INNER 	JOIN sys.all_columns 					AS COLLIST	ON TABLELIST.object_ID = COLLIST.object_id
	LEFT 	JOIN sys.extended_properties 			AS p 		ON p.major_id = TABLELIST.object_id 		AND p.minor_id = COLLIST.column_id AND p.class = 1
	LEFT 	JOIN _column_details_extended_property  AS cdep 	ON cdep.TableName = TABLELIST.name AND cdep.ColumnName = COLLIST.name
	WHERE 1=1
--		AND COLLIST.name LIKE @COLUMN_SEARCH
--		AND TABLELIST.name LIKE '%' + @TABLE_SEARCH + '%'
		
--UNION ALL
--
--	SELECT
--	--  SCHEMA_NAME(TABLELIST.schema_id) AS Schema_Name,
--	  	TABLELIST.name AS Table_Name,
--	  	COLLIST.column_id,
--	  	COLLIST.name AS Column_Name,	
--		'exec CreateOrUpdateExtendedProperty 	''' +	'view'	+	
--	  	''', '''	+	TABLELIST.name	+
--	  	''', '''	+	COLLIST.name	+
--		''', '''	+	COALESCE( CAST( p.value AS VARCHAR(max) ), cdep.Description ) 
--		+ ''''
--	
--	FROM 	sys.views AS TABLELIST
--	INNER 	JOIN sys.all_columns 			AS COLLIST	ON TABLELIST.object_ID = COLLIST.object_id
--	LEFT 	JOIN sys.extended_properties 	AS p 		ON p.major_id = TABLELIST.object_id 		AND p.minor_id = COLLIST.column_id AND p.class = 1
--	LEFT 	JOIN _column_details_extended_property  AS cdep 	ON cdep.TableName = TABLELIST.name AND cdep.ColumnName = COLLIST.name
--	WHERE 1=1

--	AND COLLIST.name LIKE '%' + @COLUMN_SEARCH + '%'
--	AND TABLELIST.name LIKE '%' + @TABLE_SEARCH + '%'

ORDER BY 1, 2

--SELECT * FROM sys.all_columns

--SELECT * FROM::fn_listextendedproperty('MS_Description', 'schema', 'dbo', 'table', 'Gen_Orgao', 'column', 'IdSessaoOperacao')


