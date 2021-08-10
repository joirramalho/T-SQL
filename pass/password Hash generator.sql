-- MÁX 10 Caracteres

-- Server + Login + Salt

-- EXEC dbLogMonitor.dbo.stpServerName

SELECT CONVERT( VARCHAR(32), HashBytes( 'MD5', 'PRD1' + 'active.jader' + 'Salt.' ), 2 ) 
-- SELECT CONVERT( VARCHAR(32), HashBytes( 'MD5', 'SQL05' + 'active.jorge' + '123456' ), 2 ) 




-- SELECT CONVERT( VARCHAR(32), HashBytes( 'MD5', @@SERVERNAME + ServidorDatabase + ServidorSigauser_login + 'SALT' ), 2 ), @@SERVERNAME, ServidorDatabase, ServidorSigauser_login
-- FROM [TbCliente]
-- where DataHora_AtualizacaoSIGA IS not NULL and ServidorIP = '172.31.31.254'