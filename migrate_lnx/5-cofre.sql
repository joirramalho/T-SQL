--13ago21 SQL10
--09mai21

-- USE dbCrmActivesoft

declare @banco varchar(32)
declare @IPOrigem varchar(32)
declare @IPDestino varchar(32)
declare @ServidorAlias VARCHAR(32)
declare @Sigainternet VARCHAR(64)


SET @banco = 'dbSigaCELogos'


set @IPOrigem = '172.31.31.254' -- SQL04
-- set @IPOrigem = '172.31.18.113' -- SQL05
-- set @IPOrigem = '172.31.17.88' -- SQL06
--set @IPOrigem = '172.31.21.223' -- SQL07
-- set @IPOrigem = '172.31.20.88' -- SQL08


SET @ServidorAlias = 'LNX10-VPN'
SET @IPDestino = '172.31.27.161' -- LNX10
SET @Sigainternet = '0370'

--SET @ServidorAlias = 'LNX09-VPN'
--SET @IPDestino = '172.31.22.23' -- LNX09
--SET @Sigainternet = '177A'

-- SET @ServidorAlias = 'LNX08-VPN'
-- SET @IPDestino = '172.31.20.88' -- LNX08
-- SET @Sigainternet = '7A00.....'

-- SET @ServidorAlias = 'LNX07-VPN'
-- SET @IPDestino = '172.31.21.223' -- LNX07
-- SET @Sigainternet = '4300...'

-- SET @ServidorAlias = 'LNX06-VPN'
-- SET @IPDestino = '172.31.17.88' -- LNX06
-- SET @Sigainternet = '4567...'

-- SET @ServidorAlias = 'LNX05-VPN'
-- SET @IPDestino = '172.31.18.113' -- LNX05
-- SET @Sigainternet = '505E'
                  
-- SET @ServidorAlias = 'LNX04-VPN'
-- SET @IPDestino = '172.31.31.254' -- LNX04
-- SET @Sigainternet = '3761'

                  
SELECT ServidorIP, ServidorAlias, ServidorSigainternet_Senha, ServidorDatabase, ServidorSigaUser_Login, 'https://siga.activesoft.com.br/login/?instituicao=' + SiglaUnidade, IdCliente
FROM [dbCrmActivesoft].[dbo].[TbCliente]
where [ServidorDatabase] = @banco

	AND ServidorIP = @IPOrigem 

ORDER by ServidorDatabase
  
BEGIN TRAN
  UPDATE dbCrmActivesoft.dbo.TbCliente  
        SET     ServidorIP = @IPDestino, 
                ServidorAlias = @ServidorAlias, 
                ServidorSigainternet_Senha = @Sigainternet -- tem que ser feito aqui
            --     ,ServidorSigaUser_Login = 'userModeloVouBuscar'
WHERE [ServidorDatabase] = @banco
      -- AND ServidorIP = @IPOrigem

COMMIT
--ROLLBACK

SELECT ServidorIP, ServidorAlias, ServidorSigainternet_Senha, ServidorDatabase, ServidorSigaUser_Login, IdCliente
FROM [dbCrmActivesoft].[dbo].[TbCliente]
where ServidorIP = @IPDestino
      AND [ServidorDatabase] = @banco
ORDER by ServidorDatabase


