--02set21

EXEC dbo.sp_foreachdb N' 
    USE [?]

    IF EXISTS(  
		SELECT *
                    FROM SYS.DATABASE_PRINCIPALS
                    WHERE TYPE NOT IN (''A'', ''G'', ''R'', ''X'') 
                        AND SID IS NOT NULL 
                        AND NAME != ''GUEST''

                        -- AND NAME LIKE ''UserSISCONTROLLER%''
                        -- AND NAME LIKE ''%GPA%''
                        -- AND NAME = ''user''
                        -- AND NAME LIKE ''%EEM%''

                        -- AND NAME = ''active.backup''
                        -- AND NAME = ''activeuser''
--                        AND NAME = ''active.modelo''
                        AND NAME = ''sigauser''
                )
    BEGIN
        SELECT DB_NAME()

		--CREATE  USER [ACTIVE.BACKUP]        FOR LOGIN   [ACTIVE.BACKUP] WITH DEFAULT_SCHEMA=[DBO]
		--ALTER   ROLE [DB_BACKUPOPERATOR]    ADD MEMBER  [ACTIVE.BACKUP]



		--EXEC SP_DROPROLEMEMBER ''DB_BACKUPOPERATOR'', 	''ACTIVE.BACKUP''
		--DROP USER [ACTIVE.BACKUP];



		--DROP USER [ACTIVEUSER];

        --EXEC SP_DROPROLEMEMBER ''DB_OWNER'', 	''SIGAUSER'';
--			DROP SCHEMA [SIGAUSER];
--			DROP USER [SIGAUSER];

		--USE dbSigaSantaMadre;
			--DROP LOGIN [sigauser];
			--DROP SCHEMA [userSisControllerSantaMadreSantaMadre];
			--DROP USER [userSisControllerSantaMadreSantaMadre];
    END
'
,
@PRINT_COMMAND_ONLY = 0,	-- OBRIGATÓRIO GERAR SCRIPT
@PRINT_DBNAME = 1,
-- ,@STATE_DESC = N'OFFLINE',
@USER_ONLY = 1,
@SUPPRESS_QUOTENAME = 1,
@NAME_PATTERN = 'DB';
-- ,@DATABASE_LIST = 'DBSIGAALDEIAPE'