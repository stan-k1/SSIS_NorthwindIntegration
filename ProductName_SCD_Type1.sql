-- Type 1 SCD Merge Script For ProductName Column in Product/DimProduct 

MERGE DimProduct AS target
	USING IntegrationDimProduct as source
	ON target.ProductId = source.ProductId
 WHEN MATCHED
 AND source.ProductName <> target.ProductName
 THEN UPDATE SET
	 target.ProductName = source.ProductName
 WHEN NOT MATCHED THEN
   INSERT  (
	  [ProductID]
      ,[ProductName]
      ,[SupplierID]
      ,[CategoryID]
      ,[QuantityPerUnit]
      ,[UnitPrice]
      ,[UnitsInStock]
      ,[UnitsOnOrder]
      ,[ReorderLevel]
      ,[Discontinued]
      ,[CategoryName]
      ,[CategoryDescription]
   )
   VALUES( 
	  source.[ProductID]
      ,source.[ProductName]
      ,source.[SupplierID]
      ,source.[CategoryID]
      ,source.[QuantityPerUnit]
      ,source.[UnitPrice]
      ,source.[UnitsInStock]
      ,source.[UnitsOnOrder]
      ,source.[ReorderLevel]
      ,source.[Discontinued]
      ,source.[CategoryName]
      ,source.[Description]
   )
WHEN NOT MATCHED BY Source
AND target.ProductID NOT IN (SELECT ProductID From Northwind.dbo.Products)
THEN
UPDATE SET Target.EndDate= CAST(GetDate() AS Date);