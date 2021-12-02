
--01dez21
	--https://www.dbrnd.com/2017/02/sql-server-script-to-find-bad-sessions-or-processes-block-transaction-waiting-session/

SELECT
	TOP 25
	CONVERT(float, cpu / datediff(SECOND, login_time, getdate())) AS PScore -- find block process
	,spid
	,blocked
	,CONVERT(varchar(64), db_name(dbid)) AS DBName
	,cpu
	,datediff(SECOND, login_time, getdate()) AS Secs
	,CONVERT(varchar(16), hostname) AS Host
	,CONVERT(varchar(50), program_name) AS Program
	,CONVERT(varchar(20), loginame) AS Login
FROM
	master..sysprocesses
WHERE
	datediff(SECOND,
	login_time,
	getdate()) > 0
	AND spid > 50
ORDER BY
	pscore DESC