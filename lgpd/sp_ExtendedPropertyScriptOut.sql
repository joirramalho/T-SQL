--03dez21

--exec sp_ExtendedPropertyScriptOut NULL, NULL, 1
--exec sp_ExtendedPropertyScriptOut 'Gen_Pessoa%', NULL,  1
--exec sp_ExtendedPropertyScriptOut NULL, 'data%', 1
--exec sp_ExtendedPropertyScriptOut 'Gen_PessoaE%', 'nome%', 1

--	sp_ExtendedPropertyScriptOut @REBUILD = 1		@COLUMN_SEARCH = '%HASH%',

IF (OBJECT_ID('dbo.sp_ExtendedPropertyScriptOut') IS NOT NULL) DROP PROCEDURE sp_ExtendedPropertyScriptOut;

CREATE PROCEDURE sp_ExtendedPropertyScriptOut( @TABLE_SEARCH 	VARCHAR(64) = NULL, @COLUMN_SEARCH 	VARCHAR(64) = NULL, @REBUILD BIT = 0 )
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @DESCRIPTION 	VARCHAR(512)
	
	SELECT
	--  SCHEMA_NAME(TABLELIST.schema_id) AS Schema_Name,
	  	TABLELIST.name AS Table_Name,
	  	COLLIST.column_id,
	  	COLLIST.name AS Column_Name,
	  		  	
		'exec CreateOrUpdateExtendedProperty 	''' +	'table'	+	
	  	''', '''	+	TABLELIST.name	+
	  	''', '''	+	COLLIST.name	+
		''', '''	+	IIF( @REBUILD = 0, 
							COALESCE( CAST( p.value AS VARCHAR(max) ), cdep.Description ), 
							cdep.Description + COALESCE( 	( SELECT TOP 1 Sufix FROM BdDicionarioDados.dbo.keyword k 	WHERE COLLIST.name LIKE ColumnName ORDER BY ID ), '' )
							)
		+ '''' AS [ExtendedPropertyScriptOut]
	
	FROM 	sys.tables AS TABLELIST
	INNER 	JOIN sys.all_columns 					AS COLLIST	ON TABLELIST.object_ID = COLLIST.object_id
	LEFT 	JOIN sys.extended_properties 			AS p 		ON p.major_id = TABLELIST.object_id 		AND p.minor_id = COLLIST.column_id AND p.class = 1
	LEFT 	JOIN _column_details_extended_property  AS cdep 	ON cdep.TableName = TABLELIST.name AND cdep.ColumnName = COLLIST.name
	WHERE 	TABLELIST.name NOT IN ('_flyway_schema_history', '_column_details_extended_property', 'sysdiagrams' )
		--		AND ExtendedPropertyScriptOut IS NOT NULL
--		AND
--		(
--			( @TABLE_SEARCH IS NOT NULL AND TABLELIST.name LIKE @TABLE_SEARCH ) OR ( @COLUMN_SEARCH IS NOT NULL AND COLLIST.name LIKE @COLUMN_SEARCH ) OR ( @TABLE_SEARCH IS NULL AND @COLUMN_SEARCH IS NULL )
--		)
			
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
	--	WHERE 	TABLELIST.name NOT IN ('_flyway_schema_history', '_column_details_extended_property', '_column_details_extended_property_dictionary', '_column_details_extended_property_keyword', 'sysdiagrams' )
	
	--	AND COLLIST.name LIKE '%' + @COLUMN_SEARCH + '%'
	--	AND TABLELIST.name LIKE '%' + @TABLE_SEARCH + '%'
	
	ORDER BY TABLELIST.name, COLLIST.column_id

END 