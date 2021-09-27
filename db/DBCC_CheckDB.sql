-- EXEC dbLogMonitor.dbo.sp_Where

-- 03ago21
-- 22abr21

EXEC dbLogMonitor.dbo.sp_foreachdb N'
        SET NOCOUNT ON

        CREATE TABLE #CheckDB([Error] INT,[Level] INT,[State] INT,[MessageText] VARCHAR(MAX),[RepairLevel] INT,[Status] INT,[DbId] INT,[DbFragId] INT,[ObjectID] INT,[IndexId] INT,[PartitionId] INT,[AllocUnitId] INT,[RidDbId] INT,[RidPruId] INT,[File] INT,[Page] INT,[Slot] INT,[RefDbID] INT,[RefPruId] INT,[RefFile] INT,[RefPage] INT,[RefSlot] INT,[Allocation] INT);

        INSERT INTO #CheckDB([Error], [Level], [State], [MessageText], [RepairLevel],[Status], [DbId], [DbFragId], [ObjectID], [IndexId], [PartitionId],[AllocUnitId], [RidDbId], [RidPruId], [File], [Page], [Slot], [RefDbID],[RefPruId], [RefFile], [RefPage], [RefSlot], [Allocation])
            EXEC (''DBCC CHECKDB([?]) WITH TABLERESULTS'');

    INSERT INTO dbLogMonitor.dbo.DBCC_CheckDB ( [Error], [Level], [State], [MessageText], [RepairLevel],[Status], [DbId], [DbFragId], [ObjectID], [IndexId] )--, [PartitionId],[AllocUnitId], [RidDbId], [RidPruId], [File], [Page], [Slot], [RefDbID],[RefPruId], [RefFile], [RefPage], [RefSlot], [Allocation])
        SELECT [Error], [Level], [State], [MessageText], [RepairLevel],[Status], [DbId], [DbFragId], [ObjectID], [IndexId] FROM #CheckDB WHERE Error = 8989 AND Error NOT IN ( 2593, 8997 )
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=1
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
,@name_pattern='dbSigaCELogos';
-- ,@database_list = 'dbSigaA'


-- 
-- DBCC CHECKDB([dbSigaRosaCamara]) -- WITH TABLERESULTS
-- 


/*
SELECT TOP (10) *
  FROM [dbLogMonitor].[dbo].[DBCC_CheckDB]
  order by timestamp DESC
*/

-- table structure for SQL Server 2012, 2014, 2016 and 2017

-- VERSION 1.01 - SQLTemplate-v4-27abr21
-- VERSION 1.01 - 15abr21

/*
USE dbLogMonitor;

IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DBCC_CheckDB]') AND type in (N'U'))
    DROP TABLE [dbo].[DBCC_CheckDB];

CREATE TABLE dbLogMonitor.[dbo].[DBCC_CheckDB](
[Error] [int] NULL,
[Level] [int] NULL,
[State] [int] NULL,
[MessageText] [varchar](7000) NULL,
[RepairLevel] [int] NULL,
[Status] [int] NULL,
[DbId] [int] NULL,
[DbFragId] [int] NULL,
[ObjectId] [int] NULL,
[IndexId] [int] NULL,
-- [PartitionID] [int] NULL,
-- [AllocUnitID] [int] NULL,
-- [RidDbId] [int] NULL,
-- [RidPruId] [int] NULL,
-- [File] [int] NULL,
-- [Page] [int] NULL,
-- [Slot] [int] NULL,
-- [RefDbId] [int] NULL,
-- [RefPruId] [int] NULL,
-- [RefFile] [int] NULL,
-- [RefPage] [int] NULL,
-- [RefSlot] [int] NULL,
-- [Allocation] [int] NULL,
timestamp           DATETIME DEFAULT GETDATE() CONSTRAINT PK_DBCC_CheckDB PRIMARY KEY CLUSTERED 
) ON [PRIMARY];
*/


-- TRUNCATE TABLE dbLogMonitor.dbo.DBCC_CheckDB


-- 2593 99
-- 8989 1  OK
-- 8997 8


-- IF @db = 'master'
--     INSERT INTO dbLogMonitor.dbo.CheckDB
--         SELECT CAST(SERVERPROPERTY('SERVERNAME') AS VARCHAR(255)), 'mssqlsystemresource', ISNULL((SELECT CONVERT(DECIMAL(10,2),SUM(size / 1024.0)) AS 'size' FROM sys.sysaltfiles WHERE DBID = 32767),0), MessageText, 'PHYSICAL ONLY', GETDATE(), completion_time = DATEDIFF(ss, @startTime, @endTime), NULL
--         FROM #CheckDB_old
--         WHERE [Error] = 8989 AND DbId = 32767;



-- Error   Level   State   MessageText
-- 2593    10      1       There are 0 rows in 0 pages for object "tblWhoops".

-- 8939    16      98      Table error: Object ID 565577053, index ID 1, partition ID 72057594041335808, alloc unit ID 72057594046971904 (type In-row data), page (1:312). Test (IS_OFF (BUF_IOERR, pBUF->bstat)) failed. Values are 133129 and -4.
-- 8928    16      1       Object ID 565577053, index ID 1, partition ID 72057594041335808, alloc unit ID 72057594046971904 (type In-row data): Page (1:312) could not be processed.  See other errors for details.
-- 8980    16      1       Table error: Object ID 565577053, index ID 1, partition ID 72057594041335808, alloc unit ID 72057594046971904 (type In-row data). Index node page (0:0), slot 0 refers to child page (1:312) and previous child (0:0), but they were not encountered.
-- 8990    10      1       CHECKTABLE found 0 allocation errors and 3 consistency errors in table 'tblWhoops' (object ID 565577053).