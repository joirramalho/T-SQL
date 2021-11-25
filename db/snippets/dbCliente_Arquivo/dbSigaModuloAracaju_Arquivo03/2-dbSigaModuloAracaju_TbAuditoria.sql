
SELECT	YEAR(DataHORA),   COUNT(*) FROM dbSigaModuloAracaju.dbo.TbAuditoria GROUP BY YEAR(DataHORA);

SELECT	YEAR(DataHORA),   COUNT(*) FROM dbSigaModuloAracaju_Arquivo03.dbo.TbAuditoria GROUP BY YEAR(DataHORA);



USE dbSigaModuloAracaju_Arquivo03;

-- CRIA TABELA DESTINO
SELECT * INTO dbSigaModuloAracaju_Arquivo03.dbo.TbAuditoria
    FROM dbSigaModuloAracaju.dbo.TbAuditoria 
        WHERE YEAR(DataHora) <= 2020


--EXEC sp_help 'TbAuditoria'
--
--
--SET IDENTITY_INSERT dbSigaSalesianoSaoJose_Arquivo.dbo.TbAuditoria ON;
--
--INSERT INTO dbSigaSalesianoSaoJose_Arquivo.dbo.TbAuditoria ( Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria )
--        SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria
--            FROM dbSigaSalesianoSaoJose_Arquivo05.dbo.TbAuditoria 



DECLARE @BatchSize INT = 2500

WHILE 1 = 1
BEGIN
	DELETE TOP (@BatchSize)
	FROM dbSigaModuloAracaju.dbo.TbAuditoria
	where YEAR(DAtaHora) = 2020
 
	IF @@ROWCOUNT < @BatchSize BREAK
END