--24set21

declare @sql varbinary(max)

select  @sql = sql_handle
from    sys.sysprocesses
where   spid = 124                     

select text
from sys.dm_exec_sql_text(@sql) 


--
----
---- Activesoft Consultoria 
---- TRIGGER criada pelo Activesoft Service Pack em 06/06/2019 durante atualização para versão 1.064.930.
----
--
--
--CREATE TRIGGER dbo.TgMensagemCaixaSaida_MessengerNotificacao ON dbo.TbMensagemCaixaSaida
---- ALTER TRIGGER dbo.TgMensagemCaixaSaida_MessengerNotificacao ON dbo.TbMensagemCaixaSaida
--FOR INSERT
--AS
--BEGIN	
--	SET NOCOUNT ON
--
--	DECLARE @TipoNotificacao VARCHAR(100)
--	SET @TipoNotificacao = 'Verifica_MensagemCaixaSaida' 
--
--	INSERT INTO TbMessengerNotificacao( DataHora, TipoNotificacao ) 
--	SELECT DataHora = GETDATE(), 
--	TipoNotificacao = @TipoNotificacao
--	WHERE NOT EXISTS(	SELECT 1 
--				FROM TbMessengerNotificacao 
--				WHERE TipoNotificacao = @TipoNotificacao )	
--
--	UPDATE TbMessengerNotificacao SET DataHora = GETDATE() 
--	WHERE TipoNotificacao = @TipoNotificacao					
--
--       
--       SET NOCOUNT OFF
--END
--
