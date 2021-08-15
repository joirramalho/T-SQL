-- USE dbSigaAuxilRecife;

/*
ALTER TABLE [dbo].[TbParametroCPR] DROP CONSTRAINT [FK_TbParametroCPR_TbClassificacaoFinanceiraTarifaCobrancaBoleto]
GO

ALTER TABLE [dbo].[TbParametroCPR] DROP CONSTRAINT [FK_TbParametroCPR_TbClassificacaoFinanceiraRecebimentoNaoIdentificado]
GO

ALTER TABLE [dbo].[TbParametroCPR] DROP CONSTRAINT [FK_TbParametroCPR_TbClassificacaoFinanceiraRecebimentoAMaior]
GO

ALTER TABLE [dbo].[TbParametroCPR] DROP CONSTRAINT [FK_TbParametroCPR_TbClassificacaoFinanceiraJuros]
GO

ALTER TABLE [dbo].[TbParametroCPR] DROP CONSTRAINT [FK_TbParametroCPR_TbClassificacaoFinanceiraMulta]
GO

ALTER TABLE [dbo].[TbObjetoPesquisa] DROP CONSTRAINT [FK_TbObjetoPesquisa_TbFrmTabRel]
GO
*/

DECLARE @Database NVARCHAR(255)   
DECLARE @TableName NVARCHAR(255)  
DECLARE @ConstraintName NVARCHAR(255)  
DECLARE @FullTableName NVARCHAR(255)  
DECLARE @cmd NVARCHAR(MAX)  

DECLARE DatabaseCursor CURSOR READ_ONLY FOR  
SELECT name FROM master.sys.databases   
        WHERE name IN ( DB_NAME() ) -- use this to select specific databases and comment out line above
        AND state = 0               -- database is online
        AND is_in_standby = 0       -- database is not read only for log shipping
        ORDER BY 1  

OPEN DatabaseCursor  

FETCH NEXT FROM DatabaseCursor INTO @Database  
WHILE @@FETCH_STATUS = 0  
BEGIN  
        PRINT 'USE ' + @Database + ';'
--        PRINT 'GO'
        PRINT ''

        DECLARE ConstraintCursor CURSOR READ_ONLY FOR  
        SELECT        Table_Name, Constraint_Name
                FROM Information_Schema.CONSTRAINT_TABLE_USAGE --dbSigaNucleo.
                WHERE 
                    SUBSTRING( Table_Name, 1, 3 )           =  '_Tb'
                    OR SUBSTRING( Table_Name, 1, 3 )        =  'CRM'
                    OR SUBSTRING( Table_Name, 1, 4 )        =  '_CRM'
                    OR SUBSTRING( Table_Name, 1, 18 )       =  '_AlunosParaExcluir'
                    OR SUBSTRING( Table_Name, 1, 7 )        =  '_Ajuste'
                    OR SUBSTRING( Table_Name, 1, 8 )        =  'Migracao'
                    OR SUBSTRING( Table_Name, 1, 9 )        =  '_Migracao'
                    OR SUBSTRING( Table_Name, 1, 3 )        =  '_Vw'
                    OR SUBSTRING( Table_Name, 1, 5 )        =  '_temp'
                    OR SUBSTRING( Table_Name, 1, 4 )        =  'FNC3'
                    OR SUBSTRING( Table_Name, 1, 4 )        =  'FNC2'
                    OR SUBSTRING( Table_Name, 1, 16 )        =  '_ImportacaoNotas'
                    OR SUBSTRING( Table_Name, 1, 5 )        =  'Carne'
                    OR SUBSTRING( Table_Name, 1, 9 )        =  'Matricula'
                    OR SUBSTRING( Table_Name, 1, 9 )        =  '_Desconto'
                    OR SUBSTRING( Table_Name, 1, 20 )        =  'TbNegociacaoItem_CRM'
                    OR SUBSTRING( Table_Name, 1, 11 )        =  '_Integracao'
                    OR SUBSTRING( Table_Name, 1, 10 )        =  'cad_alunos'
                    OR TABLE_NAME = '_GeracaoBoletosRecuperacaoEM3'


                ORDER BY Table_Name DESC                                  


   OPEN ConstraintCursor   

   FETCH NEXT FROM ConstraintCursor INTO @TableName, @ConstraintName   
   WHILE @@FETCH_STATUS = 0   
   BEGIN
      BEGIN TRY   

                SET @cmd = 'ALTER TABLE ' + @Database + '.dbo.' + @TableName + ' DROP CONSTRAINT ' + @ConstraintName + ';'
                PRINT @cmd
