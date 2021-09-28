
-- Using SQL Server Database Metrics to Predict Application Problems
    -- https://www.sqlshack.com/using-database-metrics-to-predict-application-problems/

DECLARE @current_time_utc DATE = CAST(SYSUTCDATETIME() AS DATETIME2(0));
  
  SELECT
    @current_time_utc AS sample_time_utc,
    databases.name AS DatabaseName,
    master_files.name AS DatabaseFileName,
    master_files.type_desc AS FileType,
    master_files.physical_name,
    dm_io_virtual_file_stats.num_of_reads,
    dm_io_virtual_file_stats.num_of_bytes_read,
    dm_io_virtual_file_stats.num_of_writes,
    dm_io_virtual_file_stats.num_of_bytes_written
  FROM sys.master_files
  INNER JOIN sys.dm_io_virtual_file_stats(NULL, NULL)
  ON master_files.database_id = dm_io_virtual_file_stats.database_id
  INNER JOIN sys.databases
  ON databases.database_id = master_files.database_id
  AND master_files.file_id = dm_io_virtual_file_stats.file_id;




-- SQL Server Database Metrics
    -- https://www.sqlshack.com/database-metrics/
  SELECT
  @@SERVERNAME AS server_name,
  GETDATE() AS local_time,
  dm_exec_requests.session_id,
  dm_exec_requests.blocking_session_id,
  databases.name AS database_name,
  dm_exec_requests.wait_time,
  dm_exec_requests.wait_resource,
  dm_exec_requests.wait_type,
  dm_exec_sessions.host_name,
  dm_exec_sessions.program_name,
  dm_exec_sessions.login_name,
  dm_exec_requests.command,
  CASE
    WHEN dm_exec_sql_text.text LIKE '%CREATE PROCEDURE%'
    THEN '/* PROC: */ ' + SUBSTRING(dm_exec_sql_text.text, CHARINDEX('CREATE PROCEDURE ', dm_exec_sql_text.text) + 17, 60) + ' ... '
    ELSE SUBSTRING(dm_exec_sql_text.text, 1, 60) + ' ...'
  END AS Begin_SQL,
  CASE
    WHEN dm_exec_sql_text.text LIKE '%CREATE PROCEDURE%' THEN '/* PROC - SEE SOURCE CODE */'
    ELSE RTRIM(dm_exec_sql_text.text)
  END AS Script_Text,
  SUBSTRING(dm_exec_sql_text.text, (dm_exec_requests.statement_start_offset/2) + 1,
    ((CASE dm_exec_requests.statement_end_offset WHEN -1 THEN DATALENGTH(dm_exec_sql_text.text) ELSE dm_exec_requests.statement_end_offset
    END - dm_exec_requests.statement_start_offset)/2) + 1) AS Wait_SQL,
  CONVERT(VARCHAR(MAX), Query_Hash, 1) AS Query_Hash,
  CASE WHEN dm_exec_sql_text.text IS NULL THEN NULL ELSE CHECKSUM(dm_exec_sql_text.text) END AS Checksum_Text_Hash
FROM master.sys.dm_exec_requests
INNER JOIN master.sys.dm_exec_sessions
ON dm_exec_requests.session_id = dm_exec_sessions.session_id
OUTER APPLY master.sys.dm_exec_sql_text(dm_exec_requests.sql_handle)
INNER JOIN sys.databases
ON databases.database_id = dm_exec_requests.database_id
WHERE dm_exec_sessions.is_user_process = 1 -- Only check user processes



-- Native scoring using the PREDICT T-SQL function with SQL machine learning
    -- https://docs.microsoft.com/en-us/sql/machine-learning/predictions/native-scoring-predict-transact-sql?view=sql-server-ver15

    -- https://docs.microsoft.com/en-us/sql/t-sql/queries/predict-transact-sql?view=sql-server-ver15


-- ANNOUNCING GENERAL AVAILABILITY OF NATIVE SCORING USING PREDICT FUNCTION IN AZURE SQL DATABASE
    -- https://www.oncalldba.com.au/announcing-general-availability-of-native-scoring-using-predict-function-in-azure-sql-database/