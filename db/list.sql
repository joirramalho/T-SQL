-- 04ago21

SELECT name, state_desc, recovery_model_desc, is_read_only, user_access_desc, create_date
FROM sys.databases d
WHERE database_id > 4       -- User Databases

-- and state = 0            -- 0 ON-LINE -- 6 OFF-LINE
-- and recovery_model = 1   -- 1-FULL 3-simple
-- and is_read_only = 1 	-- Read-only
-- and user_access <> 1 	-- SINGLE_USER
-- and name NOT IN ('?')
-- and create_Date > '2020-04-08 12:47:10.447'
-- and name LIKE 'dbSigaMillenium%'
 
ORDER BY  create_date DESC