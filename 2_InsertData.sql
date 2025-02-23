﻿USE FShop;

-- Insert Roles
INSERT INTO Roles ([Name]) VALUES 
('Admin'),
('Shop Manager'),
('Order Manager'),
('Warehouse Manager');

-- Insert Categories
INSERT INTO Categories ([Name]) 
VALUES 
('Laptop'), ('Smartphone'), ('Tablet'), ('Smartwatch'), ('Desktop'),
('Monitor'), ('Keyboard'), ('Mouse'), ('Headphone'), ('Speaker');

-- Insert Brands
INSERT INTO Brands ([Name]) 
VALUES 
('Apple'), ('Samsung'), ('Sony'), ('Huawei'), ('Xiaomi'),
('Dell'), ('HP'), ('Asus'), ('Lenovo'), ('Acer'),
('MSI'), ('Microsoft'), ('Google'), ('LG'), ('Razer');

-- Insert Suppliers
INSERT INTO Suppliers (SupplierID, TaxID, [Name], Email, PhoneNumber, Address, CreatedDate, LastModify, IsDeleted, IsActivate) 
VALUES 
(1, '0100101234', 'TechGear Solutions', 'contact@techgear.com', '0901234567', '123 Tech Street, District 1, Ho Chi Minh City', GETDATE(), GETDATE(), 0, 1),
(2, '0200101235', 'GadgetWorld', 'info@gadgetworld.vn', '0912345678', '456 Innovation Blvd, District 3, Ho Chi Minh City', GETDATE(), GETDATE(), 0, 1),
(3, '0300101236', 'DigitalZone', 'support@digitalzone.vn', '0923456789', '789 Digital Avenue, District 5, Ho Chi Minh City', GETDATE(), GETDATE(), 0, 1),
(4, '0400101237', 'SmartTech Supplies', 'sales@smarttech.vn', '0934567890', '101 Future Drive, District 7, Ho Chi Minh City', GETDATE(), GETDATE(), 0, 0),
(5, '0500101238', 'NextGen Electronics', 'hello@nextgen.vn', '0945678901', '202 Silicon Valley, District 2, Ho Chi Minh City', GETDATE(), GETDATE(), 0, 0);

-- Insert Attributes
INSERT INTO Attributes ([Name])
VALUES
('Processor'), ('RAM'), ('Storage'),
('Camera'), ('Battery'), ('Screen Size');

-- Insert Products
INSERT INTO Products (BrandID, CategoryID, Model, FullName, [Description], [Image], Price)
VALUES 
(1, 1, 'Macbook Pro 14', 'Apple Macbook Pro 14 inch M1 Pro chip', 'New model from Apple', '250-7038-macbook-pro-2021-apple-m1-1.jpg', 50000000),
(2, 2, 'Galaxy S23 Ultra', 'Samsung Galaxy S23 Ultra 5G 256GB', 'Latest flagship from Samsung', 'samsung-galaxy-s23-xanh-600x600-1.jpg', 30000000),
(3, 1, 'Sony Vaio Z900', 'Sony Vaio Z900 Core i7 16GB RAM', 'High-performance laptop', 'vaio-z900.jpg', 20000000);

-- Insert AttributeDetails
INSERT INTO AttributeDetails (AttributeID, ProductID, AttributeInfor)
VALUES
(1, 1, 'Apple M1 Pro'),
(4, 2, '48MP + 12MP + 12MP'),
(6, 2, '6.8 inches'),
(1, 3, 'Intel Core i7-1185G7'),
(2, 3, '16GB'),
(3, 3, '512GB SSD');

-- Insert Customers
INSERT INTO Customers (FullName, Birthday, [Password], PhoneNumber, Email, Gender, CreatedDate, IsBlock, IsDeleted, Avatar)
VALUES 
('Nguyen Van A', '1995-05-15', '6ad14ba9986e3615423dfca256d04e3f', '0901234567', 'nguyenvana@example.com', 'Male', GETDATE(), 0, 0, 'avatar1.jpg');


-- Insert Orders
INSERT INTO Orders (CustomerID, FullName, [Address], PhoneNumber, OrderedDate, DeliveredDate, Status, TotalAmount)
VALUES 
(1, 'Nguyen Van A', '123 Tech Street, District 1, Ho Chi Minh City', '0901234567', GETDATE(), NULL, 1, 50000000);

INSERT INTO OrderDetails VALUES (1, 1, 3, 50000000);


-- Insert Employees
SET IDENTITY_INSERT Employees ON;
INSERT INTO Employees (EmployeeID, FullName, Birthday, [Password], PhoneNumber, Email, Gender, CreatedDate, Avatar, RoleID) VALUES
(1, 'Nguyen Van A', '1990-01-01', 'encrypted_password_here', '0123456789', 'nguyen.vana@example.com', 'Male', GETDATE(), 'avatar_image.jpg', 1),
(2, 'Nguyen Van B', '1990-01-01', 'encrypted_password_here', '0123456788', 'nguyen.vanb@example.com', 'Male', GETDATE(), 'avatar_image.jpg', 4);
SET IDENTITY_INSERT Employees OFF;

-- Insert Carts
INSERT INTO Carts (CustomerID, ProductID, Quantity)
VALUES 
(1, 1, 1),
(1, 2, 5);

-- Insert OrderStatus
INSERT INTO OrderStatus (ID, [Status])
VALUES 
(1, 'Waiting for acceptance'),
(2, 'Packaging'),
(3, 'Waiting for delivery'),
(4, 'Delivered'),
(5, 'Canceled');

-- Insert Addresses
INSERT INTO Addresses (CustomerID, AddressDetails, IsDefault)
VALUES 
(1, 'Ap Tra Coi A, My Huong, My Tu, Soc Trang', 1);

-- Insert ImportOrders
INSERT INTO ImportOrders (EmployeeID, SupplierID, ImportDate, TotalCost, LastModify)
VALUES
(2, 1, GETDATE(), 100000000, GETDATE()),
(2, 2, GETDATE(), 50000000, GETDATE());

-- Insert ImportOrderDetails
INSERT INTO ImportOrderDetails (IOID, ProductID, Quantity, ImportPrice)
VALUES
(1, 1, 10, 45000000),
(2, 2, 20, 28000000),
(2, 3, 15, 18000000);