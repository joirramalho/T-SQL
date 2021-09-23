IF EXISTS( SELECT * FROM sys.indexes WHERE name='IX_TbDiario_TurmaDisciplina' AND object_id = OBJECT_ID('dbo.TbDiario') )
    BEGIN
        DROP INDEX [IX_TbDiario_TurmaDisciplina] ON [dbo].[TbDiario]        
    END
