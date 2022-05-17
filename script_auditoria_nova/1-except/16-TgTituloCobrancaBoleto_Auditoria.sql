
--
-- Activesoft Consultoria 
-- TRIGGER criada pelo Activesoft Service Pack em 01/12/2020 durante atualização para versão 1.065.090.
--


CREATE TRIGGER dbo.TgTituloCobrancaBoleto_Auditoria ON dbo.TbTituloCobrancaBoleto
-- ALTER TRIGGER dbo.TgTituloCobrancaBoleto_Auditoria ON dbo.TbTituloCobrancaBoleto
FOR INSERT, UPDATE, DELETE
AS
BEGIN
	SET NOCOUNT ON
	
	DECLARE @TipoOperacao CHAR(1) = 'I' -- Insert by default.
	IF EXISTS(SELECT * FROM DELETED)
	BEGIN
		SET @TipoOperacao = 
		    CASE
			WHEN EXISTS(SELECT * FROM INSERTED) THEN 'U' ELSE 'D' 
		    END
	END
	ELSE 
		IF NOT EXISTS(SELECT * FROM INSERTED) RETURN -- Nem updated nem inserted. Pode ter sido um "failed delete".

		
	IF	NOT EXISTS(	SELECT * FROM inserted
					EXCEPT
					SELECT * FROM deleted ) AND  @TipoOperacao <> 'D'
		RETURN
		

	IF APP_NAME() = 'SIGAWEB'
	BEGIN
		--- Alteração autorizada por Jorge até que seja solucionado o problema com as temptables no SIGAWEB.
		RETURN
	END

	IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = 'TbTituloCobrancaBoleto' AND LEFT(COLUMN_NAME,1) <> '_' ) <> 14
	BEGIN
		RAISERROR ('Dados não podem ser alterados (trigger de auditoria TgTituloCobrancaBoleto_Auditoria inválida)', 16, 1) 
		ROLLBACK TRANSACTION 
		RETURN 
	END 

	DECLARE @IdUsuario INTEGER
	IF OBJECT_ID( 'tempdb..#TempTable' ) IS NOT NULL
		SELECT @IdUsuario = IdUsuario FROM #TempTable
	ELSE
		SET @IdUsuario = NULL


	IF ( @TipoOperacao = 'D' )
		INSERT	TbTituloCobrancaBoleto_Auditoria ( 	DataHora, Operacao, IdUsuario, IdTituloCobranca, DataHoraAtualizacao, BOL_CodigoBanco, BOL_LinhaDigitavel, BOL_CodigoBarras, BOL_ValorDocumento, BOL_AgenciaCodigoBeneficiario, BOL_NossoNumero, BOL_NumeroDocumento, BOL_EspecieDocumento, BOL_UsoBanco, BOL_Carteira, BOL_InstrucoesDesconto, BOL_InstrucoesMultaJuros )
			SELECT									GETDATE(), @TipoOperacao, @IdUsuario, IdTituloCobranca, DataHoraAtualizacao, BOL_CodigoBanco, BOL_LinhaDigitavel, BOL_CodigoBarras, BOL_ValorDocumento, BOL_AgenciaCodigoBeneficiario, BOL_NossoNumero, BOL_NumeroDocumento, BOL_EspecieDocumento, BOL_UsoBanco, BOL_Carteira, BOL_InstrucoesDesconto, BOL_InstrucoesMultaJuros
			FROM	deleted
	ELSE
		INSERT	TbTituloCobrancaBoleto_Auditoria ( 	DataHora, Operacao, IdUsuario, IdTituloCobranca, DataHoraAtualizacao, BOL_CodigoBanco, BOL_LinhaDigitavel, BOL_CodigoBarras, BOL_ValorDocumento, BOL_AgenciaCodigoBeneficiario, BOL_NossoNumero, BOL_NumeroDocumento, BOL_EspecieDocumento, BOL_UsoBanco, BOL_Carteira, BOL_InstrucoesDesconto, BOL_InstrucoesMultaJuros )
			SELECT									GETDATE(), @TipoOperacao, @IdUsuario, IdTituloCobranca, DataHoraAtualizacao, BOL_CodigoBanco, BOL_LinhaDigitavel, BOL_CodigoBarras, BOL_ValorDocumento, BOL_AgenciaCodigoBeneficiario, BOL_NossoNumero, BOL_NumeroDocumento, BOL_EspecieDocumento, BOL_UsoBanco, BOL_Carteira, BOL_InstrucoesDesconto, BOL_InstrucoesMultaJuros
			FROM	inserted
		EXCEPT
			SELECT									GETDATE(), @TipoOperacao, @IdUsuario, IdTituloCobranca, DataHoraAtualizacao, BOL_CodigoBanco, BOL_LinhaDigitavel, BOL_CodigoBarras, BOL_ValorDocumento, BOL_AgenciaCodigoBeneficiario, BOL_NossoNumero, BOL_NumeroDocumento, BOL_EspecieDocumento, BOL_UsoBanco, BOL_Carteira, BOL_InstrucoesDesconto, BOL_InstrucoesMultaJuros
			FROM	deleted
END

