-- dbo.VwFreqMarcacao source

ALTER VIEW dbo.VwFreqMarcacao AS 
	SELECT	IdMarcacao, DataMarcacao, IdPessoa, IdColetorEntrada, HoraEntrada, ComentarioEntrada, IdColetorSaida, HoraSaida, IdResponsavelSaida, ComentarioSaida
	FROM	TbFreqMarcacao
--	UNION ALL
--	SELECT	IdMarcacao, DataMarcacao, IdAluno, IdColetorEntrada, HoraEntrada, ComentarioEntrada, IdColetorSaida, HoraSaida, IdResponsavelSaida, ComentarioSaida
--	FROM	dbSigaLiceu_Arquivo01.dbo.TbFreqMarcacao
--	UNION ALL
--	SELECT	IdMarcacao, DataMarcacao, IdPessoa, IdColetorEntrada, HoraEntrada, ComentarioEntrada, IdColetorSaida, HoraSaida, IdResponsavelSaida, ComentarioSaida
--	FROM	dbSigaLiceu_Arquivo02.dbo.TbFreqMarcacao;