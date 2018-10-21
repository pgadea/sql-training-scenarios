-- Step 1 - Open a new query window to the tempdb database

USE DBase;
GO

-- Step 2 - Create a Sales and SalesDetails table

CREATE TABLE dbo.Sales
( SaleID int IDENTITY PRIMARY KEY,
  CustomerID int,
  PurchaseOrderNumber varchar(20),
  SoldWhen datetime2 DEFAULT SYSDATETIME()
);

CREATE TABLE dbo.SalesDetails
( SalesDetailID int IDENTITY,
  SaleID int REFERENCES dbo.Sales(SaleID),
  Description varchar(50),
  Price decimal(18,2)
);
GO

-- Step 3 - Create traditional insert stored procedures for both tables

CREATE PROCEDURE dbo.SalesInsert
  @CustomerID int,
  @PurchaseOrderNumber varchar(20),
  @SaleID int OUTPUT
AS BEGIN
  INSERT INTO dbo.Sales (CustomerID,PurchaseOrderNumber)
    VALUES(@CustomerID,@PurchaseOrderNumber);
  SELECT @SaleID = SCOPE_IDENTITY();
END;
GO

CREATE PROCEDURE dbo.SalesDetailInsert
  @SaleID int,
  @Description varchar(50),
  @Price decimal(18,2),
  @SalesDetailID int OUTPUT
AS BEGIN
  INSERT INTO dbo.SalesDetails (SaleID,Description,Price)
    VALUES(@SaleID,@Description,@Price);
  SELECT @SalesDetailID = SCOPE_IDENTITY();
END;
GO

-- Step 4 - Show how we would have previously inserted an order

DECLARE @SaleID int;
DECLARE @SalesDetailID int;

BEGIN TRAN;

EXEC dbo.SalesInsert 12,'2176A',@SaleID OUTPUT;

EXEC dbo.SalesDetailInsert @SaleID,'Product 1',12.3,@SalesDetailID OUTPUT
EXEC dbo.SalesDetailInsert @SaleID,'Product 2',14.6,@SalesDetailID OUTPUT
EXEC dbo.SalesDetailInsert @SaleID,'Product 3',122.35,@SalesDetailID OUTPUT

COMMIT;
GO

SELECT * FROM dbo.Sales;
SELECT * FROM dbo.SalesDetails;
GO

-- Step 5 - Create a table data type to hold the sales details

CREATE TYPE dbo.SalesDetails AS TABLE
( Description varchar(50),
  Price decimal(18,2)
);
GO

-- Step 6 - Modify the insert procedure to take detail lines as well

ALTER PROCEDURE dbo.SalesInsert
  @CustomerID int,
  @PurchaseOrderNumber varchar(20),
  @SalesDetails dbo.SalesDetails READONLY,
  @SaleID int OUTPUT
AS BEGIN
  BEGIN TRAN;
    INSERT INTO dbo.Sales (CustomerID,PurchaseOrderNumber)
       VALUES(@CustomerID,@PurchaseOrderNumber);
    SELECT @SaleID = SCOPE_IDENTITY();
    INSERT INTO dbo.SalesDetails (SaleID,Description,Price)
      SELECT @SaleID, Description,Price
      FROM @SalesDetails;
  COMMIT;
END;
GO

-- Step 7 - Perform an insert with a single round-trip

DECLARE @SaleID int;
DECLARE @SalesDetails dbo.SalesDetails;

INSERT INTO @SalesDetails VALUES('Product 1',12.3),('Product 2',14.66),('Product 3',122.35);
EXEC dbo.SalesInsert 12,'2176A',@SalesDetails,@SaleID OUTPUT;
GO

SELECT * FROM dbo.Sales;
SELECT * FROM dbo.SalesDetails;
GO

-- Step 8 - Query the sys.types 
SELECT * FROM sys.types;

GO


--By www.ellarr.com     Vikas Munjal
