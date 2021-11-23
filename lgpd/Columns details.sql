-- Collation?!


-- Bdc.dbo.[_column_details_extended_property] definition

-- Drop table

-- DROP TABLE Bdc.dbo.[_column_details_extended_property];

--	TRUNCATE TABLE Bdc.dbo.[_column_details_extended_property];


/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
ALTER TABLE dbo._column_details_extended_property ADD
	IsError bit NOT NULL CONSTRAINT DF__column_details_extended_property_IsError DEFAULT 0,
	Description varchar(512) NULL
ALTER TABLE dbo._column_details_extended_property SET (LOCK_ESCALATION = TABLE)
COMMIT



SELECT 
	col.TABLE_CATALOG AS [Database]
     , col.TABLE_SCHEMA AS Owner
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
     , CAST(ISNULL(pk.is_primary_key, 0)AS bit)AS IsPrimaryKey

     INTO _column_details_extended_property
     
     FROM INFORMATION_SCHEMA.COLUMNS AS col
       LEFT JOIN(SELECT SCHEMA_NAME(o.schema_id)AS TABLE_SCHEMA
                      , o.name AS TABLE_NAME
                      , c.name AS COLUMN_NAME
                      , i.is_primary_key
                   FROM sys.indexes AS i JOIN sys.index_columns AS ic ON i.object_id = ic.object_id	AND i.index_id = ic.index_id
                                         JOIN sys.objects AS o ON i.object_id = o.object_id
                                         LEFT JOIN sys.columns AS c ON ic.object_id = c.object_id	AND c.column_id = ic.column_id
                  WHERE i.is_primary_key = 1)AS pk ON col.TABLE_NAME = pk.TABLE_NAME
                                                  AND col.TABLE_SCHEMA = pk.TABLE_SCHEMA
                                                  AND col.COLUMN_NAME = pk.COLUMN_NAME

 WHERE col.TABLE_NAME NOT IN ('_flyway_schema_history', '_column_details_extended_property', 'sysdiagrams')
   AND col.TABLE_SCHEMA = 'dbo'
   AND EXISTS(SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE INFORMATION_SCHEMA.TABLES.TABLE_NAME = col.TABLE_NAME AND INFORMATION_SCHEMA.TABLES.TABLE_TYPE = 'BASE TABLE' )
   
 ORDER BY col.TABLE_NAME, col.ORDINAL_POSITION;
 