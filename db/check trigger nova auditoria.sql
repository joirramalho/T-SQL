--21jun22
--Check triggers de nova auditoria

SELECT Object_Name(tr.object_id),
	CASE 
		WHEN definition LIKE '%IF @@ROWCOUNT = 0%' THEN 1
		ELSE 0
	END AS 'ROWCOUNT',
	CASE 
		WHEN definition LIKE '%SET NOCOUNT ON%' THEN 1
		ELSE 0
	END AS 'NOCOUNT',
	CASE 
		WHEN definition LIKE '%DECLARE @TipoOperacao CHAR(1) = ''I'' -- Insert by default.%' THEN 1
		ELSE 0
	END AS '@TipoOperacao',
	CASE 
		WHEN definition LIKE '%SELECT * FROM deleted ) AND  @TipoOperacao <> ''D''%' THEN 1
		ELSE 0
	END AS 'EXCEPT-1',
	CASE 
		WHEN definition LIKE '%INFORMATION_SCHEMA.COLUMNS%' THEN 0
		ELSE 1
	END AS 'SCHEMA.COLUMNS',
	CASE 
		WHEN definition LIKE '%INFORMATION_SCHEMA.TABLE_CONSTRAINTS%' THEN 0 -- Check Constraint PK
		ELSE 1
	END AS 'TABLE_CONSTRAINTS',
	CASE 
		WHEN definition LIKE '%SIGAWEB%' THEN 0
		ELSE 1
	END AS 'SIGAWEB',
	CASE 
		WHEN definition LIKE '%Audit_DataHora%' AND definition LIKE '%Audit_Operacao%' AND definition LIKE '%Audit_IdUsuario%' THEN 1
		ELSE 0
	END AS 'RENAME FIELD PREFIX',
	CASE 
		WHEN definition LIKE '%Audit_IdProfessor%' OR definition LIKE '%@IdProfessor%' THEN 1
		ELSE 0
	END AS 'IdProfessor',
	CASE 
		WHEN definition LIKE '%Audit_IdAluno%' OR definition LIKE '%@IdAluno%' THEN 1
		ELSE 0
	END AS 'IdAluno'

	
FROM sys.triggers 	AS tr 
LEFT JOIN sys.sql_modules 	AS mo ON tr.object_id = mo.object_id
WHERE Object_Name(tr.object_id) LIKE '%_Auditoria'
ORDER BY Object_Name(tr.object_id)

        		
--EXEC sp_help 'TbFaseNota' ;
--EXEC sp_helptext 'TgDiarioAula_Auditoria' ;
