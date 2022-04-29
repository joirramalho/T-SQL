--25abr22

--sp_helpindex 'TbAlunoCurso'

SELECT DB_NAME() AS Database_Name
, sc.name AS Schema_Name
, o.name AS Table_Name
, i.name AS Index_Name
, i.type_desc AS Index_Type
FROM sys.indexes i
INNER JOIN sys.objects o ON i.object_id = o.object_id
INNER JOIN sys.schemas sc ON o.schema_id = sc.schema_id
WHERE i.is_primary_key = 1 AND o.type = 'U' AND i.type_desc = 'NONCLUSTERED'
ORDER BY o.name, i.type



