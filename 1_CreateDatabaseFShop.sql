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
   ConsIDer use prefix for attribute Name of each table. Ex: Table Accounts have (a_ID, a_FullName, a_email,...)
********************************************************************************/

-- DROP TABLE IF EXISTS Wards;
-- DROP TABLE IF EXISTS Districts;
-- DROP TABLE IF EXISTS Provinces;
-- DROP TABLE IF EXISTS AdministrativeUnits;
-- DROP TABLE IF EXISTS AdministrativeRegions;


-----------------------------------------------------------------------------------
CREATE TABLE Roles (
    RoleID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(50)
);

CREATE TABLE Employees (
    AID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(255),
    Birthday DATE,
    Password VARCHAR(500),
    PhoneNumber VARCHAR(15) UNIQUE,
    Email VARCHAR(254),
    Gender CHAR(6),
    CreateAt DATETIME,
    Status VARCHAR(20),
    Avatar TEXT,
    RoleID INT,
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);


CREATE TABLE Categories (
    CID INT IDENTITY(1,1) PRIMARY KEY,
    TypeName NVARCHAR(100)
);

CREATE TABLE Attributes (
    AID INT IDENTITY(1,1) PRIMARY KEY,
    CID INT,
    AttributeName VARCHAR(100),
    FOREIGN KEY (CID) REFERENCES Categories(CID)
);


CREATE TABLE Brands (
    BrandID INT IDENTITY(1,1) PRIMARY KEY,
    BrandName NVARCHAR(50)
);

CREATE TABLE Suppliers (
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    SupplierName NVARCHAR(255),
    Address NTEXT,
    PhoneNumber VARCHAR(30),
    Email TEXT
);

CREATE TABLE InventoryHistories (
    InvenID INT IDENTITY(1,1) PRIMARY KEY,
    SKU INT,
    ImportDate DATE NOT NULL,
    Stock INT NOT NULL,
    ImportPrice INT NOT NULL,
);

CREATE TABLE ShopHistories (
    ShopID INT IDENTITY(1,1) PRIMARY KEY,
    InvenID INT,
    ExportDate DATE NOT NULL,
    Quantity INT NOT NULL,
    ExportPrice INT NOT NULL,
);

CREATE TABLE Products (
    SKU INT IDENTITY(1,1) PRIMARY KEY,
    BrandID INT,
    CategoryID INT,
    SupplierID INT,
    Model VARCHAR(50),
    FullName NVARCHAR(255) NOT NULL,
    [Status] VARCHAR(20) NOT NULL,
    InvenID INT NULL,
    ShopID INT NULL,
    FOREIGN KEY (BrandID) REFERENCES Brands(BrandID),
	FOREIGN KEY (CategoryID) REFERENCES Categories(CID),
    FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
);
   ALTER TABLE Products ADD CONSTRAINT FK_Products_InventoryHistories FOREIGN KEY (InvenID) REFERENCES InventoryHistories(InvenID);
   ALTER TABLE Products ADD CONSTRAINT FK_Products_ShopHistories FOREIGN KEY (ShopID) REFERENCES ShopHistories(ShopID);
   ALTER TABLE InventoryHistories ADD CONSTRAINT FK_InventoryHistories_Products FOREIGN KEY (SKU) REFERENCES Products(SKU);
   ALTER TABLE ShopHistories ADD CONSTRAINT FK_ShopHistories_InventoryHistories FOREIGN KEY (InvenID) REFERENCES InventoryHistories(InvenID);

CREATE TABLE AttributeDetails (
    AttributeInfor VARCHAR(100),
    AttributeID INT,
    PSKU INT,
    FOREIGN KEY (AttributeID) REFERENCES Attributes(AID),
    FOREIGN KEY (PSKU) REFERENCES Products(SKU)
);

CREATE TABLE Customers (
    AID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(255),
    Birthday DATE,
    Password VARCHAR(500),
    PhoneNumber VARCHAR(15) UNIQUE,
    Email VARCHAR(254),
    Gender CHAR(6),
    CreateAt DATETIME,
    Status VARCHAR(20),
    Avatar TEXT,
    LoyalPoint BIGINT
);

CREATE TABLE Addresses (
    AddressID INT IDENTITY(1,1) PRIMARY KEY,
    AID INT,
    City NVARCHAR(100),
    Street NVARCHAR(100),
    Ward NVARCHAR(100),
    Province NVARCHAR(100),
    District NVARCHAR(100),
    FOREIGN KEY (AID) REFERENCES Customers(AID)
);

CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    AID INT,
    FullName NVARCHAR(100),
    Address NTEXT,
    APhoneNumber VARCHAR(15),
    OrderDate DATETIME,
    OrderShippedDate DATETIME,
    Payment INT,
    Status VARCHAR(20),
    TotalAmount INT,
    Discount DECIMAL(10,2),
    FOREIGN KEY (AID) REFERENCES Customers(AID)
);

