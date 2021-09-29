--28set21

	--Script to generate the creation script of all foreign key constraints
	--www.percyreyes.com

	--USE db;

declare @ForeignKeyID int
declare @ForeignKeyName varchar(4000)
declare @ParentTableName varchar(4000)
declare @ParentColumn varchar(4000)
declare @ReferencedTable varchar(4000)
declare @ReferencedColumn varchar(4000)
declare @StrParentColumn varchar(max)
declare @StrReferencedColumn varchar(max)
declare @ParentTableSchema varchar(4000)
declare @ReferencedTableSchema varchar(4000)
declare @TSQLCreationFK varchar(max)

set nocount on


CREATE TABLE #TbFK ( TSQLCreationFK varchar(max) )


--Written by Percy Reyes www.percyreyes.com
declare CursorFK cursor for select object_id--, name, object_name( parent_object_id) 
from sys.foreign_keys
open CursorFK
fetch next from CursorFK into @ForeignKeyID
while (@@FETCH_STATUS=0)
begin
 set @StrParentColumn=''
 set @StrReferencedColumn=''
 declare CursorFKDetails cursor for
  select  fk.name ForeignKeyName, schema_name(t1.schema_id) ParentTableSchema,
  object_name(fkc.parent_object_id) ParentTable, c1.name ParentColumn,schema_name(t2.schema_id) ReferencedTableSchema,
   object_name(fkc.referenced_object_id) ReferencedTable,c2.name ReferencedColumn
  from --sys.tables t inner join 
  sys.foreign_keys fk 
  inner join sys.foreign_key_columns fkc on fk.object_id=fkc.constraint_object_id
  inner join sys.columns c1 on c1.object_id=fkc.parent_object_id and c1.column_id=fkc.parent_column_id 
  inner join sys.columns c2 on c2.object_id=fkc.referenced_object_id and c2.column_id=fkc.referenced_column_id 
  inner join sys.tables t1 on t1.object_id=fkc.parent_object_id 
  inner join sys.tables t2 on t2.object_id=fkc.referenced_object_id 
  where fk.object_id=@ForeignKeyID
  --	and EXISTS( SELECT * FROM  [MPF-MPE_RN-Exportacao-BdSIAI].DBO.Tabelas WHERE t1.name = NomeTabela ) -- APENAS TABELAS QUE FORAM EXPORTADAS
 	--and EXISTS( SELECT * FROM  [MPF-MPE_RN-Exportacao-BdSIAI].DBO.Tabelas WHERE t2.name = NomeTabela ) -- APENAS TABELAS QUE FORAM EXPORTADAS

 

 open CursorFKDetails
 fetch next from CursorFKDetails into  @ForeignKeyName, @ParentTableSchema, @ParentTableName, @ParentColumn, @ReferencedTableSchema, @ReferencedTable, @ReferencedColumn
 while (@@FETCH_STATUS=0)
 begin    
--	IF EXISTS( SELECT * FROM [MPF-MPE_RN-Exportacao-BdSIAI].INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @ParentTableName ) AND EXISTS( SELECT * FROM [MPF-MPE_RN-Exportacao-BdSIAI].INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @ReferencedTable )
--		begin
		  set @StrParentColumn=@StrParentColumn + ', ' + quotename(@ParentColumn)
		  set @StrReferencedColumn=@StrReferencedColumn + ', ' + quotename(@ReferencedColumn)
--		end

		 fetch next from CursorFKDetails into  @ForeignKeyName, @ParentTableSchema, @ParentTableName, @ParentColumn, @ReferencedTableSchema, @ReferencedTable, @ReferencedColumn
 end
 close CursorFKDetails
 deallocate CursorFKDetails

--	IF EXISTS( SELECT * FROM [MPF-MPE_RN-Exportacao-BdSIAI].INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @ParentTableName ) AND EXISTS( SELECT * FROM [MPF-MPE_RN-Exportacao-BdSIAI].INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = @ReferencedTable )
--		begin
			 set @StrParentColumn=substring(@StrParentColumn,2,len(@StrParentColumn)-1)
			 set @StrReferencedColumn=substring(@StrReferencedColumn,2,len(@StrReferencedColumn)-1)
			 set @TSQLCreationFK='ALTER TABLE '+quotename(@ParentTableSchema)+'.'+quotename(@ParentTableName)+' WITH CHECK ADD CONSTRAINT '+quotename(@ForeignKeyName)
			 + ' FOREIGN KEY('+ltrim(@StrParentColumn)+') '+ char(13) +'REFERENCES '+quotename(@ReferencedTableSchema)+'.'+quotename(@ReferencedTable)+' ('+ltrim(@StrReferencedColumn)+'); ' --+ char(13)+'go'
--		END

 --PRINT @ParentTableName
 --PRINT @ReferencedTable

	IF NOT EXISTS( SELECT * FROM #TbFK WHERE TSQLCreationFK = @TSQLCreationFK )
		Insert Into #TbFK (TSQLCreationFK) VALUES ( @TSQLCreationFK )

--		PRINT @TSQLCreationFK





 PRINT ''

fetch next from CursorFK into @ForeignKeyID 
end
close CursorFK
deallocate CursorFK


select * from #TbFK ORDER By TSQLCreationFK

DROP TABLE #TbFK

