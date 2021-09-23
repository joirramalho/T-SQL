20set21 - DROP INDEX de TbSituacaoAlunoDisciplina que não necessários. Joir.


IF EXISTS( SELECT * FROM sys.indexes WHERE name='IX_TbSituacaoAlunoDisciplina_IdFaseNotaAtual' AND object_id = OBJECT_ID('dbo.TbSituacaoAlunoDisciplina') )
   DROP INDEX [IX_TbSituacaoAlunoDisciplina_IdFaseNotaAtual] ON [dbo].[TbSituacaoAlunoDisciplina]

IF EXISTS( SELECT * FROM sys.indexes WHERE name='UK_TbSituacaoAlunoDisciplina_IdSituacaoAlunoDisciplina' AND object_id = OBJECT_ID('dbo.TbSituacaoAlunoDisciplina') )
   DROP INDEX [UK_TbSituacaoAlunoDisciplina_IdSituacaoAlunoDisciplina] ON [dbo].[TbSituacaoAlunoDisciplina]
