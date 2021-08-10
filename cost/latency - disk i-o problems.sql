-- 20jul21 - adaptado

-- https://www.sqlshack.com/sql-server-troubleshooting-disk-i-o-problems/


-- io_stall: This column shows the total latency time for the I/O operations in a millisecond.


SELECT  CAST((io_stall_read_ms + io_stall_write_ms)/(1.0 + num_of_reads + num_of_writes) AS NUMERIC(10,1)) AS [Average Total Latency],
        DB_NAME(vfs.database_id) AS database_name,
        size_on_disk_bytes / 1024 / 1024. AS [Size of Disk] ,
        CAST(io_stall_read_ms/(1.0 + num_of_reads) AS NUMERIC(10,1)) AS [Average Read latency] ,
        CAST(io_stall_write_ms/(1.0 + num_of_writes) AS NUMERIC(10,1)) AS [Average Write latency] ,
        num_of_bytes_read / NULLIF(num_of_reads, 0) AS    [Average Bytes Per Read],
        num_of_bytes_written / NULLIF(num_of_writes, 0) AS   [Average Bytes Per Write],
        physical_name AS [Physical Name]
FROM    sys.dm_io_virtual_file_stats(NULL, NULL) AS vfs
  JOIN sys.master_files AS mf ON vfs.database_id = mf.database_id AND vfs.file_id = mf.file_id
ORDER BY [Average Total Latency] DESC