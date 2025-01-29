USE FShop


INSERT INTO Categories VALUES ('Laptop', 'Selling'), ('Smartphone', 'Selling');

INSERT INTO Brands
VALUES 
('Apple'),
('Samsung'),
('Sony'),
('Huawei'),
('Xiaomi'),
('Dell'),
('HP'),
('Asus'),
('Lenovo'),
('Acer'),
('MSI'),
('Microsoft'),
('Google'),
('LG'),
('Razer'),
('Vivo');

INSERT INTO Suppliers 
VALUES 
('TechGear Solutions', '123 Tech Street, District 1, Ho Chi Minh City', '0901234567', 'contact@techgear.com'),
('GadgetWorld', '456 Innovation Blvd, District 3, Ho Chi Minh City', '0912345678', 'info@gadgetworld.vn'),
('DigitalZone', '789 Digital Avenue, District 5, Ho Chi Minh City', '0923456789', 'support@digitalzone.vn'),
('SmartTech Supplies', '101 Future Drive, District 7, Ho Chi Minh City', '0934567890', 'sales@smarttech.vn'),
('NextGen Electronics', '202 Silicon Valley, District 2, Ho Chi Minh City', '0945678901', 'hello@nextgen.vn');

INSERT INTO Attributes (CategoryID, AttributeName)
VALUES
(1, 'Processor'), -- Thuộc tính cho Laptop
(1, 'RAM'),
(1, 'Storage'),
(2,'Processor'),-- Thuộc tính cho Smartphone
(2, 'Camera'),    
(2, 'Battery'),
(2, 'Screen Size');


INSERT INTO Products (BrandID, CategoryID, Model, FullName, [Status], [Image])
VALUES (1, 1, 'Macbook Pro 14', 'Apple Macbook Pro 14 inch M1 Pro chip', 'New', '250-7038-macbook-pro-2021-apple-m1-1.jpg'),
(2, 2, 'Galaxy S23 Ultra', 'Samsung Galaxy S23 Ultra 5G 256GB', 'New', 'iphone-16-pro-max-black-thumb-600x600.jpg'),
(3, 1, 'Sony Vaio Z900', 'Sony Vaio Z900 Core i7 16GB RAM', 'Used', 'samsung-galaxy-s23-xanh-600x600-1.jpg')

INSERT INTO AttributeDetails (AttributeInfor, AttributeID, SKU)
VALUES
-- Thuộc tính cho iPhone 14 Pro
('A16 Bionic', 4, 1),
('48MP + 12MP + 12MP', 5, 1),
('6.1 inches', 7, 1),

-- Thuộc tính cho Galaxy S23 Ultra
('Snapdragon 8 Gen 2', 4, 2),
('200MP + 12MP + 10MP', 5, 2),
('6.8 inches', 7, 2),

-- Thuộc tính cho Dell XPS 13
('Intel Core i7-1185G7', 1, 3),
('16GB', 2, 3),
('512GB SSD', 3, 3)


-- Insert roles
INSERT INTO [Roles] 
VALUES 
    ('Admin'), 
    ('Manager'), 
    ('Staff')

-- Insert account
INSERT INTO Customers (FullName, Birthday, [Password], PhoneNumber, Email, Gender, CreatedAt, [Status], Avatar, LoyalPoint)
VALUES
('Nguyen Van A', '1995-05-15', '055c03b195d4c31b8918cabf04bbd255', '0901234567', 'nguyenvana@example.com', 'Male', GETDATE(), 'Active', 'avatar_link.jpg', 1000);

-- Insert into Carts
INSERT INTO Carts (CustomerID, SKU, Quantity)
VALUES 
    (1, 1, 1),
	(1, 2, 5)

-- Insert into Orders


-- Turn off IDentity insert for Products

-- Insert into InventoryProducts
INSERT INTO InventoryProducts VALUES (1, 1, 25000000, 20)

-- Insert into ShopProducts
INSERT INTO ShopProducts(PackageID, SKU, Price, Quantity) VALUES (1, 1, 30000000, 20)

-- Insert into Addresses
INSERT INTO Addresses(CustomerID, IsDefault, Street, Province, District, Ward) VALUES  (1, 1, 'Ap tra coi A', 94, 944, 31591)
INSERT INTO Addresses(CustomerID, IsDefault, Street, Province, District, Ward) VALUES  (1, 0, 'DT940', 94, 944, 31567)


-- Insert into [Orders] (CustomerID, FullName, PhoneNumber, [Address], TotalAmount, Discount) values ()