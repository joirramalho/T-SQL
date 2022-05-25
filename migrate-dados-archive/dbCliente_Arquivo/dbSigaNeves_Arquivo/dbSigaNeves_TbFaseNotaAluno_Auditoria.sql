

-- SELECT  * INTO dbSigaNeves_Arquivo.dbo.TbFaseNotaAluno_Auditoria FROM dbSigaNeves_Arquivo.dbo.TbFaseNotaAluno_Auditoria

SELECT  COUNT(*) FROM dbSigaNeves_Arquivo07.dbo.TbFaseNotaAluno_Auditoria -- 185413
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo06.dbo.TbFaseNotaAluno_Auditoria -- 3284520 rows - 3284520
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo05.dbo.TbFaseNotaAluno_Auditoria -- 3667220 - 3667220
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo04.dbo.TbFaseNotaAluno_Auditoria -- 896559 - 896559
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo03.dbo.TbFaseNotaAluno_Auditoria -- 1161759 - 1161759
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo02.dbo.TbFaseNotaAluno_Auditoria -- 1941719 - 1941719
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo01.dbo.TbFaseNotaAluno_Auditoria -- 0
--
SELECT  COUNT(*) FROM dbSigaNeves_Arquivo.dbo.TbFaseNotaAluno_Auditoria -- TOTAL 185413

SELECT  COUNT(*) FROM dbSigaNeves.dbo.TbFaseNotaAluno_Auditoria -- 2051882

SELECT  COUNT(*) FROM dbSigaNeves.dbo.VWFaseNotaAluno_Auditoria -- 2237295

    -- CREATE DATABASE dbSigaNeves_Arquivo

    -- DROP TABLE dbSigaNeves_Arquivo.dbo.TbFaseNotaAluno_Auditoria

-- SELECT  TOP 100 * FROM dbSigaNeves_Arquivo02.dbo.TbFaseNotaAluno_Auditoria


USE dbSigaNeves_Arquivo

SELECT DB_NAME()

-- CRIA TABELA DESTINO -- 185413
SELECT * INTO dbSigaNeves_Arquivo.dbo.TbFaseNotaAluno_Auditoria
    FROM dbSigaNeves_Arquivo07.dbo.TbFaseNotaAluno_Auditoria


EXEC sp_help 'TbFaseNotaAluno_Auditoria'


-- SET IDENTITY_INSERT TbFaseNotaAluno_Auditoria ON;

-- INSERT INTO TbFaseNotaAluno_Auditoria ( Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria )
--         SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria
--             FROM dbSigaNeves_Arquivo07.dbo.TbFaseNotaAluno_Auditoria
