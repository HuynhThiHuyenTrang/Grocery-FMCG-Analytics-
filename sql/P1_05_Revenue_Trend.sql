USE GrocerySales;
GO

SELECT
    YEAR(s.SalesDate) AS SalesYear,
    MONTH(s.SalesDate) AS SalesMonth,

    SUM(p.Price * s.Quantity * (1 - s.Discount)) AS Revenue,

    SUM(p.Price * s.Quantity) AS GrossSales,

    SUM(s.Quantity) AS UnitsSold,

    COUNT(*) AS TransactionCount

FROM sales s
JOIN products p
    ON s.ProductID = p.ProductID

WHERE s.SalesDate IS NOT NULL

GROUP BY
    YEAR(s.SalesDate),
    MONTH(s.SalesDate)

ORDER BY
    SalesYear,
    SalesMonth;