--20abr22

--Deprecated features to take out of your toolbox
	--https://sqlperformance.com/2021/07/sql-performance/deprecated-features-3

--query to help you track them down using the sys.columns catalog view
SELECT [Schema]    = s.name, 
       [Object]    = o.name,
       [Column]    = c.name,
       [Data Type] = TYPE_NAME(c.user_type_id) + CASE 
         WHEN c.system_type_id <> c.user_type_id 
         THEN N' (' + TYPE_NAME(c.system_type_id) + N')' 
         ELSE N'' END
  FROM sys.columns AS c
  INNER JOIN sys.objects AS o    ON c.[object_id] = o.[object_id]
  INNER JOIN sys.schemas AS s    ON o.[schema_id] = s.[schema_id]
  WHERE c.system_type_id IN (34, 35, 99)
  ORDER BY [Schema], [Object], [Column];
  
 
 
-- the columns might have default constraints associated with them. And you may have stored procedures with parameters that should be updated in tandem
 
 SELECT [Schema]  = s.name, 
       [Object]   = o.name, 
       [Parameter] = p.name, 
       [Data Type] = TYPE_NAME(p.user_type_id) + CASE 
         WHEN p.system_type_id <> p.user_type_id 
         THEN N' (' + TYPE_NAME(p.system_type_id) + N')' 
         ELSE N'' END
  FROM sys.objects AS o
  INNER JOIN sys.schemas AS s    	ON o.[schema_id] = s.[schema_id]
  INNER JOIN sys.parameters AS p    ON p.[object_id] = o.[object_id]
  WHERE p.system_type_id IN (34, 35, 99)
  ORDER BY [Schema], [Object], [Parameter];
  
 
 
--generates ALTER TABLE commands, taking into account nullability but no other complications like default constraints:
 SELECT N'ALTER TABLE ' + QUOTENAME(s.name)
  + N'.' + QUOTENAME(o.name)
  + N' ALTER COLUMN ' + QUOTENAME(c.name) + N' '
  + CASE c.system_type_id
      WHEN 34 THEN N'varbinary'
      WHEN 35 THEN N'varchar'
      WHEN 99 THEN N'nvarchar'
    END + N'(max)' 
  + CASE c.is_nullable 
      WHEN 0 THEN N' NOT' 
      ELSE N'' END + N' NULL;'
FROM sys.columns AS c
INNER JOIN sys.objects AS o  ON c.[object_id] = o.[object_id]
INNER JOIN sys.schemas AS s  ON o.[schema_id] = s.[schema_id]
WHERE c.system_type_id IN (34, 35, 99);