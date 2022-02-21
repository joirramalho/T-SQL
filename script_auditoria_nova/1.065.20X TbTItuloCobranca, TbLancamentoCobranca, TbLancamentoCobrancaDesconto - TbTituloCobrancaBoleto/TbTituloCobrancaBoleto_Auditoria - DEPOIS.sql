--09fev22
--NOVA auditoria


--1 CREATE TABLE  -------------------------------------------


	--1a CREATE FIELD PRIOR  -------------------------------------------
	--ADD FIELD PRIOR_IdFaseNotaAlunoAuditoria
	ALTER TABLE TbTituloCobrancaBoleto_Auditoria	ADD PRIOR_IdTituloCobrancaBoletoAuditoria BIGINT

	
	
	
EXEC sp_rename 'dbo.TbTituloCobrancaBoleto_Auditoria.DataHora', 'Audit_DataHora', 'COLUMN';

EXEC sp_rename 'dbo.TbTituloCobrancaBoleto_Auditoria.Operacao', 'Audit_Operacao', 'COLUMN';

EXEC sp_rename 'dbo.TbTituloCobrancaBoleto_Auditoria.IdUsuario', 'Audit_IdUsuario', 'COLUMN';
	
--	/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
--BEGIN TRANSACTION
--SET QUOTED_IDENTIFIER ON
--SET ARITHABORT ON
--SET NUMERIC_ROUNDABORT OFF
--SET CONCAT_NULL_YIELDS_NULL ON
--SET ANSI_NULLS ON
--SET ANSI_PADDING ON
--SET ANSI_WARNINGS ON
--COMMIT
--BEGIN TRANSACTION
--GO
--EXECUTE sp_rename N'dbo.TbDiarioAluno_Auditoria.DataHora', N'Tmp_Audit_DataHora', 'COLUMN' 
--GO
--EXECUTE sp_rename N'dbo.TbDiarioAluno_Auditoria.Operacao', N'Tmp_Audit_Operacao_1', 'COLUMN' 
--GO
--EXECUTE sp_rename N'dbo.TbDiarioAluno_Auditoria.IdUsuario', N'Tmp_Audit_IdUsuario_2', 'COLUMN' 
--GO
--EXECUTE sp_rename N'dbo.TbDiarioAluno_Auditoria.Tmp_Audit_DataHora', N'Audit_DataHora', 'COLUMN' 
--GO
--EXECUTE sp_rename N'dbo.TbDiarioAluno_Auditoria.Tmp_Audit_Operacao_1', N'Audit_Operacao', 'COLUMN' 
--GO
--EXECUTE sp_rename N'dbo.TbDiarioAluno_Auditoria.Tmp_Audit_IdUsuario_2', N'Audit_IdUsuario', 'COLUMN' 
--GO
--ALTER TABLE dbo.TbDiarioAluno_Auditoria SET (LOCK_ESCALATION = TABLE)
--GO
--COMMIT

	
	
	
	
	

--DROP FK IF EXISTS
	--TABELA DE AUDITORIA NÃO DEVE TER FK PARA TABEL BASE
IF OBJECT_ID('dbo.FK_TbTituloCobrancaBoleto_Auditoria_TbTituloCobranca') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbTituloCobrancaBoleto_Auditoria] DROP CONSTRAINT [FK_TbTituloCobrancaBoleto_Auditoria_TbTituloCobranca]
END


