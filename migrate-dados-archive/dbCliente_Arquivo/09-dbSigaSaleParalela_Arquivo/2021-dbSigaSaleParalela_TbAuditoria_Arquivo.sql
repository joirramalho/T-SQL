-- SELECT  COUNT(*) FROM dbSigaSaleParalela_Arquivo.dbo.TbAuditoria;

SELECT	YEAR(DataHORA),   COUNT(*) FROM dbSigaSaleParalela.dbo.TbAuditoria GROUP BY YEAR(DataHORA);

    -- CREATE DATABASE dbSigaSaleParalela_Arquivo

    -- DROP TABLE dbSigaSaleParalela_Arquivo.dbo.TbAuditoria

-- SELECT  TOP 100 * FROM dbSigaSaleParalela_Arquivo02.dbo.TbAuditoria


USE dbSigaSaleParalela_Arquivo;

-- CRIA TABELA DESTINO
	--SELECT * INTO dbSigaSaleParalela_Arquivo.dbo.TbAuditoria
	--    FROM dbSigaSaleParalela.dbo.TbAuditoria WHERE YEAR(DAtaHora) = 2015

	SET ANSI_NULLS OFF
	GO
	
	SET QUOTED_IDENTIFIER ON
	GO
	
	CREATE TABLE [dbo].[TbAuditoria](
		[Tabela] [varchar](50) NOT NULL,
		[IdUsuario] [int] NULL,
		[Operacao] [char](1) NOT NULL,
		[DataHora] [datetime] NOT NULL,
		[ValorChave1] [varchar](50) NULL,
		[ValorChave2] [varchar](50) NULL,
		[ValorChave3] [varchar](50) NULL,
		[ValorChave4] [varchar](50) NULL,
		[ValorChave5] [varchar](50) NULL,
		[DescricaoOperacao] [text] MASKED WITH (FUNCTION = 'default()') NULL,
		[IdAuditoria] [bigint] IDENTITY(1,1) NOT NULL,
	 CONSTRAINT [PK_TbAuditoria] PRIMARY KEY CLUSTERED 
	(
		[IdAuditoria] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
	) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	GO

	
	
 
-- 
	IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name='IX_TbAuditoria_Tabela_DataHora-ValorChave1' AND object_id = OBJECT_ID('dbo.TbAuditoria') )
		BEGIN
			CREATE INDEX [IX_TbAuditoria_Tabela_DataHora-ValorChave1] ON [dbo].[TbAuditoria]	([Tabela],[DataHora])	INCLUDE ([ValorChave1])	WITH (FILLFACTOR=90)

	      	PRINT  ' 		criado IX_TbAuditoria_Tabela_DataHora-ValorChave1'
		END;


	IF NOT EXISTS( SELECT * FROM sys.indexes WHERE name='IX_TbAuditoria_IdUsuario' AND object_id = OBJECT_ID('dbo.TbAuditoria') )
		BEGIN
			CREATE INDEX [IX_TbAuditoria_IdUsuario] ON [dbo].[TbAuditoria]	([IdUsuario])	WITH (FILLFACTOR=90)
	      	
			PRINT  ' 			criado IX_TbAuditoria_IdUsuario'
		END;
	
	

EXEC sp_helpindex 'TbAuditoria'
EXEC sp_help 'TbAuditoria'


SET IDENTITY_INSERT dbSigaSaleParalela_Arquivo.dbo.TbAuditoria ON;

INSERT INTO dbSigaSaleParalela_Arquivo.dbo.TbAuditoria ( Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria )
        SELECT Tabela, IdUsuario, Operacao, DataHora, ValorChave1, ValorChave2, ValorChave3, ValorChave4, ValorChave5, DescricaoOperacao, IdAuditoria
            FROM dbSigaSaleParalela.dbo.TbAuditoria WHERE YEAR(DAtaHora) <= 2021

            
        

SELECT	YEAR(DataHORA),   COUNT(*) FROM dbSigaSaleParalela.dbo.TbAuditoria 			GROUP BY YEAR(DataHORA) ORDER BY YEAR(DataHORA);
SELECT	YEAR(DataHORA),   COUNT(*) FROM dbSigaSaleParalela_Arquivo.dbo.TbAuditoria 	GROUP BY YEAR(DataHORA) ORDER BY YEAR(DataHORA);



DECLARE @BatchSize INT = 5000

WHILE 1 = 1
BEGIN
	DELETE TOP (@BatchSize)
	FROM dbSigaSaleParalela.dbo.TbAuditoria
	where YEAR(DAtaHora) <= 2021
 
	IF @@ROWCOUNT < @BatchSize BREAK
END