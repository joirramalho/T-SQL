-- EXEC dbLogMonitor.dbo.sp_ServerName

-- ALTER LOGIN [userISO_v4]  ENABLE 

-- SQL07 - 07jun21
-- SQL08 - 14jun21
ALTER LOGIN [userRestauraBancoVPS] DISABLE


ALTER LOGIN [userSisControllerCEEsCrianca] DISABLE


-- CHECK
    SELECT login_name [Login] , MAX(login_time) AS [Last Login Time]
    FROM sys.dm_exec_sessions
    where login_name LIKE 'user%'
    GROUP BY login_name;



    


    


