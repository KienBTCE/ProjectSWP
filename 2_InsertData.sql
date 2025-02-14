USE FShop

INSERT INTO Roles VALUES 
(1, 'Admin'),
(2, 'Shop Manager'),
(3, 'Order Manager'),
(4, 'Warehouse Manager')

-- Insert Categories
INSERT INTO Categories (CategoryID, [Name]) 
VALUES (1, 'Laptop'), (2, 'Smartphone');

-- Insert Brands
INSERT INTO Brands (BrandID, [Name]) 
VALUES (1, 'Apple'), (2, 'Samsung'), (3, 'Sony'), (4, 'Huawei'), (5, 'Xiaomi'),
       (6, 'Dell'), (7, 'HP'), (8, 'Asus'), (9, 'Lenovo'), (10, 'Acer'),
       (11, 'MSI'), (12, 'Microsoft'), (13, 'Google'), (14, 'LG'), (15, 'Razer'), (16, 'Vivo');

-- Insert Suppliers
INSERT INTO Suppliers (SupplierID, TaxID, [Name], Email, PhoneNumber, [Address], CreatedDate, LastModify, IsDeleted) 
VALUES 
(1, '0100101234', 'TechGear Solutions', 'contact@techgear.com', '0901234567', '123 Tech Street, District 1, Ho Chi Minh City', GETDATE(), GETDATE(), 0),
(2, '0200101234', 'GadgetWorld', 'info@gadgetworld.vn', '0912345678', '456 Innovation Blvd, District 3, Ho Chi Minh City', GETDATE(), GETDATE(), 0),
(3, '0300101234', 'DigitalZone', 'support@digitalzone.vn', '0923456789', '789 Digital Avenue, District 5, Ho Chi Minh City', GETDATE(), GETDATE(), 0),
(4, '0400101234', 'SmartTech Supplies', 'sales@smarttech.vn', '0934567890', '101 Future Drive, District 7, Ho Chi Minh City', GETDATE(), GETDATE(), 0),
(5, '0500101234', 'NextGen Electronics', 'hello@nextgen.vn', '0945678901', '202 Silicon Valley, District 2, Ho Chi Minh City', GETDATE(), GETDATE(), 0);

-- Insert Attributes
INSERT INTO Attributes (AttributeID, [Name])
VALUES
(1, 'Processor'), (2, 'RAM'), (3, 'Storage'),
(4, 'Camera'), (5, 'Battery'), (6, 'Screen Size');

-- Insert Products
INSERT INTO Products (ProductID, BrandID, CategoryID, Model, FullName, Description, Image, Price)
VALUES 
(1, 1, 1, 'Macbook Pro 14', 'Apple Macbook Pro 14 inch M1 Pro chip', 'New model from Apple', 'macbook-pro-2021-apple-m1.jpg', 50000000),
(2, 2, 2, 'Galaxy S23 Ultra', 'Samsung Galaxy S23 Ultra 5G 256GB', 'Latest flagship from Samsung', 'samsung-galaxy-s23.jpg', 30000000),
(3, 3, 1, 'Sony Vaio Z900', 'Sony Vaio Z900 Core i7 16GB RAM', 'High-performance laptop', 'sony-vaio-z900.jpg', 20000000);

-- Insert AttributeDetails
INSERT INTO AttributeDetails (AttributeID, ProductID, AttributeValue)
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
('Nguyen Van A', '1995-05-15', '6ad14ba9986e3615423dfca256d04e3f', '0901234567', 'nguyenvana@example.com', 'Male', GETDATE(), 0, 0, 'person.jpg');

-- Insert Orders
INSERT INTO Orders (OrderID, CustomerID, FullName, [Address], PhoneNumber, OrderDate, DeliveredDate, [Status], TotalAmount)
VALUES 
(1, 1, 'Nguyen Van A', '123 Tech Street, District 1, Ho Chi Minh City', '0901234567', GETDATE(), NULL, 1, 50000000);

-- Insert Employees
INSERT INTO Employees (EmployeeID, FullName, Birthday, [Password], PhoneNumber, Email, Gender, CreatedDate, Avatar, RoleID)
VALUES 
(1, 'Nguyen Van A', '1990-01-01', 'encrypted_password_here', '0123456789', 'nguyen.vana@example.com', 'Male', GETDATE(), 'avatar_image_url_here', 1);

-- Insert Carts
INSERT INTO Carts (CustomerID, ProductID, Quantity)
VALUES 
(1, 1, 1),
(1, 2, 5);

-- Insert OrderStatus
INSERT INTO OrderStatus (ID, [Status])
VALUES 
(1, 'Waiting for acceptance'),
(2, 'Transport'),
(3, 'Waiting for delivery'),
(4, 'Delivered'),
(5, 'Canceled');
