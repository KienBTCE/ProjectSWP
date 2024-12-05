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
   User camelCase for name of attribute. Ex: fullDateOfCreateAccount
   Use prefix for attribute name of each table. Ex: Table Accounts have (a_id, a_fullName, a_email,...)
********************************************************************************/

CREATE TABLE Accounts (
	a_role VARCHAR(10),
	a_id VARCHAR(10),
	a_fullName VARCHAR(100),
	a_userName VARCHAR(100),
	a_password VARCHAR(500),
	a_email VARCHAR(254),
	a_phoneNumber VARCHAR(15),
	a_address VARCHAR(500),
	a_birthday DATE,
	a_gender CHAR(5) CHECK (a_Gender IN ('Mal', 'Female', 'Other')),
	a_createTime DATETIME DEFAULT GETDATE(),
	a_status VARCHAR(20) DEFAULT 'Active',
	a_avatar TEXT
)