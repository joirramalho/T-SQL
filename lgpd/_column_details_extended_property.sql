--14dez21

	--TRUNCATE TABLE dbo.[_column_details_extended_property];
		--SELECT * FROM _column_details_extended_property ORDER BY TableName, OrdinalPosition

/*
 CREATE UNIQUE NONCLUSTERED INDEX [FK_DicionarioDados_Palavra] ON [dbo].[DicionarioDados]
(
	[Palavra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
 */

IF OBJECT_ID('dbo._column_details_extended_property') IS  NULL
	CREATE TABLE dbo.[_column_details_extended_property] (
		[Database] nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
		Owner nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
		TableType	varchar(10),
		TableName sysname COLLATE SQL_Latin1_General_CP1_CI_AI NOT NULL,
		ColumnName sysname COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
		OrdinalPosition int NULL,
		DefaultSetting nvarchar(4000) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
		DataType nvarchar(128) COLLATE SQL_Latin1_General_CP1_CI_AI NULL,
		MaxLength int NULL,
		DatePrecision smallint NULL,
		IsNullable bit NULL,
		IsPrimaryKey bit NULL,
		IsError bit DEFAULT 0 NOT NULL,
		Description varchar(512) COLLATE SQL_Latin1_General_CP1_CI_AI NULL
	);

--TABLES & VIEWS
	INSERT	INTO _column_details_extended_property ( [Database], Owner, TableType, TableName )
		SELECT 
			col.TABLE_CATALOG AS [Database]
		    ,col.TABLE_SCHEMA AS Owner
		    ,col.TABLE_TYPE AS TableType	     
		    ,col.TABLE_NAME AS TableName
		FROM INFORMATION_SCHEMA.TABLES AS col
		WHERE col.TABLE_NAME NOT IN ('_flyway_schema_history', '_column_details_extended_property', 'sysdiagrams')
			AND NOT EXISTS (SELECT * FROM _column_details_extended_property cdep WHERE col.TABLE_NAME COLLATE  SQL_Latin1_General_CP1_CI_AI = cdep.TableName )
		ORDER BY col.TABLE_NAME;

	DELETE _column_details_extended_property 
		WHERE 	NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES tables WHERE tables.TABLE_NAME = _column_details_extended_property.TableName );

 

-- COLUMNs
INSERT	INTO _column_details_extended_property 
	SELECT 
		col.TABLE_CATALOG AS [Database]
	     , col.TABLE_SCHEMA AS Owner
	     , 'COLUMN' AS TableType
	     , col.TABLE_NAME AS TableName
	     , col.COLUMN_NAME AS ColumnName
	     , col.ORDINAL_POSITION AS OrdinalPosition
	     , col.COLUMN_DEFAULT AS DefaultSetting
	     , col.DATA_TYPE AS DataType
	     , col.CHARACTER_MAXIMUM_LENGTH AS MaxLength
	     , col.DATETIME_PRECISION AS DatePrecision
	     , CAST(CASE col.IS_NULLABLE
	                WHEN 'NO' THEN 0
	                ELSE 1
	            END AS bit)AS IsNullable       
	--     , COLUMNPROPERTY(OBJECT_ID('[' + col.TABLE_SCHEMA + '].[' + col.TABLE_NAME + ']'), col.COLUMN_NAME, 'IsIdentity')AS IsIdentity
	--     , COLUMNPROPERTY(OBJECT_ID('[' + col.TABLE_SCHEMA + '].[' + col.TABLE_NAME + ']'), col.COLUMN_NAME, 'IsComputed')AS IsComputed
	     , CAST(ISNULL(pk.is_primary_key, 0) AS bit)AS IsPrimaryKey,
	     0, 	-- WARNIG
	     NULL
--INTO _column_details_extended_property   
	FROM INFORMATION_SCHEMA.COLUMNS AS col
	LEFT JOIN(	SELECT SCHEMA_NAME(o.schema_id)AS TABLE_SCHEMA
                      , o.name AS TABLE_NAME
                      , c.name AS COLUMN_NAME
                      , i.is_primary_key
				FROM sys.indexes AS i 	JOIN sys.index_columns AS ic ON i.object_id = ic.object_id	AND i.index_id = ic.index_id
										JOIN sys.objects AS o ON i.object_id = o.object_id
										LEFT JOIN sys.columns AS c ON ic.object_id = c.object_id	AND c.column_id = ic.column_id
				WHERE i.is_primary_key = 1)AS pk ON col.TABLE_NAME = pk.TABLE_NAME
                                                  AND col.TABLE_SCHEMA = pk.TABLE_SCHEMA
                                                  AND col.COLUMN_NAME = pk.COLUMN_NAME

 WHERE col.TABLE_NAME NOT IN ('_flyway_schema_history', '_column_details_extended_property', 'sysdiagrams')
   AND col.TABLE_SCHEMA = 'dbo'
   AND EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE INFORMATION_SCHEMA.TABLES.TABLE_NAME = col.TABLE_NAME AND INFORMATION_SCHEMA.TABLES.TABLE_TYPE = 'BASE TABLE' )
   
 ORDER BY col.TABLE_NAME, col.ORDINAL_POSITION;