--04mai22

--ALTER DATABASE dbSigaSalesianoDomBosco_Arquivo COLLATE SQL_Latin1_General_CP1_CI_AI

SELECT c.name, c.collation_name
 FROM SYS.COLUMNS c
 JOIN SYS.TABLES t ON t.object_id = c.object_id
 WHERE t.name = 'TbAuditoria'
-- 

SELECT 
    'ALTER TABLE [' +  TABLE_SCHEMA + '].[' + TABLE_NAME  
    + '] ALTER COLUMN [' + COLUMN_NAME + '] ' + DATA_TYPE 
    + '(' + CAST(CHARACTER_MAXIMUM_LENGTH AS nvarchar(100)) 
    + ') COLLATE ' + 'SQL_Latin1_General_CP1_CI_AI' 
    + CASE WHEN IS_NULLABLE = 'YES' THEN ' NULL' ELSE ' NOT NULL' END 
FROM 
    INFORMATION_SCHEMA.COLUMNS 
WHERE
	TABLE_NAME = 'TbAuditoria'
--    DATA_TYPE like '%char'
