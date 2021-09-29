-- 03ago21 - dbSigaFACHO & CRM
-- 17mai21 - (@P1 nvarchar(60))SELECT [TbAccessToken].[IdAccessToken]


-- DIRCEU RESENDE
    -- Identificar eventos de deadlock
        -- https://www.dirceuresende.com/blog/sql-server-consultas-uteis-do-dia-a-dia-do-dba-que-voce-sempre-tem-que-ficar-procurando-na-internet/

DECLARE @TimeZone INT = DATEDIFF(HOUR, GETUTCDATE(), GETDATE())

SELECT
    DATEADD(HOUR, @TimeZone, xed.value('@timestamp', 'datetime2(3)')) AS CreationDate,
    xed.query('.') AS XEvent
FROM
(
    SELECT 
        CAST(st.[target_data] AS XML) AS TargetData
    FROM 
        sys.dm_xe_session_targets AS st
        INNER JOIN sys.dm_xe_sessions AS s ON s.[address] = st.event_session_address
    WHERE 
        s.[name] = N'system_health'
        AND st.target_name = N'ring_buffer'
) AS [Data]
CROSS APPLY TargetData.nodes('RingBufferTarget/event[@name="xml_deadlock_report"]') AS XEventData (xed)
ORDER BY 
    CreationDate DESC



-- use dbCrmActivesoft
-- sp_help 'dbCrmActivesoft.dbo.TbAccessToken'

-- SELECT TOP 5 IdAccessToken
-- FROM dbCrmActivesoft.dbo.TbAccessToken
-- order by IdAccessToken DESC



-- USE [dbLogMonitor]
-- GO

-- EXEC dbLogMonitor.dbo.sp_where

-- IF (OBJECT_ID('dbo.Tabela1') IS NOT NULL) DROP TABLE dbo.Tabela1
-- CREATE TABLE dbo.Tabela1 (
--     Id INT IDENTITY(1, 1),
--     Nome VARCHAR(100)
-- )

-- INSERT INTO dbo.Tabela1 ( Nome )
-- VALUES ('Dirceu'), ('Resende')

-- IF (OBJECT_ID('dbo.Tabela2') IS NOT NULL) DROP TABLE dbo.Tabela2
-- CREATE TABLE dbo.Tabela2 (
--     Id INT IDENTITY(1, 1),
--     Nome VARCHAR(100)
-- )

-- INSERT INTO dbo.Tabela2 ( Nome )
-- VALUES ('DBA'), ('SQL Server')





-- Gerando deadlock
-- BEGIN TRAN
-- UPDATE Tabela1 set Nome = 'teste' where Id = 1


-- BEGIN TRAN
-- UPDATE Tabela2 set Nome = 'teste' where Id = 1



--ROLLBACK