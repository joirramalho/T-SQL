    --columns
select 'EXEC sp_dropextendedproperty
@name = '''+sys.extended_properties.name+'''
,@level0type = ''schema''
,@level0name = ''' + object_schema_name(extended_properties.major_id) + '''
,@level1type = ''' + Case so.type
                         When 'u'
                             Then
                             'table'
                         When 'v'
                             Then
                             'view'
                     End + '''
,@level1name = ''' + object_name(extended_properties.major_id) + '''
,@level2type = ''column''
,@level2name = ''' + columns.name + ''''
from sys.extended_properties
join sys.columns
on columns.object_id = extended_properties.major_id
and columns.column_id = extended_properties.minor_id
    Join
        sys.objects As so
            On
            columns.object_id     = so.object_id
Where
    extended_properties.class_desc   = 'OBJECT_OR_COLUMN'
    And extended_properties.minor_id > 0
    And so.type In
        ( 'u', 'v' )
        
--        and object_name(extended_properties.major_id) IN ('Gen_Orgao', 'vw_Gen_Orgao', 'Gen_SiglaLRF', 'Gen_OrgaoNatureza')

        
        