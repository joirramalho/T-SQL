-- 11jan22
-- 05mai21

	-- https://www.brentozar.com/blitz/tempdb-data-files/

	-- How to Add or Remove TempDB Data Files
    	-- https://www.c-sharpcorner.com/UploadFile/d2b5dd/how-to-add-or-remove-tempdb-data-files-multiple-tempdb-data/

	-- LOAD GENERATOR
	-- https://use-the-index-luke.com/sql/example-schema/sql-server/performance-testing-scalability


SELECT name, file_id, type_desc, size * 8 / 1024 [TempdbSizeInMB]
FROM sys.master_files
WHERE DB_NAME(database_id) = 'tempdb'
ORDER BY type_desc DESC, file_id 
                
--SELECT *   FROM sys.master_files
                
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



--USE tempDB  
	--EXEC SP_HELPFILE;

/*
USE [master]; 

	
	--Aumento automático de 64 MB até que o disco fique cheio
		--	https://docs.microsoft.com/pt-br/sql/relational-databases/databases/tempdb-database?view=sql-server-ver15#physical-properties-of-tempdb-in-sql-server

	ALTER DATABASE tempdb MODIFY FILE (name='tempdev4', size = 64MB ); -- FILEGROWTH = 64MB


--Adding three additional files

--	USE [master];
	
	--ALTER DATABASE [tempdb] ADD FILE (NAME = N'tempdev2', FILENAME = N'/var/opt/mssql/data/tempdb2.ndf' , SIZE = 8MB, FILEGROWTH = 64MB);
	--ALTER DATABASE [tempdb] ADD FILE (NAME = N'tempdev3', FILENAME = N'/var/opt/mssql/data/tempdb3.ndf' , SIZE = 8MB, FILEGROWTH = 64MB);
	--ALTER DATABASE [tempdb] ADD FILE (NAME = N'tempdev4', FILENAME = N'/var/opt/mssql/data/tempdb4.ndf' , SIZE = 8MB, FILEGROWTH = 64MB);
*/



-- REMOVE tempdb

--	VPS01a
		--tempdev
		--tempdev2
		--tempdev3
		--tempdev4
		--templog

--	USE tempdb;
--
--	DBCC SHRINKFILE (tempdb2, EMPTYFILE); -- to empty "tempdev12" data file

	-- ALTER DATABASE tempdb  REMOVE FILE tempdb2




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