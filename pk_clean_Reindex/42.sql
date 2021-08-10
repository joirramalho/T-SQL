USE dbSigaSaleFalcao;
-- USE dbSigaDCCJR;

SELECT DB_NAME()



-- TbTurmaProfessor
ALTER TABLE [dbo].[TbTurmaProfessor] DROP CONSTRAINT [PK_TbTurmaProfessor]
GO


ALTER TABLE [dbo].[TbTurmaProfessor] ADD  CONSTRAINT [PK_TbTurmaProfessor] PRIMARY KEY CLUSTERED 
(
        [IdTurma] ASC,
        [IdDisciplina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO





-- TbUsuarioGrupo
ALTER TABLE [dbo].[TbUsuarioGrupo] DROP CONSTRAINT [PK_TbUsuarioGrupo]
GO


ALTER TABLE [dbo].[TbUsuarioGrupo] ADD  CONSTRAINT [PK_TbUsuarioGrupo] PRIMARY KEY CLUSTERED 
(
        [IdUsuario] ASC,
        [IdGrupo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO







-- TbVerificacaoMatricula
IF OBJECT_ID('dbo.FK_TbCurso_TbVerificacaoMatricula') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbCurso] DROP CONSTRAINT [FK_TbCurso_TbVerificacaoMatricula]
END

-- 20/jan
IF OBJECT_ID('dbo.PK_TbVerificacaoMatricula') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbVerificacaoMatricula] DROP CONSTRAINT [PK_TbVerificacaoMatricula]
END

IF OBJECT_ID('dbo.PK_TbVerificacaoMatricula_IdVerificacaoMatricula') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbVerificacaoMatricula] DROP CONSTRAINT [PK_TbVerificacaoMatricula_IdVerificacaoMatricula]
END

IF OBJECT_ID('dbo.TbVerificacaoMatricula') IS NOT NULL
BEGIN
	ALTER TABLE [dbo].[TbVerificacaoMatricula] ADD  CONSTRAINT [PK_TbVerificacaoMatricula] PRIMARY KEY CLUSTERED 
	(
			[IdVerificacaoMatricula] ASC
	)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
END



IF	EXISTS		( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbCurso'				AND COLUMN_NAME = 'IdVerificacaoMatricula' )
	AND	EXISTS	( SELECT *	FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TbVerificacaoMatricula'	AND COLUMN_NAME = 'IdVerificacaoMatricula' )
	BEGIN
		ALTER TABLE [dbo].[TbCurso] WITH CHECK ADD  CONSTRAINT [FK_TbCurso_TbVerificacaoMatricula] FOREIGN KEY([IdVerificacaoMatricula]) REFERENCES [dbo].[TbVerificacaoMatricula] ([IdVerificacaoMatricula])                                                            

		ALTER TABLE [dbo].[TbCurso] CHECK CONSTRAINT [FK_TbCurso_TbVerificacaoMatricula]
	END
