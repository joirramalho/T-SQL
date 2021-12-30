--24dez21

SET NOCOUNT ON

USE [dbBibSantaMadre]; 

SELECT TOP (5) DB_NAME(), [Tabela],[DataHora], [DescricaoOperacao] FROM [dbo].[TbAuditoria]     order by Datahora DESC;
SELECT TOP (5) [DataHora],[IPHost],[Arquivo],[IdUsuario],[TitpoUsuario],[Acao],[ParametroStr] FROM [dbo].[TbLogWeb] order by IdLogWeb DESC;
--SELECT TOP (5) *  FROM [dbo].[TbLogMobile]  order by IdLogMobile DESC;
---

SELECT last_request_start_time, login_time, login_name, host_name, program_name, client_interface_name
FROM sys.dm_exec_sessions dm
LEFT JOIN sys.databases d ON dm.database_id = d.database_id
WHERE  1=1 --is_user_process = 1
        -- and Program_name = 'SIGAWEB'
        -- and DATEDIFF(MINUTE, last_request_start_time, GETDATE()) > 1 -- login_time
        -- and open_transaction_count = 0
        --  AND login_name LIKE 'userSabedoria%'
        AND name = DB_NAME()
ORDER BY last_request_start_time DESC;
--

--SELECT TOP 10 name, state_desc, recovery_model_desc, is_read_only, user_access_desc, create_date
--FROM sys.databases d
--WHERE database_id > 4        -- User Databases
---- and state <> 0             -- 0 ON-LINE -- 6 OFF-LINE
---- and recovery_model <> 1        -- FULL
---- -- and is_read_only = 1 -- Read-only
---- and user_access <> 1 -- SINGLE_USER
---- and name NOT IN ('?')
---- and create_Date > '2020-04-08 12:47:10.447'
---- and name LIKE 'dbSigaTerceiroMilenio%'
--
--ORDER BY  create_date DESC;
