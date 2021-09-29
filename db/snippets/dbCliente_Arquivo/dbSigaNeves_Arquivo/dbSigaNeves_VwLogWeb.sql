SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER VIEW [dbo].[VwLogWeb] AS   
    SELECT IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr  
    FROM TbLogWeb  
  UNION ALL  
    SELECT IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr  
    FROM dbSigaNeves_Arquivo.dbo.TbLogWeb  
  -- SELECT IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr  
  -- FROM dbSigaNeves_Arquivo01.dbo.TbLogWeb  
  -- UNION ALL  
  -- SELECT IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr  
  -- FROM dbSigaNeves_Arquivo02.dbo.TbLogWeb  
  -- UNION ALL  
  -- SELECT IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr  
  -- FROM dbSigaNeves_Arquivo03.dbo.TbLogWeb  
  -- UNION ALL  
  -- SELECT IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr  
  -- FROM dbSigaNeves_Arquivo04.dbo.TbLogWeb  
  -- UNION ALL  
  -- SELECT IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr  
  -- FROM dbSigaNeves_Arquivo05.dbo.TbLogWeb  
  -- UNION ALL  
  -- SELECT IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr  
  -- FROM dbSigaNeves_Arquivo06.dbo.TbLogWeb    
  -- UNION ALL  
  -- SELECT IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr  
  -- FROM dbSigaNeves_Arquivo06.dbo.TbLogWeb    
  -- UNION ALL  
  -- SELECT IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr  
  -- FROM dbSigaNeves_Arquivo07.dbo.TbLogWeb    
GO


SELECT COUNT(*) FROM VwLogWeb -- 803885
SELECT COUNT(*) FROM dbSigaNeves.dbo.TbLogWeb -- 697836
-- SELECT COUNT(*) FROM dbSigaNeves_Arquivo01.dbo.TbLogWeb
-- SELECT COUNT(*) FROM dbSigaNeves_Arquivo02.dbo.TbLogWeb
-- SELECT COUNT(*) FROM dbSigaNeves_Arquivo03.dbo.TbLogWeb
-- SELECT COUNT(*) FROM dbSigaNeves_Arquivo04.dbo.TbLogWeb
-- SELECT COUNT(*) FROM dbSigaNeves_Arquivo05.dbo.TbLogWeb
-- SELECT COUNT(*) FROM dbSigaNeves_Arquivo06.dbo.TbLogWeb
SELECT COUNT(*) FROM dbSigaNeves_Arquivo07.dbo.TbLogWeb -- 106061
