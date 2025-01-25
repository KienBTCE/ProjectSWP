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

-- CREATE Roles TABLE

CREATE TABLE Roles (
    RoleID INT IDENTITY(1,1) PRIMARY KEY,
    [Name] NVARCHAR(50)
);

-- CREATE Employees TABLE

CREATE TABLE Employees (
    AID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(255),
    Birthday DATE,
    [Password] VARCHAR(500),
    PhoneNumber VARCHAR(15) UNIQUE,
    Email VARCHAR(254),
    Gender CHAR(6) CHECK (gender IN ('Male', 'Female', 'Other')),
    CreateAt DATETIME DEFAULT GETDATE(),
    [Status] VARCHAR(20) DEFAULT 'Active',
    Avatar TEXT,
    RoleID INT,
    FOREIGN KEY (RoleID) REFERENCES Roles(RoleID)
);

-- CREATE Categories TABLE

CREATE TABLE Categories (
    CID INT IDENTITY(1,1) PRIMARY KEY,
    TypeName NVARCHAR(100) NOT NULL
);

-- CREATE Attributes TABLE

CREATE TABLE Attributes (
    AID INT IDENTITY(1,1) PRIMARY KEY,
    CID INT NOT NULL,
    AttributeName VARCHAR(100) NOT NULL,
    FOREIGN KEY (CID) REFERENCES Categories(CID)
);

-- CREATE Brands TABLE

CREATE TABLE Brands (
    BrandID INT IDENTITY(1,1) PRIMARY KEY,
    BrandName NVARCHAR(50) NOT NULL
);

-- CREATE Suppliers TABLE

CREATE TABLE Suppliers (
    SupplierID INT IDENTITY(1,1) PRIMARY KEY,
    [Name] NVARCHAR(255),
    [Address] NTEXT,
    PhoneNumber VARCHAR(30),
    Email TEXT
);




-- CREATE Products TABLE

CREATE TABLE Products (
    SKU INT IDENTITY(1,1) PRIMARY KEY,
    BrandID INT,
    CategoryID INT,
    SupplierID INT,
    Model VARCHAR(50),
    FullName NVARCHAR(255) NOT NULL,
    [Status] NVARCHAR(20) NOT NULL,
	Quantity INT,
	Stock INT,
    SellID INT,
	[Image] TEXT,
    FOREIGN KEY (BrandID) REFERENCES Brands(BrandID),
	FOREIGN KEY (CategoryID) REFERENCES Categories(CID),
);

--CREATE InventoryProducts TABLE 

CREATE TABLE InventoryProducts (
	PackageID INT IDENTITY (1,1) Primary key,
	SKU INT,
	SupplierID INT NOT NULL,
	ProductCost BIGINT NOT NULL,
	Stock INT NOT NULL
	FOREIGN KEY (SKU) REFERENCES Products(SKU),
	FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID)
)

-- CREATE SellingHistories TABLE

CREATE TABLE ShopHistories (
    SellID INT IDENTITY(1,1) PRIMARY KEY,
    PackageID INT,
	EmployeeID INT,
    [Date] DATE NOT NULL,
    Quantity INT NOT NULL,
    Price BIGINT NOT NULL,
	FOREIGN KEY (PackageID) REFERENCES InventoryProducts(PackageID),
	FOREIGN KEY (EmployeeID) REFERENCES Employees(AID)
);

-- CREATE InventoryHistories TABLE

CREATE TABLE InventoryHistories (
    HistoryID INT IDENTITY(1,1) PRIMARY KEY,
    PackageID INT,
	EmployeeID INT NOT NULL,
    TransactionAt DATE NOT NULL,
	[Status] VARCHAR(255) NOT NULL,
    Quantity INT NOT NULL,
	FOREIGN KEY (PackageID) REFERENCES InventoryProducts(PackageID),
	FOREIGN KEY (EmployeeID) REFERENCES Employees(AID)

);

--CREATE ShopProducts TABLE

CREATE TABLE ShopProducts (
	SKU INT,
	PackageID INT,
	Price BIGINT NOT NULL,
	Quantity INT NOT NULL
	Primary key (SKU, PackageID),
	FOREIGN KEY (PackageID) REFERENCES InventoryProducts(PackageID),
	FOREIGN KEY (SKU) REFERENCES Products(SKU)

)

-- CREATE AttributeDetails TABLE

CREATE TABLE AttributeDetails (
    AttributeInfor VARCHAR(100),
    AttributeID INT,
    PSKU INT,
    FOREIGN KEY (AttributeID) REFERENCES Attributes(AID),
    FOREIGN KEY (PSKU) REFERENCES Products(SKU)
);

-- CREATE Customers TABLE

CREATE TABLE Customers (
    AID INT IDENTITY(1,1) PRIMARY KEY,
    FullName VARCHAR(255),
    Birthday DATE,
    [Password] VARCHAR(500),
    PhoneNumber VARCHAR(15) UNIQUE,
    Email VARCHAR(254) NOT NULL,
    Gender CHAR(6) CHECK (gender IN ('Male', 'Female', 'Other')),
    CreateAt DATETIME DEFAULT GETDATE(),
    [Status] VARCHAR(255),
    Avatar TEXT,
    LoyalPoint BIGINT
);

-- CREATE ProductRatings TABLE

