USE [master]
GO

/*******************************************************************************
   Drop database if it exists
********************************************************************************/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'FShop')
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
   Use camelCase for name of attribute. Ex: fullDateOfCreateAccount
   Consider use prefix for attribute name of each table. Ex: Table Accounts have (a_id, a_fullName, a_email,...)
********************************************************************************/

CREATE TABLE Accounts (
	a_ID VARCHAR(20) PRIMARY KEY, -- As a role

	a_userName VARCHAR(100) NOT NULL,
	a_password VARCHAR(500) NOT NULL,

	a_fullName VARCHAR(255),
	birthday DATE,
	gender CHAR(6) CHECK (gender IN ('Male', 'Female', 'Other')),

	phoneNumber VARCHAR(15),
	email VARCHAR(254),
	createAt DATETIME DEFAULT GETDATE(),
	[status] VARCHAR(20) DEFAULT 'Active',
	avatar TEXT
)

CREATE TABLE Addresses (
	a_ID VARCHAR(20),
	[address] VARCHAR(500) UNIQUE,
	FOREIGN KEY (a_ID) REFERENCES Accounts(a_ID)
)

CREATE TABLE Products (
	pd_ID VARCHAR(20),
	brand VARCHAR(20),
	pd_SKU INT UNIQUE IDENTITY(1,1),

	PRIMARY KEY (pd_ID, brand),

	[status] VARCHAR(20) CHECK ([status] IN ('Available', 'Comming Soon', 'Sold Out')),
	note VARCHAR(500),
	quantity INT NOT NULL
)

CREATE TABLE Phones (
    pd_ID VARCHAR(20),
	brand VARCHAR(20),

    fullName VARCHAR(255) NOT NULL,
    screen VARCHAR(100),
    camera VARCHAR(100),
    RAM INT,
    ROM INT,
	chip VARCHAR(100),
    size VARCHAR(50),
    [weight] FLOAT,

    price DECIMAL(10, 2) NOT NULL, 

    [image] VARCHAR(255),
    [description] TEXT,
    categoryId VARCHAR(20),
	FOREIGN KEY (pd_ID, brand) REFERENCES Products(pd_ID, brand)
)

CREATE TABLE Laptops (
    pd_ID VARCHAR(20),
	brand VARCHAR(20),

    fullName VARCHAR(255) NOT NULL,
    screen VARCHAR(100),
    camera VARCHAR(100),
    RAM INT,
    ROM INT,
    CPU VARCHAR(100),
    GPU VARCHAR(100),
    size VARCHAR(50),
    connectionPort TEXT,
    lightKeyboard BINARY,
    [weight] FLOAT,

    price DECIMAL(10, 2) NOT NULL,

    [image] VARCHAR(255),
    [description] TEXT,
    categoryId VARCHAR(20),
	FOREIGN KEY (pd_ID, brand) REFERENCES Products(pd_ID, brand)
)

CREATE TABLE Categories (
	ct_ID VARCHAR(20), -- this attribute will not change, follow to product to present type of product
	pd_SKU INT,
	PRIMARY KEY (ct_ID, pd_SKU),
	typeName VARCHAR(100),
	FOREIGN KEY (pd_SKU) REFERENCES Products(pd_SKU)
)

-- KIEN DA CHECK DEN CHO NAY HEHE :D MAI CHECK TIEP KEKE

CREATE TABLE Carts (
	a_ID VARCHAR(20),
	productId VARCHAR(20),
	PRIMARY KEY (a_ID, productId),
	quantity INT NOT NULL,
	FOREIGN KEY (a_ID) REFERENCES Accounts(a_ID)
)

CREATE TABLE [Orders] (
    orderID INT PRIMARY KEY IDENTITY(1,1),
    a_ID VARCHAR(20) NOT NULL,
    fullName VARCHAR(100) NOT NULL,
    [address] TEXT NOT NULL,
    productID VARCHAR(20), -- Consider removing if not required at the order level
    orderedDate DATE NOT NULL,
    orderShippedDate DATE,
    paymentMethod VARCHAR(20) NOT NULL,
    [status] VARCHAR(20) NOT NULL,
    totalAmount DECIMAL(10, 2) NOT NULL,
    discount DECIMAL(10, 2),
    FOREIGN KEY (a_ID) REFERENCES Accounts(a_ID)
)

CREATE TABLE OrderDetails (
    OrderID INT NOT NULL ,
    ProductID VARCHAR(20) NOT NULL,
	PRIMARY KEY (OrderID, ProductID),
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES [Orders](OrderID)
)
