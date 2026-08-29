USE SupplyChainAnalytics;
GO

SELECT
    p.ProductName,
    p.Category,
    SUM(o.QuantityOrdered) AS UnitsOrdered,
    SUM(o.QuantityOrdered * p.UnitPrice) AS TotalRevenue,
    SUM(o.QuantityOrdered * p.UnitCost) AS TotalCost,
    SUM(o.QuantityOrdered * (p.UnitPrice - p.UnitCost)) AS GrossProfit,
    CAST(
        SUM(o.QuantityOrdered * (p.UnitPrice - p.UnitCost)) * 100.0 /
        NULLIF(SUM(o.QuantityOrdered * p.UnitPrice), 0)
        AS DECIMAL(10,2)
    ) AS GrossProfitMarginPct
FROM Orders o
INNER JOIN Products p
    ON o.ProductID = p.ProductID
GROUP BY
    p.ProductName,
    p.Category
ORDER BY
    TotalRevenue DESC;
GO