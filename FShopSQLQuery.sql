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

	phoneNumber VARCHAR(15) UNIQUE NOT NULL,
	email VARCHAR(254),

	[password] VARCHAR(500) NOT NULL,

	fullName VARCHAR(255) NOT NULL,
	birthday DATE,
	gender CHAR(6) CHECK (gender IN ('Male', 'Female', 'Other')),

	createAt DATETIME DEFAULT GETDATE(),
	[status] VARCHAR(20) DEFAULT 'Active',
	avatar TEXT
)

-- email can null, and null is not unique, but email is unique
CREATE UNIQUE INDEX UQ_Email 
ON Accounts(email) 
WHERE email IS NOT NULL;


CREATE TABLE Addresses (
	a_ID VARCHAR(20),
	[address] VARCHAR(500) UNIQUE,
	FOREIGN KEY (a_ID) REFERENCES Accounts(a_ID)
)

CREATE TABLE Products (
	pd_ID VARCHAR(20) NOT NULL,
	brand VARCHAR(20) NOT NULL,
	pd_SKU INT UNIQUE IDENTITY(1,1) NOT NULL,

	PRIMARY KEY (pd_ID, brand),

	[status] VARCHAR(20) CHECK ([status] IN ('Available', 'Comming Soon', 'Sold Out')) DEFAULT 'Available',
	note VARCHAR(500),
	quantity INT NOT NULL
)

CREATE TABLE Categories (
	ct_ID INT IDENTITY(1,1), -- this attribute will not change, follow to product to present type of product
	pd_SKU INT,
	typeName VARCHAR(100),
	PRIMARY KEY (pd_SKU, typeName),
	FOREIGN KEY (pd_SKU) REFERENCES Products(pd_SKU)
)

CREATE TABLE Phones (
	pd_SKU INT PRIMARY KEY,

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
	FOREIGN KEY (pd_SKU) REFERENCES Products(pd_SKU)
)

CREATE TABLE Laptops (
	pd_SKU INT  PRIMARY KEY,

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
	FOREIGN KEY (pd_SKU) REFERENCES Products(pd_SKU)
)

CREATE TABLE Carts (
	a_ID VARCHAR(20),
	pd_SKU INT,
	PRIMARY KEY (a_ID, pd_SKU),
	quantity INT NOT NULL,
	FOREIGN KEY (a_ID) REFERENCES Accounts(a_ID),
	FOREIGN KEY (pd_SKU) REFERENCES Products(pd_SKU)
)

CREATE TABLE [Orders] (
    orderID INT PRIMARY KEY IDENTITY(1,1),

    a_ID VARCHAR(20) NOT NULL,
    fullName VARCHAR(100) NOT NULL,
    [address] TEXT NOT NULL,
    pd_SKU INT NOT NULL,
	a_phoneNumber VARCHAR(15) NOT NULL,
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
    pd_SKU INT NOT NULL,
	PRIMARY KEY (OrderID, pd_SKU),
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES [Orders](OrderID)
)