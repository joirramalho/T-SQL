SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo05.dbo.TbSituacaoAlunoDisciplina_Auditoria;
SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo04.dbo.TbSituacaoAlunoDisciplina_Auditoria;
SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo03.dbo.TbSituacaoAlunoDisciplina_Auditoria;
SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo02.dbo.TbSituacaoAlunoDisciplina_Auditoria;
SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo01.dbo.TbSituacaoAlunoDisciplina_Auditoria;


SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose.dbo.TbSituacaoAlunoDisciplina_Auditoria -- 2324987


USE dbSigaSalesianoSaoJose_Arquivo;

SELECT DB_NAME()

-- CRIA TABELA DESTINO
SELECT * INTO dbSigaSalesianoSaoJose_Arquivo.dbo.TbSituacaoAlunoDisciplina_Auditoria
    FROM dbSigaSalesianoSaoJose_Arquivo05.dbo.TbSituacaoAlunoDisciplina_Auditoria;


EXEC sp_help 'TbSituacaoAlunoDisciplina_Auditoria'


-- SET IDENTITY_INSERT TbSituacaoAlunoDisciplina_Auditoria ON;

-- INSERT INTO TbSituacaoAlunoDisciplina_Auditoria ( Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria )
--         SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria
--             FROM dbSigaSalesianoSaoJose_Arquivo07.dbo.TbSituacaoAlunoDisciplina_Auditoria

SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo.dbo.TbSituacaoAlunoDisciplina_Auditoria;
