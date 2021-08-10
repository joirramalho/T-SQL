-- 05ago20

SELECT D.name AS 'Database', P.name AS 'Owner'
FROM sys.databases D
JOIN sys.server_principals P ON D.owner_sid = P.sid
ORDER BY D.name;