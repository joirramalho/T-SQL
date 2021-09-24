SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- sp_JobEspacoLivreInMB 

ALTER PROCEDURE [dbo].[sp_JobEspacoLivreInMB] 
AS

DECLARE @EspacoLivre	TABLE 
	(
		 Disco nvarchar(16)
		,EspacoLivreInMB int
	);




-- Coletar espaço livre no disco
INSERT INTO @EspacoLivre
	SELECT  DISTINCT dovs.volume_mount_point AS Drive,
	CONVERT(INT,dovs.available_bytes/1048576.0) AS FreeSpaceInMB
	FROM sys.master_files mf
	CROSS APPLY sys.dm_os_volume_stats(mf.database_id, mf.FILE_ID) dovs
	ORDER BY FreeSpaceInMB ASC


-- Gerar mensagem com pequeno delay
-- WAITFOR DELAY '00:00:01';

SELECT ( ISNULL( RTRIM( CAST( EspacoLivreInMB AS char) ),'') + ' MB' ) + ' livres em disco' FROM @EspacoLivre 

-- Logar operação em TbLogMensagem
INSERT INTO [dbLogRestore].[dbo].[TbLogMensagem]
			([CRM]
			,[Erro]
			,[Mensagem])
		VALUES
			(''
			,0 -- Warnig
			,( SELECT ISNULL( RTRIM(CAST( EspacoLivreInMB AS char) ),'') + ' MB' FROM @EspacoLivre ) + ' livres em disco')

GO
