-- USE dbSigaSaleINSA;
-- USE dbSigaNSLourdesGravata;
-- USE dbSigaAuxilRecife;


-- TbOptProva
ALTER TABLE [dbo].[TbOptProvaAlunoTurma] DROP CONSTRAINT [FK_TbOptProvaAlunoTurma_TbOptProva]
GO

IF OBJECT_ID('dbo.FK__TbOptProv__IdPro__043C47BD') IS NOT NULL  
BEGIN
    ALTER TABLE [dbo].[TbOptProvaGabarito] DROP CONSTRAINT [FK__TbOptProv__IdPro__043C47BD]
END

ALTER TABLE [dbo].[TbOptSimuladoEnem] DROP CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaCHumanas]
GO
ALTER TABLE [dbo].[TbOptSimuladoEnem] DROP CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaCBiomedicas]
GO
ALTER TABLE [dbo].[TbOptSimuladoEnem] DROP CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaLinguagens]
GO
ALTER TABLE [dbo].[TbOptSimuladoEnem] DROP CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaMatematica]
GO


-- TbOptProva - DRIO    
    
    ALTER TABLE [dbo].[TbOptProva] DROP CONSTRAINT [PK_TbOptProva]
    GO



    ALTER TABLE [dbo].[TbOptProva] ADD  CONSTRAINT [PK_TbOptProva] PRIMARY KEY CLUSTERED 
    (
            [IdProva] ASC
    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
    GO


ALTER TABLE [dbo].[TbOptProvaGabarito] WITH CHECK ADD  CONSTRAINT [FK__TbOptProv__IdPro__043C47BD] FOREIGN KEY([IdProva]) REFERENCES [dbo].[TbOptProva] ([IdProva])                                                                                              
GO
ALTER TABLE [dbo].[TbOptProvaGabarito] CHECK CONSTRAINT [FK__TbOptProv__IdPro__043C47BD]
GO

                                                                                                                                                                                                                                                                 
ALTER TABLE [dbo].[TbOptProvaAlunoTurma] WITH CHECK ADD  CONSTRAINT [FK_TbOptProvaAlunoTurma_TbOptProva] FOREIGN KEY([IdProva]) REFERENCES [dbo].[TbOptProva] ([IdProva])                                                                                        
GO
ALTER TABLE [dbo].[TbOptProvaAlunoTurma] CHECK CONSTRAINT [FK_TbOptProvaAlunoTurma_TbOptProva]
GO

ALTER TABLE [dbo].[TbOptSimuladoEnem] WITH CHECK ADD  CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaCHumanas] FOREIGN KEY([IdProvaCHumanas]) REFERENCES [dbo].[TbOptProva] ([IdProva])                                                                      
GO
ALTER TABLE [dbo].[TbOptSimuladoEnem] CHECK CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaCHumanas]
GO

ALTER TABLE [dbo].[TbOptSimuladoEnem] WITH CHECK ADD  CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaCBiomedicas] FOREIGN KEY([IdProvaCBiomedicas]) REFERENCES [dbo].[TbOptProva] ([IdProva])                                                                
GO
ALTER TABLE [dbo].[TbOptSimuladoEnem] CHECK CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaCBiomedicas]
GO

ALTER TABLE [dbo].[TbOptSimuladoEnem] WITH CHECK ADD  CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaLinguagens] FOREIGN KEY([IdProvaLinguagens]) REFERENCES [dbo].[TbOptProva] ([IdProva])                                                                  
GO
ALTER TABLE [dbo].[TbOptSimuladoEnem] CHECK CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaLinguagens]
GO

ALTER TABLE [dbo].[TbOptSimuladoEnem] WITH CHECK ADD  CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaMatematica] FOREIGN KEY([IdProvaMatematica]) REFERENCES [dbo].[TbOptProva] ([IdProva])                                                                  
GO
ALTER TABLE [dbo].[TbOptSimuladoEnem] CHECK CONSTRAINT [FK_TbOptSimuladoEnem_TbOptProva_IdProvaMatematica]
GO