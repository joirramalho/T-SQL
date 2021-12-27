--07out21
--Reset SQL user account guids 

USE  master;

DECLARE @UserName nvarchar(255) 

DECLARE orphanuser_cur cursor for 
      SELECT UserName = su.name 
      FROM sysusers su JOIN sys.server_principals sp ON sp.name = su.name     COLLATE SQL_Latin1_General_CP1_CI_AI
      WHERE issqluser = 1 AND (su.sid IS NOT NULL AND su.sid <> 0x0) AND suser_sname(su.sid) is null 
      ORDER BY su.name 
OPEN orphanuser_cur 
FETCH NEXT FROM orphanuser_cur INTO @UserName 

WHILE (@@fetch_status = 0)
BEGIN 
        PRINT @UserName + ' user name being resynced' 
        EXEC sp_change_users_login 'Update_one', @UserName, @UserName 
FETCH NEXT FROM orphanuser_cur INTO @UserName 
END 

CLOSE orphanuser_cur 
DEALLOCATE orphanuser_cur



--ALL DATABASES

-- https://www.dirceuresende.com/blog/identificando-e-resolvendo-problemas-de-usuarios-orfaos-no-sql-server-com-a-sp_change_users_login/


-- EXEC [dbSigaDom].[sys].[sp_change_users_login] 'Auto_Fix', 'userBibDom'


--IF (OBJECT_ID('tempdb..#Usuarios_Orfaos') IS NOT NULL) DROP TABLE #Usuarios_Orfaos
--CREATE TABLE #Usuarios_Orfaos (
--    [Ranking] INT IDENTITY(1,1),
--    [Database] sysname,
--    [Username] sysname,
--    [SID] UNIQUEIDENTIFIER,
--    [Command] VARCHAR(MAX)
--)
--
--INSERT INTO #Usuarios_Orfaos
--EXEC master.dbo.sp_MSforeachdb '
--SELECT
--    ''?'' AS [database],
--    A.name,
--    A.[sid],
--    ''EXEC [?].[sys].[sp_change_users_login] ''''Auto_Fix'''', '''''' + A.name + '''''''' AS command
--FROM
--    [?].sys.database_principals A WITH(NOLOCK)
--    LEFT JOIN [?].sys.sql_logins B WITH(NOLOCK) ON A.[sid] = B.[sid]
--    JOIN sys.server_principals C WITH(NOLOCK) ON A.[name] COLLATE SQL_Latin1_General_CP1_CI_AI = C.[name] COLLATE SQL_Latin1_General_CP1_CI_AI
--WHERE
--    A.principal_id > 4
--    AND B.[sid] IS NULL
--    AND A.is_fixed_role = 0
--    AND C.is_fixed_role = 0
--    AND A.name NOT LIKE ''##MS_%''
--    AND A.[type_desc] = ''SQL_USER''
--    AND C.[type_desc] = ''SQL_LOGIN''
--    AND A.name NOT IN (''sa'')
--    AND A.authentication_type <> 0 -- NONE
--
--    AND A.name NOT LIKE (''sigauser'') -- 24Fev21 -- Jorge autorizou remover.
--
--ORDER BY
--    A.name'
--
--
---- Exibindo os usuários órfãos da instância
--SELECT * FROM #Usuarios_Orfaos
--
--
---- Executando os comandos no banco
--DECLARE @Comando VARCHAR(MAX) = '' 
--
--SELECT @Comando += Command + '; '
--FROM #Usuarios_Orfaos
--
---- EXEC(@Comando)