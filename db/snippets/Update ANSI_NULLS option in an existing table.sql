--07fev22

--Update ANSI_NULLS option in an existing table
--https://stackoverflow.com/questions/10010042/update-ansi-nulls-option-in-an-existing-table



https://docs.microsoft.com/pt-br/sql/t-sql/statements/set-ansi-nulls-transact-sql?view=sql-server-ver15


SELECT 	name, is_ansi_nulls_on 
FROM 	sys.databases
ORDER 	BY name ASC;



IF sessionproperty('ANSI_NULLS') = 1 
   PRINT 'Everything is fine'
ELSE
   PRINT 'Cough. It''s dusty in here'

   
   
SELECT TOP 20 uses_ansi_nulls, * 
    FROM   sys.tables 
--    WHERE  uses_ansi_nulls = 0 --AND name LIKE '%_Auditoria%'-- object_id = object_id('dbo.TbAluno') 
    order by CREATE_date DESC