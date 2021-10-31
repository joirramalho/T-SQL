--26set21

SELECT
	database_id,
	name as [ON-LINE],
	state_desc,
	create_date,
	recovery_model_desc,
	CASE 
		WHEN is_read_only = 1 THEN 'read-only'
		ELSE 'r/w'
	END AS 'read-write',	
	user_access_desc
FROM
	sys.databases d
WHERE
	database_id > 5
	and state = 0 			-- 0 ON-LINE -- 6 OFF-LINE
	--and recovery_model = 1   -- 1-FULL 3-simple
	--and is_read_only = 1 	-- Read-only
	--and user_access <> 1 	-- SINGLE_USER
	--and name NOT IN ('?')
	--and create_Date > '2020-04-08 12:47:10.447'	
	--and name LIKE 'dbCrmActivesoft%'
ORDER BY
	create_date DESC;


--OFFLINE
SELECT
	name as [OFF-LINE],
	state_desc,
	recovery_model_desc,
	is_read_only,
	user_access_desc,
	create_date
FROM
	sys.databases d
WHERE
	database_id > 5
	and state = 6	-- 0 ON-LINE -- 6 OFF-LINE 
ORDER BY
	create_date DESC