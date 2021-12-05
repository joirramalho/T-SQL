/*
Ações:
1- Mudar as tabelas de autenticação para novo FileGroup
    TbAccessToken
    TbRefreshToken
    TbResourceOwner
        -- TbApplication
        -- TbSessao (edited) 
1- Recriar o índice
2 - Alterar o campo Scope para VARCHAR(512)
3 - Remover a consulta com LIKE %push%
*/

SELECT * FROM sys.filegroups


-- Autogrowth - Initial Size - Maximum Size

SELECT  db.name AS [Database Name], mf.name AS [Logical Name], mf.type_desc AS [File Type], mf.physical_name AS [Path], 
    CAST( (mf.Size * 8 ) / 1024.0 AS DECIMAL(18, 1)) AS [Initial Size (MB)], 
    'By ' +IIF( mf.is_percent_growth = 1, CAST(mf.growth AS VARCHAR(10))+'%', CONVERT(VARCHAR(30), CAST( (mf.growth * 8 ) / 1024.0 AS DECIMAL(18, 1)))+' MB') AS [Autogrowth], 
    IIF(mf.max_size = 0, 'No growth is allowed', IIF(mf.max_size = -1, 'Unlimited', CAST( ( CAST(mf.max_size AS BIGINT) * 8 ) / 1024 AS VARCHAR(30))+' MB')) AS  [MaximumSize]
FROM sys.master_files AS mf
INNER JOIN sys.databases AS db ON db.database_id = mf.database_id

--WHERE mf.growth <> 10



--FILEGROWTH
	--ALTER DATABASE [dbCrmActivesoft] MODIFY FILE ( NAME = N'dbActiveCRM2_Log', FILEGROWTH = 10%)


--SECONDARY
	-- USE [master]
	-- ALTER DATABASE [dbCrmActivesoft] ADD FILEGROUP [SECONDARY]
	
	-- ALTER DATABASE [dbCrmActivesoft] ADD FILE ( NAME = N'dbActiveCRM2_Data_Sec', FILENAME = N'C:\SQL\dbCrmActivesoft_Sec.ndf' , SIZE = 8192KB , FILEGROWTH = 10%) TO FILEGROUP [SECONDARY]


--COLETADADOS 04dec21
	-- USE [master]
	-- ALTER DATABASE [dbCrmActivesoft] ADD FILEGROUP [COLETADADOS]
	
	-- ALTER DATABASE [dbCrmActivesoft] ADD FILE ( NAME = N'dbActiveCRM2_Data_ColetaDados', FILENAME = N'/SQL/dbActiveCRM2_Data_ColetaDados.ndf' , SIZE = 16MB , FILEGROWTH = 10%) TO FILEGROUP [COLETADADOS]


--
SELECT o.[name] AS TableName, i.[name] AS IndexName, fg.[name] AS FileGroupName
FROM sys.indexes i
INNER JOIN sys.filegroups fg ON i.data_space_id = fg.data_space_id
INNER JOIN sys.all_objects o ON i.[object_id] = o.[object_id]
WHERE i.data_space_id = fg.data_space_id AND o.type = 'U'
    AND fg.[name] <> 'PRIMARY'
ORDER BY o.[name]


sp_help 'TbColetaDados'


--DROP INDEX [IX_TbColetaDados] ON [dbo].[TbColetaDados]


	--MOVE FILEGROUP (NO UNIQUE 2019-08-20 00:42:00.000)

--		SQL Error [1505] [S0001]: 
--		The CREATE UNIQUE INDEX statement terminated because a duplicate key was found for the object name 'dbo.TbColetaDados' and the index name 'TbColetaDados_IdCliente_IdColetaIdentificador_DataHora'. 


		--SELECT TOP 100 * FROM TbColetaDados where DataHora > '2019/08/20' ORDER BY DataHora
			--	CREATE CLUSTERED INDEX TbColetaDados_IdCliente_IdColetaIdentificador_DataHora ON TbColetaDados (IdCliente ASC, IdColetaIndicador ASC, DataHora DESC )  
			--	     WITH (DROP_EXISTING = ON)  
			--	     ON COLETADADOS

	--RECREATE IX
		--	CREATE NONCLUSTERED INDEX IX_TbColetaDados ON dbo.TbColetaDados (  IdColetaIndicador ASC  , DataHora ASC  )  
		--		 WITH (  PAD_INDEX = OFF ,FILLFACTOR = 100  ,SORT_IN_TEMPDB = OFF , IGNORE_DUP_KEY = OFF , STATISTICS_NORECOMPUTE = OFF , ONLINE = OFF , ALLOW_ROW_LOCKS = ON , ALLOW_PAGE_LOCKS = ON  )
		--		 ON [COLETADADOS] ;


