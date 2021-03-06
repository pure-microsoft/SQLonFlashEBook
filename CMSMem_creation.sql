USE [master]
GO
CREATE DATABASE [CMSMem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CMSMem_data', FILENAME = N'G:\Data\CMSMem_data.mdf' , SIZE = 131072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB ), 
 FILEGROUP [CMSMem_InMem] CONTAINS MEMORY_OPTIMIZED_DATA  DEFAULT
( NAME = N'CMSMem_InMem1', FILENAME = N'G:\Data\CMSMem_InMem1' , MAXSIZE = UNLIMITED),
( NAME = N'CMSMem_InMem2', FILENAME = N'H:\Data\CMSMem_InMem2' , MAXSIZE = UNLIMITED)
 LOG ON 
( NAME = N'CMSMem_log', FILENAME = N'L:\Logs\CMSMem_log.ldf' , SIZE = 131072KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CMSMem] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [CMSMem] SET READ_COMMITTED_SNAPSHOT ON
GO
USE [CMSMem]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 11/26/2016 6:30:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order]
(
	[OrderID] [bigint] IDENTITY(1,1) NOT NULL,
	[PersonID] [bigint] NOT NULL,
	[OrderDT] [datetime] NOT NULL,
	[ShipDT] [datetime] NULL,
	[SalesRepID] [int] NOT NULL,
	[ProductCost] [numeric](18, 2) NULL,
	[ShippingCost] [numeric](10, 2) NULL,
	[TaxCost] [numeric](10, 2) NULL,
	[OrderCost] [numeric](18, 2) NULL,

INDEX [IX_Order_OrderDT] NONCLUSTERED 
(
	[OrderDT] ASC
),
INDEX [IX_Order_PersonID] NONCLUSTERED 
(
	[PersonID] ASC
),
INDEX [IX_Order_SalesRepID] NONCLUSTERED 
(
	[SalesRepID] ASC
),
INDEX [IX_Order_ShipDT] NONCLUSTERED 
(
	[ShipDT] ASC
),
 PRIMARY KEY NONCLUSTERED HASH 
(
	[OrderID]
)WITH ( BUCKET_COUNT = 16777216)
)WITH ( MEMORY_OPTIMIZED = ON , DURABILITY = SCHEMA_AND_DATA )

