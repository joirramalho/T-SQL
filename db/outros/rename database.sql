-- VERSION 1.01 18mai21
-- VERSION 1.00 22Set20

-- sp_detach_db - sp_attach_db

RESTORE FILELISTONLY	FROM DISK = '/SQL/temp/dbSigaDiocCaruaru_20102020_0825.bak'

USE master
GO

-- ALTER DATABASE dbSigaDiocCaruaru SET SINGLE_USER WITH ROLLBACK IMMEDIATE
-- GO

-- sp_renamedb
    -- EXEC master..sp_renamedb 'dbSigaDiocCaruaru','dbSigaDiocCaruaru_TESTE'


-- SELECT name AS [Logical Name], physical_name AS [DB File Path], type_desc AS [File Type], state_desc AS [State] 
-- FROM sys.master_files
-- WHERE database_id = DB_ID(N'dbSigaDiocCaruaru_TESTE')
-- GO


-- sp_detach_db
    -- USE [master]
    -- GO

    -- EXEC master.dbo.sp_detach_db @dbname = N'dbSigaDiocCaruaru_TESTE'
--


-- RENAME FILES
    -- [root@ip-172-31-16-24 SQL]# 
        -- mv dbSigaDiocCaruaru.mdf dbSigaDiocCaruaru_TESTE.mdf
        -- mv dbSigaDiocCaruaru_1.ldf dbSigaDiocCaruaru_1_TESTE.ldf



-- sp_attach_db
    USE [master]
    GO

    -- EXEC sp_attach_db @dbname = N'dbSigaDiocCaruaru_TESTE',   
    --     @filename1 =   N'/SQL/dbSigaDiocCaruaru_TESTE.mdf',   
    --     @filename2 =   N'/SQL/dbSigaDiocCaruaru_1_TESTE.ldf';  
    EXEC sp_attach_db @dbname = N'dbSigaSalePetrolina_Arquivo03',   
        @filename1 =   N'/SQL/dbSigaSalePetrolina_Arquivo03.mdf',   
        @filename2 =   N'/SQL/dbSigaSalePetrolina_Arquivo03_log.ldf';  
-- 


-- MULTI_USER
    -- ALTER DATABASE dbSigaDiocCaruaru_TESTE SET MULTI_USER 
-- 




-- NAO PRECISA ISSO
-- ALTER DATABASE [dbSigaDiocCaruaru_TESTE] MODIFY FILE (NAME=N'dbSiga_Data', NEWNAME=N'dbSiga_Data_TESTE')
-- GO
-- ALTER DATABASE [dbSigaDiocCaruaru_TESTE] MODIFY FILE (NAME=N'dbSiga_Log', NEWNAME=N'dbSiga_Log_TESTE')
-- GO




-- RENAME DATABASE

-- EXEC master..sp_renamedb 'dbBibModelo_v3','dbBibModelo'

-- EXEC master..sp_renamedb 'dbCantinaModelo_v3','dbCantinaModelo'