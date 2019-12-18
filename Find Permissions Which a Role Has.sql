DECLARE @role NVARCHAR(max) = 'SerilogWriter';

SELECT DB_NAME() AS 'DBName'
      ,p.[name] AS 'PrincipalName'
      ,p.[type_desc] AS 'PrincipalType'
      ,p2.[name] AS 'GrantedBy'
      ,dbp.[permission_name]
      ,dbp.[state_desc]
      ,so.[Name] AS 'ObjectName'
      ,so.[type_desc] AS 'ObjectType'
  FROM [sys].[database_permissions] dbp LEFT JOIN [sys].[objects] so
    ON dbp.[major_id] = so.[object_id] LEFT JOIN [sys].[database_principals] p
    ON dbp.[grantee_principal_id] = p.[principal_id] LEFT JOIN [sys].[database_principals] p2
    ON dbp.[grantor_principal_id] = p2.[principal_id]
WHERE 
	p.[name] = @role