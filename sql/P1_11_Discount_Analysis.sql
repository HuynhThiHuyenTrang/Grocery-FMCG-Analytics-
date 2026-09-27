USE GrocerySales;
GO

-- 1. Revenue by Discount Level

SELECT
    s.Discount,

    COUNT(*) AS TransactionCount,

    SUM(s.Quantity) AS UnitsSold,

    SUM(
        p.Price * s.Quantity * (1 - s.Discount)
    ) AS Revenue,

    SUM(
        p.Price * s.Quantity
    ) AS GrossSales,

    SUM(
        p.Price * s.Quantity * s.Discount
    ) AS DiscountAmount

FROM sales s

JOIN products p
    ON s.ProductID = p.ProductID

WHERE s.SalesDate IS NOT NULL

GROUP BY
    s.Discount

ORDER BY
    s.Discount;

-- 2. Discount Share of Transactions and Revenue

SELECT
    s.Discount,

    COUNT(*) AS TransactionCount,

    COUNT(*) * 100.0
        / SUM(COUNT(*)) OVER () AS TransactionShare,

    SUM(
        p.Price * s.Quantity * (1 - s.Discount)
    ) AS Revenue,

    SUM(
        p.Price * s.Quantity * (1 - s.Discount)
    ) * 100.0
        / SUM(
            SUM(
                p.Price * s.Quantity * (1 - s.Discount)
            )
        ) OVER () AS RevenueShare

FROM sales s

JOIN products p
    ON s.ProductID = p.ProductID

WHERE s.SalesDate IS NOT NULL

GROUP BY
    s.Discount

ORDER BY
    s.Discount;

-- 3. AOV by Discount Level

SELECT
    s.Discount,

    COUNT(*) AS TransactionCount,

    SUM(
        p.Price * s.Quantity * (1 - s.Discount)
    ) AS Revenue,

    SUM(
        p.Price * s.Quantity * (1 - s.Discount)
    ) / COUNT(*) AS AOV

FROM sales s

JOIN products p
    ON s.ProductID = p.ProductID

WHERE s.SalesDate IS NOT NULL

GROUP BY
    s.Discount

ORDER BY
    s.Discount;