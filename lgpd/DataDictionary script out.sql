DECLARE @COLUMN_SEARCH varchar(100)
DECLARE @TABLE_SEARCH varchar(100)

--SET @COLUMN_SEARCH = 'IdSessao'
SET @TABLE_SEARCH = 'Gen_Orgao'
 
SELECT
--  SCHEMA_NAME(TABLELIST.schema_id) AS Schema_Name,
COLLIST.column_id ,
  	TABLELIST.name AS Table_Name,
  	COLLIST.name AS Column_Name,

	'exec CreateOrUpdateExtendedProperty 	''' +	TABLELIST.name
  	+
  	''', '''	+	COLLIST.name
  	+
--	''', '''	+	COALESCE( CAST( p.value AS VARCHAR ), 'Identificador da Operação do Registro' )
--	''', '''	+	'Identificador da Sessão do Registro'
	''', '''	+	COALESCE( CAST( p.value AS VARCHAR(max) ), COLLIST.name )
  	+
  	''''

FROM sys.views AS TABLELIST
INNER JOIN sys.all_columns AS COLLIST	ON TABLELIST.object_ID = COLLIST.object_id
LEFT JOIN sys.extended_properties AS p ON p.major_id=TABLELIST.object_id AND p.minor_id=COLLIST.column_id AND p.class=1

--WHERE COLLIST.name LIKE '%' + @COLUMN_SEARCH --+ '%'
WHERE TABLELIST.name LIKE '%' + @TABLE_SEARCH --+ '%'

ORDER BY TABLELIST.name, COLLIST.column_id 



--SELECT * FROM sys.all_columns

--EXEC CreateOrUpdateExtendedProperty 'Comum_Carreira','DataInclusao','Data da Inclusão do Registro'
--EXEC CreateOrUpdateExtendedProperty 'Comum_Carreira','IdSessao','Identificador da Sessão do Registro'
--EXEC CreateOrUpdateExtendedProperty 'Comum_Carreira','IdSessaoOperacao','Identificador da Sessão que ocorreu a Operação do Registro'   


--exec CreateOrUpdateExtendedProperty 	'Gen_Orgao', 'OrgaoAtivo', 'OrgaoAtivo'




--	'exec sp_addextendedproperty 	@name=N''MS_Description'', @value=N''' + COALESCE( CAST( p.value AS VARCHAR ), COLLIST.name )
--	+
--	''', @level0type=N''schema'',	@level0name=N'''	+	SCHEMA_NAME(TABLELIST.schema_id)
--  	+
--  	''', @level1type=N''table'', 	@level1name=N''' 	+	TABLELIST.name
--  	+
--  	''', @level2type=N''column'', 	@level2name=N'''	+	COLLIST.name
--  	+
--  	''''




--
--
--   
--IF OBJECT_ID ('dbo.CreateOrUpdateExtendedProperty', 'P') IS NOT NULL
--    DROP PROCEDURE dbo.CreateOrUpdateExtendedProperty;
--
--ALTER PROCEDURE CreateOrUpdateExtendedProperty
--    @table nvarchar(128),  -- table name
--    @column nvarchar(128), -- column name, NULL if description for table
--    @descr sql_variant     -- description text
--AS
--BEGIN
--    SET NOCOUNT ON;
--
--    DECLARE @c nvarchar(128) = NULL;
--
--    IF @column IS NOT NULL
--        SET @c = N'COLUMN';
--
--
--	IF EXISTS(SELECT * FROM::fn_listextendedproperty('MS_Description', 'schema', 'dbo', 'table', @table, 'column', @column ))       
--        EXECUTE sp_updateextendedproperty  N'MS_Description', @descr, N'SCHEMA', N'dbo', N'TABLE', @table, @c, @column
--	ELSE
--		EXECUTE sp_addextendedproperty N'MS_Description', @descr, N'SCHEMA', N'dbo', N'TABLE', @table, @c, @column;
--END
--
--
--EXEC CreateOrUpdateExtendedProperty 'Gen_Orgao', 'CodigoOrgao', 'Cod 22'
--EXEC CreateOrUpdateExtendedProperty 'Gen_Orgao', 'IdOrgaoSuperior', 'IdOrgaoSuperior 2'
--EXEC CreateOrUpdateExtendedProperty 'Gen_Orgao', 'CEPOrgao', 'CEPOrgao 2'
--
--
--
--SELECT * FROM::fn_listextendedproperty('MS_Description', 'schema', 'dbo', 'table', 'Gen_Orgao', 'column', 'IdSessaoOperacao')




		--EXEC sys.sp_addextendedproperty @name = N'MS_Description',
		--  	@value = N'Descrevendo tabela de Gen_Orgao.',
		--  	@level0type = N'SCHEMA',	@level0name = N'dbo',
		--	@level1type = N'TABLE',		@level1name = N'Gen_Orgao';
		--
		--
		--EXEC sys.sp_addextendedproperty @name = N'MS_Description',
		--  	@value = N'Descrevendo view de Gen_Orgao.',
		--  	@level0type = N'SCHEMA',	@level0name = N'dbo',
		--	@level1type = N'VIEW',		@level1name = N'vw_Gen_Orgao';
		--
		--
		--EXEC sys.sp_addextendedproperty @name = N'MS_Description',
		--  	@value = N'Nome do Grupo da Unidade Jurisdicionada usado para classificar o Órgão.',
		--  	@level0type = N'SCHEMA',	@level0name = N'dbo',
		--	@level1type = N'VIEW',		@level1name = N'vw_Gen_Orgao',
		--	@level2type = N'Column', 	@level2name = N'NomeGrupoUnidadeJurisdicionada'; 
