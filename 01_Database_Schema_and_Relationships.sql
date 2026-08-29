USE SupplyChainAnalytics;
GO

/* ============================================
   01_Database_Schema_and_Relationships.sql
   Documents core tables, columns, and PK/FK relationships
   ============================================ */

-- Base tables
SELECT
    TABLE_NAME
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE'
ORDER BY TABLE_NAME;
GO

-- Column definitions
SELECT
    TABLE_NAME,
    ORDINAL_POSITION,
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME IN (
    'Inventory',
    'Orders',
    'Products',
    'Suppliers',
    'Warehouses'
)
ORDER BY TABLE_NAME, ORDINAL_POSITION;
GO

-- Primary and foreign keys
SELECT
    tc.TABLE_NAME,
    tc.CONSTRAINT_TYPE,
    kcu.COLUMN_NAME,
    tc.CONSTRAINT_NAME
FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS tc
INNER JOIN INFORMATION_SCHEMA.KEY_COLUMN_USAGE AS kcu
    ON tc.CONSTRAINT_NAME = kcu.CONSTRAINT_NAME
    AND tc.TABLE_SCHEMA = kcu.TABLE_SCHEMA
WHERE tc.TABLE_NAME IN (
    'Inventory',
    'Orders',
    'Products',
    'Suppliers',
    'Warehouses'
)
AND tc.CONSTRAINT_TYPE IN ('PRIMARY KEY', 'FOREIGN KEY')
ORDER BY
    tc.TABLE_NAME,
    tc.CONSTRAINT_TYPE,
    kcu.ORDINAL_POSITION;
GO

-- Clean relationship map
SELECT
    OBJECT_NAME(fk.parent_object_id) AS ChildTable,
    COL_NAME(fkc.parent_object_id, fkc.parent_column_id) AS ForeignKeyColumn,
    OBJECT_NAME(fk.referenced_object_id) AS ParentTable,
    COL_NAME(fkc.referenced_object_id, fkc.referenced_column_id) AS PrimaryKeyColumn
FROM sys.foreign_keys AS fk
INNER JOIN sys.foreign_key_columns AS fkc
    ON fk.object_id = fkc.constraint_object_id
ORDER BY
    ChildTable,
    ForeignKeyColumn;
GO