USE GrocerySales;
GO

SELECT TOP 10
    s.SalesID,
    s.ProductID,
    p.ProductName,
    p.Price,
    s.Quantity,
    s.Discount,
    s.TotalPrice,

    p.Price * s.Quantity AS GrossSales,

    p.Price * s.Quantity * (1 - s.Discount) AS CalculatedRevenue

FROM sales s
JOIN products p
    ON s.ProductID = p.ProductID

WHERE s.SalesDate IS NOT NULL

ORDER BY s.SalesID;