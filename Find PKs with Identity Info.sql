SELECT  i.name AS IndexName ,
        OBJECT_NAME(ic.OBJECT_ID) AS TableName ,
        COL_NAME(ic.OBJECT_ID, ic.column_id) AS ColumnName ,
        ( SELECT    is_identity
          FROM      sys.columns c
                    INNER JOIN sys.tables t ON c.object_id = t.object_id
          WHERE     c.name = COL_NAME(ic.OBJECT_ID, ic.column_id)
                    AND t.name = OBJECT_NAME(ic.OBJECT_ID)
        ) AS 'identity'
FROM    sys.indexes AS i
INNER JOIN sys.index_columns AS ic ON i.OBJECT_ID = ic.OBJECT_ID AND i.index_id = ic.index_id
WHERE   i.is_primary_key = 1
ORDER BY OBJECT_NAME(ic.OBJECT_ID)