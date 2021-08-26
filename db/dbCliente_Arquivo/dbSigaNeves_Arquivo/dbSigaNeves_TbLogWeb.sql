 SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo05.dbo.TbLogWeb -- 0
 SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo04.dbo.TbLogWeb -- 0
 SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo03.dbo.TbLogWeb -- 0
 SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo02.dbo.TbLogWeb -- 0
 SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo01.dbo.TbLogWeb -- 0

 SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo.dbo.TbLogWeb -- TOTAL 


 

USE dbSigaSalesianoSaoJose_Arquivo

-- CRIA TABELA DESTINO
SELECT * INTO dbSigaSalesianoSaoJose_Arquivo.dbo.TbLogWeb
    FROM dbSigaSalesianoSaoJose_Arquivo05.dbo.TbLogWeb


SELECT DB_NAME()

EXEC sp_help 'TbLogWeb'


-- SET IDENTITY_INSERT TbLogWeb ON;

-- INSERT INTO TbLogWeb ( IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr )
--         SELECT IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr  
--             FROM dbSigaSalesianoSaoJose_Arquivo01.dbo.TbLogWeb