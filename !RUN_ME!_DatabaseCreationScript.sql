CREATE DATABASE [IntegrationNW]
GO

USE [IntegrationNW]
GO

/****** Object:  Table [dbo].[DimProduct]    Script Date: 5/10/2021 6:02:09 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProduct](
	[ProductID] [int] NULL,
	[ProductName] [nvarchar](40) NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[QuantityPerUnit] [nvarchar](20) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[ReorderLevel] [smallint] NULL,
	[Discontinued] [bit] NULL,
	[CategoryName] [nvarchar](15) NULL,
	[CategoryDescription] [nvarchar](max) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IntegrationDimProduct]    Script Date: 5/10/2021 6:02:09 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IntegrationDimProduct](
	[ProductID] [int] NULL,
	[ProductName] [nvarchar](40) NULL,
	[SupplierID] [int] NULL,
	[CategoryID] [int] NULL,
	[QuantityPerUnit] [nvarchar](20) NULL,
	[UnitPrice] [money] NULL,
	[UnitsInStock] [smallint] NULL,
	[UnitsOnOrder] [smallint] NULL,
	[ReorderLevel] [smallint] NULL,
	[Discontinued] [bit] NULL,
	[CategoryName] [nvarchar](15) NULL,
	[Description] [nvarchar](max) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[DimProduct] ADD  CONSTRAINT [DF_DimProduct_StartDate]  DEFAULT (CONVERT([date],getdate())) FOR [StartDate]
GO
ALTER TABLE [dbo].[IntegrationDimProduct] ADD  CONSTRAINT [DF_IntergrationDimProduct_StartDate]  DEFAULT (CONVERT([date],getdate())) FOR [StartDate]
GO