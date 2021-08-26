SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo05.dbo.TbMensagem
SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo04.dbo.TbMensagem
SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo03.dbo.TbMensagem
SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo02.dbo.TbMensagem
--SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo01.dbo.TbMensagem

SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo.dbo.TbMensagem -- TOTAL 22785

--NAO TEM TbMensagem
--  SELECT YEAR(DataHora), COUNT(*)
--  FROM [dbSigaSalesianoSaoJose].[dbo].[TbMensagem]
--  GROUP BY YEAR(DataHora)

  SELECT YEAR(DataHoraInsercao), COUNT(*)
  FROM [dbSigaSalesianoSaoJose_Arquivo].[dbo].[TbMensagem]
  GROUP BY YEAR(DataHoraInsercao)


USE dbSigaSalesianoSaoJose_Arquivo;


-- CRIA TABELA DESTINO
SELECT * INTO dbSigaSalesianoSaoJose_Arquivo.dbo.TbMensagem
    FROM dbSigaSalesianoSaoJose_Arquivo05.dbo.TbMensagem
--	    WHERE YEAR(DataHora) <= 2020



EXEC sp_help 'TbMensagem'


SET IDENTITY_INSERT TbMensagem ON;

INSERT INTO TbMensagem ( IdMensagem, DataHoraInsercao, IdUsuarioInsercao, AssuntoMensagem, TextoMensagem, IdDestinatario, TipoDestinatario, DataHoraAgendamento, DataHoraLimiteEnvio, Email_UsarHTML, Email_DestinatarioEmail, Email_DataEnvio, SMS_DestinatarioCelular, SMS_DataEnvio, SMS_StatusEnvio, IdContaSMTP ) -- , CaminhoAnexos
        SELECT IdMensagem, DataHoraInsercao, IdUsuarioInsercao, AssuntoMensagem, TextoMensagem, IdDestinatario, TipoDestinatario, DataHoraAgendamento, DataHoraLimiteEnvio, Email_UsarHTML, Email_DestinatarioEmail, Email_DataEnvio, SMS_DestinatarioCelular, SMS_DataEnvio, SMS_StatusEnvio, IdContaSMTP --, CaminhoAnexos 
            FROM dbSigaSalesianoSaoJose_Arquivo02.dbo.TbMensagem
