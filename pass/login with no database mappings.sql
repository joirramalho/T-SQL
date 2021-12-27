--14set21
--https://www.dbaservices.com.au/how-to-find-sql-logins-with-no-database-mappings/

--14set21 - SQL02; SQL01 - DISABLE LOGIN ONLY; SQL03; SQL04, SQL05, SQL06, SQL07, 08, 09 & 10.

USE MASTER;

CREATE TABLE #dbusers ( 
sid VARBINARY(85)) 
EXEC sp_MSforeachdb 
'insert #dbusers select sid from [?].sys.database_principals where type != ''R''' 
SELECT
	'DROP LOGIN [' + sys.server_principals.name + '];'
	,'ALTER LOGIN [' + sys.server_principals.name + '] DISABLE;'
	, default_database_name
	, d.state_desc
	, is_disabled as [Login is disabled]
FROM
	sys.server_principals
LEFT JOIN sys.databases d ON d.name = sys.server_principals.default_database_name 
WHERE
	sys.server_principals.name NOT LIKE 'active%' AND
	sys.server_principals.name NOT LIKE 'NT AUTHORITY%' AND
	sys.server_principals.name NOT LIKE 'BUILTIN\Administrators%' AND
	sys.server_principals.name NOT IN ('service.account', '') AND
	
	sid IN (
	SELECT
		sid
	FROM
		sys.server_principals
	WHERE
		TYPE != 'R'
		AND name NOT LIKE ('##%##')
		
EXCEPT
	SELECT
		DISTINCT sid
	FROM
		#dbusers
)
ORDER BY state_desc

DROP TABLE #dbusers;
