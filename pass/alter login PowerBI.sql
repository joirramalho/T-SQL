--01dez21 UserACSC_PowerBI
--19Fev21 - Filipe


	--											   		'1234567890'
	CREATE LOGIN [userSANTATEC_PowerBI] WITH PASSWORD=N'****', DEFAULT_DATABASE=[dbSigaSANTATEC], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF

			-- DROP LOGIN [userCOLEGIOEAG_PowerBI]
	
	    -- USE [dbSigaImcCorMariaRS]
	    -- CREATE USER [userACSC_PowerBI] FOR LOGIN [userACSC_PowerBI]
	    	
			-- Não precisa
			---- ALTER USER [userACSC_PowerBI] WITH DEFAULT_SCHEMA=[dbo]
	
	    -- EXEC sp_addrolemember N'rolePowerBI', N'userACSC_PowerBI'



	
--	GRUPOS DE ESCOLAS
	--		SQL09
		--		dbSigaDivinoCoracao
		--		dbSigaStCatarina
		-- 		dbSigaImcCorMariaRS (offline) -> ONLINE
		--		dbSigaCNSPerSocorro
	

-- VIEWs consolidades
    GRANT SELECT ON dbo.VwPowerBI_AlunoTurmaHistorico_Consolidado TO rolePowerBI;
    GRANT SELECT ON dbo.VwPowerBI_AlunoTurma_Consolidado TO rolePowerBI;
    GRANT SELECT ON dbo.VwPowerBI_Financeiro_Consolidado TO rolePowerBI;
    GRANT SELECT ON dbo.VwPowerBI_LancamentoCobrancaRecebimento_Consolidado TO rolePowerBI;




-- Use dbCrmActivesoft;
   
    --29mar22 Para Raimundinho por Filipe
    GRANT SELECT ON dbo.VwPowerBI_ColetaDados TO userActiveCrmLeitura;
    GRANT SELECT ON dbo.VwPowerBI_ColetaDadosMaisRecente TO userActiveCrmLeitura;
    GRANT SELECT ON dbo.VwPowerBI_ColetaDadosPorCliente TO userActiveCrmLeitura;

   --31mar22 Para Raimundinho por Filipe   
    GRANT SELECT ON dbo.VwPowerBI_ColetaDados_IndicadoresIsaac TO userActiveCrmLeitura;
   
   
   
   -- active.filipe - VPS09 - PowerBI -- 25Jan22
        -- GRANT UPDATE ON [dbo].TbFuncionalidadeLiberacao TO [active.filipe];
   
   

    -- active.filipe - VPS-7 - PowerBI -- 28Jan21
        -- GRANT SELECT ON [dbo].TbColetaDados TO [active.filipe];
        -- GRANT UPDATE ON [dbo].TbColetaIndicador TO [active.filipe];

           -- GRANT UPDATE ON [dbo].TbIsaac_DadosColetados TO [active.filipe]; -- 19fev22

   
        -- GRANT SELECT ON [dbo].[VwPowerBI_ColetaDadosPorCliente] TO [active.filipe]
        -- GRANT ALTER ON [dbo].[VwPowerBI_ColetaDadosPorCliente] TO [active.filipe]

   
       	--03Mar22
   		-- GRANT SELECT ON [dbo].[VwPowerBI_ColetaDados_IndicadoresIsaac] TO [active.filipe]
        -- GRANT ALTER ON [dbo].[VwPowerBI_ColetaDados_IndicadoresIsaac] TO [active.filipe]
   		-- GRANT ALTER ON [dbo].[VwPowerBI_ColetaDados_IndicadoresIsaac] TO [active.filipe]
    
   

    -- active.filipe - VPS-7 - PowerBI -- 11mar21
        -- GRANT SELECT ON [dbo].[VwPowerBI_PesquisaNPSConsolidado] TO [active.filipe];
        -- GRANT ALTER ON [dbo].[VwPowerBI_PesquisaNPSConsolidado] TO [active.filipe];


    -- active.filipe - VPS-7 - PowerBI -- 23mar21
        -- GRANT SELECT ON [dbo].[VwPowerBI_PIMP_Gerenciamento] TO [active.filipe];
        -- GRANT ALTER ON [dbo].[VwPowerBI_PIMP_Gerenciamento] TO [active.filipe];

        -- GRANT SELECT ON [dbo].[VwPowerBI_PIMP_Tarefas] TO [active.filipe];
        -- GRANT ALTER ON [dbo].[VwPowerBI_PIMP_Tarefas] TO [active.filipe];

        -- GRANT SELECT ON [dbo].[VwPowerBI_PIMP_ConsultaPrincipal] TO [active.filipe];
        -- GRANT ALTER ON [dbo].[VwPowerBI_PIMP_ConsultaPrincipal] TO [active.filipe];
    

-- 31mar21
    ALTER ROLE [db_datareader] ADD MEMBER [active.filipe]

        -- SELECT OBJECT_SCHEMA_NAME(v.object_id) schema_name, v.name, 'GRANT ALTER ON [dbo].[' + name + '] TO [active.filipe]'
        -- FROM sys.views as v
        -- where name LIKE 'VwPowerBI%' 

    -- GRANT ALTER ON [dbo].[VwPowerBI_OcorrenciasExcetoComercial] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_TbClientePessoa] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_DadosUsoInterno1] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_DadosUso] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_TbCliente] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_TbGrupoAtendimento] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_TbClienteSistema] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_TbSistema] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_TbOperador] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_TbTipoOcorrencia] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_PIMP_ConsultaPrincipal] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_PIMP_Gerenciamento] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_PIMP_Tarefas] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_ColetaDadosMaisRecente] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_ColetaDados] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_OcorrenciaConcluida_RVA] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_ColetaIndicador] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_TbClienteUnidade] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_ColetaDadosPorCliente] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_ClienteModuloContratado] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_AnaliseNivel2] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_Comercial_GestaoOportunidades] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_DataHoraAtual] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_BacklogDesenvolvimento] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_OcorrenciaPendente] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_OcorrenciaMovimentacao_Trimestre] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_VwClienteEBR_Resumo] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_VwClienteEBR_Concluidas] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_OcorrenciaPendente2] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_PesquisaNPSConsolidado] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_PesquisaSatisfacao] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_ClienteCRMConcluidoPorMes] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_OcorrenciaConcluida] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_FunilComercial] TO [active.filipe]
    -- GRANT ALTER ON [dbo].[VwPowerBI_Reclamacao] TO [active.filipe]