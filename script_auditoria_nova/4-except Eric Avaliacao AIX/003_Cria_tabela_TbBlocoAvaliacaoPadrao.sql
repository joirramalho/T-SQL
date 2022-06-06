BEGIN TRAN

	SET ANSI_NULLS ON
	GO

	SET QUOTED_IDENTIFIER ON
	GO

	CREATE TABLE TbBlocoAvaliacaoPadrao (
		IdBlocoAvaliacaoPadrao  INT IDENTITY (1, 1) NOT NULL,
		Nome VARCHAR (256) NOT NULL,
		ValorMaximo NUMERIC (7, 2) NOT NULL,

		CONSTRAINT [PK_TbBlocoAvaliacaoPadrao] PRIMARY KEY (IdBlocoAvaliacaoPadrao),
	)
	GO
COMMIT
ROLLBACK