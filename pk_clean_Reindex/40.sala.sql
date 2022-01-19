USE dbSigaMariaStela;

-- TbSala
ALTER TABLE [dbo].[TbAtividadeDistribuicaoAluno] DROP CONSTRAINT [FK_TbAtividadeDistribuicaoAluno_TbSala]
GO
ALTER TABLE [dbo].[TbAtividadeSala] DROP CONSTRAINT [FK_TbAtividadeSala_TbSala]
GO
ALTER TABLE [dbo].[TbDisponibilidade] DROP CONSTRAINT [FK_TbDisponibilidade_TbSala]
GO

-- 20/jan
IF OBJECT_ID('dbo.FK_TbFreqQuadroHorario_TbSala') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbFreqQuadroHorario] DROP CONSTRAINT [FK_TbFreqQuadroHorario_TbSala]
END

ALTER TABLE [dbo].[TbGradeHorario] DROP CONSTRAINT [FK_TbGradeHorario_TbSala]
GO
ALTER TABLE [dbo].[TbTurma] DROP CONSTRAINT [FK_TbTurma_TbSala]
GO

ALTER TABLE [dbo].[TbSala] DROP CONSTRAINT [PK_TbSala]
GO


ALTER TABLE [dbo].[TbSala] ADD  CONSTRAINT [PK_TbSala] PRIMARY KEY CLUSTERED 
(
        [IdSala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO

                                                                                                                                                                                                                                                                 
ALTER TABLE [dbo].[TbAtividadeDistribuicaoAluno] WITH CHECK ADD  CONSTRAINT [FK_TbAtividadeDistribuicaoAluno_TbSala] FOREIGN KEY([IdSala]) REFERENCES [dbo].[TbSala] ([IdSala])                                                                                  
GO
ALTER TABLE [dbo].[TbAtividadeDistribuicaoAluno] CHECK CONSTRAINT [FK_TbAtividadeDistribuicaoAluno_TbSala]
GO

ALTER TABLE [dbo].[TbAtividadeSala] WITH CHECK ADD  CONSTRAINT [FK_TbAtividadeSala_TbSala] FOREIGN KEY([IdSala]) REFERENCES [dbo].[TbSala] ([IdSala])                                                                                                           
GO
ALTER TABLE [dbo].[TbAtividadeSala] CHECK CONSTRAINT [FK_TbAtividadeSala_TbSala]
GO

ALTER TABLE [dbo].[TbDisponibilidade] WITH CHECK ADD  CONSTRAINT [FK_TbDisponibilidade_TbSala] FOREIGN KEY([IdSala]) REFERENCES [dbo].[TbSala] ([IdSala])                                                                                                        
GO
ALTER TABLE [dbo].[TbDisponibilidade] CHECK CONSTRAINT [FK_TbDisponibilidade_TbSala]
GO

IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbFreqQuadroHorario'	AND COLUMN_NAME = 'IdSala' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbSala'					AND COLUMN_NAME = 'IdSala' )
	BEGIN
		ALTER TABLE [dbo].[TbFreqQuadroHorario] WITH CHECK ADD  CONSTRAINT [FK_TbFreqQuadroHorario_TbSala] FOREIGN KEY([IdSala]) REFERENCES [dbo].[TbSala] ([IdSala])                                                                                                    

		ALTER TABLE [dbo].[TbFreqQuadroHorario] CHECK CONSTRAINT [FK_TbFreqQuadroHorario_TbSala]
	END

ALTER TABLE [dbo].[TbGradeHorario] WITH CHECK ADD  CONSTRAINT [FK_TbGradeHorario_TbSala] FOREIGN KEY([IdSala]) REFERENCES [dbo].[TbSala] ([IdSala])                                                                                                              
GO
ALTER TABLE [dbo].[TbGradeHorario] CHECK CONSTRAINT [FK_TbGradeHorario_TbSala]
GO

ALTER TABLE [dbo].[TbTurma] WITH CHECK ADD  CONSTRAINT [FK_TbTurma_TbSala] FOREIGN KEY([IdSala]) REFERENCES [dbo].[TbSala] ([IdSala])                                                                                                                           
GO
ALTER TABLE [dbo].[TbTurma] CHECK CONSTRAINT [FK_TbTurma_TbSala]
GO
