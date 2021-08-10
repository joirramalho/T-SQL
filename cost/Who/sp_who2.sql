-- 12mai21

-- EXEC dbLogMonitor.dbo.sp_Where

  DECLARE @Table TABLE( SPID INT, Status VARCHAR(MAX), LOGIN VARCHAR(MAX), HostName VARCHAR(MAX), BlkBy VARCHAR(MAX), DBName VARCHAR(MAX), Command VARCHAR(MAX), CPUTime INT, DiskIO INT, LastBatch VARCHAR(MAX), ProgramName VARCHAR(MAX), SPID_1 INT, REQUESTID INT )

  -- SET NOCOUNT ON

  INSERT INTO @Table EXEC sp_who2

-- killall example.sh

-- USE dbSigaFACHO; 
-- KILL 87    
-- create procedure sys.sp_procedure_params_rowset(    @procedure_name     sysname,    @group_number       int = 1,    @procedure_schema   sysname = null,    @parameter_name     sysname = null)as    select        PROCEDURE_CATALOG           = s_pp.PROCEDURE_CATALOG,        PROCEDURE_SCHEMA            = s_pp.PROCEDURE_SCHEMA,        PROCEDURE_NAME              = convert(nvarchar(134),                                                s_pp.PROCEDURE_NAME +';'+                                                ltrim(str(coalesce(s_pp.procedure_number,@group_number,1), 5))),        PARAMETER_NAME              = s_pp.PARAMETER_NAME,        ORDINAL_POSITION            = s_pp.ORDINAL_POSITION,        PARAMETER_TYPE              = s_pp.PARAMETER_TYPE,        PARAMETER_HASDEFAULT        = s_pp.PARAMETER_HASDEFAULT,        PARAMETER_DEFAULT           = s_pp.PARAMETER_DEFAULT,        IS_NULLABLE                 = s_pp.IS_NULLABLE,        DATA_TYPE                   = s_pp.DATA_TYPE_28, -- for backward compatibility        CHARACTER_MAXIMUM_LENGTH    = s_pp.CHARACTER_MAXIMUM_LENGTH_28, -- for backward compatibility        CHARACTER_OCTET_LENGTH      = s_pp.CHARACTER_OCTET_LENGTH_28, -- for backward compatibility        NUMERIC_PRECISION           = s_pp.NUMERIC_PRECISION,        NUMERIC_SCALE               = s_pp.NUMERIC_SCALE,        DESCRIPTION                 = s_pp.DESCRIPTION,        TYPE_NAME                   = s_pp.TYPE_NAME_28, -- for backward compatibility        LOCAL_TYPE_NAME             = s_pp.LOCAL_TYPE_NAME_28 -- for backward compatibility    from        sys.spt_procedure_params_view s_pp    where        (@procedure_schema is null and s_pp.PROCEDURE_NAME = @procedure_name)        and        (            @group_number is null or            (s_pp.procedure_number = @group_number and s_pp.type in ('P', 'PC')) or            (s_pp.procedure_number = 0             and s_pp.type in ('FN', 'TF', 'IF'))        ) and        (@parameter_name is null or @parameter_name = s_pp.PARAMETER_NAME)    UNION ALL    select        PROCEDURE_CATALOG           = s_pp.PROCEDURE_CATALOG,        PROCEDURE_SCHEMA            = s_pp.PROCEDURE_SCHEMA,        PROCEDURE_NAME              = convert(nvarchar(134),                                                s_pp.PROCEDURE_NAME +';'+                                                ltrim(str(coalesce(s_pp.procedure_number,@group_number,1), 5))),        PARAMETER_NAME              = s_pp.PARAMETER_NAME,        ORDINAL_POSITION            = s_pp.ORDINAL_POSITION,        PARAMETER_TYPE              = s_pp.PARAMETER_TYPE,        PARAMETER_HASDEFAULT        = s_pp.PARAMETER_HASDEFAULT,        PARAMETER_DEFAULT           = s_pp.PARAMETER_DEFAULT,        IS_NULLABLE                 = s_pp.IS_NULLABLE,        DATA_TYPE                   = s_pp.DATA_TYPE_28, -- for backward compatibility        CHARACTER_MAXIMUM_LENGTH    = s_pp.CHARACTER_MAXIMUM_LENGTH_28, -- for backward compatibility        CHARACTER_OCTET_LENGTH      = s_pp.CHARACTER_OCTET_LENGTH_28, -- for backward compatibility        NUMERIC_PRECISION           = s_pp.NUMERIC_PRECISION,        NUMERIC_SCALE               = s_pp.NUMERIC_SCALE,        DESCRIPTION                 = s_pp.DESCRIPTION,        TYPE_NAME                   = s_pp.TYPE_NAME_28, -- for backward compatibility        LOCAL_TYPE_NAME             = s_pp.LOCAL_TYPE_NAME_28 -- for backward compatibility    from        sys.spt_procedure_params_view s_pp    where        (@procedure_schema is not null and s_pp.object_id = object_id(quotename(@procedure_schema) + '.' + quotename(@procedure_name)))        and        (            @group_number is null or            (s_pp.procedure_number = @group_number and s_pp.type in ('P', 'PC')) or            (s_pp.procedure_number = 0             and s_pp.type in ('FN', 'TF', 'IF'))        ) and        (@parameter_name is null or @parameter_name = s_pp.PARAMETER_NAME)    UNION ALL    select        PROCEDURE_CATALOG           = s_pprv.PROCEDURE_CATALOG,        PROCEDURE_SCHEMA            = s_pprv.PROCEDURE_SCHEMA,        PROCEDURE_NAME              = convert(nvarchar(134),                                                s_pprv.PROCEDURE_NAME +';'+                                                ltrim(str(coalesce(s_pprv.procedure_number,@group_number,1), 5))),        PARAMETER_NAME              = s_pprv.PARAMETER_NAME,        ORDINAL_POSITION            = s_pprv.ORDINAL_POSITION,        PARAMETER_TYPE              = s_pprv.PARAMETER_TYPE,        PARAMETER_HASDEFAULT        = s_pprv.PARAMETER_HASDEFAULT,        PARAMETER_DEFAULT           = s_pprv.PARAMETER_DEFAULT,        IS_NULLABLE                 = s_pprv.IS_NULLABLE,        DATA_TYPE                   = s_pprv.DATA_TYPE, -- Return value is either int or empty.        CHARACTER_MAXIMUM_LENGTH    = s_pprv.CHARACTER_MAXIMUM_LENGTH,        CHARACTER_OCTET_LENGTH      = s_pprv.CHARACTER_OCTET_LENGTH,        NUMERIC_PRECISION           = s_pprv.NUMERIC_PRECISION,        NUMERIC_SCALE               = s_pprv.NUMERIC_SCALE,        DESCRIPTION                 = s_pprv.DESCRIPTION,        TYPE_NAME                   = s_pprv.TYPE_NAME,        LOCAL_TYPE_NAME             = s_pprv.LOCAL_TYPE_NAME    from        sys.spt_procedure_params_return_values_view s_pprv    where        (@procedure_schema is null and s_pprv.PROCEDURE_NAME = @procedure_name)        and        (            @parameter_name is null or            (@parameter_name = '@RETURN_VALUE' and s_pprv.type in ('P', 'PC')) or            (@parameter_name = '@TABLE_RETURN_VALUE' and s_pprv.type <> 'P' and s_pprv.type <> 'PC')        )        and        (            @group_number is null or            (s_pprv.procedure_number = 0             and s_pprv.type in ('FN', 'TF', 'IF')) or            (s_pprv.procedure_number = @group_number and s_pprv.type in ('P', 'PC'))        )    UNION ALL    select        PROCEDURE_CATALOG           = s_pprv.PROCEDURE_CATALOG,        PROCEDURE_SCHEMA            = s_pprv.PROCEDURE_SCHEMA,        PROCEDURE_NAME              = convert(nvarchar(134),                                                s_pprv.PROCEDURE_NAME +';'+                                                ltrim(str(coalesce(s_pprv.procedure_number,@group_number,1), 5))),        PARAMETER_NAME              = s_pprv.PARAMETER_NAME,        ORDINAL_POSITION            = s_pprv.ORDINAL_POSITION,        PARAMETER_TYPE              = s_pprv.PARAMETER_TYPE,        PARAMETER_HASDEFAULT        = s_pprv.PARAMETER_HASDEFAULT,        PARAMETER_DEFAULT           = s_pprv.PARAMETER_DEFAULT,        IS_NULLABLE                 = s_pprv.IS_NULLABLE,        DATA_TYPE                   = s_pprv.DATA_TYPE, -- Return value is either int or empty.        CHARACTER_MAXIMUM_LENGTH    = s_pprv.CHARACTER_MAXIMUM_LENGTH,        CHARACTER_OCTET_LENGTH      = s_pprv.CHARACTER_OCTET_LENGTH,        NUMERIC_PRECISION           = s_pprv.NUMERIC_PRECISION,        NUMERIC_SCALE               = s_pprv.NUMERIC_SCALE,        DESCRIPTION                 = s_pprv.DESCRIPTION,        TYPE_NAME                   = s_pprv.TYPE_NAME,        LOCAL_TYPE_NAME             = s_pprv.LOCAL_TYPE_NAME    from        sys.spt_procedure_params_return_values_view s_pprv    where        (@procedure_schema is not null and s_pprv.object_id = object_id(quotename(@procedure_schema) + '.' + quotename(@procedure_name)))        and        (            @parameter_name is null or            (@parameter_name = '@RETURN_VALUE' and s_pprv.type in ('P', 'PC')) or            (@parameter_name = '@TABLE_RETURN_VALUE' and s_pprv.type <> 'P' and s_pprv.type <> 'PC')        )        and        (            @group_number is null or            (s_pprv.procedure_number = 0             and s_pprv.type in ('FN', 'TF', 'IF')) or            (s_pprv.procedure_number = @group_number and s_pprv.type in ('P', 'PC'))        )    order by 2, 3, 5    option (OPTIMIZE CORRELATED UNION ALL)


  -- SELECT name, state_desc, recovery_model_desc, is_read_only, user_access_desc, create_date FROM sys.databases d  WHERE NAME = DB_NAME()
  
  SELECT  LastBatch, DBName, 'KILL '  + LEFT( CAST( SPID as CHAR), 5) AS SPID, BlkBy, ProgramName, [LOGIN], HostName, [Status], Command --, CPUTime, DiskIO
  FROM    @Table
  WHERE 1=1   AND SPID > 50 AND [LOGIN] NOT IN ('sa', 'NT AUTHORITY\NETWORK SERVICE') -- , 'sigainternet'
      -- AND [LOGIN] LIKE '%userActiveCrmLeitura'      
      -- AND ( [LOGIN] LIKE 'userNeves' OR [LOGIN] LIKE 'service.account' )
      
      AND DBName IN ('dbSigaFACHO','dbSigaCEEsCrianca') --DB_NAME()