--CREATE PK ON Tabela Espelho
ALTER TABLE [dbo].[TbTituloCobrancaBoleto_Auditoria] ADD  CONSTRAINT [PK_TbTituloCobrancaBoleto_Auditoria] PRIMARY KEY CLUSTERED 
(
        [IdTituloCobrancaBoletoAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO


--CREATE INDEX IX ON Tabela espelho -------------------------------------------
CREATE INDEX [IX_TbTituloCobrancaBoleto_Auditoria_IdTituloCobranca] ON [dbo].[TbTituloCobrancaBoleto_Auditoria] ([IdTituloCobranca])
GO


--APENAS SE *** NÃO *** EXISTIA TABELA ESPELHADA -------------------------------------------
	-- POPULAR TABELA ESPELHO com dados da tabela base (Operação "+" ------------------------


	
	



--3 CREATE TRIGGER ON PK Tabela base -------------------------------------------


--4 DROP TRIGGERs ANTIGA ON PK Tabela base -------------------------------------------



--5 CREATE TRIGGER NOVA ON tabela espelho -------------------------------------------

--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 18/11/2021 durante atualização para versão 1.065.183.
--

CREATE TRIGGER [dbo].[TbTituloCobrancaBoleto_Auditoria_Prior] ON [dbo].[TbTituloCobrancaBoleto_Auditoria]
--ALTER TRIGGER [dbo].[TbTituloCobrancaBoleto_Auditoria_Prior] ON [dbo].[TbTituloCobrancaBoleto_Auditoria]
FOR INSERT
AS
BEGIN
	SET NOCOUNT ON
	
    UPDATE TbTituloCobrancaBoleto_Auditoria
    SET PRIOR_IdTituloCobrancaBoletoAuditoria = 
		    (
		    SELECT TOP 1 IdTituloCobrancaBoletoAuditoria 
         	FROM 	TbTituloCobrancaBoleto_Auditoria
     		WHERE 	IdTituloCobrancaBoletoAuditoria < i.IdTituloCobrancaBoletoAuditoria	
					AND IdTituloCobranca = i.IdTituloCobranca 
     		ORDER 	BY IdTituloCobrancaBoletoAuditoria DESC
			)
	    FROM inserted i 
	    INNER JOIN TbTituloCobrancaBoleto_Auditoria ON i.IdTituloCobrancaBoletoAuditoria = TbTituloCobrancaBoleto_Auditoria.IdTituloCobrancaBoletoAuditoria
	    WHERE TbTituloCobrancaBoleto_Auditoria.IdTituloCobrancaBoletoAuditoria = i.IdTituloCobrancaBoletoAuditoria
END




--7 CHECK tabela espelho -------------------------------------------

--SELECT COUNT(*)  						FROM TbTituloCobrancaBoleto --WHERE PRIOR_IdTituloCobrancaAuditoria IS NOT NULL
--SELECT COUNT(DISTINCT IdTituloCobranca)	FROM TbTituloCobrancaBoleto_Auditoria --WHERE PRIOR_IdTituloCobrancaBoletoAuditoria IS NOT NULL




--8 APENAS SE JÁ EXISTIA TABELA ESPELHADA -------------------------------------------
	-- POPULAR PRIOR_IdTituloCobrancaBoletoAuditoria ON tabela espelho -------------------------------------------

IF (OBJECT_ID('tempdb..#TEMP_AUDITORIA') IS NOT NULL) DROP TABLE tempdb..#TEMP_AUDITORIA
	CREATE TABLE tempdb..#TEMP_AUDITORIA ( IdTituloCobrancaBoletoAuditoria bigint, PRIOR_IdTituloCobrancaBoletoAuditoria bigint )

INSERT INTO tempdb..#TEMP_AUDITORIA
	SELECT IdTituloCobrancaBoletoAuditoria,
		        (		SELECT 	TOP 1 IdTituloCobrancaBoletoAuditoria 
			         	FROM 	TbTituloCobrancaBoleto_Auditoria
		         		WHERE 	IdTituloCobrancaBoletoAuditoria < t.IdTituloCobrancaBoletoAuditoria	
								AND IdTituloCobranca = t.IdTituloCobranca
		         		ORDER 	BY IdTituloCobrancaBoletoAuditoria DESC
		        ) AS PRIOR_IdTituloCobrancaBoletoAuditoria
		from TbTituloCobrancaBoleto_Auditoria t

--		SELECT * FROM  tempdb..#TEMP_AUDITORIA

UPDATE 	TbTituloCobrancaBoleto_Auditoria 
SET 	TbTituloCobrancaBoleto_Auditoria.PRIOR_IdTituloCobrancaBoletoAuditoria = tempdb..#TEMP_AUDITORIA.PRIOR_IdTituloCobrancaBoletoAuditoria 
FROM 	TbTituloCobrancaBoleto_Auditoria, tempdb..#TEMP_AUDITORIA
WHERE 	TbTituloCobrancaBoleto_Auditoria.IdTituloCobrancaBoletoAuditoria = tempdb..#TEMP_AUDITORIA.IdTituloCobrancaBoletoAuditoria
		AND tempdb..#TEMP_AUDITORIA.PRIOR_IdTituloCobrancaBoletoAuditoria IS NOT NULL
		
		
		
		

--9 CHECK de carga ON tabela espelho -------------------------------------------
			
	SELECT 
		audit.*
		,CASE 
				WHEN Operacao ='I' THEN 'Inclusão'
				WHEN Operacao ='U' THEN 'Alteração'
				WHEN Operacao ='D' THEN 'Remoção'
				WHEN Operacao ='+' THEN 'Carga de auditoria'
				WHEN Operacao ='O' THEN 'Tipo criado para identificar movimentações antigas' -- CRM 24432
				ELSE 'r/w'
			END AS 'NomeOperacao'
		,tu.NomeUsuario
--		,p.NomeProfessor 
	FROM TbTituloCobrancaBoleto_Auditoria audit
	LEFT JOIN TbUsuario 	tu 	ON tu.IdUsuario 	= audit.IdUsuario
--	LEFT JOIN TbProfessor 	p 	ON p.IdProfessor  	= audit.IdProfessor
--
	WHERE IdTituloCobranca IN (592207) -- 592194, 
--
--	
--	
--	SELECT TOP 100 * FROM TbTituloCobrancaBoleto WHERE YEAR  (DataHoraAtualizacao) = 2022
--	
	
--	SELECT  tcb.IdTituloCobrancaBoletoAuditoria, prior.IdTituloCobrancaBoletoAuditoria AS p2
--	FROM TbTituloCobrancaBoleto_Auditoria tcb
--	CROSS APPLY (	SELECT 	TOP 1 IdTituloCobrancaBoletoAuditoria 
--					FROM 	TbTituloCobrancaBoleto_Auditoria
--					WHERE 	IdTituloCobrancaBoletoAuditoria < tcb.IdTituloCobrancaBoletoAuditoria	
--						AND IdTituloCobranca = tcb.IdTituloCobranca
--		         	ORDER 	BY IdTituloCobrancaBoletoAuditoria DESC
--		          ) AS prior
--	WHERE PRIOR_IdTituloCobrancaBoletoAuditoria = prior.IdTituloCobrancaBoletoAuditoria AND IdTituloCobranca  IN (929061) --929103
--ORDER BY IdTituloCobrancaBoletoAuditoria DESC
	
	
	
	SELECT  tcb.IdTituloCobrancaBoletoAuditoria, tcb.Audit_DataHora , tcb.PRIOR_IdTituloCobrancaBoletoAuditoria , 
			(	SELECT 	TOP 1 IdTituloCobrancaBoletoAuditoria 
				FROM 	TbTituloCobrancaBoleto_Auditoria
				WHERE 	IdTituloCobrancaBoletoAuditoria < tcb.IdTituloCobrancaBoletoAuditoria	
				AND IdTituloCobranca = tcb.IdTituloCobranca
		         	ORDER 	BY IdTituloCobrancaBoletoAuditoria DESC
			) AS prior
	FROM TbTituloCobrancaBoleto_Auditoria tcb
	WHERE IdTituloCobranca  IN (929061) --929103
	ORDER BY IdTituloCobrancaBoletoAuditoria DESC

SELECT  tcb.IdTituloCobrancaBoletoAuditoria
	FROM TbTituloCobrancaBoleto_Auditoria tcb
	WHERE  IdTituloCobranca  IN (929061) --929103
	ORDER BY IdTituloCobrancaBoletoAuditoria DESC


Select
  ColumnA,
  ColumnB,
  c.calccolumn1 As calccolumn1,
  c.calccolumn1 / ColumnC As calccolumn2
from t42
cross apply (select (ColumnA + ColumnB) as calccolumn1) as c


--	
	UPDATE TbTituloCobrancaBoleto
	SET BOL_CodigoBarras = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.'
	WHERE IdTituloCobranca  IN (929061,929103)