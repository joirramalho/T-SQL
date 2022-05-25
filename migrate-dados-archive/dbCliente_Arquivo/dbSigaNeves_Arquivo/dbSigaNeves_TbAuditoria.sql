

-- SELECT  * INTO dbSigaNeves_Arquivo.dbo.TbAuditoria_Auditoria FROM dbSigaNeves_Arquivo.dbo.TbAuditoria_Auditoria

-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo07.dbo.TbAuditoria_Auditoria
SELECT  COUNT(*) FROM dbSigaNeves_Arquivo07.dbo.TbAuditoria_Auditoria -- 114835
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo06.dbo.TbAuditoria_Auditoria -- 3284520 rows - 3284520
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo05.dbo.TbAuditoria_Auditoria -- 3667220 - 3667220
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo04.dbo.TbAuditoria_Auditoria -- 896559 - 896559
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo03.dbo.TbAuditoria_Auditoria -- 1161759 - 1161759
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo02.dbo.TbAuditoria_Auditoria -- 1941719 - 1941719
-- SELECT  COUNT(*) FROM dbSigaNeves_Arquivo01.dbo.TbAuditoria_Auditoria -- 2155154 - 2155154
--
SELECT  COUNT(*) FROM dbSigaNeves_Arquivo.dbo.TbAuditoria_Auditoria -- 114835

SELECT  COUNT(*) FROM dbSigaNeves.dbo.TbAuditoria_Auditoria -- 2324987

    -- CREATE DATABASE dbSigaNeves_Arquivo

    -- DROP TABLE dbSigaNeves_Arquivo.dbo.TbAuditoria_Auditoria

-- SELECT  TOP 100 * FROM dbSigaNeves_Arquivo02.dbo.TbAuditoria_Auditoria


USE dbSigaNeves_Arquivo

SELECT DB_NAME()

-- CRIA TABELA DESTINO
SELECT * INTO dbSigaNeves_Arquivo.dbo.TbAuditoria_Auditoria
    FROM dbSigaNeves_Arquivo07.dbo.TbAuditoria_Auditoria


EXEC sp_help 'TbAuditoria_Auditoria'


-- SET IDENTITY_INSERT TbAuditoria_Auditoria ON;

-- INSERT INTO TbAuditoria_Auditoria ( Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria )
         SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria
            FROM dbSigaNeves.dbo.TbAuditoria WHERE YEAR(DAtaHora) <= 2018
--             FROM dbSigaNeves_Arquivo07.dbo.TbAuditoria_Auditoria




SELECT  COUNT(*) FROM dbSigaNeves.dbo.TbAuditoria 			WHERE YEAR(DAtaHora) <= 2018;  
SELECT  COUNT(*) FROM dbSigaNeves_Arquivo.dbo.TbAuditoria 	--WHERE YEAR(DAtaHora) <= 2015; 

SELECT	YEAR(DataHORA),   COUNT(*) FROM dbSigaNeves.dbo.TbAuditoria 			GROUP BY YEAR(DataHORA);
SELECT	YEAR(DataHORA),   COUNT(*) FROM dbSigaNeves_Arquivo.dbo.TbAuditoria 	GROUP BY YEAR(DataHORA);


DECLARE @BatchSize INT = 5000

WHILE 1 = 1
BEGIN
	DELETE TOP (@BatchSize)
	FROM dbSigaNeves.dbo.TbAuditoria
	where YEAR(DAtaHora) <= 2021
 
	IF @@ROWCOUNT < @BatchSize BREAK
END
