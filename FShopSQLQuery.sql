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

CREATE TABLE [Roles] (
	[roleID] INT Primary key,
	[name] NVARCHAR(50) NOT NULL
);

CREATE TABLE Accounts (
	a_ID INT PRIMARY KEY IDENTITY (1,1),
	phoneNumber VARCHAR(15) UNIQUE NOT NULL,
	email VARCHAR(254),
	[password] VARCHAR(500) NOT NULL,
	fullName VARCHAR(255) NOT NULL,
	birthday DATE NOT NULL,
	gender CHAR(6) CHECK (gender IN ('Male', 'Female', 'Other')),
	createAt DATETIME DEFAULT GETDATE(),
	[status] VARCHAR(20) DEFAULT 'Active',
	avatar TEXT,
	roleID INT NOT NULL,
	loyalPoint BIGINT,
	FOREIGN KEY (roleID) REFERENCES [Roles](roleID)
);

CREATE UNIQUE INDEX UQ_Email 
ON Accounts(email) 
WHERE email IS NOT NULL;

CREATE TABLE Addresses (
	a_ID INT,
	street NTEXT NOT NULL,
	ward NVARCHAR(100) NOT NULL,
	district NVARCHAR(100) NOT NULL,
	city NVARCHAR(100) NOT NULL,
	FOREIGN KEY (a_ID) REFERENCES Accounts(a_ID)
);

CREATE TABLE Categories (
	ct_ID INT PRIMARY KEY,
	typeName VARCHAR(100) NOT NULL
);

CREATE TABLE Brands (
	brandID INT PRIMARY KEY,
	brandName NVARCHAR(255) NOT NULL
);

CREATE TABLE Suppliers (
	supplierID INT PRIMARY KEY,
	supplierName NVARCHAR(255) NOT NULL,
	[address] NTEXT NOT NULL,
	phoneNumber VARCHAR(30) NOT NULL,
	email VARCHAR(50) NOT NULL
);

CREATE TABLE Products (
	model VARCHAR(20),
	pd_ID INT UNIQUE IDENTITY(1,1),
	PRIMARY KEY (model),
	brandID INT,
	fullName VARCHAR(255) NOT NULL,
	[status] VARCHAR(20) CHECK ([status] IN ('Available', 'Comming Soon', 'Sold Out')) DEFAULT 'Available',
	note VARCHAR(500),
	quantity INT NOT NULL,
	price INT NOT NULL,
	importDate DATE,
	categoryID INT NOT NULL,
	supplierID INT,
	FOREIGN KEY (categoryID) REFERENCES Categories(ct_ID),
	FOREIGN KEY (brandID) REFERENCES Brands(brandID),
	FOREIGN KEY (supplierID) REFERENCES Suppliers(supplierID)
);

CREATE TABLE Phones (
	pd_ID INT,
	screen VARCHAR(100),
	camera VARCHAR(100),
	RAM INT,
	ROM INT,
	chip VARCHAR(100),
	size VARCHAR(50),
	[weight] FLOAT,
	[image] VARCHAR(255),
	[description] TEXT,
	FOREIGN KEY (pd_ID) REFERENCES Products(pd_ID),
	PRIMARY KEY (pd_ID)
);

CREATE TABLE Laptops (
	pd_ID INT PRIMARY KEY,
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
	FOREIGN KEY (pd_ID) REFERENCES Products(pd_ID)
);

CREATE TABLE Carts (
	a_ID INT,
	pd_ID INT,
	quantity INT NOT NULL,
	FOREIGN KEY (a_ID) REFERENCES Accounts(a_ID),
	FOREIGN KEY (pd_ID) REFERENCES Products(pd_ID)
);

CREATE TABLE [Orders] (
	orderID INT PRIMARY KEY IDENTITY(1,1),
	a_ID INT NOT NULL,
	fullName VARCHAR(100) NOT NULL,
	[address] NTEXT NOT NULL,
	a_phoneNumber VARCHAR(15) NOT NULL,
	orderedDate DATETIME DEFAULT GETDATE(),
	orderShippedDate DATE,
	paymentMethod VARCHAR(20) NOT NULL,
	[status] VARCHAR(20) NOT NULL DEFAULT 'Ordered Successful',
	totalAmount INT NOT NULL,
	discount DECIMAL(10, 2),
	FOREIGN KEY (a_ID) REFERENCES Accounts(a_ID)
);

