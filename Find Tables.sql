DECLARE @TableName NVARCHAR(MAX);
SET @TableName = '%status';

SELECT  DISTINCT
        s.[name]            'Schema',
        t.[name]            'Table',
        t.type_desc
FROM        
	sys.schemas s
INNER JOIN  
	sys.tables  t ON s.schema_id = t.schema_id
WHERE
	 t.name like @TableName
