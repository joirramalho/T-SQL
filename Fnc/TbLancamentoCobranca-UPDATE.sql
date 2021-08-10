SELECT TOP (100) [Tabela]
      ,[Operacao]
      ,[DataHora]
      ,[ValorChave1]
      ,[ValorChave2]
      ,[DescricaoOperacao]
      ,[IdAuditoria]
  FROM [dbSigaActivesoftGestao].[dbo].[TbAuditoria]
  where Tabela = 'TbLancamentoCobranca' AND ValorChave1 = 59571 AND DataHora > '2021-03-24' AND DataHora < '2021-03-25'
  order by DataHora DESC

  
  
--   Número do título vinculado: 54075
--   ParcelaCobranca: 03/2021
--   IdServico: Manutenção - AlmoxarifadoValorServico: 334.28
--   IdNotaFiscal: 70559 
  
--   --> <nulo>


SELECT * 
FROM TbLancamentoCobranca 
WHERE	IdTituloCobrancaGerado IN ( 59571 ) AND IdNotaFiscal IS null
--( SELECT IdTituloCobranca FROM _TbLancamentoCobranca_AjusteNFSe_20210324 )


BEGIN TRAN
    UPDATE TbLancamentoCobranca
    SET IdNotaFiscal = 70618
    WHERE	IdTituloCobrancaGerado IN ( 59571 ) AND IdNotaFiscal IS NULL
COMMIT
--rollback