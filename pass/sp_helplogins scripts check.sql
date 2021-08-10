-- sp_helplogins userAPLICACAO

select 'EXEC sp_helplogins [' + sp.name + ']'
       
from sys.server_principals sp
left join sys.sql_logins sl
          on sp.principal_id = sl.principal_id
where sp.type not in ('G', 'R') 
    AND sp.is_disabled = 0
    AND sp.type_desc = 'SQL_LOGIN'
order by sp.name;