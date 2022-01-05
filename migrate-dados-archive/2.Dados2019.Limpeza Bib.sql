-- Script SELECT
EXEC dbo.sp_foreachdb N'
    USE [?]

--SELECT DB_NAME()

    SELECT Tabela, year( DataHora ), count(*)	FROM ?.dbo.TbAuditoria  WHERE   year(DataHora) < ( year( getdate() ) - 2 ) group by Tabela, year( DataHora )        order by year( DataHora ) DESC
'
,@print_command_only = 0
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
,@name_pattern='dbBib';
-- ,@database_list = 'dbCantina';





-- Script INSERT INTO
EXEC dbo.sp_foreachdb N'
    BEGIN TRAN
		SELECT  * INTO VPS04_20220105_Dados2019.dbo.?_TbAuditoria FROM ?.dbo.TbAuditoria WHERE  year(DataHora) < ( year( getdate() ) - 2 )

		DELETE  FROM ?.dbo.TbAuditoria  WHERE Tabela IN (''TbCaixaLancamento'',''TbCaixaMovimentacao'',''TbConta'',''TbLancamentoConsumo'',''TbLancamentoConsumoItem'',''TbLancamentoCredito'',''TbProdutoEstoque'') AND year(DataHora) < ( year( getdate() ) - 2 )
    COMMIT
'
,@print_command_only=0
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
,@name_pattern='dbBib';
--,@database_list = 'dbActiveCantinaCIEC';