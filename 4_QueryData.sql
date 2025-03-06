USE FShop
-- Query District of each province
SELECT p.FullNameEn, d.FullNameEn, w.FullNameEn, w.Code FROM Provinces p
LEFT JOIN Districts d ON d.ProvinceCode = p.Code
LEFT JOIN Wards w ON w.DistrictCode = d.Code
WHERE p.Code = 94 AND d.Code = 944

-- Query Orders ordered by orderID
SELECT o.OrderID, od.SKU, MIN(i.[Image])
FROM Orders o 
LEFT JOIN OrderDetails od ON o.OrderID = od.OrderID
LEFT JOIN Products i ON od.SKU = i.SKU 
GROUP BY o.OrderID, od.SKU, od.Quantity
GO
WITH RankedProducts AS (
    SELECT SKU, FullName, Image,
           ROW_NUMBER() OVER (PARTITION BY SKU ORDER BY SKU) AS rn
    FROM Products
)
SELECT SKU, FullName, Image
FROM RankedProducts
WHERE rn = 1;
GO
SELECT * FROM Orders o 
LEFT JOIN OrderStatus ot ON o.Status = ot.ID 

-- Query OrderDetails
SELECT * 
FROM OrderDetails;

-- Query Carts
SELECT c.SKU, c.Quantity, p.[Image], p.FullName, sp.Price, p.CategoryID  
FROM Carts c 
LEFT JOIN Products p ON c.SKU = p.SKU
LEFT JOIN ShopProducts sp ON p.SKU = sp.SKU
WHERE c.CustomerID = 1
SELECT * FROM Customers
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

	SELECT a.AddressID, a.Street, w.FullNameEn, d.FullNameEn, p.FullNameEn, a.IsDefault FROM Addresses a
	LEFT JOIN Provinces p ON a.Province = p.Code
	LEFT JOIN Districts d ON a.District = d.Code
	LEFT JOIN Wards w ON a.Ward = w.Code
	Where CustomerID = 1 AND a.IsDefault = 1

SELECT a.AddressID, a.Street, w.NameEn, d.NameEn, p.NameEn, a.IsDefault FROM Addresses a
LEFT JOIN Provinces p ON a.Province = p.Code
LEFT JOIN Districts d ON a.District = d.Code
LEFT JOIN Wards w ON a.Ward = w.Code
Where CustomerID = 1

SELECT * FROM Wards WHERE DistrictCode LIKE '944'

SELECT * FROM ShopProducts

SELECT * 
FROM Products;

SELECT * 
FROM Products JOIN Products ON Laptops.pd_SKU = Products.pd_SKU
JOIN Suppliers ON Products.brandID = Suppliers.supplierID;

SELECT * FROM Products WHERE  AND price BETWEEN 20000000 AND 25000000)


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



SELECT * FROM Products P JOIN Brands B ON P.BrandID = B.BrandID
WHERE B.Name IN (SELECT Name FROM Brands WHERE [Name] IN ('Apple'))

SELECT * FROM Products P JOIN Brands B ON P.BrandID = B.BrandID
WHERE B.Name IN (SELECT Name FROM Brands WHERE Name IN ('Apple'))

select * from Brands




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
);select * from Products where CategoryID = 1
SELECT * FROM Employees
SELECT * FROM Roles


SELECT DISTINCT B.[Name] FROM Brands B JOIN Products P ON B.BrandID = P.BrandID WHERE P.CategoryID IN (SELECT CategoryID FROM Categories WHERE [Name] = 'Laptop')

SELECT * FROM Products P JOIN Brands B ON P.BrandID = B.BrandID WHERE B.Name IN (SELECT Name FROM Brands WHERE Name IN ('Apple')) AND WHERE P.CategoryID IN (SELECT CategoryID FROM Categories WHERE [Name] = 'Laptop')

SELECT * FROM Products P JOIN Brands B ON P.BrandID = B.BrandID WHERE B.Name IN (SELECT Name FROM Brands WHERE  AND price > 30000000) AND P.CategoryID IN (SELECT CategoryID FROM Categories WHERE [Name] = 'Laptop')

