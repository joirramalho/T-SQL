--SQL09 - 13ago21
--SQL08 - 14jun21
--SQL07 - 07jun21

ALTER LOGIN [userRestauraBancoVPS] DISABLE


ALTER LOGIN [userSisControllerCEEsCrianca] DISABLE


-- CHECK & last Login
    SELECT login_name [Login] , MAX(login_time) AS [Last Login Time]
    FROM sys.dm_exec_sessions
    where login_name LIKE 'user%'
    GROUP BY login_name;



    


    


