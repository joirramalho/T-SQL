-- dbo.VwLogWeb source

ALTER VIEW dbo.VwLogWeb AS 
	SELECT	IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr
	FROM	TbLogWeb
--	UNION ALL
--	SELECT	IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr
--	FROM	dbSigaSalePetrolina_Arquivo01.dbo.TbLogWeb
--	UNION ALL
--	SELECT	IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr
--	FROM	dbSigaSalePetrolina_Arquivo02.dbo.TbLogWeb
--	UNION ALL
--	SELECT	IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr
--	FROM	dbSigaSalePetrolina_Arquivo03.dbo.TbLogWeb;