GO
/****** Object:  Table [dbo].[Person]    Script Date: 11/26/2016 6:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Person]
(
	[PersonID] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LastName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedDT] [datetime] NOT NULL,

 PRIMARY KEY NONCLUSTERED HASH 
(
	[PersonID]
)WITH ( BUCKET_COUNT = 16777216)
)WITH ( MEMORY_OPTIMIZED = ON , DURABILITY = SCHEMA_AND_DATA )

GO
/****** Object:  Table [dbo].[SalesRep]    Script Date: 11/26/2016 6:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesRep]
(
	[SalesRepID] [int] IDENTITY(1,1) NOT NULL,
	[RepName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[SalesTerritoryID] [int] NOT NULL,

INDEX [IX_SalesRep_SalesTerritoryID] NONCLUSTERED 
(
	[SalesTerritoryID] ASC
),
 PRIMARY KEY NONCLUSTERED HASH 
(
	[SalesRepID]
)WITH ( BUCKET_COUNT = 16384)
)WITH ( MEMORY_OPTIMIZED = ON , DURABILITY = SCHEMA_AND_DATA )

GO
/****** Object:  Table [dbo].[SalesTerritory]    Script Date: 11/26/2016 6:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesTerritory]
(
	[SalesTerritoryID] [int] IDENTITY(1,1) NOT NULL,
	[TerritoryName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,

 PRIMARY KEY NONCLUSTERED HASH 
(
	[SalesTerritoryID]
)WITH ( BUCKET_COUNT = 16384)
)WITH ( MEMORY_OPTIMIZED = ON , DURABILITY = SCHEMA_AND_DATA )

GO
/****** Object:  Table [dbo].[OrderLine]    Script Date: 11/26/2016 6:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLine]
(
	[OrderLineID] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderID] [bigint] NOT NULL,
	[ProductID] [bigint] NOT NULL,
	[QuantityOrdered] [int] NOT NULL,
	[UnitPrice] [numeric](10, 2) NOT NULL,

INDEX [IX_OrderLine_OrderID] NONCLUSTERED 
(
	[OrderID] ASC
),
INDEX [IX_OrderLine_ProductID] NONCLUSTERED 
(
	[ProductID] ASC
),
 PRIMARY KEY NONCLUSTERED HASH 
(
	[OrderLineID]
)WITH ( BUCKET_COUNT = 134217728)
)WITH ( MEMORY_OPTIMIZED = ON , DURABILITY = SCHEMA_AND_DATA )

GO
/****** Object:  StoredProcedure [dbo].[Product_by_Date]    Script Date: 11/26/2016 6:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[Product_by_Date] (
	@StartDT DATETIME,
	@EndDT DATETIME
) 
WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER
AS

BEGIN ATOMIC WITH (
	TRANSACTION ISOLATION LEVEL = SNAPSHOT, 
	LANGUAGE = N'us_english')

SELECT
	l.ProductID,
	SUM(l.QuantityOrdered) AS SoldCount,
	SUM(l.UnitPrice) AS SoldValue
FROM
	dbo.[Order] o
	INNER JOIN dbo.OrderLine l 
		ON o.OrderID = l.OrderID
	INNER JOIN dbo.Person p 
		ON p.PersonID = o.PersonID
	INNER JOIN dbo.SalesRep r 
		ON r.SalesRepID = o.SalesRepID
	INNER JOIN dbo.SalesTerritory t 
		ON t.SalesTerritoryID = r.SalesTerritoryID
WHERE
	o.OrderDT >= @StartDT
	AND o.OrderDT <= @EndDT
GROUP BY
	l.ProductID
ORDER BY
	SoldValue DESC
	
END;
GO
/****** Object:  StoredProcedure [dbo].[Product_by_Territory_Date]    Script Date: 11/26/2016 6:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[Product_by_Territory_Date] (
	@StartDT DATETIME,
	@EndDT DATETIME
) 
WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER
AS

BEGIN ATOMIC WITH (
	TRANSACTION ISOLATION LEVEL = SNAPSHOT, 
	LANGUAGE = N'us_english')

SELECT
	l.ProductID,
	t.TerritoryName,
	sum(l.QuantityOrdered) AS SoldCount,
	sum(l.UnitPrice) AS SoldValue
FROM
	dbo.[Order] o
	INNER JOIN dbo.OrderLine l ON o.OrderID = l.OrderID
	INNER JOIN dbo.Person p ON p.PersonID = o.PersonID
	INNER JOIN dbo.SalesRep r ON r.SalesRepID = o.SalesRepID
	INNER JOIN dbo.SalesTerritory t ON t.SalesTerritoryID = r.SalesTerritoryID
WHERE
	o.OrderDT >= @StartDT
	AND o.OrderDT <= @EndDT
GROUP BY
	l.ProductID,
	t.TerritoryName
ORDER BY 
	t.TerritoryName ASC, SoldValue DESC
	
END;
GO
/****** Object:  StoredProcedure [dbo].[Product_Ship_Delays_by_Age_Date]    Script Date: 11/26/2016 6:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[Product_Ship_Delays_by_Age_Date] (
	@MinDaysDelayed INT = 7,
	@StartDT DATETIME,
	@EndDT DATETIME
) 
WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER
AS

BEGIN ATOMIC WITH (
	TRANSACTION ISOLATION LEVEL = SNAPSHOT, 
	LANGUAGE = N'us_english')

SELECT
	count(o.OrderID) AS NumOrdersImpacted,
	datediff(dd, o.OrderDT, o.ShipDT) AS ShippingDelayDays
FROM
	dbo.[Order] o
	INNER JOIN dbo.OrderLine l ON o.OrderID = l.OrderID
	INNER JOIN dbo.Person p ON p.PersonID = o.PersonID
	INNER JOIN dbo.SalesRep r ON r.SalesRepID = o.SalesRepID
	INNER JOIN dbo.SalesTerritory t ON t.SalesTerritoryID = r.SalesTerritoryID
WHERE
	o.OrderDT >= @StartDT
	AND o.OrderDT <= @EndDT
GROUP BY
	datediff(dd, o.OrderDT, o.ShipDT)
HAVING
	datediff(dd, o.OrderDT, o.ShipDT) >= @MinDaysDelayed
ORDER BY 
	ShippingDelayDays DESC
	
END;
GO
/****** Object:  StoredProcedure [dbo].[Product_Ship_Delays_by_Date]    Script Date: 11/26/2016 6:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[Product_Ship_Delays_by_Date] (
	@StartDT DATETIME,
	@EndDT DATETIME
) 
WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER
AS

BEGIN ATOMIC WITH (
	TRANSACTION ISOLATION LEVEL = SNAPSHOT, 
	LANGUAGE = N'us_english')

SELECT
	count(o.OrderID) AS NumOrdersImpacted,
	datediff(dd, o.OrderDT, o.ShipDT) AS ShippingDelayDays
FROM
	dbo.[Order] o
	INNER JOIN dbo.OrderLine l ON o.OrderID = l.OrderID
	INNER JOIN dbo.Person p ON p.PersonID = o.PersonID
	INNER JOIN dbo.SalesRep r ON r.SalesRepID = o.SalesRepID
	INNER JOIN dbo.SalesTerritory t ON t.SalesTerritoryID = r.SalesTerritoryID
WHERE
	o.OrderDT >= @StartDT
	AND o.OrderDT <= @EndDT
GROUP BY
	datediff(dd, o.OrderDT, o.ShipDT)
ORDER BY
	ShippingDelayDays DESC
	
END;
GO
/****** Object:  StoredProcedure [dbo].[Sales_By_Territory_Date]    Script Date: 11/26/2016 6:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[Sales_By_Territory_Date] (
	@StartDT DATETIME,
	@EndDT DATETIME
) 
WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER
AS

BEGIN ATOMIC WITH (
	TRANSACTION ISOLATION LEVEL = SNAPSHOT, 
	LANGUAGE = N'us_english')

SELECT
	t.SalesTerritoryID, 
	t.TerritoryName,
	SUM(o.OrderCost) as TotalOrderValue,
	COUNT(o.OrderID) as OrderCount
FROM
	dbo.[Order] o
	INNER JOIN dbo.Person p ON p.PersonID = o.PersonID
	INNER JOIN dbo.SalesRep r ON r.SalesRepID = o.SalesRepID
	INNER JOIN dbo.SalesTerritory t ON t.SalesTerritoryID = r.SalesTerritoryID
WHERE
	o.OrderDT >= @StartDT
	AND o.OrderDT <= @EndDT
GROUP BY
	t.SalesTerritoryID, 
	t.TerritoryName
ORDER BY 
	t.TerritoryName ASC
	
END;
GO
/****** Object:  StoredProcedure [dbo].[Sales_Rep_Reassign]    Script Date: 11/26/2016 6:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[Sales_Rep_Reassign] (
	@OldSalesRepID INT,
	@NewSalesRepID INT
) 
WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER
AS

BEGIN ATOMIC WITH (
	TRANSACTION ISOLATION LEVEL = SNAPSHOT, 
	LANGUAGE = N'us_english')

UPDATE dbo.[Order]
	SET SalesRepID = @NewSalesRepID
	WHERE SalesRepID = @OldSalesRepID
	
END;
GO
/****** Object:  StoredProcedure [dbo].[Sales_By_Territory_Rep_Date]    Script Date: 11/26/2016 6:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   PROC [dbo].[Sales_By_Territory_Rep_Date] (
	@StartDT DATETIME,
	@EndDT DATETIME
) 
WITH NATIVE_COMPILATION, SCHEMABINDING, EXECUTE AS OWNER
AS

BEGIN ATOMIC WITH (
	TRANSACTION ISOLATION LEVEL = SNAPSHOT, 
	LANGUAGE = N'us_english')

select
	t.SalesTerritoryID, 
	t.TerritoryName,
	r.SalesRepID,
	sum(o.OrderCost) as TotalOrderValue,
	count(o.OrderID) as OrderCount
from
	dbo.[Order] o
	join dbo.Person p on p.PersonID = o.PersonID
	join dbo.SalesRep r on r.SalesRepID = o.SalesRepID
	join dbo.SalesTerritory t on t.SalesTerritoryID = r.SalesTerritoryID
where
	o.OrderDT >= @StartDT
	and o.OrderDT <= @EndDT
group by
	t.SalesTerritoryID, 
	t.TerritoryName,
	r.SalesRepID
order by 
	t.TerritoryName asc, TotalOrderValue desc
	
END;
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/26/2016 6:30:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product]
(
	[ProductID] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[UnitPrice] [numeric](12, 2) NOT NULL,
	[ProductTypeID] [int] NOT NULL,

INDEX [IX_Product_ProductTypeID] NONCLUSTERED 
(
	[ProductTypeID] ASC
),
 PRIMARY KEY NONCLUSTERED HASH 
(
	[ProductID]
)WITH ( BUCKET_COUNT = 16777216)
)WITH ( MEMORY_OPTIMIZED = ON , DURABILITY = SCHEMA_AND_DATA )

GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 11/26/2016 6:30:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType]
(
	[ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,

 PRIMARY KEY NONCLUSTERED HASH 
(
	[ProductTypeID]
)WITH ( BUCKET_COUNT = 16384)
)WITH ( MEMORY_OPTIMIZED = ON , DURABILITY = SCHEMA_AND_DATA )

GO
/****** Object:  View [dbo].[RandView]    Script Date: 11/26/2016 6:30:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[RandView]
AS
SELECT RAND() RandNumber


GO
USE [master]
GO
ALTER DATABASE [CMSMem] SET  READ_WRITE 
GO
