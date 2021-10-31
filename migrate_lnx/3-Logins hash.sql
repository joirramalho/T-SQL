--31out21 -- Logins by HASH script out 

SELECT 
    SP.default_database_name, 
    SP.name, 
    -- 'sh backup-migracao-diff.sh '   + SP.default_database_name, -- LINUX
    -- 'backup-migracao-diff.bat '     + SP.default_database_name, -- VPS

    './migracao-backup-diff.sh ' + SP.default_database_name + ' ' + SP.name,

    './migracao-restore-full-diff.sh ' + SP.default_database_name + ' ' + SP.name + ' ' + CONVERT( NVARCHAR(MAX), SL.password_hash, 1 ) As LOGIN,
    './add-user-after-migracao.sh ' + SP.default_database_name + ' ' + SP.name + ' ' + CONVERT( NVARCHAR(MAX), SL.password_hash, 1 ) AS LOGIN_EEM
    
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
        AND SP.name <> ('sigainternet')

        AND sp.is_disabled = 0 -- enabled

        -- AND SP.default_database_name LIKE 'master%' 

        -- AND EXISTS ( SELECT * FROM sys.databases d WHERE d.state_desc = 'ONLINE' )
        -- AND EXISTS ( SELECT * FROM sys.databases d WHERE d.name = sp.default_database_name AND d.state_desc = 'ONLINE' )
-- ORDER BY SP.default_database_name
ORDER BY SP.name



-- Consertat DEFAULT_DATABASE of LOGIN
    
    -- sp_helplogins [userSaleParalela]

    -- ALTER LOGIN [userSaleParalela] WITH DEFAULT_DATABASE = [dbSigaSaleParalela]


-- select name as username
-- from sys.database_principals
-- where type not in ('A', 'G', 'R', 'X') and sid is not null and name != 'guest'
--     AND name NOT IN ('activeuser','sigaadmin', 'sigainternet', 'dbo', 'sigauser')
-- order by username;


-- SELECT  'sh restore-migracao-full-diff.sh ' + SP.default_database_name + ' ' + SP.name + ' ' + CONVERT( NVARCHAR(MAX), SL.password_hash, 1 )
-- FROM sys.server_principals AS SP 
-- INNER JOIN sys.sql_logins AS SL ON SP.principal_id = SL.principal_id
-- WHERE ( sp.name LIKE '%userSisContr%' OR sp.name LIKE '%EEM%') AND sp.type_desc = 'SQL_LOGIN'


-- CLIENTES COM APP Mobile - ATUALIZAR arquivo .mdb nos Servidores WEB01 e 02

    -- Colégio Cognição - COGNICAO
    -- Colégio Núcleo - NUCLEO
    -- Colégio Master Christi - MATERCHRISTIYE
    -- Colégio Cristo Rei - CREIMACEIO
    -- Colégio Fênix - FENIX
    -- Escola Bem Me Quer - BEMMEQUER
    -- Escola Geração Atual - GERACAO
    -- Escola Pequenos Passos - PEQUENOSPASSOSCE
    -- Faculdade Jardins - FACJARDINS
    -- Cei Mirassol - CEIMAIS
    -- Cei Zona Sul - CELM


-- Integração com o EEM - Escola em movimento - ATUALIZAR arquivo .mdb nos Servidores WEB01 e 02

    -- dbSigaCEAAracaju userCEAAracaEEM


