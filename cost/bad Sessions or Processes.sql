
--05dez21 - adaptado
	--https://www.dbrnd.com/2017/02/sql-server-script-to-find-bad-sessions-or-processes-block-transaction-waiting-session/
	--https://docs.microsoft.com/pt-br/sql/relational-databases/system-compatibility-views/sys-sysprocesses-transact-sql?view=sql-server-ver15

SELECT
	TOP 25
	CONVERT(float, cpu / datediff(SECOND, login_time, getdate())) AS PScore -- find block process
	,spid
	,blocked
	,RTRIM(status) AS status
	,login_time
	,last_batch
--	,cmd
	,open_tran
	,CONVERT(varchar(64), db_name(dbid)) AS DBName
	,CONVERT(varchar(20), loginame) AS Login
	,RTRIM(waitresource) AS WaitResource
	,CONVERT(varchar(16), hostname) AS Host
	,CONVERT(varchar(50), program_name) AS Program
	,cpu AS [Sum time CPU processo]
	,datediff(SECOND, login_time, getdate()) AS Secs
FROM
	master..sysprocesses
WHERE
	datediff(SECOND,
	login_time,
	getdate()) > 0
	AND spid > 50
	AND program_name NOT LIKE 'ADO_Messenger_ADO%'
ORDER BY
	pscore DESC