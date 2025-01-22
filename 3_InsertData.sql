USE FShop


INSERT INTO Categories VALUES ('Laptop'), ('Smartphone');

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

INSERT INTO Attributes (CID, AttributeName)
VALUES
(1, 'Processor'), -- Thuộc tính cho Laptop
(1, 'RAM'),
(1, 'Storage'),
(2,'Processor'),-- Thuộc tính cho Smartphone
(2, 'Camera'),    
(2, 'Battery'),
(2, 'Screen Size');



INSERT INTO Products (BrandID, CategoryID, SupplierID, Model, FullName, [Status])
VALUES
(1, 2, 1, 'iPhone 14 Pro', 'Apple iPhone 14 Pro 128GB', 'Available'),
(2, 2, 2, 'Galaxy S23 Ultra', 'Samsung Galaxy S23 Ultra 256GB', 'Available'),
(6, 1, 3, 'XPS 13', 'Dell XPS 13 9310', 'Available'),
(8, 1, 4, 'ZenBook 14', 'Asus ZenBook 14 UX425', 'Available'),
(10, 1, 5, 'Aspire 7', 'Acer Aspire 7 A715', 'Available');


INSERT INTO AttributeDetails (AttributeInfor, AttributeID, PSKU)
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
('512GB SSD', 3, 3),

-- Thuộc tính cho Asus ZenBook 14
('AMD Ryzen 7 5800H', 1, 4),
('16GB', 2, 4),
('1TB SSD', 3, 4),

-- Thuộc tính cho Acer Aspire 7
('Intel Core i5-10300H', 1, 5),
('8GB', 2, 5),
('256GB SSD', 3, 5);


-- Insert roles
INSERT INTO [Roles] 
VALUES 
    ('Admin'), 
    ('Manager'), 
    ('Staff')

-- Insert account
INSERT INTO Customers (FullName, Birthday, Password, PhoneNumber, Email, Gender, CreateAt, [Status], Avatar, LoyalPoint)
VALUES
('Nguyen Van A', '1995-05-15', 'hashed_password_123', '0901234567', 'nguyenvana@example.com', 'Male', GETDATE(), 'Active', 'avatar_link.jpg', 1000);

-- Insert into Carts
INSERT INTO Carts (AID, SKU, Quantity)
VALUES 
    (1, 1, 1),
    (1, 2, 1),
    (1, 5, 1);

-- Insert into Orders


-- Turn off IDentity insert for Products


