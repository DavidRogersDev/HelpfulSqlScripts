DECLARE @ColumnName nvarchar(max);
SET @ColumnName = '%bst%';

select  
        s.[name]            'Schema',
        t.[name]            'Table',
        c.[name]            'Column',
        d.[name]            'Data Type',
        d.[max_length]      'Max Length',
        d.[precision]       'Precision',
        c.[is_identity]     'Is Id',
        c.[is_nullable]     'Is Nullable',
        c.[is_computed]     'Is Computed',
        d.[is_user_defined] 'Is UserDefined',
        t.[modify_date]     'Date Modified',
        t.[create_date]     'Date created'
from        sys.schemas s
inner join  sys.tables  t
on s.schema_id = t.schema_id
inner join  sys.columns c
on t.object_id = c.object_id
inner join  sys.types   d
on c.user_type_id = d.user_type_id
where c.name like @ColumnName