--06mai22
--	Dependências de uma função
	--https://docs.microsoft.com/pt-br/sql/relational-databases/user-defined-functions/view-user-defined-functions?view=sql-server-ver15
 
-- Get all of the dependency information  
SELECT OBJECT_NAME(sed.referencing_id) AS referencing_entity_name,   
    o.type_desc AS referencing_desciption,   
    COALESCE(COL_NAME(sed.referencing_id, sed.referencing_minor_id), '(n/a)') AS referencing_minor_id,   
    sed.referencing_class_desc, sed.referenced_class_desc,  
    sed.referenced_server_name, sed.referenced_database_name, sed.referenced_schema_name,  
    sed.referenced_entity_name,   
    COALESCE(COL_NAME(sed.referenced_id, sed.referenced_minor_id), '(n/a)') AS referenced_column_name,  
    sed.is_caller_dependent, sed.is_ambiguous  
-- from the two system tables sys.sql_expression_dependencies and sys.object  
FROM sys.sql_expression_dependencies AS sed  
INNER JOIN sys.objects AS o ON sed.referencing_id = o.object_id  
-- on the function dbo.ufnGetProductDealerPrice  
WHERE sed.referencing_id = OBJECT_ID('dbo.fn_SplitOnUpperCase');  



/*
 * 
-- Get the function name, definition, and relevant properties  
SELECT sm.object_id,   
   OBJECT_NAME(sm.object_id) AS object_name,   
   o.type,   
   o.type_desc,   
   sm.definition,  
   sm.uses_ansi_nulls,  
   sm.uses_quoted_identifier,  
   sm.is_schema_bound,  
   sm.execute_as_principal_id  
-- using the two system tables sys.sql_modules and sys.objects  
FROM sys.sql_modules AS sm  
JOIN sys.objects AS o ON sm.object_id = o.object_id  
-- from the function 'dbo.ufnGetProductDealerPrice'  
WHERE sm.object_id = OBJECT_ID('dbo.fn_SplitOnUpperCase')  
ORDER BY o.type;  
*/