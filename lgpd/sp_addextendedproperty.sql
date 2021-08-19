--18ago21

--SQL Server Management Studio 2017 Data Discovery and Categorization
--https://www.mssqltips.com/sqlservertip/5497/sql-server-management-studio-2017-data-discovery-and-categorization/

--Working with SQL Server Extended Properties
--https://www.mssqltips.com/sqlservertip/5384/working-with-sql-server-extended-properties/

--Classificação dos Dados
--https://www.gov.br/cidadania/pt-br/acesso-a-informacao/lgpd/classificacao-dos-dados

DECLARE @COLUMN_SEARCH varchar(100)

SET @COLUMN_SEARCH = 'BANCO'
 
SELECT
  SCHEMA_NAME(TABLELIST.schema_id) AS Schema_Name,
  TABLELIST.name AS Table_Name,
  COLLIST.name AS Column_Name,
  'exec sp_addextendedproperty @name=N''sys_information_type_name'',@level0type=N''schema'',@level0name=N'''
  +
  SCHEMA_NAME(TABLELIST.schema_id)
  +
  ''' ,@level1type=N''table'',@level1name=N'''
  +
  TABLELIST.name
  +
  ''' ,@level2type=N''column'',@level2name=N'''
  +
  COLLIST.name
  +
  
  ''' ,@value=N''Banking'';'  --Change this line to one of the information types: Banking, Contact Info, Credentials, Credit Card, Date of Birth, Financial, Health, Name, National ID, Networking, SSN, Other
  
FROM sys.tables AS TABLELIST
INNER JOIN sys.all_columns AS COLLIST
  ON TABLELIST.object_ID = COLLIST.object_id
WHERE COLLIST.name LIKE '%' + @COLUMN_SEARCH + '%'
 
UNION ALL
 
SELECT
  SCHEMA_NAME(TABLELIST.schema_id) AS Schema_Name,
  TABLELIST.name AS Table_Name,
  COLLIST.name AS Column_Name,
  'exec sp_addextendedproperty @name=N''sys_information_type_id'',@level0type=N''schema'',@level0name=N'''
  +
  SCHEMA_NAME(TABLELIST.schema_id)
  +
  ''' ,@level1type=N''table'',@level1name=N'''
  +
  TABLELIST.name
  +
  ''' ,@level2type=N''column'',@level2name=N'''
  +
  COLLIST.name
  +
  ''' ,@value=''' + CAST(NEWID() AS varchar(100)) + ''';'
FROM sys.tables AS TABLELIST
INNER JOIN sys.all_columns AS COLLIST
  ON TABLELIST.object_ID = COLLIST.object_id
WHERE COLLIST.name LIKE '%' + @COLUMN_SEARCH + '%'
 
UNION ALL
  
SELECT
  SCHEMA_NAME(TABLELIST.schema_id) AS Schema_Name,
  TABLELIST.name AS Table_Name,
  COLLIST.name AS Column_Name,
  'exec sp_addextendedproperty @name=N''sys_sensitivity_label_name'',@level0type=N''schema'',@level0name=N'''
  +
  SCHEMA_NAME(TABLELIST.schema_id)
  +
  ''' ,@level1type=N''table'',@level1name=N'''
  +
  TABLELIST.name
  +
  ''' ,@level2type=N''column'',@level2name=N'''
  +
  COLLIST.name
  +
  
  ''' ,@value=N''Confidential'';' -- Change Sensitivity Level to one of the levels: Public, General, Confidential, Confidential - GDPR, Highly Confidential, Highly Confidential - GDPR
   
FROM sys.tables AS TABLELIST
INNER JOIN sys.all_columns AS COLLIST
  ON TABLELIST.object_ID = COLLIST.object_id
WHERE COLLIST.name LIKE '%' + @COLUMN_SEARCH + '%'
 
UNION ALL
 
SELECT
  SCHEMA_NAME(TABLELIST.schema_id) AS Schema_Name,
  TABLELIST.name AS Table_Name,
  COLLIST.name AS Column_Name,
  'exec sp_addextendedproperty @name=N''sys_sensitivity_label_id'',@level0type=N''schema'',@level0name=N'''
  +
  SCHEMA_NAME(TABLELIST.schema_id)
  +
  ''' ,@level1type=N''table'',@level1name=N'''
  +
  TABLELIST.name
  +
  ''' ,@level2type=N''column'',@level2name=N'''
  +
  COLLIST.name
  +
  ''' ,@value=''' + CAST(NEWID() AS varchar(100)) + ''';'
 
FROM sys.tables AS TABLELIST
INNER JOIN sys.all_columns AS COLLIST
  ON TABLELIST.object_ID = COLLIST.object_id
WHERE COLLIST.name LIKE '%' + @COLUMN_SEARCH + '%'
ORDER BY TABLELIST.name
, COLLIST.name;
			