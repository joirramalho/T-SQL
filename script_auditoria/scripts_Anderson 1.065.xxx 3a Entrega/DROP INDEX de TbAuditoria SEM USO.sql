-- DROP INDEX de TbAuditoria SEM USO
-- Joir Ramalho
-- 21/Jan/2020

-- VPS-7
	-- dbSigaGGE
	-- dbSigaContemporaneo
	-- dbSigaFFerrari
	-- dbSigaCTEAD
-- 10 Jun 20
	-- dbSigaPedacinhoCeuDF
	-- dbSigaENSVitoriasRN
	-- dbSigaFacCatolicaRN
	-- dbSigaCICOlhoDagua
	-- dbSigaCONFHICNSFatima
	-- dbSigaIEPAM

-- SQL01
	-- dbSigaContemporaneo
	-- dbSigaAmericanoBatista
	-- dbSigaCEAMOMossoro
	-- dbSigaCordUNECIM
	-- dbSigaDaLuz
	-- dbSigaMeninoJesus
	-- dbSigaDivinoMestre
	-- dbSigaSagradoCoracao
	-- dbSigaAlfa
	-- dbSigaSagCoracaoMaria

-- SQL02
	-- dbSigaOverdose
	-- dbSigaPlenus
	-- dbSigaSaberViver
	-- dbSigaLourdesJP
	-- dbSigaNSLourdes
	-- dbSigaTeresaLisieux
	-- dbSigaSaleAracaju
	-- dbSigaSantaMadre
	-- dbSigaSalesianoRecife
	-- dbSigaCulturaRecife	

-- VPS-8
	-- dbSigaSaleParalela
	-- dbSigaSementes
	-- dbSigaFACHO
	-- dbSigaVisao
	-- dbSigaLiceu
	-- dbSigaCristoRedentor
	-- dbSigaMadreDeusUnd2
	-- dbSigaMadreDeusUnd1
	-- dbSigaSantissimoSenhor
	-- dbSigaPH3	

-- VPS-1
	-- dbSigaCognitivo
	-- dbSigaNeves
	-- dbSigaLourdinasCG
	-- dbSigaFenix
	-- dbSigaElo
	-- dbSigaSantanna
	-- dbSigaCOCSP
	-- dbSigaEminente
	-- dbSigaJardins
	-- dbSigaPrince	

-- VPS-6
	-- dbSigaCristoRei
	-- dbSigaCoesi
	-- dbSigaSaoJorge
	-- dbSigaCESFCE
	-- dbSigaCEAAracaju
	-- dbSigaDom
	-- dbSigaMaterChristi
	-- dbSigaNSAparecida
	-- dbSigaNSAmparo
	-- dbSigaLuizaCora	(READ_ONLY)

IF EXISTS( SELECT * FROM sys.indexes WHERE name='IX_TbAuditoriaTabelaChave' AND object_id = OBJECT_ID('dbo.TbAuditoria') )
	BEGIN
		DROP INDEX [IX_TbAuditoriaTabelaChave] ON [dbo].[TbAuditoria]
	END

IF EXISTS( SELECT * FROM sys.indexes WHERE name='IX_TbAuditoriaDataHoraDesc' AND object_id = OBJECT_ID('dbo.TbAuditoria') )
	BEGIN
		DROP INDEX [IX_TbAuditoriaDataHoraDesc] ON [dbo].[TbAuditoria]
	END

IF EXISTS( SELECT * FROM sys.indexes WHERE name='IX_TbAuditoriaTabelaChave2' AND object_id = OBJECT_ID('dbo.TbAuditoria') )
	BEGIN
		DROP INDEX [IX_TbAuditoriaTabelaChave2] ON [dbo].[TbAuditoria]
	END

IF EXISTS( SELECT * FROM sys.indexes WHERE name='IX_TbAuditoriaTabelaDataHora' AND object_id = OBJECT_ID('dbo.TbAuditoria') )
	BEGIN
		DROP INDEX [IX_TbAuditoriaTabelaDataHora] ON [dbo].[TbAuditoria]
	END
