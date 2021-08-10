-- VERSION 1.01 08mai21 - FILEGROWTH = 65536 KB
-- VERSION 1.00 05mai21

-- https://www.brentozar.com/blitz/tempdb-data-files/

-- How to Add or Remove TempDB Data Files
    -- https://www.c-sharpcorner.com/UploadFile/d2b5dd/how-to-add-or-remove-tempdb-data-files-multiple-tempdb-data/

-- LOAD GENERATOR
-- https://use-the-index-luke.com/sql/example-schema/sql-server/performance-testing-scalability


-- EXEC dbLogMonitor.dbo.sp_Where

USE tempDB  

EXEC SP_HELPFILE;


-- ALTER GROWTH SIZE (in KB)
    -- ALTER DATABASE [tempdb] MODIFY FILE ( NAME = N'tempdev', FILEGROWTH = 65536 KB) -- SQL05, SQL04
    -- ALTER DATABASE [tempdb] MODIFY FILE ( NAME = N'tempdb2', FILEGROWTH = 65536 KB) -- SQL05, SQL04

    -- ALTER DATABASE [tempdb] MODIFY FILE ( NAME = N'tempdev3', FILEGROWTH = 65536 KB)


USE [master]; 
GO 
alter database tempdb modify file (name='tempdev', size = 8GB);
GO

/* Adding three additional files */

USE [master];

ALTER DATABASE [tempdb] ADD FILE (NAME = N'tempdev3', FILENAME = N'/var/opt/mssql/data/tempdb3.ndf' , SIZE = 2564096 KB, FILEGROWTH = 65536 KB);
ALTER DATABASE [tempdb] ADD FILE (NAME = N'tempdev4', FILENAME = N'/var/opt/mssql/data/tempdb4.ndf' , SIZE = 2564096 KB, FILEGROWTH = 65536 KB);
-- ALTER DATABASE [tempdb] ADD FILE (NAME = N'tempdev2', FILENAME = N'/var/opt/mssql/data/tempdb2.ndf' , SIZE = 8MB , FILEGROWTH = 65536 KB);


-- SQL01 & 02
  -- Att FILEGROWTH
ALTER DATABASE [tempdb] ADD FILE (NAME = N'tempdev3', FILENAME = N'/SQL/system/tempdev3.ndf' , SIZE = 2564096 KB, FILEGROWTH = 65536 KB);
ALTER DATABASE [tempdb] ADD FILE (NAME = N'tempdev4', FILENAME = N'/SQL/system/tempdev4.ndf' , SIZE = 2564096 KB, FILEGROWTH = 65536 KB);


-- REMOVE tempdb
    -- ALTER DATABASE tempdb  REMOVE FILE tempdev3




/*
SELECT name AS FileName,
    size*1.0/128 AS FileSizeInMB,
    CASE max_size
        WHEN 0 THEN 'Autogrowth is off.'
        WHEN -1 THEN 'Autogrowth is on.'
        ELSE 'Log file grows to a maximum size of 2 TB.'
    END,
    growth AS 'GrowthValue',
    'GrowthIncrement' =
        CASE
            WHEN growth = 0 THEN 'Size is fixed.'
            WHEN growth > 0 AND is_percent_growth = 0
                THEN 'Growth value is in 8-KB pages.'
            ELSE 'Growth value is a percentage.'
        END
FROM tempdb.sys.database_files;
*/

/*
-- Determining the amount of free space in tempdb
SELECT SUM(unallocated_extent_page_count) AS [free pages],
  (SUM(unallocated_extent_page_count)*1.0/128) AS [free space in MB]
FROM sys.dm_db_file_space_usage;

-- Determining the amount of space used by the version store
SELECT SUM(version_store_reserved_page_count) AS [version store pages used],
  (SUM(version_store_reserved_page_count)*1.0/128) AS [version store space in MB]
FROM sys.dm_db_file_space_usage;

-- Determining the amount of space used by internal objects
SELECT SUM(internal_object_reserved_page_count) AS [internal object pages used],
  (SUM(internal_object_reserved_page_count)*1.0/128) AS [internal object space in MB]
FROM sys.dm_db_file_space_usage;

-- Determining the amount of space used by user objects
SELECT SUM(user_object_reserved_page_count) AS [user object pages used],
  (SUM(user_object_reserved_page_count)*1.0/128) AS [user object space in MB]
FROM sys.dm_db_file_space_usage;
*/

/*
-- Obtaining the space consumed by internal objects in all currently running tasks in each session
SELECT session_id,
  SUM(internal_objects_alloc_page_count) AS task_internal_objects_alloc_page_count,
  SUM(internal_objects_dealloc_page_count) AS task_internal_objects_dealloc_page_count
FROM sys.dm_db_task_space_usage
GROUP BY session_id;

-- Obtaining the space consumed by internal objects in the current session for both running and completed tasks
SELECT R2.session_id,
  R1.internal_objects_alloc_page_count
  + SUM(R2.internal_objects_alloc_page_count) AS session_internal_objects_alloc_page_count,
  R1.internal_objects_dealloc_page_count
  + SUM(R2.internal_objects_dealloc_page_count) AS session_internal_objects_dealloc_page_count
FROM sys.dm_db_session_space_usage AS R1
INNER JOIN sys.dm_db_task_space_usage AS R2 ON R1.session_id = R2.session_id
GROUP BY R2.session_id, R1.internal_objects_alloc_page_count,
  R1.internal_objects_dealloc_page_count;
*/