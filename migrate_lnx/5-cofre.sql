--24dez21
--09MAI21

DECLARE @BANCO VARCHAR(32)
DECLARE @IPORIGEM VARCHAR(32)
DECLARE @IPDESTINO VARCHAR(32)
DECLARE @SERVIDORALIAS VARCHAR(32)
DECLARE @SIGAINTERNET VARCHAR(64)


SET	@BANCO = 'dbSigaPereiraRocha'


--	SET	@IPORIGEM = '172.31.16.24' -- SQL01
	--	SET	@IPORIGEM = '172.31.44.127' -- SQL02
	--SET @IPORIGEM = '172.31.31.254' -- SQL04
--SET @IPORIGEM = '172.31.18.113' -- SQL05
	--SET @IPORIGEM = '172.31.17.88' -- SQL06
	--SET @IPORIGEM = '172.31.21.223' -- SQL07
--SET @IPORIGEM = '172.31.20.88' -- SQL08
--SET @IPORIGEM = '172.31.22.23' -- SQL09
SET @IPORIGEM = '172.31.27.161' -- SQL10
--	SET @IPORIGEM = '172.31.31.201' -- SQL11


SET @SERVIDORALIAS = 'VPS12-VPN'
SET @IPDESTINO = '172.31.25.237' -- VPS12
SET @SIGAINTERNET = '7301...'

--	SET @SERVIDORALIAS = 'VPS11-VPN'
--	SET @IPDESTINO = '172.31.31.201' -- LNX11
--	SET @SIGAINTERNET = '7001....'
	
	--SET @SERVIDORALIAS = 'VPS10-VPN'
	--SET @IPDESTINO = '172.31.27.161' -- LNX10
	--SET @SIGAINTERNET = '0370'
	
--SET @SERVIDORALIAS = 'VPS09-VPN'
--SET @IPDESTINO = '172.31.22.23' -- LNX09
--SET @SIGAINTERNET = '6000...'
	
	--SET @SERVIDORALIAS = 'VPS08-VPN'
	--SET @IPDESTINO = '172.31.20.88' -- LNX08
	--SET @SIGAINTERNET = '7A00.....'
	
--SET @SERVIDORALIAS = 'VPS07-VPN'
--SET @IPDESTINO = '172.31.21.223' -- LNX07
--SET @SIGAINTERNET = '4300...'
	
	--SET @SERVIDORALIAS = 'VPS06-VPN'
	--SET @IPDESTINO = '172.31.17.88' -- LNX06
	--SET @SIGAINTERNET = '4567...'
	
	--SET @SERVIDORALIAS = 'VPS05-VPN'
	--SET @IPDESTINO = '172.31.18.113' -- LNX05
	--SET @SIGAINTERNET = '505E'
	
--SET @SERVIDORALIAS = 'VPS04-VPN'
--SET @IPDESTINO = '172.31.31.254' -- LNX04
--SET @SIGAINTERNET = '5A55...'
	
--	SET @SERVIDORALIAS = 'VPS02a-VPN'
--	SET @IPDESTINO = '172.31.28.131' -- VPS02a
--	SET @SIGAINTERNET = '647C...' 
	
--	SET @SERVIDORALIAS = 'VPS01a-VPN'
--	SET @IPDESTINO = '172.31.28.240' -- VPS01a
--	SET @SIGAINTERNET = '604E...'
	
	
                  
SELECT
	SERVIDORIP,
	SERVIDORALIAS,
	SERVIDORSIGAINTERNET_SENHA,
	SERVIDORDATABASE,
	SERVIDORSIGAUSER_LOGIN,
	SiglaUnidade, 
	'https://siga.activesoft.com.br/login/?instituicao=' + SIGLAUNIDADE
FROM
	[DBCRMACTIVESOFT].[DBO].[TBCLIENTE]
WHERE
	[SERVIDORDATABASE] = @BANCO
	
	AND SERVIDORIP = @IPORIGEM
ORDER BY
	SERVIDORDATABASE
  
BEGIN TRAN
  UPDATE
	DBCRMACTIVESOFT.DBO.TBCLIENTE
SET
	SERVIDORIP = @IPDESTINO,
	SERVIDORALIAS = @SERVIDORALIAS,
	SERVIDORSIGAINTERNET_SENHA = @SIGAINTERNET
	-- TEM QUE SER FEITO AQUI
	--     ,SERVIDORSIGAUSER_LOGIN = 'USERMODELOVOUBUSCAR'
WHERE
	[SERVIDORDATABASE] = @BANCO
	-- AND SERVIDORIP = @IPORIGEM

COMMIT
	--ROLLBACK

SELECT
	SERVIDORIP,
	SERVIDORALIAS,
	SERVIDORSIGAINTERNET_SENHA,
	SERVIDORDATABASE,
	SERVIDORSIGAUSER_LOGIN,
	IDCLIENTE
FROM
	[DBCRMACTIVESOFT].[DBO].[TBCLIENTE]
WHERE
	SERVIDORIP = @IPDESTINO
	AND [SERVIDORDATABASE] = @BANCO
ORDER BY
	SERVIDORDATABASE

	
	
	
/*
 * 
SELECT	*
FROM
	[DBCRMACTIVESOFT].[DBO].[TBCLIENTE]
WHERE
	 ServidorDatabase_Biblioteca IS NOT NULL
	 
	 AND servidorIP = '172.31.28.131' -- VPS02a
--	 SiglaUnidade LIKE '%IES%' 
 */	