--				print 'GO'
               --  EXEC (@cmd) 

      END TRY
      BEGIN CATCH
         PRINT '--- ERRO ---'
         PRINT '***********************************************************************'
         PRINT @cmd
         PRINT ERROR_MESSAGE() 
         PRINT '***********************************************************************'
      END CATCH

      FETCH NEXT FROM ConstraintCursor INTO @TableName, @ConstraintName   
   END   

   CLOSE ConstraintCursor   
   DEALLOCATE ConstraintCursor  

   SET @cmd = 'DECLARE TableCursor CURSOR READ_ONLY FOR SELECT table_name AS TableName, ''['' + table_catalog + ''].['' + table_schema + ''].['' +  
   table_name + '']'' as FulltableName FROM [' + @Database + '].INFORMATION_SCHEMA.TABLES WHERE table_type = ''BASE TABLE'' AND ( SUBSTRING( Table_Name, 1, 3 ) =  ''_Tb'' OR SUBSTRING( Table_Name, 1, 3 ) =  ''CRM'' OR SUBSTRING( Table_Name, 1, 4 ) =  ''_CRM'' OR SUBSTRING( Table_Name, 1, 18 ) =  ''_AlunosParaExcluir'' OR SUBSTRING( Table_Name, 1, 7 ) =  ''_Ajuste'' OR SUBSTRING( Table_Name, 1, 8 ) =  ''Migracao'' OR SUBSTRING( Table_Name, 1, 9 ) =  ''_Migracao'' OR SUBSTRING( Table_Name, 1, 3 ) =  ''_Vw'' OR SUBSTRING( Table_Name, 1, 5 ) =  ''_temp'' OR SUBSTRING( Table_Name, 1, 4 ) =  ''FNC2'' OR SUBSTRING( Table_Name, 1, 4 ) =  ''FNC3'' OR SUBSTRING( Table_Name, 1, 16 ) =  ''_ImportacaoNotas'' OR SUBSTRING( Table_Name, 1, 5 ) =  ''Carne'' OR SUBSTRING( Table_Name, 1, 9 ) =  ''Matricula'' OR SUBSTRING( Table_Name, 1, 9 ) =  ''_Desconto'' OR SUBSTRING( Table_Name, 1, 20 ) =  ''TbNegociacaoItem_CRM'' OR SUBSTRING( Table_Name, 1, 24 ) =  ''TbLancamentoCobranca_CRM'' OR SUBSTRING( Table_Name, 1, 32 ) =  ''TbLancamentoCobrancaDesconto_CRM'' OR SUBSTRING( Table_Name, 1, 20 ) =  ''TbTituloCobranca_CRM'' OR SUBSTRING( Table_Name, 1, 30 ) =  ''TbTituloCobrancaVencimento_CRM''  )'    -- OR SUBSTRING( Table_Name, 1, 30 ) =  ''TbTituloCobrancaVencimento_CRM'' 

   EXEC (@cmd)  

   OPEN TableCursor   

   FETCH NEXT FROM TableCursor INTO @TableName, @FullTableName   
   WHILE @@FETCH_STATUS = 0   
   BEGIN
      BEGIN TRY   

                PRINT ''
        
                SET @cmd = 'SELECT * INTO SQL04_20210214_lixo.dbo.' + @Database + '_' + @TableName + ' FROM ' + @FullTableName
        PRINT @cmd 
      --   EXEC (@cmd) 
        
        SET @cmd = 'DROP TABLE ' + @FullTableName
        PRINT @cmd 

      --   EXEC (@cmd) 

      END TRY
      BEGIN CATCH
         PRINT '--- ERRO ---'
         PRINT '***********************************************************************'
         PRINT @cmd
         PRINT ERROR_MESSAGE() 
         PRINT '***********************************************************************'
      END CATCH

      FETCH NEXT FROM TableCursor INTO @TableName, @FullTableName   
   END   

   CLOSE TableCursor   
   DEALLOCATE TableCursor  

    PRINT ''

   FETCH NEXT FROM DatabaseCursor INTO @Database  
END  
CLOSE DatabaseCursor   
DEALLOCATE DatabaseCursor

