-- SCD Type 2 Update Script For UnitPrice. 
-- Note 1: No updates for deleted since they will already be handled by the previous SCD script
-- Note 2: The final OUTPUT Statement is used as the FROM for the outer INSERT INTO clause. It will return the rows that need to be updated.

INSERT INTO Dimproduct ([ProductID],[ProductName],[SupplierID],[CategoryID],[QuantityPerUnit],[UnitPrice],
[UnitsInStock],[UnitsOnOrder],[ReorderLevel],[Discontinued],[CategoryName],[CategoryDescription],[StartDate],[EndDate])
SELECT [ProductID],[ProductName],[SupplierID],[CategoryID],[QuantityPerUnit],[UnitPrice],
[UnitsInStock],[UnitsOnOrder],[ReorderLevel],[Discontinued],[CategoryName],[Description],[StartDate],[EndDate]
FROM
(
MERGE DimProduct AS target
	USING IntegrationDimProduct as source
	ON target.ProductId = source.ProductId
 WHEN MATCHED AND source.UnitPrice <> target.UnitPrice
 AND target.EndDate IS NULL
 THEN UPDATE SET
	 target.EndDate=source.StartDate
 WHEN NOT MATCHED BY Target THEN
   INSERT  (
	[ProductID],[ProductName],[SupplierID],[CategoryID],[QuantityPerUnit],[UnitPrice],
	[UnitsInStock],[UnitsOnOrder],[ReorderLevel],[Discontinued],[CategoryName],[CategoryDescription],[StartDate],[EndDate] 
   )
   VALUES( 
	source.[ProductID],source.[ProductName],source.[SupplierID],source.[CategoryID],source.[QuantityPerUnit],source.[UnitPrice],
	source.[UnitsInStock],source.[UnitsOnOrder],source.[ReorderLevel],source.[Discontinued],source.[CategoryName],source.[Description],source.[StartDate], source.[EndDate] 
   )
OUTPUT 
	source.[ProductID],source.[ProductName],source.[SupplierID],source.[CategoryID],source.[QuantityPerUnit],source.[UnitPrice],
	source.[UnitsInStock],source.[UnitsOnOrder],source.[ReorderLevel],source.[Discontinued],source.[CategoryName],source.[Description],source.[StartDate], source.[EndDate],
	$Action as ActionName
) AS Mrg
WHERE Mrg.ActionName='UPDATE'
AND ProductId IS NOT NULL