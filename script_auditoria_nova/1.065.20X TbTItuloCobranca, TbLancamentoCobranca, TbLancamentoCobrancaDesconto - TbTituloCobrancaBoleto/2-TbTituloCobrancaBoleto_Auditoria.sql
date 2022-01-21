--20jan22
--NOVA auditoria


--1 CREATE TABLE  -------------------------------------------


--1a CREATE FIELD PRIOR  -------------------------------------------
--ADD FIELD PRIOR_IdFaseNotaAlunoAuditoria
ALTER TABLE TbTituloCobrancaBoleto_Auditoria	ADD PRIOR_IdTituloCobrancaBoletoAuditoria BIGINT


--DROP FK IF EXISTS
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


--2 CREATE INDEX IX ON Tabela espelho -------------------------------------------
CREATE INDEX [IX_TbTituloCobrancaBoleto_Auditoria_IdTituloCobranca] ON [dbo].[TbTituloCobrancaBoleto_Auditoria] ([IdTituloCobranca])
GO




	
	



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



--6 APENAS SE *** NÃO *** EXISTIA TABELA ESPELHADA -------------------------------------------
	-- POPULAR TABELA ESPELHO com dados da tabela base (Operação "+" ------------------------



--7 CHECK tabela espelho -------------------------------------------

--SELECT COUNT(*)  						FROM TbTituloCobrancaBoleto --WHERE PRIOR_IdTituloCobrancaAuditoria IS NOT NULL
--SELECT COUNT(DISTINCT IdTituloCobranca)	FROM TbTituloCobrancaBoleto_Auditoria --WHERE PRIOR_IdTituloCobrancaBoletoAuditoria IS NOT NULL




--8 APENAS SE JÁ EXISTIA TABELA ESPELHADA -------------------------------------------
	-- POPULAR PRIOR_IdTituloCobrancaBoletoAuditoria ON tabela espelho -------------------------------------------

--IF (OBJECT_ID('tempdb..#TEMP_AUDITORIA') IS NOT NULL) DROP TABLE tempdb..#TEMP_AUDITORIA
--	CREATE TABLE tempdb..#TEMP_AUDITORIA ( IdTituloCobrancaBoletoAuditoria bigint, PRIOR_IdTituloCobrancaBoletoAuditoria bigint )
--
--INSERT INTO tempdb..#TEMP_AUDITORIA
--	SELECT IdTituloCobrancaBoletoAuditoria,
--		        (		SELECT 	TOP 1 IdTituloCobrancaBoletoAuditoria 
--			         	FROM 	TbTituloCobrancaBoleto_Auditoria
--		         		WHERE 	IdTituloCobrancaBoletoAuditoria < t.IdTituloCobrancaBoletoAuditoria	
--								AND IdTituloCobranca = t.IdTituloCobranca
--		         		ORDER 	BY IdTituloCobrancaBoletoAuditoria DESC
--		        ) AS PRIOR_IdTituloCobrancaBoletoAuditoria
--		from TbTituloCobrancaBoleto_Auditoria t
--
----		SELECT * FROM  tempdb..#TEMP_AUDITORIA
--
--UPDATE 	TbTituloCobrancaBoleto_Auditoria 
--SET 	TbTituloCobrancaBoleto_Auditoria.PRIOR_IdTituloCobrancaBoletoAuditoria = tempdb..#TEMP_AUDITORIA.PRIOR_IdTituloCobrancaBoletoAuditoria 
--FROM 	TbTituloCobrancaBoleto_Auditoria, tempdb..#TEMP_AUDITORIA
--WHERE 	TbTituloCobrancaBoleto_Auditoria.IdTituloCobrancaBoletoAuditoria = tempdb..#TEMP_AUDITORIA.IdTituloCobrancaBoletoAuditoria
--		AND tempdb..#TEMP_AUDITORIA.PRIOR_IdTituloCobrancaBoletoAuditoria IS NOT NULL
		
		
		
		

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
--	SELECT TOP 10 * FROM TbTituloCobrancaBoleto_Auditoria WHERE IdTituloCobranca  = 524027 
--	
--	UPDATE TbTituloCobrancaBoleto
--	SET BOL_CodigoBarras = 'XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX.'
--	WHERE IdTituloCobranca  IN (592194, 592207)