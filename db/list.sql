--17fev22

SELECT 
--	database_id, 
	name as [Database],
	'./backup.sh ' + name as [script],
	state_desc AS state, create_date, recovery_model_desc AS recovery_model,
	CASE 
		WHEN is_read_only = 1 THEN 'read-only'
		ELSE 'r/w'
	END AS 'read-write',	
	user_access_desc
FROM
	sys.databases d
WHERE
	database_id > 4
	and state = 0 			-- 0 ON-LINE -- 6 OFF-LINE
	--and recovery_model = 1   -- 1-FULL 3-simple
	--and is_read_only = 1 	-- Read-only
	--and user_access <> 1 	-- SINGLE_USER
	--and name NOT IN ('?')
	--and create_Date > '2020-04-08 12:47:10.447'	
	--and name LIKE 'dbCrmActivesoft%'
ORDER BY
	create_date DESC;
--	name

	
--OFFLINE
SELECT
	name as [Database], state_desc AS state, recovery_model_desc AS recovery_model, is_read_only, user_access_desc AS user_access, create_date
FROM
	sys.databases d
WHERE
	database_id > 4
	and state = 6	-- 0 ON-LINE -- 6 OFF-LINE 
ORDER BY
	user_access_desc , name DESC