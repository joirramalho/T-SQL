

-- SELECT  * INTO dbSigaNeves_Arquivo.dbo.TbFreqMarcacao FROM dbSigaNeves_Arquivo.dbo.TbFreqMarcacao

SELECT  COUNT(*) FROM dbSigaNeves_Arquivo07.dbo.TbFreqMarcacao -- 375736 rows
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo06.dbo.TbFreqMarcacao -- 0
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo05.dbo.TbFreqMarcacao -- 0
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo04.dbo.TbFreqMarcacao -- 0
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo03.dbo.TbFreqMarcacao -- 0
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo02.dbo.TbFreqMarcacao -- 0
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo01.dbo.TbFreqMarcacao -- 0
SELECT  COUNT(*) FROM dbSigaNeves_Arquivo.dbo.TbFreqMarcacao -- TOTAL 


    -- CREATE DATABASE dbSigaNeves_Arquivo

    -- DROP TABLE dbSigaNeves_Arquivo.dbo.TbFreqMarcacao

-- SELECT  TOP 100 * FROM dbSigaNeves_Arquivo02.dbo.TbFreqMarcacao


USE dbSigaNeves_Arquivo

-- CRIA TABELA DESTINO
SELECT * INTO dbSigaNeves_Arquivo.dbo.TbFreqMarcacao
    FROM dbSigaNeves_Arquivo07.dbo.TbFreqMarcacao


SELECT DB_NAME()

EXEC sp_help 'TbFreqMarcacao'


-- SET IDENTITY_INSERT TbFreqMarcacao ON;

-- INSERT INTO TbFreqMarcacao ( IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr )
--         SELECT IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr  
--             FROM dbSigaNeves_Arquivo01.dbo.TbFreqMarcacao
