-- use dbSigaGGE

-- SELECT DB_NAME()

DECLARE @BatchSize INT = 5000

WHILE 1 = 1
BEGIN
	DELETE TOP (@BatchSize)
	FROM dbSigaGGE.dbo.TbAuditoria
	where YEAR(DAtaHora) = 2020
 
	IF @@ROWCOUNT < @BatchSize BREAK
END