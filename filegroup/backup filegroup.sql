-- CREATE DATABASE dbFilegroup
    -- https://www.mssqltips.com/sqlservertip/5832/move-sql-server-tables-to-different-filegroups/


-- USE dbFilegroup

--     SET ANSI_NULLS ON
--     GO
--     SET QUOTED_IDENTIFIER ON
--     GO
--     CREATE TABLE [dbo].[TbPrimary](
--     	[Chave] [varchar](40) NOT NULL
--     PRIMARY KEY CLUSTERED 
--     (
--     	[Chave] ASC
--     )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
--     ) ON [PRIMARY]
--     GO



-- SET ANSI_NULLS ON
-- GO
-- SET QUOTED_IDENTIFIER ON
-- GO
-- CREATE TABLE [dbo].[TbSessao](
-- 	[Chave] [varchar](40) NOT NULL,
-- 	[Dados] [text] NULL,
-- 	[ExpiraEm] [datetime] NULL,
-- PRIMARY KEY CLUSTERED 
-- (
-- 	[Chave] ASC
-- )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
-- ) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
-- GO


-- sp_helpdb dbFilegroup



-- USE [master]
-- GO
-- ALTER DATABASE [dbFilegroup] ADD FILEGROUP [Filegroup_Sessao]
-- GO
-- ALTER DATABASE [dbFilegroup] ADD FILE ( NAME = N'Filegroup_Sessao_Data', FILENAME = N'C:\SQL\dbfilegroup_Sessao_Data.ndf' , SIZE = 8192KB , FILEGROWTH = 65536KB ) TO FILEGROUP [Filegroup_Sessao]
-- GO



-- sp_helpdb dbFilegroup

-- USE dbFilegroup
-- sp_help TbSessao 


    -- MOVE Table to filegroup WITHOUT DROP PK prior
    -- USE dbFilegroup
    -- GO

    -- CREATE UNIQUE CLUSTERED INDEX PK__TbSessao__97A44D76E0D7ABF6 ON TbSessao (Chave)  
    --     WITH (DROP_EXISTING = ON)  
    --     ON Filegroup_Sessao



-- DROP TABLE TbSessao



-- SELECT o.[name] AS TableName, i.[name] AS IndexName, fg.[name] AS FileGroupName
-- FROM sys.indexes i
-- INNER JOIN sys.filegroups fg ON i.data_space_id = fg.data_space_id
-- INNER JOIN sys.all_objects o ON i.[object_id] = o.[object_id]
-- WHERE i.data_space_id = fg.data_space_id AND o.type = 'U'



    -- DROP OLD PK & MOVE TABLE TO Filegroup
        -- ALTER TABLE TbSessao
        -- DROP CONSTRAINT PK_TbSessao WITH (MOVE TO Filegroup_Sessao)


    -- RE-CREATE PK
        -- ALTER TABLE [dbo].[TbSessao] ADD  CONSTRAINT [PK_TbSessao] PRIMARY KEY CLUSTERED 
        -- (
        --         [Chave] ASC
        -- )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [Filegroup_Sessao]
        -- GO

    -- SELECT * FROM TbSessao

    ---
    -- BACKUP FILEGROUP
    ---

-- FULL SEMANAL (OBRIGATÓRIO)

CREATE DATABASE [dbFilegroup]
 ON  PRIMARY 
