--17ago21

sp_exibirBancos
    dbLogRestore.dbo.sp_exibirBancos 'CRM', '288959'

    -- dbLogRestore.dbo.sp_exibirBancos  'banco', 'dbSigaFACHO'

    dbLogRestore.dbo.sp_exibirBancos 'Login', 'active.rogerio' -- active.wantuilson






sp_delete
/*
    EXEC dbLogRestore.dbo.sp_delete 'dbSigaEminente', '288959'

    -- DROP DATABASE CRM_270731

-- wantuilson
    -- Use CRM_270232;	DROP USER [active.wantuilson]
    -- Use CRM_260661;	DROP USER [active.kezio]
    -- Use CRM_265342;	DROP USER [_sigainternet]
    

    
*/


UPDATE
/*
    --SELECT 'CALL Nuvem.bat  ' + RTRIM(LTRIM(NomeDatabase)) + ' ' + RTRIM(LTRIM(CRM)) + ' ' + ''FROM dbLogRestore..TbLogRestore WHERE version_id_full IS NULL AND DataLogDownload IS NULL AND BancoLocal = 0 ORDER BY IdLogRestore


        UPDATE dbLogRestore.dbo.TbLogRestore SET BancoLocal = 1 where CRM = '267841'

        UPDATE dbLogRestore.dbo.TbLogRestore SET DataLogDownload = NULL where CRM = '279297';
        UPDATE dbLogRestore.dbo.TbLogRestore SET DataRestauracao = NULL, BackupFinishDate = NULL, DataDeleteBAK = NULL where CRM = '279297';





    -- UPDATE dbLogRestore.dbo.TbLogRestore SET version_id_diff = null where CRM = '253561'
    -- UPDATE dbLogRestore.dbo.TbLogRestore SET version_id_full = NULL where CRM = '253561'


    SELECT TOP 10 * FROM [dbLogRestore].[dbo].[TbLogRestore] --where CRM = '220875' -- dbSigaAcropole_175095 -- SELECT TOP 100 * FROM [dbLogRestore].[dbo].[TbLogMensagem] /* UPDATE TbLogRestore SET DataLogDownload = NULL WHERE IdLogRestore = 875 UPDATE TbLogRestore SET DataRestauracao = NULL WHERE IdLogRestore = 875 UPDATE TbLogRestore SET DataDeleteBAK = NULL WHERE IdLogRestore = 875
*/



sp_restore
    -- compartilha? Sobrescreve?            SEM ZIP no NOME


    --  dbLogRestore..sp_restore 'dbSigaTiaZeze', '296859', 'active.mardelson', 'NAO', 'NAO', 'nuvem'
    
    -- ATENCAO - PADRAO DO NOME DO .ZIP E DO .BAK INTERNO

    -- NUVEM
            -- dbLogRestore..sp_restore 'dbSigaModeloWEB', '273581', 'active.luizmatheus', 'NAO', 'NAO', 'nuvem'

    -- LOCAL
		--dbLogRestore..sp_restore 'dbSigaSantaGertrudes202110201800', '310545', 'active.rogeriobrollo', 'NAO', 'NAO', 'local'  

    
    -- RETROATIVO SEMANA ANTERIOR
        -- CALL Retroativo.bat  dbSigaEminente 288959_18Ago jjUXKBtmqx9M6el.KMKLMJgCjnCYYD42 FnE_NLPTgoMHfaihekLQHR5UCgHKF4Zg


-- "c:\Program Files\Amazon\AWSCLI\aws.exe" s3api get-object --bucket activesoft-sql-backup-full --key dbSigaColegioEAG_full.zip --version-id bs_H6YbUEkgjcFnB6kDgn6ymfp3zDNKR dbSigaColegioEAG_full.zip 


        -- dbLogRestore..sp_restore 'dbSigaAldeiaPE', '253561', 'active.marley', 'NAO', 'NAO', 'nuvem' , 'qkyRdYSNaKv1ytnrabDzlxgMqRVpEIE2', 'Only-full' 
        -- dbLogRestore..sp_restore 'dbSigaFacCatolicaRN', '219810', 'active.suelio', 'NAO', 'NAO', 'nuvem', '5fbd45c66109faf2b1ca26298c015874-41', 'FCs0gvY_USEKX.tMPZjIxzoi4ct1UQwC' 

    -- RETROATIVO SEMANA ATUAL
    -- dbLogRestore..sp_restore 'dbSigaFacCatolicaRN', '219810', 'active.suelio', 'NAO', 'NAO', 'nuvem', 'nPrecisaInformar', 'FCs0gvY_USEKX.tMPZjIxzoi4ct1UQwC' 

    -- dbLogRestore..sp_restore 'dbSigaSalePetrolina', '240600', 'active.wantuilson', 'NAO', 'NAO', 'nuvem'

    -- SELECT TOP 10 * FROM [dbLogRestore].[dbo].[TbLogRestore]


