-- 29out21 - List Data Dictionary
	--https://www.mssqltips.com/sqlservertip/5384/working-with-sql-server-extended-properties/

SELECT
   SCHEMA_NAME(tbl.schema_id) AS SchemaName,	
   tbl.name AS TableName, 
   clmns.name AS ColumnName,
   p.name AS ExtendedPropertyName,
   CAST(p.value AS sql_variant) AS ExtendedPropertyValue
FROM
   sys.tables AS tbl
   INNER JOIN sys.all_columns AS clmns ON clmns.object_id=tbl.object_id
   INNER JOIN sys.extended_properties AS p ON p.major_id=tbl.object_id AND p.minor_id=clmns.column_id AND p.class=1


--USE [bdc]
--EXEC sys.sp_addextendedproperty 
--	@name=N'MS_Description', 
--	@value=N'Testing entry for Extended Property - IdOrgao' , 
--	@level0type=N'SCHEMA',@level0name=N'dbo', 
--	@level1type=N'TABLE',@level1name=N'Gen_Orgao', 
--	@level2type=N'COLUMN',@level2name=N'IdOrgao'
