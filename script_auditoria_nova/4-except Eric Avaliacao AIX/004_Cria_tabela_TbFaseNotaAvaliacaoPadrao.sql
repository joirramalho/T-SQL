BEGIN TRAN

	SET ANSI_NULLS ON
	GO

	SET QUOTED_IDENTIFIER ON
	GO

	CREATE TABLE TbFaseNotaAvaliacaoPadrao (
		IdFaseNotaAvaliacaoPadrao  INT IDENTITY (1, 1) NOT NULL,
		IdFaseNotaAvaliacaoModelo INTEGER NOT NULL,
		IdBlocoAvaliacao_Padrao INTEGER NULL,
		StAtivo BIT NOT NULL,
		NomeAvaliacao VARCHAR (256) NOT NULL,
		Conteudo VARCHAR (MAX) NULL,
		ValorMaximo NUMERIC (7, 2) NOT NULL,
		Peso NUMERIC (7, 2) NOT NULL,
		StSubstituirMenorNota BIT NOT NULL,
		RegraCalculoAusenciaDeNota VARCHAR (30) NULL,
		StEntregaOnline BIT NOT NULL,
		ExtensaoAceita VARCHAR (30) NOT NULL,

		CONSTRAINT [PK_TbFaseNotaAvaliacaoPadrao] PRIMARY KEY (IdFaseNotaAvaliacaoPadrao),
		CONSTRAINT [FK_TbFaseNotaAvaliacaoPadrao_TbFaseNotaAvaliacaoModelo] FOREIGN KEY (IdFaseNotaAvaliacaoModelo) REFERENCES TbFaseNotaAvaliacaoModelo (IdFaseNotaAvaliacaoModelo),
		CONSTRAINT [FK_TbFaseNotaAvaliacaoPadrao_TbBlocoAvaliacao_Padrao] FOREIGN KEY (IdBlocoAvaliacao_Padrao) REFERENCES TbBlocoAvaliacao_Padrao (IdBlocoAvaliacao_Padrao),
		CONSTRAINT [CK_TbFaseNotaAvaliacaoPadrao_RegraCalculoAusenciaDeNota] CHECK (RegraCalculoAusenciaDeNota IN ('ImpedirConfirmacao', 'ConsiderarComoZero', 'DispensarNoCalculo')),
	)
	GO

ROLLBACK