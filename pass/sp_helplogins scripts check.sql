--25ago21
	--https://www.sqlshack.com/read-sql-server-error-logs-using-the-xp_readerrorlog-command/

SELECT
	'EXEC SP_HELPLOGINS [' + SP.NAME + ']'
FROM
	SYS.SERVER_PRINCIPALS SP
LEFT JOIN SYS.SQL_LOGINS SL
          ON
	SP.PRINCIPAL_ID = SL.PRINCIPAL_ID
WHERE
	SP.TYPE NOT IN ('G', 'R')
	AND SP.IS_DISABLED = 0
	AND SP.TYPE_DESC = 'SQL_LOGIN'
ORDER BY
	SP.NAME;

--USE dbSigaEducativo;
--DROP USER [userFaculJardinsVPS5];


--EXEC SP_HELPLOGINS [userEducativo];
