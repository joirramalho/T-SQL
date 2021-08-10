-- sp_PrepareProcedureFuncion.sql

--IF	OBJECT_ID('tempdb..#tmpObjetos') IS NOT NULL
	DROP TABLE #tmpObjetos

CREATE TABLE #tmpObjetos	( Routine_Name VARCHAR(128), Routine_Definition VARCHAR(MAX), Routine_Type CHAR(10), hashedVal varbinary(20), Created DATETIME, Last_Altered DATETIME  )


INSERT INTO #tmpObjetos
	SELECT Routine_Name, Routine_Definition, Routine_Type, NULL, Created, Last_Altered	FROM INFORMATION_SCHEMA.ROUTINES --	WHERE ROUTINE_TYPE = 'PROCEDURE' --AND Routine_Name = 'stp_Mem_Memorando_SEL'


UPDATE	#tmpObjetos
SET		hashedVal = (select HashBytes('SHA1', Routine_Definition ))


DELETE _CompareProcedureFuncion

INSERT INTO _CompareProcedureFuncion
	SELECT *  FROM #tmpObjetos

SELECT *  FROM _CompareProcedureFuncion