--------





--TbAccessToken

-- MOVE FILEGROUP
    -- CREATE UNIQUE CLUSTERED INDEX TbAccessToken_pk ON TbAccessToken (IdAccessToken)  
    --     WITH (DROP_EXISTING = ON)  
    --     ON SECONDARY




        DROP INDEX [TbAccessToken_Token_uindex] ON [dbo].[TbAccessToken]
        GO

        -- CREATE UNIQUE NONCLUSTERED INDEX [TbAccessToken_Token_uindex] ON [dbo].[TbAccessToken]
        -- (
        --     [Token] ASC
        -- )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [SECONDARY]
        -- GO

    -- INCLUDE

        -- DROP INDEX [TbAccessToken_Token-Include] ON [dbo].[TbAccessToken]
        -- GO

        -- SET ANSI_PADDING ON
        -- GO

        -- CREATE NONCLUSTERED INDEX [TbAccessToken_Token-Include] ON [dbo].[TbAccessToken]
        -- (
        --     [Token] ASC
        -- )
        -- INCLUDE ( 	[IdAccessToken],
        --     [IdResourceOwner],
        --     [IdSourceRefreshToken],
        --     [IdApplication],
        --     [Expires],
        --     [CreatedAt],
        --     [UpdatedAt]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [SECONDARY]
        -- GO






--
    -- CREATE UNIQUE CLUSTERED INDEX TbRefreshToken_pk ON TbRefreshToken (IdRefreshToken)  
    --     WITH (DROP_EXISTING = ON)  
    --     ON SECONDARY


        -- DROP INDEX [IX_TbRefreshToken__RevokedAt] ON [dbo].[TbRefreshToken]
        -- GO

        -- SET ANSI_PADDING ON
        -- GO

        -- CREATE NONCLUSTERED INDEX [IX_TbRefreshToken__RevokedAt] ON [dbo].[TbRefreshToken]
        -- (
        --     [RevokedAt] ASC
        -- )
        -- INCLUDE ( 	[IdResourceOwner],
        --     [Token],
        --     [IdApplication],
        --     [IdAccessToken],
        --     [CreatedAt],
        --     [UpdatedAt]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [SECONDARY]
        -- GO

    
    ------


        -- DROP INDEX [IX_TbRefreshToken_IdAccessToken] ON [dbo].[TbRefreshToken]
        -- GO

        -- CREATE NONCLUSTERED INDEX [IX_TbRefreshToken_IdAccessToken] ON [dbo].[TbRefreshToken]
        -- (
        --     [IdAccessToken] ASC
        -- )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [SECONDARY]
        -- GO


--
    -- CREATE UNIQUE CLUSTERED INDEX PK_TbResourceOwner ON TbResourceOwner (IdResourceOwner)  
    --     WITH (DROP_EXISTING = ON)  
    --     ON SECONDARY


        -- DROP INDEX [IX_TbResourceOwner_IdUsuario] ON [dbo].[TbResourceOwner]
        -- GO

        -- CREATE NONCLUSTERED INDEX [IX_TbResourceOwner_IdUsuario] ON [dbo].[TbResourceOwner]
        -- (
        --     [IdUsuario] ASC
        -- )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [SECONDARY]
        -- GO

        ---

        -- DROP INDEX [IX_TbResourceOwner_Tipo_IdUsuario_IdCliente] ON [dbo].[TbResourceOwner]
        -- GO

        -- SET ANSI_PADDING ON
        -- GO

        -- CREATE UNIQUE NONCLUSTERED INDEX [IX_TbResourceOwner_Tipo_IdUsuario_IdCliente] ON [dbo].[TbResourceOwner]
        -- (
        --     [Tipo] ASC,
        --     [IdUsuario] ASC,
        --     [IdCliente] ASC
        -- )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [SECONDARY]
        -- GO


        ---

        -- ALTER TABLE [dbo].[TbResourceOwner] DROP CONSTRAINT [UC_TbResourceOwner_Tipo_IdUsuario_IdCliente]
        -- GO

        -- SET ANSI_PADDING ON
        -- GO

        -- ALTER TABLE [dbo].[TbResourceOwner] ADD  CONSTRAINT [UC_TbResourceOwner_Tipo_IdUsuario_IdCliente] UNIQUE NONCLUSTERED 
        -- (
        --     [Tipo] ASC,
        --     [IdUsuario] ASC,
        --     [IdCliente] ASC
        -- )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [SECONDARY]
        -- GO





-- CHECK
sp_help 'TbAccessToken'

sp_help 'TbRefreshToken'

sp_help 'TbResourceOwner'