

-- SELECT  * INTO dbSigaNeves_Arquivo.dbo.TbLogWeb FROM dbSigaNeves_Arquivo.dbo.TbLogWeb

SELECT  COUNT(*) FROM dbSigaNeves_Arquivo07.dbo.TbLogWeb -- 106061 rows
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo06.dbo.TbLogWeb -- 0
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo05.dbo.TbLogWeb -- 0
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo04.dbo.TbLogWeb -- 0
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo03.dbo.TbLogWeb -- 0
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo02.dbo.TbLogWeb -- 0
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo01.dbo.TbLogWeb -- 0
SELECT  COUNT(*) FROM dbSigaNeves_Arquivo.dbo.TbLogWeb -- TOTAL 


    -- CREATE DATABASE dbSigaNeves_Arquivo

    -- DROP TABLE dbSigaNeves_Arquivo.dbo.TbLogWeb

-- SELECT  TOP 100 * FROM dbSigaNeves_Arquivo02.dbo.TbLogWeb


USE dbSigaNeves_Arquivo

-- CRIA TABELA DESTINO
SELECT * INTO dbSigaNeves_Arquivo.dbo.TbLogWeb
    FROM dbSigaNeves_Arquivo07.dbo.TbLogWeb


SELECT DB_NAME()

EXEC sp_help 'TbLogWeb'


-- SET IDENTITY_INSERT TbLogWeb ON;

-- INSERT INTO TbLogWeb ( IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr )
--         SELECT IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr  
--             FROM dbSigaNeves_Arquivo01.dbo.TbLogWeb
