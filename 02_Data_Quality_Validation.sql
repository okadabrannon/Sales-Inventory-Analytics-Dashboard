USE SupplyChainAnalytics;
GO

/* ============================================
   02_Data_Quality_Validation.sql
   Validates referential integrity across
   core supply chain relationships
   ============================================ */

SELECT
    'Inventory → Products' AS Relationship,
    COUNT(*) AS OrphanRecords
FROM Inventory i
LEFT JOIN Products p
    ON i.ProductID = p.ProductID
WHERE p.ProductID IS NULL

UNION ALL

SELECT
    'Inventory → Warehouses',
    COUNT(*)
FROM Inventory i
LEFT JOIN Warehouses w
    ON i.WarehouseID = w.WarehouseID
WHERE w.WarehouseID IS NULL

UNION ALL

SELECT
    'Orders → Products',
    COUNT(*)
FROM Orders o
LEFT JOIN Products p
    ON o.ProductID = p.ProductID
WHERE p.ProductID IS NULL

UNION ALL

SELECT
    'Orders → Warehouses',
    COUNT(*)
FROM Orders o
LEFT JOIN Warehouses w
    ON o.WarehouseID = w.WarehouseID
WHERE w.WarehouseID IS NULL

UNION ALL

SELECT
    'Products → Suppliers',
    COUNT(*)
FROM Products p
LEFT JOIN Suppliers s
    ON p.SupplierID = s.SupplierID
WHERE s.SupplierID IS NULL;
GO