USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT Name FROM master.dbo.sysdatabases WHERE Name = N'FShop')
BEGIN
	ALTER DATABASE FShop SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE FShop SET ONLINE;
	DROP DATABASE FShop;
END

GO

CREATE DATABASE FShop
GO

USE FShop
GO

/*******************************************************************************
   Use camelCase for Name of attribute. Ex: FullDateOfCreateAccount
   ConsIDer use prefix for attribute Name of each TABLE. Ex: TABLE Accounts have (a_ID, a_FullName, a_email,...)
********************************************************************************/

-- DROP TABLE IF EXISTS Wards;
-- DROP TABLE IF EXISTS Districts;
-- DROP TABLE IF EXISTS Provinces;
-- DROP TABLE IF EXISTS AdministrativeUnits;
-- DROP TABLE IF EXISTS AdministrativeRegions;


-----------------------------------------------------------------------------------

CREATE TABLE Roles (
    RoleID INT PRIMARY KEY,
    [Name] NVARCHAR(50) NOT NULL
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    Birthday DATE,
    [Password] VARCHAR(500) NOT NULL,
    PhoneNumber VARCHAR(15),
    Email VARCHAR(254),
    Gender CHAR(6),
    CreatedDate DATETIME,
    Avatar TEXT,
    RoleID INT,
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(255) NOT NULL,
    Birthday DATE,
    [Password] VARCHAR(500) NOT NULL,
    PhoneNumber VARCHAR(15),
    Email VARCHAR(254),
    Gender CHAR(6),
    CreatedDate DATETIME,
    IsBlock BIT,
    IsDeleted BIT,
    Avatar TEXT
);

CREATE TABLE Addresses (
    AddressID INT PRIMARY KEY,
    CustomerID INT,
    AddressDetails NTEXT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Suppliers (
    SupplierID INT PRIMARY KEY,
    TaxID VARCHAR(20),
    [Name] NVARCHAR(255) NOT NULL,
    Email VARCHAR(254),
    PhoneNumber VARCHAR(15),
    [Address] VARCHAR(255),
    CreatedDate DATETIME,
    LastModify DATETIME,
    IsDeleted BIT
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY,
    [Name] NVARCHAR(50) NOT NULL
);

CREATE TABLE Brands (
    BrandID INT PRIMARY KEY,
    [Name] NVARCHAR(50) NOT NULL
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    BrandID INT,
    CategoryID INT,
    Model NVARCHAR(50),
    FullName VARCHAR(255),
    Description TEXT,
    Image TEXT,
    Price BIGINT,
    FOREIGN KEY (BrandID) REFERENCES Brands(BrandID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Attributes (
    AttributeID INT PRIMARY KEY,
    [Name] NVARCHAR(100) NOT NULL
);

CREATE TABLE AttributeDetails (
    AttributeID INT,
    ProductID INT,
    AttributeValue VARCHAR(100),
    PRIMARY KEY (AttributeID, ProductID),
    FOREIGN KEY (AttributeID) REFERENCES Attributes(AttributeID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    FullName VARCHAR(100) NOT NULL,
    [Address] NTEXT NOT NULL,
    PhoneNumber VARCHAR(15) NOT NULL,
    OrderDate DATETIME NOT NULL,
    DeliveredDate DATETIME,
    [Status]INT,
    TotalAmount BIGINT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    Price BIGINT,
    PRIMARY KEY (OrderID, ProductID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE OrderStatus (
    ID INT PRIMARY KEY,
    [Status]NVARCHAR(50) NOT NULL
);

CREATE TABLE ImportOrders (
    IOID INT PRIMARY KEY,
    EmployeeID INT,
    SupplierID INT,
    ImportDate DATETIME,
    TotalCost BIGINT,
	IsComplete BIT,
    IsDeleted BIT,
    LastModify DATETIME,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);

CREATE TABLE ImportOrderDetails (
    IOID INT,
    ProductID INT,
    Quantity INT,
    ImportPrice BIGINT,
    PRIMARY KEY (IOID, ProductID),
    FOREIGN KEY (IOID) REFERENCES ImportOrders(IOID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE ProductRatings (
    RateID INT PRIMARY KEY,
    CustomerID INT,
    ProductID INT,
    CreateDate DATETIME,
    Star INT,
    Comment NVARCHAR(300),
    IsDeleted BIT,
    IsRead BIT,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE RatingReplies (
    ReplyID INT PRIMARY KEY,
    EmployeeID INT,
    RateID INT,
    Answer NVARCHAR(300),
    IsRead BIT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (RateID) REFERENCES ProductRatings(RateID)
);

CREATE TABLE Carts (
    CustomerID INT,
    ProductID INT,
    Quantity INT,
    PRIMARY KEY (CustomerID, ProductID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

/*******************************************************************************
   Schema for UI/UX Testing
********************************************************************************/