sp_JobRestore COM debug
-- 
    SELECT	TOP 1	CRM, NomeDatabase, BancoLocal, *
    FROM	dbLogRestore.dbo.TbLogRestore 
    WHERE	DataLogDownload IS NOT NULL --AND DataRestauracao IS NULL
    ORDER	BY DataLogRestore DESC



    -- EXEC dbLogRestore.dbo.sp_JobRestore 1

    --     RESTORE DATABASE CRM_276942_30jun FROM DISK = 'C:\Restore\dbSigaFACHO_full.bak' WITH FILE = 1, MOVE N'dbSiga_Data' TO N'C:\SQL\dbSigaFACHO_276942.mdf', MOVE N'dbSiga_log' TO N'C:\SQL\dbSigaFACHO_276942_log.ldf', RECOVERY,  NOUNLOAD,  STATS = 25

    --     RESTORE DATABASE CRM_254505 FROM DISK = 'C:\Restore\dbSigaCESA_diff.bak' WITH RECOVERY

sp_AdicionarUsuario
-- 
    -- sigainternet 212458 Mardeson pollyana rogeriobrollo wantuilson

    
    -- dbLogRestore..sp_AdicionarUsuario '290223', 'active.suelio' 

    -- dbLogRestore..sp_AdicionarUsuario '262340', 'sigainternet' -- sigainternet 212458 Mardeson pollyana rogeriobrollo

    --  UPDATE [dbLogRestore].[dbo].[TbLogUsuario] SET AutorizadoEm = GETDATE() WHERE IdLogUsuario = 3698

    -- SELECT TOP 10 * FROM [dbLogRestore].[dbo].[TbLogUsuario] --where LoginUsuario = 'active.pablo'



sp_DesmascararBanco
-- 
    -- DbLogRestore.dbo.sp_DesmascararBanco '296859', 'active.mardelson'

    -- dbLogRestore.dbo.sp_desmascararbanco '273972','active.luan'

    -- SELECT TOP 10 *  FROM [dbLogRestore].[dbo].[TbLogMascara]

    -- UPDATE TbLogMascara SET DesmascaradoEM = NULL WHERE IdLogMascara = 242


    -- USE [dbSigaModeloBoleto];
    -- USE [CRM_249695]
    -- REVOKE UNMASK TO	[active.filipe]; -- MASCARAR


    -- GRANT UNMASK TO	[active.jane]; -- DESMASCARAR



-- Download RETROATIVO pós GLACIER
    -- https://activesoft-sql-backup-full.s3.amazonaws.com/dbSigaCESFCE_full.zip?versionId=BJXg51Z22_P15lKlPfdO7cwThD1LIHQp
    
    -- "c:\Program Files\Amazon\AWSCLI\aws.exe" s3api get-object --bucket activesoft-sql-backup-full --key dbSigaMUNDOFANTASIA_full.zip --version-id owLxlj0U8rqUsbsEhECAEVRFvqvvg2B_ dbSigaMUNDOFANTASIA_full.zip



--RESTORE DATABASE CRM_307506 FROM DISK = 'C:\TEMP\dbSigaEscolaSerra_full.bak' WITH FILE = 1, MOVE N'dbSiga_Data' TO N'C:\SQL\dbSigaEscolaSerra.mdf', MOVE N'dbSiga_log' TO N'C:\SQL\dbSigaEscolaSerra_log.ldf', NORECOVERY,  NOUNLOAD,  STATS = 25	--, REPLACE

	--RESTORE DATABASE CRM_307506 FROM DISK = 'C:\TEMP\dbSigaEscolaSerra_diff.bak' WITH RECOVERY

	--RESTORE DATABASE CRM_16nov21 FROM DISK = 'C:\TEMP\dbSigaDiocesanoMossoro_backup_2021_11_15_220600_9714394.bak' WITH RECOVERY



--SELECT TOP 10 * FROM CRM_288959_18Ago.dbo.TbAuditoria ORDER BY IdAuditoria DESC


