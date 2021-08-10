

-- SELECT  * INTO dbSigaNeves_Arquivo.dbo.TbSituacaoAlunoDisciplina_Auditoria FROM dbSigaNeves_Arquivo.dbo.TbSituacaoAlunoDisciplina_Auditoria

-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo07.dbo.TbSituacaoAlunoDisciplina_Auditoria
SELECT  COUNT(*) FROM dbSigaNeves_Arquivo07.dbo.TbSituacaoAlunoDisciplina_Auditoria -- 114835
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo06.dbo.TbSituacaoAlunoDisciplina_Auditoria -- 3284520 rows - 3284520
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo05.dbo.TbSituacaoAlunoDisciplina_Auditoria -- 3667220 - 3667220
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo04.dbo.TbSituacaoAlunoDisciplina_Auditoria -- 896559 - 896559
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo03.dbo.TbSituacaoAlunoDisciplina_Auditoria -- 1161759 - 1161759
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo02.dbo.TbSituacaoAlunoDisciplina_Auditoria -- 1941719 - 1941719
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo01.dbo.TbSituacaoAlunoDisciplina_Auditoria -- 2155154 - 2155154
--
SELECT  COUNT(*) FROM dbSigaNeves_Arquivo.dbo.TbSituacaoAlunoDisciplina_Auditoria -- 114835

SELECT  COUNT(*) FROM dbSigaNeves.dbo.TbSituacaoAlunoDisciplina_Auditoria -- 2324987

    -- CREATE DATABASE dbSigaNeves_Arquivo

    -- DROP TABLE dbSigaNeves_Arquivo.dbo.TbSituacaoAlunoDisciplina_Auditoria

-- SELECT  TOP 100 * FROM dbSigaNeves_Arquivo02.dbo.TbSituacaoAlunoDisciplina_Auditoria


USE dbSigaNeves_Arquivo

SELECT DB_NAME()

-- CRIA TABELA DESTINO
SELECT * INTO dbSigaNeves_Arquivo.dbo.TbSituacaoAlunoDisciplina_Auditoria
    FROM dbSigaNeves_Arquivo07.dbo.TbSituacaoAlunoDisciplina_Auditoria


EXEC sp_help 'TbSituacaoAlunoDisciplina_Auditoria'


-- SET IDENTITY_INSERT TbSituacaoAlunoDisciplina_Auditoria ON;

-- INSERT INTO TbSituacaoAlunoDisciplina_Auditoria ( Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria )
--         SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria
--             FROM dbSigaNeves_Arquivo07.dbo.TbSituacaoAlunoDisciplina_Auditoria
