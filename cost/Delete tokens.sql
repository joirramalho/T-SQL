--07jan22

/*
	UPDATE tat SET tat.IdSourceRefreshToken = NULL
	FROM TbAccessToken tat 
	INNER JOIN TbRefreshToken trt ON trt.IdRefreshToken = tat.IdSourceRefreshToken
	WHERE 1=1
		AND trt.RevokedAt IS NOT NULL
		AND trt.RevokedAt < GETDATE() - 2
		AND tat.Expires < GETDATE()	
	
	
	DECLARE @BatchSize INT = 50
	
	WHILE 1 = 1
	BEGIN
	DELETE TOP (@BatchSize)
	--	SELECT COUNT(*) FROM 
			TbRefreshToken
		WHERE 1=1
			AND RevokedAt IS NOT NULL
			AND RevokedAt < GETDATE() - 2
	 
		IF @@ROWCOUNT < @BatchSize BREAK
	END
*/


/*
	UPDATE tat SET tat.IdSourceRefreshToken = NULL
	--	SELECT trt.*
		FROM TbAccessToken tat 
		INNER JOIN TbRefreshToken trt ON trt.IdRefreshToken = tat.IdSourceRefreshToken
		WHERE 1=1
			AND trt.CreatedAt < GETDATE() - 90
			AND tat.Expires < GETDATE()
	

	DELETE
	--SELECT COUNT(*) FROM 
		TbRefreshToken
	WHERE 1=1
		AND CreatedAt < GETDATE() - 90
*/




/*
	 DELETE tat
	--SELECT * -- SELECT COUNT(*)
	FROM TbAccessToken tat 
	LEFT JOIN TbRefreshToken trt ON trt.IdAccessToken = tat.IdAccessToken
	LEFT JOIN TbRefreshToken trt2 ON trt2.IdRefreshToken = tat.IdSourceRefreshToken 
	WHERE 1=1
		AND Expires < GETDATE()
		AND trt.IdRefreshToken  IS NULL 
		AND trt2.IdRefreshToken IS NULL
 */


/*
ALTER TABLE dbCrmActivesoft.dbo.TbRefreshToken ADD CONSTRAINT FK_TbRefreshToken_TbAccessToken_IdAccessToken FOREIGN KEY (IdAccessToken) 
	REFERENCES dbCrmActivesoft.dbo.TbAccessToken(IdAccessToken);

		--ALTER TABLE dbCrmActivesoft.dbo.TbRefreshToken ADD CONSTRAINT FK_TbRefreshToken_TbAccessToken_IdSourceRefreshToken FOREIGN KEY (IdRefreshToken) 
		--	REFERENCES dbCrmActivesoft.dbo.TbAccessToken(IdSourceRefreshToken);

-- cíclico - NÃO CRIADO
	ALTER TABLE dbCrmActivesoft.dbo.TbAccessToken ADD CONSTRAINT FK_TbAccessToken_TbRefreshToken_IdRefreshToken FOREIGN KEY (IdSourceRefreshToken) 
		REFERENCES dbCrmActivesoft.dbo.TbRefreshToken(IdRefreshToken);
*/

	
	
DELETE tat
--	SELECT COUNT(*) 
	FROM TbAccessToken tat 
	LEFT JOIN TbRefreshToken trt ON trt.IdAccessToken = tat.IdAccessToken 
	WHERE 1=1
		AND Expires < GETDATE()
		AND IdSourceRefreshToken IS NULL
		AND IdRefreshToken IS NULL
