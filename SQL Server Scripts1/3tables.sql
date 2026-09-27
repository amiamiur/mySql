USE ShopDB;
GO

CREATE TABLE dbo.ShopCategory
(
    ProductCategoryID INT NOT NULL,
    CategoryName NVARCHAR(50) NOT NULL,

    CONSTRAINT PK_ShopCategory
        PRIMARY KEY (ProductCategoryID)
)
ON FG_ShopCatalog;

CREATE TABLE dbo.ShopSubcategory
(
    ProductSubcategoryID INT NOT NULL,
    ProductCategoryID INT NOT NULL,
    SubcategoryName NVARCHAR(50) NOT NULL,

    CONSTRAINT PK_ShopSubcategory
        PRIMARY KEY (ProductSubcategoryID),

    CONSTRAINT FK_ShopSubcategory_Category
        FOREIGN KEY (ProductCategoryID)
        REFERENCES dbo.ShopCategory(ProductCategoryID)
)
ON FG_ShopCatalog;

CREATE TABLE dbo.ShopProduct
(
    ProductID INT NOT NULL,
    ProductSubcategoryID INT NULL,
    ProductName NVARCHAR(50) NOT NULL,
    ProductNumber NVARCHAR(25) NOT NULL,
    ListPrice MONEY NOT NULL,

    CONSTRAINT PK_ShopProduct
        PRIMARY KEY (ProductID),

    CONSTRAINT FK_ShopProduct_Subcategory
        FOREIGN KEY (ProductSubcategoryID)
        REFERENCES dbo.ShopSubcategory(ProductSubcategoryID)
)
ON FG_ShopCatalog;

CREATE TABLE dbo.ShopCustomer
(
    CustomerID INT NOT NULL,
    PersonID INT NULL,
    StoreID INT NULL,
    CustomerName NVARCHAR(200) NOT NULL,
    TerritoryID INT NULL,

    CONSTRAINT PK_ShopCustomer
        PRIMARY KEY (CustomerID)
)
ON FG_ShopSales;

CREATE TABLE dbo.ShopAddress
(
    AddressID INT NOT NULL,
    AddressLine1 NVARCHAR(60) NOT NULL,
    City NVARCHAR(30) NOT NULL,
    PostalCode NVARCHAR(15) NOT NULL,

    CONSTRAINT PK_ShopAddress
    PRIMARY KEY (AddressID)
)
ON FG_ShopSales;

CREATE TABLE dbo.ShopOrder
(
    SalesOrderID INT NOT NULL,
    CustomerID INT NOT NULL,
    OrderDate DATETIME NOT NULL,
    TotalDue MONEY NOT NULL,
    BillToAddressID INT NOT NULL,
    ShipToAddressID INT NOT NULL,

    CONSTRAINT PK_ShopOrder
    PRIMARY KEY (SalesOrderID),

    CONSTRAINT FK_ShopOrder_Customer
    FOREIGN KEY (CustomerID)
    REFERENCES dbo.ShopCustomer(CustomerID),

    CONSTRAINT FK_ShopOrder_BillAddress
    FOREIGN KEY (BillToAddressID)
    REFERENCES dbo.ShopAddress(AddressID),

    CONSTRAINT FK_ShopOrder_ShipAddress
    FOREIGN KEY (ShipToAddressID)
    REFERENCES dbo.ShopAddress(AddressID)
)
ON FG_ShopSales;

CREATE TABLE dbo.ShopOrderItem
(
    SalesOrderDetailID INT NOT NULL,
    SalesOrderID INT NOT NULL,
    ProductID INT NOT NULL,
    OrderQty SMALLINT NOT NULL,
    UnitPrice MONEY NOT NULL,
    LineTotal MONEY NOT NULL,

    CONSTRAINT PK_ShopOrderItem
    PRIMARY KEY (SalesOrderDetailID),

    CONSTRAINT FK_ShopOrderItem_Order
    FOREIGN KEY (SalesOrderID)
    REFERENCES dbo.ShopOrder(SalesOrderID),

    CONSTRAINT FK_ShopOrderItem_Product
    FOREIGN KEY (ProductID)
    REFERENCES dbo.ShopProduct(ProductID)
)
ON FG_ShopSales;
GO