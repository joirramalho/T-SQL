-- DIRCEU RESENDE
    -- https://www.dirceuresende.com/blog/verificando-permissoes-privilegios-acessos-um-usuario-database-no-sql-server/

USE [dbLogMonitor]
GO

/*
EXEC dbLogMonitor.dbo.sp_VerificaPermissoes 
    @Usuario             = 'active.%'
    ,@_Database           = NULL
    ,@Objeto             = NULL  -- table, view, procedure, etc
    ,@Nr_Tipo_Permissao      = 2     -- NULL, -- 0-User_Login, 1-Database_Role, 2-Database_Permission, 3-Server_Role, 4-Server_Permission
    ,@Fl_Permissoes_Servidor = 1
*/


/*
-- Verifica todas as permissões do usuário 'Usuario_Teste' na instância
EXEC dbo.sp_VerificaPermissoes
    @Usuario = 'Usuario_Teste'
    
    
-- Verifica todas as permissões da tabela 'SA1010' no database 'Protheus_Producao'
EXEC dbo.sp_VerificaPermissoes
    @_Database = 'db',
    @Objeto = 'SA1010'
    

-- Verifica as roles de database do usuário 'Usuario_Teste' em todos os bancos
EXEC dbo.sp_VerificaPermissoes
    @Usuario = 'Usuario_Teste', -- varchar(100)
    @_Database = NULL, -- varchar(100)
    @Objeto = NULL,
    @Nr_Tipo_Permissao = 1,
    @Fl_Permissoes_Servidor = 0 -- Não
    
    
-- Verifica as permissões a nível de Database do usuário 'Usuario_Teste'
EXEC dbo.sp_VerificaPermissoes
    @Usuario = 'Usuario_Teste', -- varchar(100)
    @_Database = NULL, -- varchar(100)
    @Objeto = NULL,
    @Nr_Tipo_Permissao = 2,
    @Fl_Permissoes_Servidor = 0 -- Não
    
    
-- Verifica as permissões do database 'Protheus_Producao' para todos os usuários
EXEC dbo.sp_VerificaPermissoes
    @Usuario = NULL, -- varchar(100)
    @_Database = 'Protheus_Producao', -- varchar(100)
    @Objeto = NULL,
    @Nr_Tipo_Permissao = 2,
    @Fl_Permissoes_Servidor = 0 -- Não
    
    
-- Verifica as permissões a nível de sistema da instância
EXEC dbo.sp_VerificaPermissoes
    @Nr_Tipo_Permissao = 4
    
   
-- Verifica os membros de roles de sistema da instância
EXEC dbo.sp_VerificaPermissoes
    @Nr_Tipo_Permissao = 3
*/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

IF (OBJECT_ID('dbo.sp_VerificaPermissoes') IS NOT NULL) DROP PROCEDURE sp_VerificaPermissoes
GO

IF (OBJECT_ID('dbo.sp_what') IS NOT NULL) DROP PROCEDURE sp_what
GO

