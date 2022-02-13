--10fev22
	--INDEX by database

SELECT 
     TableName = t.name, COUNT(*)
FROM 
     sys.indexes ind 
INNER JOIN 
     sys.tables t ON ind.object_id = t.object_id 
--WHERE 
--     ind.is_primary_key = 0 
--     AND ind.is_unique = 0 
--     AND ind.is_unique_constraint = 0 
--     AND t.is_ms_shipped = 0 
GROUP BY t.name
ORDER BY 
     count(*) DESC