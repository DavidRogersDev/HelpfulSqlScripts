SELECT DISTINCT
	o.name AS Object_Name
    , o.type_desc
    --, m.[definition]
    --, o.[type]
FROM 
	sys.sql_modules m
INNER JOIN
	sys.objects o
ON 
	m.object_id = o.object_id
WHERE
	o.[type] = 'P' -- confine search to Store Procedures 
AND
	m.[definition] 	Like '%text here%'; -- e.g. a column name