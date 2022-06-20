-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo05.dbo.TbMetaSituacaoAlunoDisciplina_Auditoria -- 0
-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo04.dbo.TbMetaSituacaoAlunoDisciplina_Auditoria -- 0
-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo03.dbo.TbMetaSituacaoAlunoDisciplina_Auditoria -- 0
-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo02.dbo.TbMetaSituacaoAlunoDisciplina_Auditoria -- 0
-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo01.dbo.TbMetaSituacaoAlunoDisciplina_Auditoria -- 0
SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose.dbo.TbMetaSituacaoAlunoDisciplina_Auditoria -- TOTAL 


    -- CREATE DATABASE dbSigaSalesianoSaoJose_Arquivo

    -- DROP TABLE dbSigaSalesianoSaoJose_Arquivo.dbo.TbMetaSituacaoAlunoDisciplina_Auditoria

-- SELECT  TOP 100 * FROM dbSigaSalesianoSaoJose_Arquivo02.dbo.TbMetaSituacaoAlunoDisciplina_Auditoria


USE dbSigaSalesianoSaoJose_Arquivo

-- CRIA TABELA DESTINO
SELECT * INTO dbSigaSalesianoSaoJose_Arquivo.dbo.TbMetaSituacaoAlunoDisciplina_Auditoria
    FROM dbSigaSalesianoSaoJose_Arquivo05.dbo.TbMetaSituacaoAlunoDisciplina_Auditoria


EXEC sp_help 'TbMetaSituacaoAlunoDisciplina_Auditoria'


-- SET IDENTITY_INSERT TbMetaSituacaoAlunoDisciplina_Auditoria ON;

-- INSERT INTO TbMetaSituacaoAlunoDisciplina_Auditoria ( IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr )
--         SELECT IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr  
--             FROM dbSigaSalesianoSaoJose_Arquivo01.dbo.TbMetaSituacaoAlunoDisciplina_Auditoria
