-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo05.dbo.TbAuditoria;
-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo04.dbo.TbAuditoria;
-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo03.dbo.TbAuditoria;
-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo02.dbo.TbAuditoria;
-- SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo01.dbo.TbAuditoria;

SELECT	YEAR(DataHORA),   COUNT(*) FROM dbSigaSalesianoSaoJose.dbo.TbAuditoria GROUP BY YEAR(DataHORA);

    -- CREATE DATABASE dbSigaSalesianoSaoJose_Arquivo

    -- DROP TABLE dbSigaSalesianoSaoJose_Arquivo.dbo.TbAuditoria

-- SELECT  TOP 100 * FROM dbSigaSalesianoSaoJose_Arquivo02.dbo.TbAuditoria


USE dbSigaSalesianoSaoJose_Arquivo;

-- CRIA TABELA DESTINO
SELECT * INTO dbSigaSalesianoSaoJose_Arquivo.dbo.TbAuditoria
    FROM dbSigaSalesianoSaoJose.dbo.TbAuditoria WHERE YEAR(DAtaHora) = 2015


EXEC sp_help 'TbAuditoria'


SET IDENTITY_INSERT dbSigaSalesianoSaoJose_Arquivo.dbo.TbAuditoria ON;

INSERT INTO dbSigaSalesianoSaoJose_Arquivo.dbo.TbAuditoria ( Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria )
        SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria
            FROM dbSigaSalesianoSaoJose_Arquivo05.dbo.TbAuditoria 


-- dbSigaSalesianoSaoJose RETOMAR AQUI
SET IDENTITY_INSERT dbSigaSalesianoSaoJose_Arquivo.dbo.TbAuditoria ON;

INSERT INTO dbSigaSalesianoSaoJose_Arquivo.dbo.TbAuditoria ( Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria )
        SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria
            FROM dbSigaSalesianoSaoJose.dbo.TbAuditoria WHERE YEAR(DAtaHora) <= 2020

            
--2017	224074
--2018	748457
--2019	94532
--2020	107523	 1174586
--2021	338624
        
        
SELECT  COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo.dbo.TbAuditoria; -- 7701393 -- 8875979

SELECT	YEAR(DataHORA),   COUNT(*) FROM dbSigaSalesianoSaoJose.dbo.TbAuditoria GROUP BY YEAR(DataHORA);
SELECT	YEAR(DataHORA),   COUNT(*) FROM dbSigaSalesianoSaoJose_Arquivo.dbo.TbAuditoria GROUP BY YEAR(DataHORA);



DECLARE @BatchSize INT = 5000

WHILE 1 = 1
BEGIN
	DELETE TOP (@BatchSize)
	FROM dbSigaSalesianoSaoJose.dbo.TbAuditoria
	where YEAR(DAtaHora) <= 2020
 
	IF @@ROWCOUNT < @BatchSize BREAK
END