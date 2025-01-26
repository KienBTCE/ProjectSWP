USE FShop
-- Query District of each province
SELECT p.FullNameEn, d.FullNameEn, w.FullNameEn FROM Provinces p
LEFT JOIN Districts d ON d.ProvinceCode = p.Code
LEFT JOIN Wards w ON w.DistrictCode = d.Code
WHERE p.Code = 94 AND d.Code = 944

-- Query Orders ordered by orderID
SELECT * 
FROM Orders
ORDER BY orderID DESC;

-- Query OrderDetails
SELECT * 
FROM OrderDetails;

-- Query Carts
SELECT c.SKU, c.Quantity, p.[Image], p.FullName, sp.Price, p.CategoryID  
FROM Carts c 
LEFT JOIN Products p ON c.SKU = p.SKU
LEFT JOIN ShopProducts sp ON p.SKU = sp.SKU
WHERE c.AID = 1

-- Query Accounts
SELECT * 
FROM Customers;

-- Query Products
SELECT p.FullName, p.Model, p.[Status], [at].AttributeName, a.AttributeInfor 
FROM Products p 
LEFT JOIN AttributeDetails a ON p.SKU = a.PSKU
LEFT JOIN Attributes [at] ON a.AttributeID = [at].AID


SELECT * FROM InventoryProducts

SELECT * FROM ShopProducts

SELECT * 
FROM Suppliers;

SELECT * 
FROM Brands;

SELECT * 
FROM Categories;

SELECT * 
FROM [Roles];
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