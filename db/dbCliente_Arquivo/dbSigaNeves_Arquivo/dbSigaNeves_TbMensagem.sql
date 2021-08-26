

-- SELECT  * INTO dbSigaNeves_Arquivo.dbo.TbAuditoria FROM dbSigaNeves_Arquivo.dbo.TbAuditoria

-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo07.dbo.TbMensagem
SELECT  COUNT(*) FROM dbSigaNeves_Arquivo06.dbo.TbMensagem -- 5711 rows
SELECT  COUNT(*) FROM dbSigaNeves_Arquivo05.dbo.TbMensagem -- 12404
SELECT  COUNT(*) FROM dbSigaNeves_Arquivo04.dbo.TbMensagem -- 3054
SELECT  COUNT(*) FROM dbSigaNeves_Arquivo03.dbo.TbMensagem -- 681
SELECT  COUNT(*) FROM dbSigaNeves_Arquivo02.dbo.TbMensagem -- 72
SELECT  COUNT(*) FROM dbSigaNeves_Arquivo01.dbo.TbMensagem -- 863
SELECT  COUNT(*) FROM dbSigaNeves_Arquivo.dbo.TbMensagem -- TOTAL 22785


    -- DROP TABLE dbSigaNeves_Arquivo.dbo.TbMensagem

-- SELECT  DISTINCT IdMensagem FROM dbSigaNeves_Arquivo.dbo.TbMensagem -- TOTAL 22785


USE dbSigaNeves_Arquivo

-- CRIA TABELA DESTINO
SELECT * INTO dbSigaNeves_Arquivo.dbo.TbMensagem
    FROM dbSigaNeves_Arquivo06.dbo.TbMensagem


SELECT DB_NAME()

EXEC sp_help 'TbMensagem'


SET IDENTITY_INSERT TbMensagem ON;

INSERT INTO TbMensagem ( IdMensagem, DataHoraInsercao, IdUsuarioInsercao, AssuntoMensagem, TextoMensagem, IdDestinatario, TipoDestinatario, DataHoraAgendamento, DataHoraLimiteEnvio, Email_UsarHTML, Email_DestinatarioEmail, Email_DataEnvio, SMS_DestinatarioCelular, SMS_DataEnvio, SMS_StatusEnvio, IdContaSMTP ) -- , CaminhoAnexos
        SELECT IdMensagem, DataHoraInsercao, IdUsuarioInsercao, AssuntoMensagem, TextoMensagem, IdDestinatario, TipoDestinatario, DataHoraAgendamento, DataHoraLimiteEnvio, Email_UsarHTML, Email_DestinatarioEmail, Email_DataEnvio, SMS_DestinatarioCelular, SMS_DataEnvio, SMS_StatusEnvio, IdContaSMTP --, CaminhoAnexos 
            FROM dbSigaNeves_Arquivo01.dbo.TbMensagem
