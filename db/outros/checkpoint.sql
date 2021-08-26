-- 04ago21

-- SQL Server CHECKPOINT, Lazy Writer, Eager Writer and Dirty Pages in SQL Server

    -- https://www.sqlshack.com/sql-server-checkpoint-lazy-writer-eager-writer-and-dirty-pages-in-sql-server/


SELECT db_name(database_id) AS 'Database',
count(page_id) AS 'Dirty Pages'
FROM sys.dm_os_buffer_descriptors
WHERE is_modified =1
GROUP BY db_name(database_id)
ORDER BY count(page_id) DESC



-- select [Current LSN] , Operation, Context, LogBlockGeneration,[Checkpoint Begin],[Checkpoint End],Description,[Log Record]
-- from ::fn_dblog(null,null) WHERE [Operation] like '%CKPT'