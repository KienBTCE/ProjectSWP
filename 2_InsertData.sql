USE FShop;

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
SET IDENTITY_INSERT Products ON;

INSERT INTO Products (BrandID, CategoryID, Model, FullName, [Description], [Image], Price)
VALUES 
(1, 1, 'Macbook Pro 14', 'Apple Macbook Pro 14 inch M1 Pro chip', 'New model from Apple', '250-7038-macbook-pro-2021-apple-m1-1.jpg', 50000000),
(2, 2, 'Galaxy S23 Ultra', 'Samsung Galaxy S23 Ultra 5G 256GB', 'Latest flagship from Samsung', 'samsung-galaxy-s23-xanh-600x600-1.jpg', 30000000),
(3, 1, 'Sony Vaio Z900', 'Sony Vaio Z900 Core i7 16GB RAM', 'High-performance laptop', 'vaio-z900.jpg', 20000000);

INSERT INTO Products(ProductID, brand, pd_ID, fullName, quantity, [status], [productType], price) VALUES (1, 'Asus', '14XHMY', 'Zenbook 14XHMY', 10, 'Available', 'Laptop', 28909000)
INSERT INTO Laptops(ProductID, [image]) VALUES (1, '250-8562-line-laptop.png')

INSERT INTO Products(ProductID, brand, pd_ID, fullName, quantity, [status], [productType], price) VALUES (2, 'Apple', '12XHMY', 'iPhone 15 Pro Max 256GB', 10, 'Available', 'SmartPhone', 32529000)
INSERT INTO Phones(ProductID, [image]) VALUES (2, 'iphone-16-pro-max-black-thumb-600x600.jpg')

INSERT INTO Products(ProductID, brand, pd_ID, fullName, quantity, [status], [productType], price) VALUES (3, 'Samsung', '7XGLX', 'Galaxy S23 512GB', 10, 'Available', 'SmartPhone', 25899000)
INSERT INTO Phones(ProductID, [image]) VALUES (3, 'samsung-galaxy-s23-xanh-600x600-1.jpg')

INSERT INTO Products(ProductID, brand, pd_ID, fullName, quantity, [status], [productType], price) VALUES (4, 'Lenovo', '15LGXHYM', 'Legion Pro 15GXH', 10, 'Available', 'Laptop', 38909000)
INSERT INTO Laptops(ProductID, [image]) VALUES (4, '0yp3jx9d-1090-lenovo-legion-pro-5-y9000p-2023-core-i9-13900hx-16gb-1tb-rtx-4050-6gb-16-wqxga-240hz-new.jpg')

INSERT INTO Products(ProductID, brand, pd_ID, fullName, quantity, [status], [productType], price) VALUES (5, 'Asus', 'A17FA706', 'Asus Tuf Gamming 17FA', 10, 'Available', 'Laptop', 31909000)
INSERT INTO Laptops(ProductID, [image]) VALUES (5, 'ASUS-TUF-Gaming-A17-FA706-600x600.jpg')

INSERT INTO Products(ProductID, brand, pd_ID, fullName, quantity, [status], [productType], price) VALUES (6, 'MSI', 'b8vf406ca', 'MSI Katana Gamming B8VF', 10, 'Available', 'Laptop', 33909000)
INSERT INTO Laptops(ProductID, [image]) VALUES (6, '5e0dkkrb-1411-msi-katana-gaming-a15-ai-b8vf-406ca-amd-ryzen-r9-8945hs-32gb-1tb-rtx-4060-8gb-15-6-144hz-fhd-new.jpg')

INSERT INTO Products(ProductID, brand, pd_ID, fullName, quantity, [status], [productType], price) VALUES (7, 'Apple', 'MCBP2021', 'Macbook Pro 2021', 10, 'Available', 'Laptop', 45909000)
INSERT INTO Laptops(ProductID, [image]) VALUES (7, '250-7038-macbook-pro-2021-apple-m1-1.jpg')

INSERT INTO Products(ProductID, brand, pd_ID, fullName, quantity, [status], [productType], price) VALUES (8, 'Dell', 'D9C72G1', 'Dell Gamming G15 551', 10, 'Available', 'Laptop', 35909000)
INSERT INTO Laptops(ProductID, [image]) VALUES (8, '45606_dell_gaming_5511_dark_grey_ha3.jpg')

SET IDENTITY_INSERT Products OFF;

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