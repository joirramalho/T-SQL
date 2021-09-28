-- EXEC sp_CompareProcedureFuncion
USE [master]
GO
/****** Object:  StoredProcedure [dbo].[sp_CompareProcedureFuncion]    Script Date: 20/06/2020 12:11:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
use [master]
GO
GRANT EXECUTE ON [dbo].[sp_CompareProcedureFuncion] TO [public]
GO
*/


-- EXEC sp_CompareProcedureFuncion
-- V1.02 20jUN20

ALTER PROCEDURE [dbo].[sp_CompareProcedureFuncion] 
--	@db	VARCHAR(128)
AS
BEGIN

IF	OBJECT_ID('tempdb..#tmpObjetos') IS NOT NULL
	DROP TABLE #tmpObjetos

	CREATE TABLE #tmpObjetos	( Routine_Name VARCHAR(128), Routine_Definition VARCHAR(MAX), Routine_Type CHAR(10), hashedVal varbinary(20), Created DATETIME, Last_Altered DATETIME  )


	INSERT INTO #tmpObjetos
		SELECT Routine_Name, Routine_Definition, Routine_Type, NULL, Created, Last_Altered	FROM Processo.INFORMATION_SCHEMA.ROUTINES --	WHERE ROUTINE_TYPE = 'PROCEDURE' --AND Routine_Name = 'stp_Mem_Memorando_SEL'

	UPDATE	#tmpObjetos
	SET		hashedVal = (select HashBytes('SHA1', Routine_Definition ))


	SELECT S.Routine_Name, S.Routine_Definition Routine_Definition_PRD, s.Created Created_PRD, s.Last_Altered Last_Altered_PRD, Tmp.Routine_Definition Routine_Definition_Check, tmp.Created Created_Check, tmp.Last_Altered Last_Altered_Check --, s.hashedVal, Tmp.hashedVal   
	--SELECT s.Created Created_PRD, s.Last_Altered Last_Altered_PRD, S.Routine_Definition, S.Routine_Name, tmp.Created Created_Check, tmp.Last_Altered Last_Altered_Check, Tmp.Routine_Definition Routine_Definition_Check  
	FROM Processo.dbo._CompareProcedureFuncion S
	JOIN #tmpObjetos Tmp ON S.Routine_Name = Tmp.Routine_Name COLLATE SQL_Latin1_General_CP1_CI_AI
	WHERE	s.hashedVal <> TMP.hashedVal
	ORDER BY S.Routine_Name


	SELECT S.Routine_Name, S.Routine_Definition ONLY_PRD_Routine_Definition, s.Created Created_PRD, s.Last_Altered Last_Altered_PRD
	FROM Processo.dbo._CompareProcedureFuncion S
	WHERE NOT EXISTS( SELECT * FROM #tmpObjetos tmp WHERE TMP.Routine_Name = s.Routine_Name COLLATE SQL_Latin1_General_CP1_CI_AI )

	SELECT tmp.Routine_Name, tmp.Routine_Definition ONLY_CheckDB_Routine_Definition, tmp.Created Created_Check, tmp.Last_Altered Last_Altered_Check
	FROM #tmpObjetos tmp
	WHERE NOT EXISTS( SELECT * FROM Processo.dbo._CompareProcedureFuncion s WHERE s.Routine_Name = tmp.Routine_Name COLLATE SQL_Latin1_General_CP1_CI_AI )
END
