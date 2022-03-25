--21mar22
	--https://stackoverflow.com/questions/19539696/find-all-stored-procedures-that-reference-a-specific-column-in-some-table

	--https://stackoverflow.com/questions/7272157/how-to-identify-all-stored-procedures-referring-a-particular-table


SELECT Name
FROM sys.procedures
WHERE OBJECT_DEFINITION(OBJECT_ID) LIKE '%TbAlunoTurma%'


-- Search in Stored Procedure Only
SELECT DISTINCT OBJECT_NAME(OBJECT_ID),
object_definition(OBJECT_ID)
FROM sys.Procedures
WHERE object_definition(OBJECT_ID) LIKE '%' + 'OrdemChamada' + '%'
GO


-- Search in All Objects
SELECT OBJECT_NAME(OBJECT_ID),
definition
FROM sys.sql_modules
WHERE definition LIKE '%' + 'OrdemChamada' + '%'