-- SET DATEFORMAT DMYEXEC dbSigaCEEsCrianca.dbo.SpFreqEfetuarMarcacao2 '11/06/2021 08:27:50','E',2224,NULL,'ENTRADA LIBERADA';


    --  AND ProgramName NOT IN ( 'ADO_Messenger_ADO(1.048.)             ' ) 
    --  AND HostName LIKE '%Mac%'
  -- ORDER BY    LastBatch DESC -- blkby DESC 
  -- ORDER BY    LastBatch DESC  -- LOGIN,  blkby DESC 
  ORDER BY  LastBatch DESC -- DBName, HostName      DESC -- blkby DESC 


  -- SELECT TOP (3) DB_NAME(), [Tabela],[DataHora] AS WEB, [DescricaoOperacao]
  -- FROM [dbo].[TbAuditoria]
  -- order by Datahora DESC;


--  SELECT TOP (3) [IdLogWeb],[SessionId],[DataHora] AS LogWEB,[IPHost],[Arquivo],[IdUsuario],[TitpoUsuario],[Acao],[ParametroStr]
--   FROM [dbo].[TbLogWeb]
--   order by DataHora DESC 


-- SELECT TOP (3) *  FROM [dbo].[TbLogMobile]  order by IdLogMobile DESC 




-- sp_helpdb dbSigaMaristella_Arquivo01_full.bak;

-- RESTORE FILELISTONLY	FROM DISK = '/TEMP/dbActiveBibliotecaCOC_full.bak'


-- KILL 419  
