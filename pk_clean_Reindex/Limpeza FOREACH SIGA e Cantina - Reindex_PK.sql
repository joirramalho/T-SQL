-- Script SELECT
EXEC master.dbo.sp_foreachdb N'
    USE [?]

    SELECT Tabela, year( DataHora ), count(*)	FROM ?.dbo.TbAuditoria  WHERE   Tabela IN (''TbCaixaLancamento'',''TbCaixaMovimentacao'',''TbConta'',''TbLancamentoConsumo'',''TbLancamentoConsumoItem'',''TbLancamentoCredito'',''TbProdutoEstoque'') group by Tabela, year( DataHora )        order by year( DataHora ) DESC
'
,@print_command_only = 0
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
,@name_pattern='dbActiveCantina';
-- ,@database_list = 'dbCantina';





-- Script INSERT INTO
EXEC master.dbo.sp_foreachdb N'
    ALTER DATABASE [?] SET RECOVERY SIMPLE WITH NO_WAIT

    BEGIN TRAN
        SELECT  * INTO VPS1_20210123_Dados2018.dbo.?_TbAuditoria FROM ?.dbo.TbAuditoria WHERE Tabela IN (''TbCaixaLancamento'',''TbCaixaMovimentacao'',''TbConta'',''TbLancamentoConsumo'',''TbLancamentoConsumoItem'',''TbLancamentoCredito'',''TbProdutoEstoque'') AND year(DataHora) < ( year( getdate() ) - 1 )

       DELETE  FROM ?.dbo.TbAuditoria  WHERE Tabela IN (''TbCaixaLancamento'',''TbCaixaMovimentacao'',''TbConta'',''TbLancamentoConsumo'',''TbLancamentoConsumoItem'',''TbLancamentoCredito'',''TbProdutoEstoque'') AND year(DataHora) < ( year( getdate() ) - 1 )
    COMMIT

    ALTER DATABASE [?] SET RECOVERY FULL WITH NO_WAIT
'
,@print_command_only=0
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
,@name_pattern='dbActiveCantina';
--,@database_list = 'dbActiveCantinaCIEC';