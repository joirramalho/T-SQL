--24dez21 -- Logins by HASH script out 

SELECT 
    SP.default_database_name, SP.name, 
    -- 'sh backup-migracao-diff.sh '   + SP.default_database_name, -- LINUX
    -- 'backup-migracao-diff.bat '     + SP.default_database_name, -- VPS

    './migracao-restore-full-diff.sh ' + SP.default_database_name + ' ' + SP.name + ' ' + CONVERT( NVARCHAR(MAX), SL.password_hash, 1 ) As [Restore FULL],
    './migracao-backup-diff.sh ' + SP.default_database_name + ' ' + SP.name As [Backup Diff],
    './add-user-after-migracao.sh ' + SP.default_database_name + ' ' + SP.name + ' ' + CONVERT( NVARCHAR(MAX), SL.password_hash, 1 ) AS LOGIN_EscolaEmMovimento
    
    -- ,'ALTER LOGIN ' + SP.name + ' WITH DEFAULT_DATABASE = ' + SP.default_database_name
FROM sys.server_principals AS SP 
LEFT JOIN sys.sql_logins AS SL ON SP.principal_id = SL.principal_id
WHERE SP.type IN ('S','G','U')
        AND SP.name NOT LIKE '##%##'
        AND SP.name NOT LIKE 'NT AUTHORITY%' 
        AND SP.name NOT LIKE 'NT SERVICE%'
        AND SP.name <> ('BUILTIN\Administrators')
        AND SP.name <> ('sa')
        AND SP.name <> 'distributor_admin'
        AND SP.name NOT LIKE 'active.%'
        -- AND SP.name <> ('user')
        AND SP.name NOT IN ('sigainternet', 'service.account')


        AND sp.is_disabled = 0 -- enabled

        
        -- AND SP.default_database_name LIKE 'master%' 
        -- AND EXISTS ( SELECT * FROM sys.databases d WHERE d.state_desc = 'ONLINE' )
        -- AND EXISTS ( SELECT * FROM sys.databases d WHERE d.name = sp.default_database_name AND d.state_desc = 'ONLINE' )
-- ORDER BY SP.default_database_name
ORDER BY SP.default_database_name, SP.name



-- Consertat DEFAULT_DATABASE of LOGIN
    
    -- sp_helplogins [userSaleParalela]

    -- ALTER LOGIN [userSaleParalela] WITH DEFAULT_DATABASE = [dbSigaSaleParalela]



-- SELECT  'sh restore-migracao-full-diff.sh ' + SP.default_database_name + ' ' + SP.name + ' ' + CONVERT( NVARCHAR(MAX), SL.password_hash, 1 )
-- FROM sys.server_principals AS SP 
-- INNER JOIN sys.sql_logins AS SL ON SP.principal_id = SL.principal_id
-- WHERE ( sp.name LIKE '%userSisContr%' OR sp.name LIKE '%EEM%') AND sp.type_desc = 'SQL_LOGIN'


-- CLIENTES COM APP Mobile - ATUALIZAR arquivo .mdb nos Servidores WEB01 e 02

    -- Col??gio Cogni????o - COGNICAO
    -- Col??gio N??cleo - NUCLEO
    -- Col??gio Master Christi - MATERCHRISTIYE
    -- Col??gio Cristo Rei - CREIMACEIO
    -- Col??gio F??nix - FENIX
    -- Escola Bem Me Quer - BEMMEQUER
    -- Escola Gera????o Atual - GERACAO
    -- Escola Pequenos Passos - PEQUENOSPASSOSCE
    -- Faculdade Jardins - FACJARDINS
    -- Cei Mirassol - CEIMAIS
    -- Cei Zona Sul - CELM


-- Integra????o com o EEM - Escola em movimento - ATUALIZAR arquivo .mdb nos Servidores WEB01 e 02

    -- dbSigaCEAAracaju userCEAAracaEEM


