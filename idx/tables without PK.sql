USE dbSigaNeves_Arquivo03

--SELECT DB_NAME()

SELECT t.name AS Table_Name -- sc.name AS Schema_Name, 
FROM sys.tables t
INNER JOIN sys.schemas sc ON t.schema_id = sc.schema_id
WHERE OBJECTPROPERTY(t.object_id,'TableHasPrimaryKey') = 0  AND t.type = 'U'
ORDER BY t.name