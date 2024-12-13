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

	fullName VARCHAR(255) NOT NULL,

	[status] VARCHAR(20) CHECK ([status] IN ('Available', 'Comming Soon', 'Sold Out')) DEFAULT 'Available',
	note VARCHAR(500),
	quantity INT NOT NULL,
	[productType] VARCHAR(100) NOT NULL,

	price INT NOT NULL,
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

    screen VARCHAR(100),
    camera VARCHAR(100),
    RAM INT,
    ROM INT,
	chip VARCHAR(100),
    size VARCHAR(50),
    [weight] FLOAT,

    [image] VARCHAR(255),
    [description] TEXT,
	FOREIGN KEY (pd_SKU) REFERENCES Products(pd_SKU)
)

CREATE TABLE Laptops (
	pd_SKU INT  PRIMARY KEY,

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
    totalAmount INT NOT NULL,
    discount DECIMAL(10, 2),
    FOREIGN KEY (a_ID) REFERENCES Accounts(a_ID)
)

CREATE TABLE OrderDetails (
    OrderID INT NOT NULL ,
    pd_SKU INT NOT NULL,
	PRIMARY KEY (OrderID, pd_SKU),
    Quantity INT NOT NULL,
    Price INT NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES [Orders](OrderID)
)

/*******************************************************************************
   Schema for UI/UX Testing
********************************************************************************/

SET IDENTITY_INSERT Products ON;

INSERT INTO Products(pd_SKU, brand, pd_ID, fullName, quantity, [status], [productType], price) VALUES (1, 'Asus', '14XHMY', 'Zenbook 14XHMY', 10, 'Available', 'Laptop', 28909000)
INSERT INTO Laptops(pd_SKU, [image]) VALUES (1, '250-8562-line-laptop.png')

INSERT INTO Products(pd_SKU, brand, pd_ID, fullName, quantity, [status], [productType], price) VALUES (2, 'Apple', '12XHMY', 'iPhone 15 Pro Max 256GB', 10, 'Available', 'SmartPhone', 32529000)
INSERT INTO Phones(pd_SKU, [image]) VALUES (2, 'iphone-16-pro-max-black-thumb-600x600.jpg')

INSERT INTO Products(pd_SKU, brand, pd_ID, fullName, quantity, [status], [productType], price) VALUES (3, 'Samsung', '7XGLX', 'Galaxy S23 512GB', 10, 'Available', 'SmartPhone', 25899000)
INSERT INTO Phones(pd_SKU, [image]) VALUES (3, 'samsung-galaxy-s23-xanh-600x600-1.jpg')

INSERT INTO Products(pd_SKU, brand, pd_ID, fullName, quantity, [status], [productType], price) VALUES (4, 'Lenovo', '15LGXHYM', 'Legion Pro 15GXH', 10, 'Available', 'Laptop', 38909000)
INSERT INTO Laptops(pd_SKU, [image]) VALUES (4, '0yp3jx9d-1090-lenovo-legion-pro-5-y9000p-2023-core-i9-13900hx-16gb-1tb-rtx-4050-6gb-16-wqxga-240hz-new.jpg')

INSERT INTO Products(pd_SKU, brand, pd_ID, fullName, quantity, [status], [productType], price) VALUES (5, 'Asus', 'A17FA706', 'Asus Tuf Gamming 17FA', 10, 'Available', 'Laptop', 31909000)
INSERT INTO Laptops(pd_SKU, [image]) VALUES (5, 'ASUS-TUF-Gaming-A17-FA706-600x600.jpg')

INSERT INTO Products(pd_SKU, brand, pd_ID, fullName, quantity, [status], [productType], price) VALUES (6, 'MSI', 'b8vf406ca', 'MSI Katana Gamming B8VF', 10, 'Available', 'Laptop', 33909000)
INSERT INTO Laptops(pd_SKU, [image]) VALUES (6, '5e0dkkrb-1411-msi-katana-gaming-a15-ai-b8vf-406ca-amd-ryzen-r9-8945hs-32gb-1tb-rtx-4060-8gb-15-6-144hz-fhd-new.jpg')

INSERT INTO Products(pd_SKU, brand, pd_ID, fullName, quantity, [status], [productType], price) VALUES (7, 'Apple', 'MCBP2021', 'Macbook Pro 2021', 10, 'Available', 'Laptop', 45909000)
INSERT INTO Laptops(pd_SKU, [image]) VALUES (7, '250-7038-macbook-pro-2021-apple-m1-1.jpg')

INSERT INTO Products(pd_SKU, brand, pd_ID, fullName, quantity, [status], [productType], price) VALUES (8, 'Dell', 'D9C72G1', 'Dell Gamming G15 551', 10, 'Available', 'Laptop', 35909000)
INSERT INTO Laptops(pd_SKU, [image]) VALUES (8, '45606_dell_gaming_5511_dark_grey_ha3.jpg')

SET IDENTITY_INSERT Products OFF;

INSERT INTO Accounts(a_ID, phoneNumber, email, [password], fullName, birthday, gender, avatar)
VALUES ('user1', '0888888888', 'abc123@gmail.com', 'user1', 'User NoName', '2004-01-01', 'Male', 'avatar')

INSERT INTO Carts VALUES ('user1', 1, 1),
('user1', 2, 1),
('user1', 5, 1),
('user1', 7, 1)