--16set21
--https://stackoverflow.com/questions/7272157/how-to-identify-all-stored-procedures-referring-a-particular-table

SELECT Name
FROM sys.procedures
WHERE OBJECT_DEFINITION(OBJECT_ID) LIKE '%TbAlunoTurma%'