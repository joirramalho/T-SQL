USE dbSigaSaleJuvenal;
-- USE dbSigaNSLourdesGravata;
-- USE dbSigaAuxilRecife;




IF OBJECT_ID('dbo.[FK_TbParametroInternet_InscrEvento_IdSituacaoAlunoTurmaParticipante]') IS NOT NULL 
	BEGIN
		ALTER TABLE dbo.[TbParametroInternet] DROP CONSTRAINT FK_TbParametroInternet_InscrEvento_IdSituacaoAlunoTurmaParticipante
	END


ALTER TABLE [dbo].[TbAlunoTurma] DROP CONSTRAINT [FK_TbAlunoTurma_TbSituacaoAlunoTurma]
GO
ALTER TABLE [dbo].[TbParametroInternet] DROP CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdSituacaoAlunoTurmaComVaga]
GO
ALTER TABLE [dbo].[TbParametroInternet] DROP CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdSituacaoAlunoTurmaSemVaga]
GO
ALTER TABLE [dbo].[TbParametroInternet] DROP CONSTRAINT [FK_TbParametroInternet_RMOnLine_TbSituacaoAlunoTurma]
GO
ALTER TABLE [dbo].[TbParametroInternet] DROP CONSTRAINT [FK_TbParametroInternet_FInscr_TbSituacaoAlunoTurma]
GO
ALTER TABLE [dbo].[TbSerie] DROP CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma4]
GO
ALTER TABLE [dbo].[TbSerie] DROP CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma3]
GO
ALTER TABLE [dbo].[TbSerie] DROP CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma1]
GO
ALTER TABLE [dbo].[TbSerie] DROP CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma2]
GO
ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] DROP CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSituacaoAlunoTurmaDestino]
GO
ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] DROP CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSituacaoAlunoTurmaOrigem]
GO
ALTER TABLE [dbo].[TbTurma] DROP CONSTRAINT [FK_TbTurma_TbSituacaoAlunoTurma]
GO

ALTER TABLE [dbo].[TbParametroAssinaturaEletronica] DROP CONSTRAINT [FK_TbModeloContrato_TbSituacaoAlunoTurma]
GO



ALTER TABLE [dbo].[TbSituacaoAlunoTurma] DROP CONSTRAINT [PK_TbSituacaoAlunoTurma]
GO



-- TbSituacaoAlunoTurma	-  2a.Parte
    
    ALTER TABLE [dbo].[TbSituacaoAlunoTurma] ADD  CONSTRAINT [PK_TbSituacaoAlunoTurma] PRIMARY KEY CLUSTERED 
	(
			[IdSituacaoAlunoTurma] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
	GO


    

ALTER TABLE [dbo].[TbParametroAssinaturaEletronica]  WITH CHECK ADD  CONSTRAINT [FK_TbModeloContrato_TbSituacaoAlunoTurma] FOREIGN KEY([IdSituacaoAlunoTurmaDestino])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbParametroAssinaturaEletronica] CHECK CONSTRAINT [FK_TbModeloContrato_TbSituacaoAlunoTurma]
GO


ALTER TABLE [dbo].[TbAlunoTurma]  WITH CHECK ADD  CONSTRAINT [FK_TbAlunoTurma_TbSituacaoAlunoTurma] FOREIGN KEY([IdSituacaoAlunoTurma])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbAlunoTurma] CHECK CONSTRAINT [FK_TbAlunoTurma_TbSituacaoAlunoTurma]
GO


ALTER TABLE [dbo].[TbParametroInternet]  WITH CHECK ADD  CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdSituacaoAlunoTurmaComVaga] FOREIGN KEY([InscrTurma_IdSituacaoAlunoTurmaComVaga])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbParametroInternet] CHECK CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdSituacaoAlunoTurmaComVaga]
GO


ALTER TABLE [dbo].[TbParametroInternet]  WITH CHECK ADD  CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdSituacaoAlunoTurmaSemVaga] FOREIGN KEY([InscrTurma_IdSituacaoAlunoTurmaSemVaga])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbParametroInternet] CHECK CONSTRAINT [FK_TbParametroInternet_InscrTurma_IdSituacaoAlunoTurmaSemVaga]
GO

ALTER TABLE [dbo].[TbParametroInternet]  WITH CHECK ADD  CONSTRAINT [FK_TbParametroInternet_RMOnLine_TbSituacaoAlunoTurma] FOREIGN KEY([RMOnLine_IdSituacaoAlunoTurma])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbParametroInternet] CHECK CONSTRAINT [FK_TbParametroInternet_RMOnLine_TbSituacaoAlunoTurma]
GO


ALTER TABLE [dbo].[TbParametroInternet]  WITH CHECK ADD  CONSTRAINT [FK_TbParametroInternet_FInscr_TbSituacaoAlunoTurma] FOREIGN KEY([FInscr_IdSituacaoAlunoTurma])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbParametroInternet] CHECK CONSTRAINT [FK_TbParametroInternet_FInscr_TbSituacaoAlunoTurma]
GO


ALTER TABLE [dbo].[TbParametroInternet]  WITH CHECK ADD  CONSTRAINT [FK_TbParametroInternet_InscrEvento_IdSituacaoAlunoTurmaParticipante] FOREIGN KEY([InscrEvento_IdSituacaoAlunoTurmaParticipante])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbParametroInternet] CHECK CONSTRAINT [FK_TbParametroInternet_InscrEvento_IdSituacaoAlunoTurmaParticipante]
GO


ALTER TABLE [dbo].[TbTurma]  WITH CHECK ADD  CONSTRAINT [FK_TbTurma_TbSituacaoAlunoTurma] FOREIGN KEY([FInscr_IdSituacaoAlunoTurma])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbTurma] CHECK CONSTRAINT [FK_TbTurma_TbSituacaoAlunoTurma]
GO


ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento]  WITH CHECK ADD  CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSituacaoAlunoTurmaOrigem] FOREIGN KEY([IdSituacaoAlunoTurmaOrigem])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] CHECK CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSituacaoAlunoTurmaOrigem]
GO


ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento]  WITH CHECK ADD  CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSituacaoAlunoTurmaDestino] FOREIGN KEY([IdSituacaoAlunoTurmaDestino])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbSituacaoAlunoTurmaPagamento] CHECK CONSTRAINT [FK_TbSituacaoAlunoTurmaPagamento_TbSituacaoAlunoTurmaDestino]
GO


ALTER TABLE [dbo].[TbSerie]  WITH CHECK ADD  CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma2] FOREIGN KEY([IdSituacaoAlunoTurmaAprovado])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbSerie] CHECK CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma2]
GO


ALTER TABLE [dbo].[TbSerie]  WITH CHECK ADD  CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma1] FOREIGN KEY([IdSituacaoAlunoTurmaCursando])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbSerie] CHECK CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma1]
GO

ALTER TABLE [dbo].[TbSerie]  WITH CHECK ADD  CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma4] FOREIGN KEY([IdSituacaoAlunoTurmaReprovado])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbSerie] CHECK CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma4]
GO

ALTER TABLE [dbo].[TbSerie]  WITH CHECK ADD  CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma3] FOREIGN KEY([IdSituacaoAlunoTurmaPParcial])
REFERENCES [dbo].[TbSituacaoAlunoTurma] ([IdSituacaoAlunoTurma])
GO

ALTER TABLE [dbo].[TbSerie] CHECK CONSTRAINT [FK_TbSerie_TbSituacaoAlunoTurma3]
GO