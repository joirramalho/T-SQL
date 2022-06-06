BEGIN TRAN

	SET ANSI_NULLS ON
	GO

	SET QUOTED_IDENTIFIER ON
	GO

	CREATE TABLE TbFaseNotaAvaliacaoModelo (
		IdFaseNotaAvaliacaoModelo  INT IDENTITY (1, 1) NOT NULL,
		Nome VARCHAR (256) NOT NULL,
		StAtivo BIT NOT NULL
			CONSTRAINT [DF_TbFaseNotaAvaliacaoModelo_StAtivo] DEFAULT 1,

		CONSTRAINT [PK_TbFaseNotaAvaliacaoModelo] PRIMARY KEY (IdFaseNotaAvaliacaoModelo),
	)
	GO

ROLLBACK