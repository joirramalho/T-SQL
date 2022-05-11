--16mar22
	--?

	--Different Ways to Find SQL Server Object Dependencies
	--
	--https://www.mssqltips.com/sqlservertip/2999/different-ways-to-find-sql-server-object-dependencies/

-- This gives you:

-- The FK itself itself
-- Schema that the FK belongs to
-- The "referencing table" or the table that has the FK
-- The "referencing column" or the column inside referencing table that points to the FK
-- The "referenced table" or the table that has the key column that your FK is pointing to
-- The "referenced column" or the column that is the key that your FK is pointing to


--USE dbSigaPadraoInst;

SELECT  obj.name AS FK_NAME, sch.name AS [schema_name], tab1.name AS [table], col1.name AS [column], tab2.name AS [referenced_table], col2.name AS [referenced_column]
FROM sys.foreign_key_columns fkc
INNER JOIN sys.objects obj	ON obj.object_id = fkc.constraint_object_id
INNER JOIN sys.tables tab1	ON tab1.object_id = fkc.parent_object_id
INNER JOIN sys.schemas sch	ON tab1.schema_id = sch.schema_id
INNER JOIN sys.columns col1	ON col1.column_id = parent_column_id AND col1.object_id = tab1.object_id
INNER JOIN sys.tables tab2	ON tab2.object_id = fkc.referenced_object_id
INNER JOIN sys.columns col2	ON col2.column_id = referenced_column_id AND col2.object_id = tab2.object_id

WHERE tab2.name = 'TbFavorecido'



-- https://www.dirceuresende.com/blog/mapeando-dependencias-entre-objetos-sql-server/
--	dependências em vários níveis.sql

SELECT
    DB_NAME() AS dbname,
    o.type_desc AS referenced_object_type,
    d1.referenced_entity_name,
--    d1.referenced_id,
    STUFF((
            SELECT	'; ' + OBJECT_NAME(d2.referencing_id)
            FROM	sys.sql_expression_dependencies d2
            WHERE	d2.referenced_id = d1.referenced_id
            ORDER 	BY	OBJECT_NAME(d2.referencing_id)
            FOR XML PATH('')
          ), 1, 1, '') AS dependent_objects_list
FROM
    sys.sql_expression_dependencies d1 JOIN sys.objects o ON d1.referenced_id = o.[object_id]
WHERE 	referenced_entity_name = 'TbContaPagar'
GROUP 	BY 	o.type_desc, d1.referenced_id, d1.referenced_entity_name
ORDER 	BY	o.type_desc, d1.referenced_entity_name