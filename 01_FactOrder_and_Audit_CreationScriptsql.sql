USE [IntegrationNW]
GO

CREATE TABLE [FactOrder] (
    [OrderID] int,
    [EmployeeID] int,
    [OrderDate] datetime,
    [RequiredDate] datetime,
    [ShippedDate] datetime,
    [ShipAddress] nvarchar(60),
    [ShipCity] nvarchar(15),
    [ShipRegion] nvarchar(15),
    [ShipPostalCode] nvarchar(10),
    [ShipCountry] nvarchar(15),
    [ProductID] int,
    [TotalFreight] money,
    [AverageUnitPrice] money,
    [AverageDiscountPercent] float
)

CREATE TABLE [dbo].[Audit](
	[ProcessedTable] [nvarchar](64) NULL,
	[LastRowKey] [int] NULL,
    ExecutionTime datetime2 NULL,
    Computer nvarchar(64) NULL,
    Username nvarchar(64) NULL
) ON [PRIMARY]
GO

INSERT INTO Audit (ProcessedTable, LastRowKey)
VALUES ('FactOrder', 0)