-- MOVER das TABELAS _Tb para Banco lixo

-- USE dbSigaalternativoPE;


declare @vname sysname
  declare @tmpTamTabela table (
    name       sysname     null
  , rows       int         null
  , reserved   varchar(25) null
  , data       varchar(25) null
  , index_size varchar(25) null
  , unused     varchar(25) null )

 declare cp1 cursor local fast_forward read_only for
    select name
      from sysobjects
    --  where type = 'U' --AND name  LIKE '%_PlanoCon'
     where type = 'U' AND name NOT LIKE 'Tb%'
     order by name

 open cp1

 while 1 = 1
  begin
    fetch next from cp1 into @vname
    if @@fetch_status <> 0 break

   insert into @tmpTamTabela (name, rows, reserved
                             , data, index_size, unused)
      exec sp_spaceused @vname
 end
  close cp1
  deallocate cp1

 select 
      'SELECT * INTO SQL08_20210726_lixo.dbo.' + DB_NAME() + '_' + name + ' FROM ' + DB_NAME() + '.dbo.' + name
      ,'DROP TABLE ' + DB_NAME() + '.dbo.' + name
       , rows as 'Linhas'
       , convert(int, replace(reserved, ' KB','')) as 'Tamanho total KB'
       , convert(int, replace(data, ' KB','')) as 'Dados'
       , convert(int, replace(index_size, ' KB',''))as 'IndexKB'
       , convert(int, replace(unused, ' KB',''))as 'EspacoNaoUsadoKB'
    from @tmpTamTabela
   order by 3 desc


