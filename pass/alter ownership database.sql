-- 05ago20 --- NAO TESTADO

SELECT
	'IF EXISTS(SELECT name FROM sys.server_principals WHERE name = ''' 
  + P.name + ''') ALTER AUTHORIZATION ON DATABASE::[' + D.name +
  '] TO [' + P.name + '];
GO'
FROM
	sys.databases D
JOIN sys.server_principals P ON
	D.owner_sid = P.sid
WHERE
	D.name NOT IN ('master', 'model', 'msdb', 'tempdb')
ORDER BY
	D.name;