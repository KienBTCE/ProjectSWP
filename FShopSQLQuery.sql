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
	a_role VARCHAR(10) PRIMARY KEY,
	a_ID VARCHAR(10),
	a_fullName VARCHAR(255),
	a_userName VARCHAR(100),
	a_password VARCHAR(500),
	a_email VARCHAR(254),
	a_phoneNumber VARCHAR(15),
	a_address VARCHAR(500),
	a_birthday DATE,
	a_gender CHAR(5) CHECK (a_Gender IN ('Male', 'Female', 'Other')),
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
CREATE TABLE CART (
	userName VARCHAR(100),
	productId VARCHAR(20),
	primary key (userName, productId),
	quantity INT
)