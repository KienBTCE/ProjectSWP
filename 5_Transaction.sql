-- IMPORT STOCK

GO
CREATE OR ALTER PROCEDURE InsertInventoryAndHistory(
    @SKU INT,
    @ProductCost BIGINT,
    @Stock INT,
    @EmployeeID INT,
    @StatusID INT,
    @Note TEXT)
AS
BEGIN
    DECLARE @PackageID INT;
    DECLARE @Price INT;
    DECLARE @Quantity INT;

    INSERT INTO InventoryProducts (SKU, ProductCost, Stock)
    VALUES (@SKU, @ProductCost, @Stock);

    SET @PackageID = SCOPE_IDENTITY();
	SET @Price = @ProductCost;
	SET @Quantity = @Stock;

    INSERT INTO InventoryHistories (PackageID, SKU, EmployeeID, TransactionAt, StatusID, Price, Quantity, Note)
    VALUES (@PackageID, @SKU, @EmployeeID, GETDATE(), @StatusID, @Price, @Quantity, @Note);

    COMMIT TRANSACTION;
END;
GO