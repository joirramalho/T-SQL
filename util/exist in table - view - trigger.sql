-- Exist IN Table, View ou Trigger

SELECT * 
FROM   INFORMATION_SCHEMA.VIEWS 
WHERE  VIEW_DEFINITION like '%TbFeriado%'

SELECT      o.[name], c.[text]
FROM        sys.objects AS o
INNER JOIN  sys.syscomments AS c ON      o.object_id = c.id
WHERE   o.[type] = 'TR' and TExt LIKE '%TbFeriado%'
order by Name

SELECT DISTINCT
       o.name AS Object_Name,
       o.type_desc
  FROM sys.sql_modules m
       INNER JOIN sys.objects o ON m.object_id = o.object_id
 WHERE m.definition Like '%TbFeriado%';