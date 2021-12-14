--14dez21

--USE dbSigaPadraoInst

--sp_CompareDb
	--EXEC dbLogMonitor.dbo.sp_CompareDb 'dbSigaPadraoInst', 'dbSigaDarwin'



--VersaoDB_Atual by CRM
SELECT
	[VersaoDB_Atual]
,
	COUNT(*)
FROM
	[dbCrmActivesoft].[dbo].[TbCliente]
WHERE	( 
      ServidorIP IN ('172.31.16.24', '172.31.44.127', '172.31.19.237', '172.31.31.254', '172.31.18.113', '172.31.17.88', '172.31.21.223', '172.31.20.88', '172.31.22.23', '172.31.27.161')
		AND ServidorIP NOT IN ('172.31.17.105', '172.31.27.137', '172.31.27.138')
		--PRD & LAB4 )
  		)
--	AND TipoCliente IN ('A')
--	AND VersaoDB_Atual NOT IN (1001200, 1064990, 1065089, 1065092)
GROUP BY
	[VersaoDB_Atual]
ORDER BY
	[VersaoDB_Atual]

  
  


SELECT 
-- [CodigoCliente]
      [NomeCliente] AS [LOCAL],
    --   ,[Licencas]
    --   ,[Operadores]
    --   ,[DadosConexao]
    --   ,[OperadoresComPermissaoSolicitacao]
    --   ,[StAtivo_]
    --   ,[IdOperadorVendedor]
    --   ,[TipoCliente]
    --   ,[ObservacaoSetorComercial]
    --   ,[IdGrupoAtendimento]
    --   ,[IdClienteCongregacao]
    --   ,[StRequerOrcamento]
    --   ,[IdVPS]
      [SiglaUnidade],
    --   ,[SituacaoLicencaUso]
    --   ,[ServidorAlias]
    
      [ServidorIP]
    
    --   ,[ServidorPorta]
    --   ,[ServidorDatabase]
    --   ,[ServidorAdmin_Login]
    --   ,[ServidorAdmin_Senha]
    --   ,[ServidorSigauser_Login]
    --   ,[ServidorSigauser_Senha]
    --   ,[ServidorSigainternet_Login]
    --   ,[ServidorSigainternet_Senha]
    --   ,[ServidorMessenger_Login]
    --   ,[ServidorMessenger_Senha]

      -- [VersaoDB_Atual]

    --   ,[DataHora_AtualizacaoSIGA]
      ,[ServidorLocalIP]
    --   ,[ServidorLocalPorta]
      ,COUNT(*)
  FROM [dbCrmActivesoft].[dbo].[TbCliente]
  WHERE 1=1
    AND 
    ( 
      ServidorIP  NOT IN ('172.31.16.24', '172.31.44.127', '172.31.19.237', '172.31.31.254', '172.31.18.113', '172.31.17.88', '172.31.21.223', '172.31.20.88', '172.31.22.23', '172.31.27.161', '172.31.31.201')
    AND ServidorIP NOT  IN ('172.31.17.105', '172.31.27.137', '172.31.27.138') --PRD & LAB4 )
  )
    AND TipoCliente IN ('A')
    AND VersaoDB_Atual NOT IN (1001200,1064990,1065089,1065092)

  
  GROUP BY NomeCliente,[SiglaUnidade], ServidorIP, ServidorLocalIP --VersaoDB_Atual
  ORDER BY NomeCliente,[SiglaUnidade], ServidorIP, ServidorLocalIP --VersaoDB_Atual