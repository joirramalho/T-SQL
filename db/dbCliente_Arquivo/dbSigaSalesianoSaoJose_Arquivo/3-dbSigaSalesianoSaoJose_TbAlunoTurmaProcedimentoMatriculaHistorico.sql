 SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo05.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico; -- 0
 SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo04.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico; -- 0
 SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo03.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico; -- 0
 SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo02.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico; -- 0
 SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo01.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico; -- 0



    -- CREATE DATABASE dbSigaSalesianoSaoJose_Arquivo

    -- DROP TABLE dbSigaSalesianoSaoJose_Arquivo.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico

-- SELECT  TOP 100 * FROM dbSigaSalesianoSaoJose_Arquivo02.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico


USE dbSigaSalesianoSaoJose_Arquivo;

--SELECT DB_NAME()

-- CRIA TABELA DESTINO
SELECT * INTO dbSigaSalesianoSaoJose_Arquivo.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico
    FROM dbSigaSalesianoSaoJose_Arquivo05.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico



EXEC sp_help 'TbAlunoTurmaProcedimentoMatriculaHistorico'


-- SET IDENTITY_INSERT TbAlunoTurmaProcedimentoMatriculaHistorico ON;

-- INSERT INTO TbAlunoTurmaProcedimentoMatriculaHistorico ( IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr )
--         SELECT IdLogWeb, SessionId, DataHora, IPHost, SistemaOperacional, Arquivo, IdUsuario, TitpoUsuario, Acao, ParametroInt_1, ParametroInt_2, ParametroInt_3, ParametroStr  
--             FROM dbSigaSalesianoSaoJose_Arquivo01.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico


--CHECK TOTAL
	--SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo.dbo.TbAlunoTurmaProcedimentoMatriculaHistorico 
