--27nov21
-- Exist IN Table, View ou Trigger

SELECT * 
FROM   INFORMATION_SCHEMA.VIEWS 
WHERE  VIEW_DEFINITION like '%TbAlunoTurma%'

SELECT      o.[name], c.[text]
FROM        sys.objects AS o
INNER JOIN  sys.syscomments AS c ON      o.object_id = c.id
WHERE   o.[type] = 'TR' and TExt LIKE '%TbAlunoTurma%'
order by Name

SELECT DISTINCT
       o.name AS Object_Name,
       o.type_desc
  FROM sys.sql_modules m
       INNER JOIN sys.objects o ON m.object_id = o.object_id
 WHERE m.definition Like '%TbAlunoTurma%';
 
sp_helptext 'SpAlunoTurmaAlterarTurma2'



--Find all TABLES/VIEWS containing column with specified name
	SELECT * --TABLE_NAME, COLUMN_NAME
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE table_schema = 'dbo'
	AND TABLE_NAME = 'VwLancamentoCobrancaContabil'
	AND column_name like 'ValorDescontoNaoCondicionadoPROUNI';


--Find all TABLES (ONLY) containing column with specified name
	--	SELECT      c.name  AS 'ColumnName'
	--	            ,t.name AS 'TableName'
	--	FROM        sys.columns c
	--	JOIN        sys.tables  t   ON c.object_id = t.object_id
	--	WHERE       c.name LIKE '%ValorDescontoNaoCondicionadoPROUNI%'
	--	ORDER BY    TableName, ColumnName;
	

