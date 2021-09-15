--14set21

DECLARE @DBName VARCHAR(200)

SET
@DBName = NULL
-- SET @DBName = 'master'; 


SELECT
	sp.name
    ,
	sp.default_database_name
	,
	CASE 
		WHEN sp.is_disabled = 0 THEN 'enabled'
		ELSE '-- no --'
	END AS 'login_enabled'
	,
	CASE 
		WHEN sl.is_policy_checked = 1 THEN 'checked'
		ELSE ''
	END AS 'policy_checked'
	,
	CASE 
		WHEN sl.is_expiration_checked = 1 THEN 'checked'
		ELSE ''
	END AS 'expiration_checked'
--    ,password_hash
FROM
	sys.server_principals AS SP
LEFT JOIN sys.sql_logins AS SL ON
	SP.principal_id = SL.principal_id
WHERE
	SP.type IN ('S', 'G', 'U')
	AND SP.name NOT LIKE '##%##'
	AND SP.name NOT LIKE 'NT AUTHORITY%'
	AND SP.name NOT LIKE 'NT SERVICE%'
	AND SP.name <> ('BUILTIN\Administrators')
	AND SP.name <> ('sa')
	AND SP.name <> 'distributor_admin'
	-- AND SP.name NOT LIKE 'active.%'
	-- AND SP.name <> ('user')
	AND SP.name <> ('sigainternet')
--	AND sp.is_disabled = 0 -- enabled
	AND EXISTS (
	SELECT
		*
	FROM
		sys.databases d
	WHERE
		d.name = sp.default_database_name
		AND d.state_desc = 'ONLINE' )
	AND sp.default_database_name LIKE ISNULL( @DBName,
	sp.default_database_name)
	-- AND SP.default_database_name IS NOT NULL 
	-- AND CONVERT( NVARCHAR(MAX), SL.password_hash, 1 ) IS NOT NULL
ORDER BY
	SP.name