CREATE TABLE ProductRatings(
	RateID INT IDENTITY(1,1) Primary key,
	CustomerID INT,
	SKU INT,
	Star INT,
	Comment NTEXT,
	[Status] VARCHAR(20)
	FOREIGN KEY (CustomerID) REFERENCES Customers(AID),
	FOREIGN KEY (SKU) REFERENCES Products(SKU)
)

-- CREATE RatingReplies TABLE

CREATE TABLE RatingReplies (
	ReplyID INT IDENTITY(1,1) Primary key,
	EmployeeID INT,
	RateID INT,
	Answer NTEXT
	FOREIGN KEY (EmployeeID) REFERENCES Employees(AID),
	FOREIGN KEY (RateID) REFERENCES ProductRatings(RateID)

)

-- CREATE Orders TABLE

CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    AID INT,
    FullName NVARCHAR(100),
    Address NTEXT,
    APhoneNumber VARCHAR(15),
    OrderDate DATETIME DEFAULT GETDATE(),
    DeliveredDate DATETIME,
    [Status] VARCHAR(255) NOT NULL DEFAULT 'Ordered Successful',
    TotalAmount BIGINT,
    Discount DECIMAL(10,2),
    FOREIGN KEY (AID) REFERENCES Customers(AID)
);

-- CREATE OrderDetails TABLE

CREATE TABLE OrderDetails (
    OrderID INT,
    PSKU INT,
    Quantity INT,
    Price BIGINT,
    PRIMARY KEY (OrderID, PSKU),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (PSKU) REFERENCES Products(SKU)
);

-- CREATE PaymentHistories TABLE

CREATE TABLE PaymentHistories (
    PhID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT,
    PaIDAmount INT,
    RemainingAmount INT,
    [Status] NVARCHAR(20),
    PaymentDate DATE,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- CREATE Carts TABLE

CREATE TABLE Carts (
    AID INT FOREIGN KEY (AID) REFERENCES Customers(AID),
    SKU INT FOREIGN KEY (SKU) REFERENCES Products(SKU),
    Quantity INT,
    PRIMARY KEY (AID, SKU)
);


-- CREATE AdministrativeRegions TABLE

CREATE TABLE AdministrativeRegions (
	ID INT NOT NULL,
	[Name] varchar(255) NOT NULL,
	NameEn varchar(255) NOT NULL,
	CodeName varchar(255) NOT NULL,
	CodeNameEn varchar(255) NOT NULL,
	CONSTRAINT AdministrativeRegions_pkey PRIMARY KEY (ID)
);


-- CREATE AdministrativeUnits TABLE

CREATE TABLE AdministrativeUnits (
	ID INT NOT NULL,
	FullName nvarchar(255) NOT NULL,
	FullNameEn varchar(255) NOT NULL,
	ShortName varchar(255) NOT NULL,
	ShortNameEn varchar(255) NOT NULL,
	CodeName varchar(255) NOT NULL,
	CodeNameEn varchar(255) NOT NULL,
	CONSTRAINT AdministrativeUnits_pkey PRIMARY KEY (ID)
);


-- CREATE Provinces TABLE

CREATE TABLE Provinces (
	Code varchar(20) NOT NULL,
	[Name] nvarchar(255) NOT NULL,
	NameEn varchar(255)  NOT NULL,
	FullName nvarchar(255) NOT NULL,
	FullNameEn varchar(255) NOT NULL,
	CodeName varchar(255) NOT NULL,
	AdministrativeUnitID INT NOT NULL,
	AdministrativeRegionID INT NOT NULL,
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
	[Name] nvarchar(255) NOT NULL,
	NameEn varchar(255)  NOT NULL,
	FullName nvarchar(255) NOT NULL,
	FullNameEn varchar(255) NOT  NULL,
	CodeName varchar(255) NOT NULL,
	ProvinceCode varchar(20) NOT NULL,
	AdministrativeUnitID integer NOT NULL,
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
	NameEn varchar(255) NOT NULL,
	FullName nvarchar(255)  NOT NULL,
	FullNameEn varchar(255) NOT NULL,
	CodeName varchar(255) NOT NULL,
	DistrictCode varchar(20) NOT NULL,
	AdministrativeUnitID INT NOT NULL,
	CONSTRAINT Wards_pkey PRIMARY KEY (Code)
);


-- Wards foreign keys

ALTER TABLE Wards ADD CONSTRAINT Wards_AdministrativeUnitID_fkey FOREIGN KEY (AdministrativeUnitID) REFERENCES AdministrativeUnits(ID);
ALTER TABLE Wards ADD CONSTRAINT Wards_DistrictCode_fkey FOREIGN KEY (DistrictCode) REFERENCES Districts(Code);

CREATE INDEX IDx_Wards_district ON Wards(DistrictCode);
CREATE INDEX IDx_Wards_unit ON Wards(AdministrativeUnitID);

-- CREATE Cart TABLE

CREATE TABLE Addresses (
    AddressID INT IDENTITY(1,1) PRIMARY KEY,
    AID INT,
    IsDefault NVARCHAR(20),
    Street NVARCHAR(20),
    Ward VARCHAR(20),
    Province VARCHAR(20),
    District VARCHAR(20),
    FOREIGN KEY (AID) REFERENCES Customers(AID),
	FOREIGN KEY (Province) REFERENCES Provinces (Code),
	FOREIGN KEY (District) REFERENCES Districts (Code),
	FOREIGN KEY (Ward) REFERENCES Wards (Code)

);

/*******************************************************************************
   Schema for UI/UX Testing
********************************************************************************/

