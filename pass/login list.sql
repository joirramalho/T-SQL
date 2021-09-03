--02set21

SELECT
	SP.NAME AS LOGIN,
	SP.TYPE_DESC AS LOGIN_TYPE,
--	SL.PASSWORD_HASH,
	CASE
		WHEN SP.IS_DISABLED = 1 THEN '-- DISABLED --'
		ELSE 'ENABLED'
	END AS STATUS,
	SP.CREATE_DATE,
	SP.MODIFY_DATE
FROM
	SYS.SERVER_PRINCIPALS SP
LEFT JOIN SYS.SQL_LOGINS SL ON
	SP.PRINCIPAL_ID = SL.PRINCIPAL_ID
WHERE
	SP.TYPE NOT IN ('A', 'G', 'R', 'X') 
	AND SP.type_desc NOT IN ('CERTIFICATE_MAPPED_LOGIN')
ORDER BY
	SP.NAME;