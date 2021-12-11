--10dez21

--	       1         2         3   		 4         5         6         7
--1234567890123456789012345678901234567890123456789012345678901234567890
--ValorDespesasInscritasEmRestosAPagarNaoProcessadosEmExercicioAnterior

--EXEC dbo.sp_ExtendedPropertyScriptOut @REBUILD = 1	@COLUMN_SEARCH = '%HASH%',
--EXEC dbo.sp_ExtendedPropertyScriptOut @REBUILD = 1, 	@TABLE_SEARCH = 'vw%'

--IF (OBJECT_ID('dbo.sp_ExtendedPropertyScriptOut') IS NOT NULL) DROP PROCEDURE sp_ExtendedPropertyScriptOut;

IF OBJECT_ID('dbo.sp_ExtendedPropertyScriptOut', 'P') IS NULL
	EXECUTE('CREATE PROCEDURE dbo.sp_ExtendedPropertyScriptOut AS SELECT 1');


ALTER PROCEDURE dbo.sp_ExtendedPropertyScriptOut( @TABLE_SEARCH 	sysname = NULL, @COLUMN_SEARCH 	sysname = NULL, @REBUILD BIT = 0 )
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @DESCRIPTION 	VARCHAR(512)
	DECLARE @COLUMN CHAR(1) = NULL
	
	SELECT
	  	TABLELIST.name AS Table_Name,
	  	COLLIST.column_id,
	  	COLLIST.name,
	  	
	  	IIF( @REBUILD = 0, 
							COALESCE( CAST( p.value AS VARCHAR(max) ), cdep.Description ), 
							cdep.Description + COALESCE( 	( SELECT TOP 1 Sufix FROM BdDicionarioDados.dbo.keyword k 	WHERE COLLIST.name LIKE ColumnName ORDER BY ID ), '' )
							),
	  	
		'exec dbo.sp_CreateOrUpdateExtendedProperty 	''' +	'Column'	+	
	  	''', '''	+	TABLELIST.name	+
		''', '''	+	IIF( @REBUILD = 0, 
							COALESCE( CAST( p.value AS VARCHAR(max) ), cdep.Description ), 
							cdep.Description + COALESCE( 	( SELECT TOP 1 Sufix FROM BdDicionarioDados.dbo.keyword k 	WHERE COLLIST.name LIKE ColumnName ORDER BY ID ), '' )
							) +
	  	''', '''	+	COLLIST.name	+
		'''' AS [ExtendedPropertyScriptOut]
	
	FROM 	sys.tables AS TABLELIST
	INNER 	JOIN sys.columns 						AS COLLIST	ON TABLELIST.object_ID = COLLIST.object_id
	LEFT 	JOIN sys.extended_properties 			AS p 		ON p.major_id = TABLELIST.object_id AND p.minor_id = COLLIST.column_id AND p.class = 1
	LEFT 	JOIN _column_details_extended_property  AS cdep 	ON cdep.TableName = TABLELIST.name 	AND cdep.ColumnName = COLLIST.name
	WHERE 	TABLELIST.name NOT IN ('_flyway_schema_history', '_column_details_extended_property', 'sysdiagrams' )
		AND	(	( @TABLE_SEARCH IS NOT NULL AND TABLELIST.name LIKE @TABLE_SEARCH ) OR ( @COLUMN_SEARCH IS NOT NULL AND COLLIST.name LIKE @COLUMN_SEARCH ) OR ( @TABLE_SEARCH IS NULL AND @COLUMN_SEARCH IS NULL )	)	


	UNION ALL -- Table

	SELECT
	  	TABLELIST.name AS Table_Name,
	  	0,
	  	'',
		'',
	  		  	
		'exec dbo.sp_CreateOrUpdateExtendedProperty 	''' +	'Table'	+	
	  	''', '''	+	TABLELIST.name	+
		''', '''	+	IIF( @REBUILD = 0, 
							COALESCE( ( SELECT CAST( sys.extended_properties.value AS VARCHAR(max) ) FROM sys.extended_properties WHERE sys.extended_properties.major_id = TABLELIST.object_id AND minor_id = 0 ), 
								( SELECT Description FROM _column_details_extended_property cdep WHERE  TableType = 'BASE TABLE' AND cdep.TableName = TABLELIST.name )	), 
								( SELECT Description FROM _column_details_extended_property cdep WHERE  TableType = 'BASE TABLE' AND cdep.TableName = TABLELIST.name ) 
							)
		+ '''' AS [ExtendedPropertyScriptOut]
	
	FROM 	sys.tables AS TABLELIST
	WHERE 	TABLELIST.name NOT IN ('_flyway_schema_history', '_column_details_extended_property', 'sysdiagrams' )
		AND	(	( @TABLE_SEARCH IS NOT NULL AND TABLELIST.name LIKE @TABLE_SEARCH ) OR ( @TABLE_SEARCH IS NULL )	)	



		
	UNION ALL -- View

		SELECT
		  	TABLELIST.name AS Table_Name,
		  	0,
		  	'',
			'',	

		'exec dbo.sp_CreateOrUpdateExtendedProperty 	''' +	'view'	+	
	  	''', '''	+	TABLELIST.name	+
		''', '''	+	IIF( @REBUILD = 0, 
							COALESCE( ( SELECT CAST( sys.extended_properties.value AS VARCHAR(max) ) FROM sys.extended_properties WHERE sys.extended_properties.major_id = TABLELIST.object_id AND minor_id = 0 ), 
								( SELECT Description FROM _column_details_extended_property cdep WHERE  TableType = 'VIEW' AND cdep.TableName = TABLELIST.name )	), 
								( SELECT Description FROM _column_details_extended_property cdep WHERE  TableType = 'VIEW' AND cdep.TableName = TABLELIST.name )
							)
		+ '''' AS [ExtendedPropertyScriptOut]
		  		  	
--			'exec dbo.sp_CreateOrUpdateExtendedProperty 	''' +	'View'	+	
--		  	''', '''	+	TABLELIST.name	+
--			''', '''	+	IIF( @REBUILD = 0, 
--								COALESCE( CAST( p.value AS VARCHAR(max) ), cdep.Description ), 
--								cdep.Description
--								)
--			+ '''' AS [ExtendedPropertyScriptOut]
		
		FROM 	sys.views AS TABLELIST
--		LEFT 	JOIN sys.extended_properties 			AS p 		ON p.major_id = TABLELIST.object_id
--		LEFT 	JOIN _column_details_extended_property  AS cdep 	ON cdep.TableName = TABLELIST.name
		WHERE 	TABLELIST.name NOT IN ('_flyway_schema_history', '_column_details_extended_property', 'sysdiagrams' )
--			AND Tabletype <> 'COLUMN'
			AND	(	( @TABLE_SEARCH IS NOT NULL AND TABLELIST.name LIKE @TABLE_SEARCH ) OR ( @TABLE_SEARCH IS NULL )	)	
	
	ORDER BY TABLELIST.name, COLLIST.column_id
END

