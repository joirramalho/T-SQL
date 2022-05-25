

-- SELECT  * INTO dbSigaNeves_Arquivo.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico FROM dbSigaNeves_Arquivo.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico

SELECT  COUNT(*) FROM dbSigaNeves_Arquivo07.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico -- 7373 rows
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo06.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico -- 0
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo05.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico -- 0
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo04.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico -- 0
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo03.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico -- 0
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo02.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico -- 0
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo01.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico -- 0
SELECT  COUNT(*) FROM dbSigaNeves_Arquivo.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico -- TOTAL 


    -- CREATE DATABASE dbSigaNeves_Arquivo

    -- DROP TABLE dbSigaNeves_Arquivo.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico

-- SELECT  TOP 100 * FROM dbSigaNeves_Arquivo02.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico


USE dbSigaNeves_Arquivo

-- CRIA TABELA DESTINO
SELECT * INTO dbSigaNeves_Arquivo.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico
    FROM dbSigaNeves_Arquivo07.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico


SELECT DB_NAME()

EXEC sp_help 'TbAlunoTurmaProcedimentoMatriculaHistorico'


-- SET IDENTITY_INSERT TbAlunoTurmaProcedimentoMatriculaHistorico ON;

-- INSERT INTO TbAlunoTurmaProcedimentoMatriculaHistorico ( IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr )
--         SELECT IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr  
--             FROM dbSigaNeves_Arquivo01.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico
