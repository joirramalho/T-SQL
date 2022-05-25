  SELECT YEAR(DataHora), COUNT(*)
  FROM [dbSigaModuloAracaju].[dbo].[TbLogWeb]
  GROUP BY YEAR(DataHora)

  SELECT YEAR(DataHora), COUNT(*)
  FROM [dbSigaModuloAracaju_Arquivo03].[dbo].[TbLogWeb]
  GROUP BY YEAR(DataHora)


USE dbSigaModuloAracaju_Arquivo03;

SELECT DB_NAME()

-- CRIA TABELA DESTINO -- 185413
SELECT * INTO dbSigaModuloAracaju_Arquivo03.dbo.TbLogWeb
    FROM dbSigaModuloAracaju.dbo.TbLogWeb
        WHERE YEAR(DataHora) <= 2020



EXEC sp_help 'TbLogWeb'


-- SET IDENTITY_INSERT TbLogWeb ON;

-- INSERT INTO TbLogWeb ( Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria )
--         SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria
--             FROM dbSigaSalesianoSaoJose_Arquivo07.dbo.TbLogWeb


DECLARE @BatchSize INT = 2500

WHILE 1 = 1
BEGIN
	DELETE TOP (@BatchSize)
	FROM dbSigaModuloAracaju.dbo.TbLogWeb
	where YEAR(DataHora) <= 2020
 
	IF @@ROWCOUNT < @BatchSize BREAK
END