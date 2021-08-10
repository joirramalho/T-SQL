SELECT TOP (1000) [IdColetaIndicador]
      ,[NomeIndicador]
      ,[Periodicidade]
      ,[TipoIndicador]
      ,[SistemaOrigem]
      ,[ConsultaSQL]
      ,[StAtivo]
  FROM [dbCrmActivesoft].[dbo].[TbColetaIndicador]

  where NomeIndicador LIKE 'Isaac_FaturamentoLiq%' --_EmAberto_202109\

    order by ConsultaSQL


-- BEGIN TRAN
--     update [dbCrmActivesoft].[dbo].[TbColetaIndicador]
--     set StAtivo = 0
--     where NomeIndicador LIKE 'Isaac_FaturamentoLiq%'
-- -- COMMIT