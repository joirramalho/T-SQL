IF OBJECT_ID('sp_CompareTable') IS NOT NULL  
    DROP PROC sp_CompareTable 
GO 
/* 
 
        Author    -- Satheesh Variath 
        Email     -- satheeshv@sqlthoughts.com 
        Sample Usage 
            Exec sp_CompareTable @Db1='DB1',@Db2='DB2',@TableName='Student' 
         
*/     
CREATE PROC sp_CompareTable(@Db1 varchar(250),@Db2 sysname , @SchemaName sysname ='dbo',@TableName sysname) 
AS 
declare @reason varchar(7)='Missing'; 
declare @linkedserver sysname; 
IF CHARINDEX('.',@db1,1)<>0 
    SET @Db1=QUOTENAME(SUBSTRING(@db1,1, CHARINDEX('.',@db1,1)-1))+'.'+QUOTENAME(SUBSTRING(@db1, CHARINDEX('.',@db1,1)+1,DATALENGTH(@db1)-CHARINDEX('.',@db1,1))) 
 
IF CHARINDEX('.',@Db2,1)<>0 
    SET @Db2=QUOTENAME(SUBSTRING(@Db2,1, CHARINDEX('.',@Db2,1)-1))+'.'+QUOTENAME(SUBSTRING(@Db2, CHARINDEX('.',@Db2,1)+1,DATALENGTH(@Db2)-CHARINDEX('.',@Db2,1))) 
 
print @db1 
EXEC ('select * from  
(SELECT * FROM '+ @db1 +'.'+@SchemaName+'.'+@TableName +'  
EXCEPT 
SELECT * FROM '+ @db2 +'.'+@SchemaName+'.'+@TableName +') T 
Cross Join (SELECT '''+@reason +' in '+@db2 +'.'+@SchemaName+'.'+@TableName+''' Reason)T2 
Union ALL 
select * from  
(SELECT * FROM '+ @db2 +'.'+@SchemaName+'.'+@TableName +'  
EXCEPT 
SELECT * FROM '+ @db1 +'.'+@SchemaName+'.'+@TableName +' ) T Cross Join (SELECT '''+@reason +' in '+@db1 +'.'+@SchemaName+'.'+@TableName+''' Reason)T2') 
 
GO 