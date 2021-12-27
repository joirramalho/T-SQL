  SELECT YEAR(DataHoraLogin), COUNT(*)
  FROM [dbSigaModuloAracaju].[dbo].[TbLogMobile]
  GROUP BY YEAR(DataHoraLogin)

  SELECT YEAR(DataHoraLogin), COUNT(*)
  FROM [dbSigaModuloAracaju_Arquivo03].[dbo].[TbLogMobile]
  GROUP BY YEAR(DataHoraLogin)


USE dbSigaModuloAracaju_Arquivo03;

-- CRIA TABELA DESTINO -- 185413
SELECT * INTO dbSigaModuloAracaju_Arquivo03.dbo.TbLogMobile
    FROM dbSigaModuloAracaju.dbo.TbLogMobile
        WHERE YEAR(DataHoraLogin) <= 2020;



EXEC sp_help 'TbLogMobile'


-- SET IDENTITY_INSERT TbLogMobile ON;

-- INSERT INTO TbLogMobile ( Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria )
--         SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria
--             FROM dbSigaSalesianoSaoJose_Arquivo07.dbo.TbLogMobile


DECLARE @BatchSize INT = 2500

WHILE 1 = 1
BEGIN
	DELETE TOP (@BatchSize)
	FROM dbSigaModuloAracaju.dbo.TbLogMobile
	where YEAR(DataHoraLogin) <= 2020
 
	IF @@ROWCOUNT < @BatchSize BREAK
END