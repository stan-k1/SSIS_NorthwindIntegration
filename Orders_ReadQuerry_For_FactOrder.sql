-- Reads data from Orders and Order Details, Aggregates to one row when both the Order Id and the Product Id are the same
-- Uses Audit Table in the Where clause to only read new rows from the Orders table based on the id of the last processed order
SELECT Orders.OrderID, ProductID, Orders.EmployeeID, Orders.OrderDate, Orders.RequiredDate, Orders.ShippedDate, Orders.ShipAddress, Orders.ShipCity, Orders.ShipRegion, Orders.ShipCountry, Orders.ShipPostalCode, 
SUM(Freight) AS TotalFreight, AVG(UnitPrice) AS AverageUnitPrice, ROUND(AVG(Discount),2) * 100 AS AverageDiscountPercent
FROM ORDERS
LEFT JOIN [Order Details]
ON Orders.OrderID = [Order Details].OrderID
WHERE Orders.OrderID >
	(SELECT MAX(LastRowKey)
	FROM IntegrationNW.dbo.Audit
	WHERE ProcessedTable='FactOrder')
GROUP BY Orders.OrderID,  Orders.EmployeeID, Orders.OrderDate, Orders.RequiredDate, Orders.ShippedDate, Orders.ShipAddress, Orders.ShipCity, Orders.ShipRegion, Orders.ShipCountry, Orders.ShipPostalCode, ProductID