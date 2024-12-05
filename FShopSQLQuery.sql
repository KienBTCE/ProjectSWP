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
   Use prefix for attribute name of each table. Ex: Table Accounts have (a_id, a_fullName, a_email,...)
********************************************************************************/

CREATE TABLE Accounts (
	a_role VARCHAR(10) ,
	a_ID VARCHAR(10),
	a_fullName VARCHAR(255),
	a_userName VARCHAR(100) PRIMARY KEY,
	a_password VARCHAR(500),
	a_email VARCHAR(254),
	a_phoneNumber VARCHAR(15),
	a_address VARCHAR(500),
	a_birthday DATE,
	a_gender CHAR(6) CHECK (a_Gender IN ('Male', 'Female', 'Other')),
	a_createAt DATETIME DEFAULT GETDATE(),
	a_status VARCHAR(20) DEFAULT 'Active',
	a_avatar TEXT
)

CREATE TABLE Phone (
    p_ID VARCHAR(10) PRIMARY KEY,
    p_fullName VARCHAR(255) NOT NULL,
    p_screen VARCHAR(100),
    p_camera VARCHAR(100),
    p_RAM INT,
    p_ROM INT,
    p_size VARCHAR(50),
    p_weight FLOAT,
    p_price DECIMAL(10, 2) NOT NULL, 
    p_image VARCHAR(255),
    p_description TEXT,
    p_brandId VARCHAR(20),
    p_categoryId VARCHAR(20)
)

CREATE TABLE Laptop (
    lt_ID VARCHAR(20) PRIMARY KEY,
    lt_fullName VARCHAR(255) NOT NULL,
    lt_CPU VARCHAR(100),
    lt_GPU VARCHAR(100),
    lt_RAM INT,
    lt_ROM INT,
    lt_screen VARCHAR(100),
    lt_camera VARCHAR(100),
    lt_size VARCHAR(50),
    lt_weight FLOAT,
    lt_lightKeyboard BINARY,
    lt_connectionPort TEXT,
    lt_price DECIMAL(10, 2) NOT NULL,
    lt_image VARCHAR(255),
    lt_description TEXT,
    lt_brandId VARCHAR(20),
    lt_categoryId VARCHAR(20)
)
CREATE TABLE Cart (
	username VARCHAR(100) ,
	productId VARCHAR(20),
	primary key (userName, productId),
	quantity INT,
	FOREIGN KEY (username) REFERENCES Accounts(a_userName)
)

CREATE TABLE [Order] (
    orderID INT PRIMARY KEY IDENTITY(1,1),
    username VARCHAR(100) NOT NULL,
    fullname VARCHAR(100) NOT NULL,
    address TEXT NOT NULL,
    productID INT, -- Consider removing if not required at the order level
    orderedDate DATE NOT NULL,
    orderShippedDate DATE,
    paymentMethod VARCHAR(20) NOT NULL,
    status VARCHAR(20) NOT NULL,
    totalAmount DECIMAL(10, 2) NOT NULL,
    discount DECIMAL(10, 2),
    FOREIGN KEY (username) REFERENCES Accounts(a_userName)
)
CREATE TABLE OrderDetail (
    OrderID INT NOT NULL ,
    ProductID INT NOT NULL,
	PRIMARY KEY (OrderID, ProductID),
    Quantity INT NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES [Order](OrderID)
)


