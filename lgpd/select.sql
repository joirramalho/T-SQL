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
WHERE
   SCHEMA_NAME(tbl.schema_id)='dbo'
--   and tbl.name='Gen_orgao' 
--   and clmns.name='sno'
--   and p.name='SNO'
ORDER BY tbl.name

   
-- ##Comum_Carreira##
--EXEC CreateOrUpdateExtendedProperty 'Comum_Carreira','IdCarreira','Identificador da Tabela Comum Carreira'
--EXEC CreateOrUpdateExtendedProperty 'Comum_Carreira','NomeCarreira','Nome da Carreira'
--EXEC CreateOrUpdateExtendedProperty 'Comum_Carreira','IdOrgao','Identificador do Órgão da Carreira ({{ base_url_tceadmin2 }}/v2/UnidadeJurisdicionada/)'
--EXEC CreateOrUpdateExtendedProperty 'Comum_Carreira','DataInclusao','Data da Inclusão do Registro'
--EXEC CreateOrUpdateExtendedProperty 'Comum_Carreira','IdSessao','Identificador da Sessão do Registro'
--EXEC CreateOrUpdateExtendedProperty 'Comum_Carreira','IdSessaoOperacao','Identificador da Operação do Registro'   

   

--SELECT * FROM::fn_listextendedproperty('MS_Description', 'schema', 'dbo', 'table', 'Gen_Orgao', 'column', 'CodigoOrgao')
