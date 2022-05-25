-- SELECT  COUNT(*) FROM dbSigaModuloAracaju_Arquivo03.dbo.TbAuditoria
-- SELECT  COUNT(*) FROM dbSigaModuloAracaju_Arquivo02.dbo.TbAuditoria
-- SELECT  COUNT(*) FROM dbSigaModuloAracaju_Arquivo01.dbo.TbAuditoria
--
SELECT  COUNT(*) FROM dbSigaModuloAracaju_Arquivo.dbo.TbAuditoria

SELECT  COUNT(*) FROM dbSigaModuloAracaju.dbo.TbAuditoria

USE dbSigaModuloAracaju_Arquivo;

SELECT DB_NAME()

-- CRIA TABELA DESTINO
SELECT * INTO dbSigaModuloAracaju_Arquivo.dbo.TbAuditoria
    FROM dbSigaModuloAracaju_Arquivo03.dbo.TbAuditoria


EXEC sp_help 'TbAuditoria'


-- SET IDENTITY_INSERT TbSituacaoAlunoDisciplina_Auditoria ON;

-- INSERT INTO TbSituacaoAlunoDisciplina_Auditoria ( Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria )
--         SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria
--             FROM dbSigaModuloAracaju_Arquivo07.dbo.TbSituacaoAlunoDisciplina_Auditoria
