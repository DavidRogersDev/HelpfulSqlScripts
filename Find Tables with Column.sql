DECLARE @ColumnName NVARCHAR(MAX);
SET @ColumnName = '%%';

SELECT  
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
FROM        
	sys.schemas s
INNER JOIN  
	sys.tables  t ON s.schema_id = t.schema_id
INNER JOIN  
	sys.columns c ON t.object_id = c.object_id
INNER JOIN  
	sys.types   d ON c.user_type_id = d.user_type_id
WHERE
	 c.name like @ColumnName