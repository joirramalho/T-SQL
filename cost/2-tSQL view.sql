declare @sql varbinary(max)

select  @sql = sql_handle
from    sys.sysprocesses
where   spid = 58                     

select text
from sys.dm_exec_sql_text(@sql) 


