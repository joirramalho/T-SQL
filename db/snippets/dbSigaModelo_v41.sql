-- dbSigaModeloComercial - dbSigaModeloWEB (09Nov21) -- FILIPE



-- ALTER DATABASE dbSigaModeloWEB SET MULTI_USER WITH NO_WAIT


-----------


--BACKUP DATABASE dbSigaModelo_v41 TO DISK = N'C:/TEMP/dbSigaModelo_v41.bak'


--dbSigaModeloWEB
	--RESTORE DATABASE [dbSigaModeloWEB] FROM DISK = '/SQL/dbSigaModelo_v41.bak' WITH FILE = 1, MOVE N'dbSiga_Data' TO N'/SQL/dbSigaModeloWEB.mdf', MOVE N'dbSiga_Log' TO N'/SQL/dbSigaModeloWEB_1.ldf', RECOVERY, NOUNLOAD, STATS = 25


	-- dbSigaModeloComercial
	--	UPDATE TbUnidade SET SiglaUnidade = 'ACTIVECOMERCIAL' WHERE IdUnidade = 1
	--	UPDATE TbUnidade SET SiglaUnidade = 'ACTIVECOMERCIAL2' WHERE IdUnidade = 2
	--	UPDATE TbUnidade SET SiglaUnidade = 'IES_ACTIVECOMERCIAL' WHERE IdUnidade = 3
	
	-- dbSigaModeloWEB
--	UPDATE TbUnidade SET SiglaUnidade = 'SIGAWEB' WHERE IdUnidade = 1
--	UPDATE TbUnidade SET SiglaUnidade = 'SIGAWEB' WHERE IdUnidade = 2
--	UPDATE TbUnidade SET SiglaUnidade = 'IES_SIGAWEB' WHERE IdUnidade = 3

-- VIDE órfãos

	-- exec sp_addrolemember 'db_owner', 'userModeloComercial'

	-- exec sp_addrolemember 'db_owner', 'userModeloWEB'