CREATE TABLE OrderDetails (
	orderID INT NOT NULL,
	pd_ID INT NOT NULL,
	PRIMARY KEY (orderID, pd_ID),
	quantity INT NOT NULL,
	price INT NOT NULL,
	FOREIGN KEY (orderID) REFERENCES [Orders](orderID)
);

CREATE TABLE Blogs (
	blogID INT PRIMARY KEY IDENTITY (1,1),
	writer INT,
	blogTitle NTEXT,
	content NTEXT,
	images TEXT,
	datePost DATE DEFAULT GETDATE(),
	FOREIGN KEY (writer) REFERENCES Accounts(a_ID)
);

CREATE TABLE BlogImages (
	[image] TEXT,
	blogID INT,
	FOREIGN KEY (blogID) REFERENCES Blogs(blogID)
);

/*******************************************************************************
   Schema for UI/UX Testing
********************************************************************************/

SET IDENTITY_INSERT Products ON;

INSERT INTO Categories VALUES (1, 'Laptop'), (2, 'Smartphone');

INSERT INTO Brands (brandID, brandName) 
VALUES 
(1, 'Apple'),
(2, 'Samsung'),
(3, 'Sony'),
(4, 'Huawei'),
(5, 'Xiaomi'),
(6, 'Dell'),
(7, 'HP'),
(8, 'Asus'),
(9, 'Lenovo'),
(10, 'Acer'),
(11, 'MSI'),
(12, 'Microsoft'),
(13, 'Google'),
(14, 'LG'),
(15, 'Razer'),
(16, 'Vivo');

INSERT INTO Suppliers (supplierID, supplierName, [address], phoneNumber, email)
VALUES 
(1, 'TechGear Solutions', '123 Tech Street, District 1, Ho Chi Minh City', '0901234567', 'contact@techgear.com'),
(2, 'GadgetWorld', '456 Innovation Blvd, District 3, Ho Chi Minh City', '0912345678', 'info@gadgetworld.vn'),
(3, 'DigitalZone', '789 Digital Avenue, District 5, Ho Chi Minh City', '0923456789', 'support@digitalzone.vn'),
(4, 'SmartTech Supplies', '101 Future Drive, District 7, Ho Chi Minh City', '0934567890', 'sales@smarttech.vn'),
(5, 'NextGen Electronics', '202 Silicon Valley, District 2, Ho Chi Minh City', '0945678901', 'hello@nextgen.vn');

INSERT INTO Products(pd_ID, brandID, model, fullName, quantity, [status], price, categoryID) 
VALUES 
(1, 8, '14XHMY', 'Zenbook 14XHMY', 10, 'Available', 28909000, 1), -- Asus, Laptop
(2, 1, '12XHMY', 'iPhone 15 Pro Max 256GB', 10, 'Available', 32529000, 2), -- Apple, Smartphone
(3, 2, '7XGLX', 'Galaxy S23 512GB', 10, 'Available', 25899000, 2), -- Samsung, Smartphone
(4, 9, '15LGXHYM', 'Legion Pro 15GXH', 10, 'Available', 38909000, 1), -- Lenovo, Laptop
(5, 8, 'A17FA706', 'Asus Tuf Gamming 17FA', 10, 'Available', 31909000, 1), -- Asus, Laptop
(6, 11, 'b8vf406ca', 'MSI Katana Gamming B8VF', 10, 'Available', 33909000, 1), -- MSI, Laptop
(7, 1, 'MCBP2021', 'Macbook Pro 2021', 10, 'Available', 45909000, 1), -- Apple, Laptop
(8, 6, 'D9C72G1', 'Dell Gamming G15 551', 10, 'Available', 35909000, 1); -- Dell, Laptop


