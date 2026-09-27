USE GrocerySales;
GO

SELECT
    c.CategoryID,
    c.CategoryName,

    SUM(p.Price * s.Quantity * (1 - s.Discount)) AS Revenue,

    SUM(p.Price * s.Quantity) AS GrossSales,

    SUM(s.Quantity) AS UnitsSold,

    COUNT(*) AS TransactionCount

FROM sales s

JOIN products p
    ON s.ProductID = p.ProductID

JOIN categories c
    ON p.CategoryID = c.CategoryID

WHERE s.SalesDate IS NOT NULL

GROUP BY
    c.CategoryID,
    c.CategoryName


ORDER BY
    Revenue DESC;

SELECT
    c.CategoryID,
    c.CategoryName,

    SUM(p.Price * s.Quantity * (1 - s.Discount)) AS Revenue,

    SUM(p.Price * s.Quantity * (1 - s.Discount))
        / SUM(SUM(p.Price * s.Quantity * (1 - s.Discount)))
          OVER () AS RevenueShare

FROM sales s

JOIN products p
    ON s.ProductID = p.ProductID

JOIN categories c
    ON p.CategoryID = c.CategoryID

WHERE s.SalesDate IS NOT NULL

GROUP BY
    c.CategoryID,
    c.CategoryName

ORDER BY
    Revenue DESC;