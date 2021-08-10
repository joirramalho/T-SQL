EXEC dbLogMonitor.dbo.sp_Where

IF OBJECT_ID('TEMPDB..##temp') IS NOT NULL 
  DROP TABLE ##temp

Create Table ##temp ( DatabaseName sysname, Name sysname, physical_name nvarchar(500), size decimal (18,2), FreeSpace decimal (18,2), NameSize VARCHAR(20) )

Exec sp_msforeachdb 'Use [?];
    Insert Into ##temp (DatabaseName, Name, physical_name, Size, FreeSpace)
        Select DB_NAME() AS [DatabaseName], Name,  physical_name,
        Cast(Cast(Round(cast(size as decimal) * 8.0/1024.0,2) as decimal(18,0)) as nvarchar) Size,
        Cast(Cast(Round(cast(size as decimal) * 8.0/1024.0,2) as decimal(18,0)) - Cast(FILEPROPERTY(name, ''SpaceUsed'') * 8.0/1024.0 as decimal(18,0)) as nvarchar) As FreeSpace
        From sys.database_files
        where DB_NAME() NOT IN (''master'',''tempdb'',''model'',''msdb'', ''dbLogMonitor'', ''dbSigaPadraoInst'') 
          AND type_desc = ''rows''
'
SET NOCOUNT ON

Select DatabaseName, Name, physical_name, size, FreeSpace
FROM ##temp  
-- where   Name LIKE 'dbSigaContemporaneo_Arquivo01%'
  order by Size    DESC   
  -- order by DatabaseName
  -- order by FreeSpace    DESC 

SET NOCOUNT OFF