INSERT INTO Laptops(pd_ID, [image]) 
VALUES 
(1, '250-8562-line-laptop.png'),
(4, '0yp3jx9d-1090-lenovo-legion-pro-5-y9000p-2023-core-i9-13900hx-16gb-1tb-rtx-4050-6gb-16-wqxga-240hz-new.jpg'),
(5, 'ASUS-TUF-Gaming-A17-FA706-600x600.jpg'),
(6, '5e0dkkrb-1411-msi-katana-gaming-a15-ai-b8vf-406ca-amd-ryzen-r9-8945hs-32gb-1tb-rtx-4060-8gb-15-6-144hz-fhd-new.jpg'),
(7, '250-7038-macbook-pro-2021-apple-m1-1.jpg'),
(8, '45606_dell_gaming_5511_dark_grey_ha3.jpg');

INSERT INTO Phones(pd_ID, [image]) 
VALUES 
(2, 'iphone-16-pro-max-black-thumb-600x600.jpg'),
(3, 'samsung-galaxy-s23-xanh-600x600-1.jpg');


-- Insert roles
INSERT INTO [Roles] 
VALUES 
    (1, 'Admin'), 
    (2, 'Manager'), 
    (3, 'Staff'), 
    (4, 'Customer');

-- Insert account
INSERT INTO Accounts (phoneNumber, email, [password], fullName, birthday, gender, avatar, roleID)
VALUES 
    ('0888888888', 'abc123@gmail.com', 'user1', 'User NoName', '2004-01-01', 'Male', 'avatar', 4);

-- Insert into Carts
INSERT INTO Carts 
VALUES 
    (1, 1, 1),
    (1, 2, 1),
    (1, 5, 1),
    (1, 7, 5),
    (1, 7, 5);

-- Insert into Orders
INSERT INTO [Orders] (a_ID, fullName, a_phoneNumber, [address], paymentMethod, totalAmount) 
VALUES 
    (1, 'Nguyen Van a', '034xxxxxxx', N'Địa chỉ có dấu', 'Delivery', 100000000);

-- Turn off identity insert for Products
SET IDENTITY_INSERT Products OFF;

-- Query Orders ordered by orderID
SELECT * 
FROM Orders
ORDER BY orderID DESC;

-- Query OrderDetails
SELECT * 
FROM OrderDetails;

-- Query Carts
SELECT * 
FROM Carts;

-- Query Accounts
SELECT * 
FROM Accounts;

-- Query Products
SELECT * 
FROM Products;

SELECT * 
FROM Laptops;

SELECT * 
FROM Phones;

-- Delete from Carts
-- DELETE FROM Carts WHERE pd_ID = 2 AND a_ID LIKE 'user1';

-- Query for Laptops with specific brand and price range

SELECT * 
FROM Laptops 
JOIN Products ON Laptops.pd_ID = Products.pd_ID
WHERE Laptops.pd_ID IN (
    SELECT pd_ID 
    FROM Products 
    WHERE pd_ID IN (SELECT pd_ID FROM Laptops) 
      AND brandID IN (9) 
      AND (price BETWEEN 25000000 AND 30000000 OR price BETWEEN 35000000 AND 40000000)
);

-- Query for Laptops with Asus brand and specific price range
SELECT * 
FROM Laptops 
JOIN Products ON Laptops.pd_ID = Products.pd_ID
WHERE Laptops.pd_ID IN (
    SELECT pd_ID 
    FROM Products 
    WHERE pd_ID IN (SELECT pd_ID FROM Laptops) 
      AND brandID IN (8) 
      AND (price BETWEEN 25000000 AND 30000000 OR price BETWEEN 30000000 AND 35000000)
);

SELECT * FROM Products p join Phones l on p.pd_ID = l.pd_ID
SELECT * FROM Laptops
SELECT * FROM Phones
SELECT * FROM Suppliers



SELECT * FROM Laptops JOIN Products
ON Laptops.pd_ID = Products.pd_ID
JOIN Suppliers
ON Products.brandID = Suppliers.supplierID
WHERE Suppliers.supplierName = 'TechGear Solutions' AND price BETWEEN 25000000 AND 30000000