( NAME = N'Filegroup',          FILENAME = N'C:\TEMP\dbFilegroup.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ), 
 FILEGROUP [FilegroupSessao] 
( NAME = N'Filegroup_Sessao',   FILENAME = N'C:\TEMP\dbFilegroup_Sessao.ndf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB ) 
 LOG ON 
( NAME = N'Filegroup_log',      FILENAME = N'C:\TEMP\dbFilegroup_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO



    backup database dbFilegroup to disk='C:\TEMP\dbFilegroup.bak' with stats = 10


USE dbFilegroup
USE dbFilegroup_Dev

INSERT INTO dbFilegroup.DBO.TbPrimary ( Chave ) VALUES ('1')
INSERT INTO dbFilegroup.DBO.TbSessao ( Chave, Dados, Expiraem ) VALUES ('1', 'texto', '2020-11-13 14:19')

select * from dbFilegroup.dbo.TbPrimary;    select * from dbFilegroup.dbo.TbSessao

-- drop database dbFilegroup_Dev


-- RESTORE ONLY FULL PRIOR IN DEV ENVIROMENT -- CREATE PHYSICAL FILES & ANOTHER DATABASE NAME, IF DESIRED
    RESTORE DATABASE [dbFilegroup_Dev]
    FROM DISK = N'C:\TEMP\dbFilegroup.BAK' WITH
    MOVE 'Filegroup'        TO 'C:\TEMP\dbFilegroup_Dev.mdf',
    MOVE 'Filegroup_Sessao' TO 'C:\TEMP\dbfilegroup_Sessao_Data_Dev.ndf',
    MOVE 'Filegroup_log'    TO 'C:\TEMP\dbFilegroup_log_Dev.ldf',
    RECOVERY, REPLACE, STATS = 10;



-- FULL  PRIMARY & filegroup
    backup database dbFilegroup 
        FILEGROUP = 'PRIMARY'
        TO DISK = 'C:\TEMP\dbFilegroup_PRIMARY.bak' with stats=10

    backup database dbFilegroup 
        FILEGROUP = 'Filegroup_Sessao'
        TO DISK = 'C:\TEMP\dbFilegroup_Filegroup_Sessao.bak' with stats=10


-- DIFFERENTIAL  PRIMARY & filegroup
    backup database dbFilegroup 
        FILEGROUP = 'PRIMARY'
        TO DISK = 'C:\TEMP\dbFilegroup_PRIMARY_DIFF.bak'
    WITH DIFFERENTIAL;

    backup database dbFilegroup 
        FILEGROUP = 'Filegroup_Sessao'
        TO DISK = 'C:\TEMP\dbFilegroup_Filegroup_Sessao_DIFF.bak'
    WITH DIFFERENTIAL;

-- Backup the transaction log  (you will probably have more than one of these in a real life environment, but for demo purposes I'm just taking one):-
    BACKUP LOG [dbFilegroup]    TO DISK = 'C:\TEMP\dbFilegroup_LogBackup.trn';




------  RESTORE ---------

-- now we can restore the development database. First we take a Tail Log backup
    BACKUP LOG [dbFilegroup_Dev]    TO DISK = 'C:\TEMP\dbFilegroup_Dev_TailLogBackup.trn'   WITH NORECOVERY;

-- RESTORE DO FULL  FILEGROUP
    RESTORE DATABASE [dbFilegroup_Dev]
    FILEGROUP = 'PRIMARY'
    FROM DISK = N'C:\TEMP\dbFilegroup_PRIMARY.BAK'
    WITH NORECOVERY

    RESTORE DATABASE [dbFilegroup_Dev]
    FILEGROUP = 'Filegroup_Sessao'  
    FROM DISK = N'C:\TEMP\dbFilegroup_Filegroup_Sessao.BAK' 
    WITH NORECOVERY

-- DIFFs
    RESTORE DATABASE [dbFilegroup_Dev]
    FILEGROUP = 'PRIMARY'
    FROM DISK = N'C:\TEMP\dbFilegroup_PRIMARY_DIFF.BAK'
    WITH NORECOVERY

    RESTORE DATABASE [dbFilegroup_Dev]
    FILEGROUP = 'Filegroup_Sessao'  
    FROM DISK = N'C:\TEMP\dbFilegroup_Filegroup_Sessao_DIFF.BAK' 
    WITH NORECOVERY

-- LOG
    RESTORE LOG [dbFilegroup_Dev]      FROM DISK = 'C:\TEMP\dbFilegroup_LogBackup.trn'  WITH NORECOVERY;

-- RECOVERY
    RESTORE DATABASE [dbFilegroup_Dev] WITH RECOVERY;

    
    
select * from dbFilegroup.dbo.TbPrimary;    select * from dbFilegroup.dbo.TbSessao

select * from dbFilegroup_Dev.dbo.TbPrimary;    select * from dbFilegroup_Dev.dbo.TbSessao