SELECT * FROM Products P JOIN Brands B ON P.BrandID = B.BrandID WHERE B.Name IN (SELECT Name FROM Brands WHERE Name IN ('Apple', 'Asus', 'Dell', 'Lenovo', 'MSI')) AND P.CategoryID IN (SELECT CategoryID FROM Categories WHERE [Name] = 'Laptop')

SELECT * FROM Products P JOIN Brands B ON P.BrandID = B.BrandID WHERE B.Name IN (SELECT Name FROM Brands WHERE Name IN ('Apple', 'Asus', 'Dell', 'Lenovo', 'MSI') AND price BETWEEN 20000000 AND 25000000) AND P.CategoryID IN (SELECT CategoryID FROM Categories WHERE [Name] = 'Laptop')

SELECT * FROM Products P JOIN Brands B ON P.BrandID = B.BrandID WHERE B.Name IN (SELECT Name FROM Brands WHERE Name IN ('Apple', 'Asus', 'Dell', 'Lenovo', 'MSI') AND (price BETWEEN 20000000 AND 25000000 OR price BETWEEN 25000000 AND 30000000)) AND P.CategoryID IN (SELECT CategoryID FROM Categories WHERE [Name] = 'Laptop')


SELECT * FROM Products
SELECT * FROM ImportOrders
SELECT * FROM ImportOrderDetails

UPDATE Products SET Stock = 10 WHERE ProductID IN (1, 2, 3)

UPDATE Products SET Stock = Stock + 10 WHERE ProductID = 1, Stock = Stock + 11 WHERE ProductID = 2

UPDATE P SET P.Stock = P.Stock + D.Quantity FROM Products P INNER JOIN ImportOrderDetails D ON P.ProductID = D.ProductID WHERE D.IOID = 4

UPDATE ImportOrders SET Completed = 1, ImportDate = GETDATE(), TotalCost = 1 WHERE IOID = 4


UPDATE Products SET Stock = Stock + CASE WHEN ProductID = 1 THEN 10 ELSE 0 END

UPDATE Products SET Stock = Stock + CASE WHEN ProductID = 1 THEN 1 ProductID = 3 THEN 1 ProductID = 5 THEN 1 ELSE 0 END

UPDATE Products SET Stock = Stock + CASE WHEN ProductID = 1 THEN 1  WHEN ProductID = 3 THEN 1  WHEN ProductID = 5 THEN 1 END WHERE ProductID IN (1, 3, 5);


UPDATE Products SET Stock = Stock + CASE WHEN ProductID = 1 THEN 1  WHEN ProductID = 3 THEN 1  WHEN ProductID = 5 THEN 1 END WHERE ProductID IN ((1, 3, 5), 1(1, 3, 5), 3(1, 3, 5), 51, 3, 5), 1(1, 3, 5), 3(1, 3, 5), 5)


UPDATE Products SET Stock = Stock + CASE WHEN ProductID = 1 THEN 1 END WHERE ProductID IN ((1, 3, 5)(1)1, 3, 5)(1))


UPDATE Products SET Stock = Stock + CASE WHEN ProductID = 1 THEN 1 END WHERE ProductID IN (1)

UPDATE Products SET Stock = Stock + CASE WHEN ProductID = 1 THEN 1 WHEN ProductID = 3 THEN 1 WHEN ProductID = 5 THEN 1 END WHERE ProductID IN (1, 3, 5)

UPDATE Products SET Stock = Stock + CASE WHEN ProductID = 1 THEN 1 WHEN ProductID = 3 THEN 4 WHEN ProductID = 5 THEN 4 WHEN ProductID = 7 THEN 5 WHEN ProductID = 10 THEN 1 END WHERE ProductID IN (1, 3, 5, 7, 10)

DELETE ImportOrderDetails WHERE ProductID = 3 AND IOID = 5

DELETE ImportOrderDetails WHERE ProductID = 3 AND IOID = 5

DELETE ImportOrders WHERE IOID in (13, 14, 15, 16)
