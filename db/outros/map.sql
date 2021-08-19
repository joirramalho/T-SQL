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

UPDATE ##temp
    SET NameSize = case
      when size < 1000  then '1-até 1 GB'
      when size < 2000  then '2-de 1 GB a 2 GB'
      when size < 4000  then '3-de 2 GB a 4 GB'
      when size < 6000  then '4-de 4 GB a 6 GB'
      when size < 8000  then '5-de 6 GB a 8 GB'
      when size < 10000 then '6-de 8 GB a 10 GB'
      ELSE '7-Maior que 10 GB'
    END;

SELECT NameSize, COUNT(*)
From ##temp  
GROUP BY NameSize
ORDER by NameSize