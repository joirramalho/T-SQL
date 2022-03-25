--23mar22

SELECT name,
'/opt/mssql-tools/bin/sqlcmd -S localhost,1435 -U login -P ***** -i script.sql -d ' + name	-- + ' -o audit.sql.output'
FROM sys.databases
where database_id > 4 and  name LIKE 'dbSiga%' and state = 0 and is_read_only =0
order by name