CREATE TABLE OrderDetails (
    OrderID INT,
    PSKU INT,
    Quantity INT,
    Price INT,
    PRIMARY KEY (OrderID, PSKU),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (PSKU) REFERENCES Products(SKU)
);

CREATE TABLE PaymentHistories (
    PhID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT,
    PaIDAmount INT,
    RemainingAmount INT,
    Status NVARCHAR(20),
    PaymentDate DATE,
    PaymentMethod NVARCHAR(20),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

CREATE TABLE Carts (
    AID INT FOREIGN KEY (AID) REFERENCES Customers(AID),
    SKU INT FOREIGN KEY (SKU) REFERENCES Products(SKU),
    Quantity INT,
    PRIMARY KEY (AID, SKU)
);


-- CREATE AdministrativeRegions TABLE
CREATE TABLE AdministrativeRegions (
	ID integer NOT NULL,
	Name varchar(255) NOT NULL,
	NameEn varchar(255) NOT NULL,
	CodeName varchar(255) NULL,
	CodeNameEn varchar(255) NULL,
	CONSTRAINT AdministrativeRegions_pkey PRIMARY KEY (ID)
);


-- CREATE AdministrativeUnits TABLE
CREATE TABLE AdministrativeUnits (
	ID integer NOT NULL,
	FullName nvarchar(255) NULL,
	FullNameEn varchar(255) NULL,
	ShortName varchar(255) NULL,
	ShortNameEn varchar(255) NULL,
	CodeName varchar(255) NULL,
	CodeNameEn varchar(255) NULL,
	CONSTRAINT AdministrativeUnits_pkey PRIMARY KEY (ID)
);


-- CREATE Provinces TABLE
CREATE TABLE Provinces (
	Code varchar(20) NOT NULL,
	Name nvarchar(255) NOT NULL,
	NameEn varchar(255) NULL,
	FullName nvarchar(255) NOT NULL,
	FullNameEn varchar(255) NULL,
	CodeName varchar(255) NULL,
	AdministrativeUnitID integer NULL,
	AdministrativeRegionID integer NULL,
	CONSTRAINT Provinces_pkey PRIMARY KEY (Code)
);


-- Provinces foreign keys

ALTER TABLE Provinces ADD CONSTRAINT Provinces_AdministrativeRegionID_fkey FOREIGN KEY (AdministrativeRegionID) REFERENCES AdministrativeRegions(ID);
ALTER TABLE Provinces ADD CONSTRAINT Provinces_AdministrativeUnitID_fkey FOREIGN KEY (AdministrativeUnitID) REFERENCES AdministrativeUnits(ID);

CREATE INDEX IDx_Provinces_region ON Provinces(AdministrativeRegionID);
CREATE INDEX IDx_Provinces_unit ON Provinces(AdministrativeUnitID);


-- CREATE Districts TABLE
CREATE TABLE Districts (
	Code varchar(20) NOT NULL,
	Name nvarchar(255) NOT NULL,
	NameEn varchar(255) NULL,
	FullName nvarchar(255) NULL,
	FullNameEn varchar(255) NULL,
	CodeName varchar(255) NULL,
	ProvinceCode varchar(20) NULL,
	AdministrativeUnitID integer NULL,
	CONSTRAINT Districts_pkey PRIMARY KEY (Code)
);


-- Districts foreign keys

ALTER TABLE Districts ADD CONSTRAINT Districts_AdministrativeUnitID_fkey FOREIGN KEY (AdministrativeUnitID) REFERENCES AdministrativeUnits(ID);
ALTER TABLE Districts ADD CONSTRAINT Districts_ProvinceCode_fkey FOREIGN KEY (ProvinceCode) REFERENCES Provinces(Code);

CREATE INDEX IDx_Districts_Province ON Districts(ProvinceCode);
CREATE INDEX IDx_Districts_unit ON Districts(AdministrativeUnitID);


-- CREATE Wards TABLE
CREATE TABLE Wards (
	Code varchar(20) NOT NULL,
	Name nvarchar(255) NOT NULL,
	NameEn varchar(255) NULL,
	FullName nvarchar(255) NULL,
	FullNameEn varchar(255) NULL,
	CodeName varchar(255) NULL,
	DistrictCode varchar(20) NULL,
	AdministrativeUnitID integer NULL,
	CONSTRAINT Wards_pkey PRIMARY KEY (Code)
);


-- Wards foreign keys

ALTER TABLE Wards ADD CONSTRAINT Wards_AdministrativeUnitID_fkey FOREIGN KEY (AdministrativeUnitID) REFERENCES AdministrativeUnits(ID);
ALTER TABLE Wards ADD CONSTRAINT Wards_DistrictCode_fkey FOREIGN KEY (DistrictCode) REFERENCES Districts(Code);

CREATE INDEX IDx_Wards_district ON Wards(DistrictCode);
CREATE INDEX IDx_Wards_unit ON Wards(AdministrativeUnitID);
/*******************************************************************************
   Schema for UI/UX Testing
********************************************************************************/

