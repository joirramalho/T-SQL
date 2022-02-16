DECLARE @path VARCHAR(MAX) = (SELECT [path] FROM sys.traces WHERE is_default = 1)
SELECT
TextData,
Duration,
StartTime,
EndTime,
SPID,
ApplicationName,
LoginName
FROM
sys.fn_trace_gettable(@path, DEFAULT)
WHERE
EventClass IN ( 115 )
	AND TextData NOT LIKE 'BACKUP LOG%'
	AND TextData NOT LIKE '%DIFFERENTIAL'
ORDER BY
StartTime DESC