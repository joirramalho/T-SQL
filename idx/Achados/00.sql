-- DROP INDEX UNUSEFUL sp_foreachdb

EXEC dbLogMonitor.dbo.sp_foreachdb N'
    USE ?

    SELECT DB_NAME()

    IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbAuditoriaTabelaChave'' AND object_id = OBJECT_ID(''dbo.TbAuditoria'') )
        BEGIN
            DROP INDEX [IX_TbAuditoriaTabelaChave] ON [dbo].[TbAuditoria]
        END

    IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbAuditoriaDataHoraDesc'' AND object_id = OBJECT_ID(''dbo.TbAuditoria'') )
        BEGIN
            DROP INDEX [IX_TbAuditoriaDataHoraDesc] ON [dbo].[TbAuditoria]
        END

    IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbAuditoriaTabelaChave2'' AND object_id = OBJECT_ID(''dbo.TbAuditoria'') )
        BEGIN
            DROP INDEX [IX_TbAuditoriaTabelaChave2] ON [dbo].[TbAuditoria]
        END

    IF EXISTS( SELECT * FROM sys.indexes WHERE name=''IX_TbAuditoriaTabelaDataHora'' AND object_id = OBJECT_ID(''dbo.TbAuditoria'') )
        BEGIN
            DROP INDEX [IX_TbAuditoriaTabelaDataHora] ON [dbo].[TbAuditoria]
        END
'
,@print_command_only = 0 -- Obrigatório Gerar script
,@print_dbname=0
,@state_desc = N'ONLINE'
,@user_only = 1
,@suppress_quotename=1
,@name_pattern='dbSiga';
-- ,@database_list = ''

-- SQL02    dbSigaSandraMaria,dbSigaSaleJuazeiro,dbSigaCoracaoJesus,dbSigaUniversoUno,dbSigaDenizard,dbSigaSaleCarpina,dbSigaSaleDBFortaleza,dbSigaEducativo,dbSigaCEShalom,dbSigaIBV
-- SQL01    dbSigaDourado,dbSigaCJAV,dbSigaColegioBJ,dbSigaMaanaim,dbSigaCordCVP,dbSigaESTMeninoJesus,dbSigaFantastico,dbSigaSantaCatarina,dbSigaCordPCIME,dbSigaCONFHICAFI
-- VPS1     dbSigaSantaAmelia,dbSigaPolichinelo,dbSigaSantaRosa,dbSigaCriarte,dbSigaNevesTaxas,dbSigaCICSerra,dbSigaCentecCursos,dbSigaLiceuAracaju,dbSigaCEPJSS,dbSigaGenteMiuda
-- VPS8     dbSigaImaCorMaria,dbSigaEvolucao,dbSigaMaristella,dbSigaNSGracas,dbSigaCasaEscola,dbSigaPPasso,dbSigaPaivaAndradeCE,dbSigaSaoRaphael,dbSigaNucleo,dbSigaSMICEufrasia