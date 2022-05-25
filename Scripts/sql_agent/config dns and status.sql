-- How to check if SQL Server Agent is running

-- ENABLED SQLAgent
    -- sudo /opt/mssql/bin/mssql-conf set sqlagent.enabled true
        -- sudo systemctl restart mssql-server


        -- cd /var/opt/mssql/log
            -- cat /var/opt/mssql/log/sqlagent.out

                -- https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-setup-sql-agent?view=sql-server-ver15
                    -- The SQL Server Agent startup service account is ip-172-31-44-12\ip-172-31-44-12$. (SQL02)

                    -- 172.31.31.254 ip-172-31-31-25   (SQL04)

                    -- https://stackoverflow.com/questions/56739546/sql-server-agent-service-could-not-be-started/64281811#64281811

/*
Obs.: select @@servername
        ip-172-31-31-25 (truncado o último dígito do 254)

[root@ip-172-31-31-254 etc]# cat /etc/hosts
    172.31.31.254 ip-172-31-31-25
    127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
    ::1         localhost6 localhost6.localdomain6
[root@ip-172-31-31-254 etc]#       



ATENCAO PARA DETALHE

    ip-172-31-29-22

        Com hífem e sem o último dígito do ultimo octeto.

[ec2-user@ip-172-31-29-224 ~]$ sudo cat /etc/hosts
172.31.29.224 ip-172-31-29-22
127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost6 localhost6.localdomain6
*/

SELECT dss.[status], dss.[status_desc]
FROM   sys.dm_server_services dss
WHERE  dss.[servicename] LIKE N'SQL Server Agent (%';


-- LOG SQLAgent
    -- cat /var/opt/mssql/log/sqlagent.out