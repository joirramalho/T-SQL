ALTER TRIGGER tgDATABASE_ALTER_TABLE
--CREATE TRIGGER tgDATABASE_ALTER_TABLE   
ON DATABASE   
FOR ALTER_TABLE -- DROP_TABLE,    
AS   
BEGIN 
	SET NOCOUNT ON;

	DECLARE	@TbName NVARCHAR(255)
	
	SELECT 	@TbName = EVENTDATA().value('(/EVENT_INSTANCE/ObjectName)[1]',  'NVARCHAR(255)')
   	
	IF @TbName IN ('TbDiario', 'TbDiarioAula')
	BEGIN   	
		-- Comparar a qtde de campos entre a tabela base e de auditoria descontando 4 campos de auditoria
		IF ( SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = @TbName AND LEFT(COLUMN_NAME,1) <> '_' ) <> ( SELECT COUNT(*) - 4 FROM INFORMATION_SCHEMA.COLUMNS c WHERE DATA_TYPE NOT IN ( 'text', 'image' ) AND TABLE_NAME = @TbName + '_Auditoria' AND LEFT(COLUMN_NAME,1) <> '_' )
		BEGIN			
			ROLLBACK TRANSACTION
			
			DECLARE @Mensagem VARCHAR(255)
			
			SET 	@Mensagem = 'Dados não podem ser alterados (trigger de auditoria Tg' + @TbName + '_Auditoria inválida)'

			RAISERROR (@Mensagem, 16, 1) 
			RETURN 
		END
	END
END


--DISABLE TRIGGER tgDATABASE_ALTER_TABLE ON DATABASE; 
--ENABLE TRIGGER tgDATABASE_ALTER_TABLE ON DATABASE; 


	
--	ALTER TABLE TbDiarioAula	ADD NewColumn2 varchar(20)
--	ALTER TABLE [dbo].[TbDiarioAula] DROP COLUMN [NewColumn2]
		
--		select db_name()

--	ALTER TABLE TbDiarioAula_AUDITORIA	ADD NewColumn2 varchar(20)
--	ALTER TABLE [dbo].[TbDiarioAula_AUDITORIA] DROP COLUMN [NewColumn2]
