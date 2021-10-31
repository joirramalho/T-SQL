DECLARE @COLUMN_SEARCH varchar(100)

SET @COLUMN_SEARCH = 'BANCO'
 
SELECT
--  SCHEMA_NAME(TABLELIST.schema_id) AS Schema_Name,
  TABLELIST.name AS Table_Name,
  COLLIST.name AS Column_Name,
  'exec sp_addextendedproperty @name=N''MS_Description'', @value=N''Desc Extended Property'', 			@level0type=N''schema'',@level0name=N'''
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
  
  '''

--  , @value=N''Banking'';'  --Change this line to one of the information types: Banking, Contact Info, Credentials, Credit Card, Date of Birth, Financial, Health, Name, National ID, Networking, SSN, Other
  
FROM sys.tables AS TABLELIST
INNER JOIN sys.all_columns AS COLLIST	ON TABLELIST.object_ID = COLLIST.object_id
--WHERE COLLIST.name LIKE '%' + @COLUMN_SEARCH + '%'


exec sp_addextendedproperty 
@name=N'MS_Description', 
@value=N'Desc Extended Property', 			
@level0type=N'schema',@level0name=N'dbo' ,
@level1type=N'table',@level1name=N'Seg_AutorizacaoOperadorAcaoOrgao' ,
@level2type=N'column',@level2name=N'DataInclusao'

--  , @value=N'Banking';


--exec sp_addextendedproperty 
--	@name=N'MS_Description', 
--	@value=N'Desc Extended Property', 			
--	@level0type=N'schema', @level0name=N'dbo' ,
--	@level1type=N'table',@level1name=N'Seg_AutorizacaoOperadorAcaoOrgao' ,
--	@level2type=N'column',@level2name=N'DataInclusao' ,
--	@value=N'Banking';


--USE [bdc]
--EXEC sys.sp_addextendedproperty 
--	@name=N'MS_Description', 
--	@value=N'Testing entry for Extended Property - IdOrgao' , 
--	@level0type=N'SCHEMA',@level0name=N'dbo', 
--	@level1type=N'TABLE',@level1name=N'Gen_Orgao', 
--	@level2type=N'COLUMN',@level2name=N'IdOrgao'
