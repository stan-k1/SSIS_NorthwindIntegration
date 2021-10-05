-- Changes the original Northwind database to test the SCDs
USE Northwind;
GO

DELETE FROM [Order Details] WHERE ProductID = 3; 
DELETE FROM Products WHERE ProductID = 3; -- Deletion: EndDate will be set 
UPDATE Products SET UnitPrice = 100.00 WHERE ProductID = 4; -- SCD Type 2: New Row Will Be Created And EndDate Set For Old Row
UPDATE Products SET ProductName = 'Changed Name' WHERE ProductID = 5; -- SCD Type 1: Changes Will Be Made To The Existing Row