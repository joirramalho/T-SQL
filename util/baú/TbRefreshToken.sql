SELECT year( CreatedAt), month( CreatedAt), count(*)
  FROM [dbCrmActivesoft].[dbo].[TbRefreshToken]
where year( CreatedAt) = 2021
 --   AND revokedAt IS  NULL
  group by year( CreatedAt), month( CreatedAt)
  order by year( CreatedAt), month( CreatedAt)



  SELECT *
  FROM [dbCrmActivesoft].[dbo].[TbRefreshToken]





DECLARE @BatchSize INT = 100

WHILE 1 = 1
BEGIN
	DELETE TOP (@BatchSize)
	FROM [dbCrmActivesoft].[dbo].[TbRefreshToken]
	where year( CreatedAt ) = 2020 --AND month( CreatedAt ) = 2 --AND revokedAt IS NOT NULL
 
	IF @@ROWCOUNT < @BatchSize BREAK
END
