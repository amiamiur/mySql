USE ShopDB;
GO

INSERT INTO dbo.ShopCategory
(
    ProductCategoryID,
    CategoryName
)
SELECT
    ProductCategoryID,
    Name
FROM AdventureWorks2022.Production.ProductCategory;
GO
USE ShopDB;
GO

INSERT INTO dbo.ShopSubcategory
(
    ProductSubcategoryID,
    ProductCategoryID,
    SubcategoryName
)
SELECT
    ProductSubcategoryID,
    ProductCategoryID,
    Name
FROM AdventureWorks2022.Production.ProductSubcategory;
GO
USE ShopDB;
GO

INSERT INTO dbo.ShopProduct
(
    ProductID,
    ProductSubcategoryID,
    ProductName,
    ProductNumber,
    ListPrice
)
SELECT
    ProductID,
    ProductSubcategoryID,
    Name,
    ProductNumber,
    ListPrice
FROM AdventureWorks2022.Production.Product;
GO
USE ShopDB;
GO

USE ShopDB;
GO

INSERT INTO dbo.ShopCustomer
(
    CustomerID,
    CustomerName
)
SELECT
    c.CustomerID,
    CASE
        WHEN c.PersonID IS NOT NULL
            THEN p.FirstName + N' ' + p.LastName
        ELSE ISNULL(s.Name, N'Unknown customer')
    END
FROM AdventureWorks2022.Sales.Customer AS c
LEFT JOIN AdventureWorks2022.Person.Person AS p
    ON c.PersonID = p.BusinessEntityID
LEFT JOIN AdventureWorks2022.Sales.Store AS s
    ON c.StoreID = s.BusinessEntityID;
GO

INSERT INTO dbo.ShopAddress
(
    AddressID,
    AddressLine1,
    City,
    PostalCode
)
SELECT
    AddressID,
    AddressLine1,
    City,
    PostalCode
FROM AdventureWorks2022.Person.Address;
GO
USE ShopDB;
GO

INSERT INTO dbo.ShopOrder
(
    SalesOrderID,
    CustomerID,
    OrderDate,
    TotalDue,
    BillToAddressID,
    ShipToAddressID
)
SELECT
    SalesOrderID,
    CustomerID,
    OrderDate,
    TotalDue,
    BillToAddressID,
    ShipToAddressID
FROM AdventureWorks2022.Sales.SalesOrderHeader;
GO
USE ShopDB;
GO

INSERT INTO dbo.ShopOrderItem
(
    SalesOrderDetailID,
    SalesOrderID,
    ProductID,
    OrderQty,
    UnitPrice,
    LineTotal
)
SELECT
    SalesOrderDetailID,
    SalesOrderID,
    ProductID,
    OrderQty,
    UnitPrice,
    LineTotal
FROM AdventureWorks2022.Sales.SalesOrderDetail;
GO
USE ShopDB;
GO


SELECT * FROM dbo.ShopCategory;

SELECT * FROM dbo.ShopSubcategory;

SELECT * FROM dbo.ShopProduct;

SELECT * FROM dbo.ShopCustomer;

SELECT * FROM dbo.ShopAddress;

SELECT * FROM dbo.ShopOrder;

SELECT * FROM dbo.ShopOrderItem;