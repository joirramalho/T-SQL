--05dez21

--USE dbSigaNeves_Arquivo01;


DECLARE @sql nvarchar(max) = N''
 
SELECT @sql += '[' + COLUMN_NAME + '], ' 
  FROM INFORMATION_SCHEMA.COLUMNS AS d 
  WHERE TABLE_NAME = 'TbParametroAssinaturaEletronica'
  	AND LEFT(COLUMN_NAME,1) <> '_'

SELECT DatabaseCount = @@ROWCOUNT, cmd = @sql;

--select schema_name(tab.schema_id) as schema_name, tab.name as table_name,  col.column_id, col.name as column_name,  t.name as data_type, col.max_length, col.precision
--from sys.tables as tab
--    inner join sys.columns  as col  on tab.object_id = col.object_id
--    left join sys.types     as t    on col.user_type_id = t.user_type_id
--WHERE tab.name = 'TbLancamentoCobranca_Auditoria'
--order by schema_name, table_name, column_id;