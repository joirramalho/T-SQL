USE dbLogMonitor;

IF (OBJECT_ID('dbo.sp_SERVERNAME') IS NOT NULL) DROP PROCEDURE sp_SERVERNAME
GO


IF (OBJECT_ID('dbo.sp_where') IS NOT NULL) DROP PROCEDURE sp_where
GO

-- EXEC dbo.sp_where

CREATE PROCEDURE [dbo].[sp_where]
AS 
BEGIN
    -- VERSION 1.11 - 15abr21 - test execute-sql.sh
    -- VERSION 1.10 - 01abr21 - LAB4; DB_NAME, SUSER_SNAME()
    -- VERSION 1.09 - 15mar21 - SQL06; PrivateIP
    -- VERSION 1.08 - 12mar21 - SQL05; IpPrivate
    -- VERSION 1.07 - 16Out20 - VPS1
    -- VERSION 1.06 - 09Out20 - SQL04
    -- VERSION 1.05 - 05Out20


    DECLARE @IpPrivate CHAR(15) = ( SELECT  local_net_address    FROM sys.dm_exec_connections WHERE session_id = @@SPID );

    SELECT 
        CASE 
            WHEN @IpPrivate = '172.31.31.200'   THEN 'VPS7' 
            WHEN @IpPrivate = '172.31.18.109'   THEN 'VPS8' 
            WHEN @IpPrivate = '172.31.16.24'    THEN 'SQL01' 
            WHEN @IpPrivate = '172.31.44.127'   THEN 'SQL02' 
            WHEN @IpPrivate = '172.31.19.237'   THEN 'SQL03' 
            WHEN @IpPrivate = '172.31.31.254'   THEN 'SQL04' 
            WHEN @IpPrivate = '172.31.18.113'   THEN 'SQL05' 
            WHEN @IpPrivate = '172.31.17.88'    THEN 'SQL06' 
            WHEN @IpPrivate = '172.31.17.105'   THEN 'PRD' 
            WHEN @IpPrivate = '172.31.27.137'   THEN 'LAB4' 
            ELSE @IpPrivate 
        END AS 'SERVER',
        RTRIM( @IpPrivate ) + ',1435' PrivateIP,
        -- ( SELECT DB_NAME() ) AS 'Database',
        ( SELECT SUSER_SNAME() ) AS 'User'
END