CREATE PROCEDURE [dbo].[sp_what] (
    @Usuario VARCHAR(100) = NULL,
    @_Database VARCHAR(100) = NULL,
    @Objeto VARCHAR(100) = NULL,
    @Nr_Tipo_Permissao SMALLINT = NULL,
    @Fl_Permissoes_Servidor BIT = 1
)
AS BEGIN
    SET NOCOUNT ON

    SELECT
        @Usuario = ISNULL(@Usuario, ''),
        @_Database = ISNULL(@_Database, ''),
        @Objeto = ISNULL(@Objeto, '')
        
    DECLARE
        @Query VARCHAR(MAX)

    ----------------------------------------------------------------------------------------
    -- ASSOCIAÇÃO USUÁRIO X LOGIN
    ----------------------------------------------------------------------------------------
    
    IF (OBJECT_ID('tempdb..#Users_Logins') IS NOT NULL) DROP TABLE #Users_Logins
    CREATE TABLE #Users_Logins (
        _Database VARCHAR(100),
        _Login VARCHAR(100),
        Usuario VARCHAR(100)
    )
    
    
    IF (@Nr_Tipo_Permissao = 0 OR @Nr_Tipo_Permissao IS NULL)
    BEGIN
    
        SET @Query = '
        IF (''?'' = ''' + @_Database + ''' OR ''' + @_Database + ''' = '''')
        BEGIN

            USE [?]

            SELECT
                ''?'' AS _Database,
                C.name AS _Login,
                B.name AS Usuario
            FROM 
                sys.database_principals     A	WITH(NOLOCK)
                JOIN sys.sysusers			B	WITH(NOLOCK)	ON	A.principal_id = B.uid
                LEFT JOIN sys.syslogins		C	WITH(NOLOCK)	ON	B.sid = C.sid
            WHERE
                A.type_desc != ''DATABASE_ROLE''
                AND (C.name = ''' + @Usuario + ''' OR B.name = ''' + @Usuario + ''' OR ''' + @Usuario + ''' = '''')
                AND (C.name = ''' + @Objeto + ''' OR B.name = ''' + @Objeto + ''' OR ''' + @Objeto + ''' = '''')
                
        END'
        

        INSERT INTO #Users_Logins
            EXEC master.dbo.sp_MSforeachdb @Query    
    END



    ----------------------------------------------------------------------------------------
    -- PERMISSÕES EM ROLES DE BANCO DE DADOS
    ----------------------------------------------------------------------------------------

    IF (OBJECT_ID('tempdb..#Database_Roles') IS NOT NULL) DROP TABLE #Database_Roles
    CREATE TABLE #Database_Roles (
        _Database VARCHAR(100),
        _Login VARCHAR(100),
        Usuario VARCHAR(100),
        _Database_Role VARCHAR(100)
    )
    
    
    IF (@Nr_Tipo_Permissao = 1 OR @Nr_Tipo_Permissao IS NULL)
    BEGIN

        SET @Query = '
        IF (''?'' = ''' + @_Database + ''' OR ''' + @_Database + ''' = '''')
        BEGIN

            USE [?]

            SELECT 
                ''?'' AS _Database,
                D.name AS _Login,
                C.name AS Usuario,
                B.name AS Ds_Role
            FROM 
                sys.database_role_members		A	WITH(NOLOCK)
                JOIN sys.database_principals	B	WITH(NOLOCK)	ON	A.role_principal_id = B.principal_id
                JOIN sys.sysusers			    C	WITH(NOLOCK)	ON	A.member_principal_id = C.uid
                LEFT JOIN sys.syslogins			D	WITH(NOLOCK)	ON	C.sid = D.sid
            WHERE
                (C.name = ''' + @Usuario + ''' OR D.name = ''' + @Usuario + ''' OR ''' + @Usuario  + ''' = '''')
                AND (B.name = ''' + @Objeto + ''' OR ''' + @Objeto + ''' = '''')
                
        END'


        INSERT INTO #Database_Roles
            EXEC master.dbo.sp_MSforeachdb @Query 
    END


    ----------------------------------------------------------------------------------------
    -- PERMISSÕES A NÍVEL DE BANCO DE DADOS
    ----------------------------------------------------------------------------------------
    
    IF (OBJECT_ID('tempdb..#Database_Permissions') IS NOT NULL) DROP TABLE #Database_Permissions
    CREATE TABLE #Database_Permissions (
        _Database VARCHAR(100),
        TipoPermissao VARCHAR(60),
        Permissao VARCHAR(128),
        _Operacao VARCHAR(60),
        _Login_Permissao VARCHAR(100),
        Usuario_Permissao VARCHAR(100),
        Objeto VARCHAR(100)
    )
    
    
    IF (@Nr_Tipo_Permissao = 2 OR @Nr_Tipo_Permissao IS NULL)
    BEGIN
        SET @Query = '
        IF (''?'' = ''' + @_Database + ''' OR ''' + @_Database + ''' = '''')
        BEGIN

            USE [?]

            SELECT
                ''?'' AS _Database,
                A.class_desc AS TipoPermissao, 
                A.permission_name AS Permissao,
                A.state_desc AS _Operacao,
                C.name AS _Login_Permissao,
                B.name AS Usuario_Permissao,
                D.name AS Objeto
            FROM 
                sys.database_permissions    A	WITH(NOLOCK)
                JOIN sys.sysusers			B	WITH(NOLOCK)	ON	A.grantee_principal_id = B.uid
                LEFT JOIN sys.syslogins		C	WITH(NOLOCK)	ON	B.sid = C.sid
                LEFT JOIN sys.objects		D	WITH(NOLOCK)	ON	A.major_id = D.object_id
            WHERE
                A.major_id >= 0
                AND (B.name = ''' + @Usuario + ''' OR C.name = ''' + @Usuario + ''' OR ''' + @Usuario + ''' = '''')
                AND (D.name = ''' + @Objeto + ''' OR ''' + @Objeto + ''' = '''')
                
        END'

        INSERT INTO #Database_Permissions
            EXEC master.dbo.sp_MSforeachdb @Query
    END


    ----------------------------------------------------------------------------------------
    -- PERMISSÕES EM ROLES DE SISTEMA
    ----------------------------------------------------------------------------------------

    IF (OBJECT_ID('tempdb..#Server_Roles') IS NOT NULL) DROP TABLE #Server_Roles
    CREATE TABLE #Server_Roles (
        Usuario VARCHAR(100),
        Ds_Server_Role VARCHAR(100)
    )

    
    IF ((@Fl_Permissoes_Servidor = 1 AND @Nr_Tipo_Permissao IS NULL) OR @Nr_Tipo_Permissao = 3)
    BEGIN
        SET @Query = '
        SELECT 
            B.name AS Usuario,
            C.name AS Ds_Role
        FROM 
            sys.server_role_members			A	WITH(NOLOCK)
            JOIN sys.server_principals		B	WITH(NOLOCK)	ON	A.member_principal_id = B.principal_id
            JOIN sys.server_principals		C	WITH(NOLOCK)	ON	A.role_principal_id = C.principal_id
        WHERE
            (B.name = ''' + @Usuario + ''' OR ''' + @Usuario + ''' = '''')
            AND (B.name = ''' + @Objeto + ''' OR ''' + @Objeto + ''' = '''')'

        INSERT INTO #Server_Roles
            EXEC (@Query)
    END


    ----------------------------------------------------------------------------------------
    -- PERMISSÕES A NÍVEL DE SERVIDOR
    ----------------------------------------------------------------------------------------

    IF (OBJECT_ID('tempdb..#Server_Permissions') IS NOT NULL) DROP TABLE #Server_Permissions
    CREATE TABLE #Server_Permissions (
        TipoPermissao VARCHAR(60),
        Ds_Tipo_Operacao VARCHAR(60),
        Permissao VARCHAR(128),
        _Login VARCHAR(100),
        Ds_Tipo_Login VARCHAR(100)
    )


    IF ((@Fl_Permissoes_Servidor = 1 AND @Nr_Tipo_Permissao IS NULL) OR @Nr_Tipo_Permissao = 4)
    BEGIN
        SET @Query = '
        SELECT
            A.class_desc AS TipoPermissao,
            A.state_desc AS Ds_Tipo_Operacao,
            A.permission_name AS Permissao,
            C.name AS _Login,
            B.type_desc AS Ds_Tipo_Login
        FROM 
            sys.server_permissions	    A	WITH(NOLOCK)
            JOIN sys.server_principals	B	WITH(NOLOCK)	ON	A.grantee_principal_id = B.principal_id
            LEFT JOIN sys.syslogins		C	WITH(NOLOCK)	ON	B.sid = C.sid
        WHERE
            (C.name = ''' + @Usuario + ''' OR ''' + @Usuario + ''' = '''')
            AND (C.name = ''' + @Objeto + ''' OR ''' + @Objeto + ''' = '''')'


        INSERT INTO #Server_Permissions
            EXEC(@Query) 
    END


    ----------------------------------------------------------------------------------------
    -- DEFINE AS SAÍDAS
    ----------------------------------------------------------------------------------------

    SELECT 
        0 AS Nivel,
        'User_Login' AS NivelPermissao,
        _Database,
        NULL AS TipoPermissao,
        'LOGIN' AS Permissao,
        'GRANT' AS _Operacao,
        _Login, 
        Usuario,
        NULL AS Objeto
    FROM 
        #Users_Logins
    
    UNION ALL
    
    SELECT 
        1 AS Nivel,
        'Database_Role' AS NivelPermissao,
        _Database,
        NULL AS TipoPermissao,
        _Database_Role AS Permissao,
        'GRANT' AS _Operacao,
        _Login,
        Usuario,
        NULL AS Objeto
    FROM 
        #Database_Roles
        
    UNION ALL
        
    SELECT 
        2 AS Nivel,
        'Database_Permission' AS NivelPermissao,
        _Database,
        TipoPermissao,
        Permissao,
        _Operacao,
        _Login_Permissao,
        Usuario_Permissao,
        Objeto
    FROM 
        #Database_Permissions
        
    UNION ALL
    
    SELECT 
        3 AS Nivel,
        'Server_Role' AS NivelPermissao,
        NULL AS _Database,
        NULL AS TipoPermissao,
        Ds_Server_Role AS Permissao,
        'GRANT' AS _Operacao,
        Usuario AS _Login,
        NULL AS Usuario,
        @@SERVERNAME AS Objeto
    FROM 
        #Server_Roles
        
    UNION ALL
    
    SELECT 
        4 AS Id_Nivel_Permissao,
        'Server_Permission' AS NivelPermissao,
        NULL AS _Database,
        TipoPermissao,
        Permissao,
        Ds_Tipo_Operacao AS _Operacao,
        _Login,
        NULL AS Usuario,
        @@SERVERNAME AS Objeto
    FROM 
        #Server_Permissions
    ORDER BY
        1, 3, 7, 8, 9
    
END
