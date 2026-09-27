USE GrocerySales;
GO

SELECT TOP 20
    p.ProductID,
    p.ProductName,
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
    p.ProductID,
    p.ProductName,
    c.CategoryName

ORDER BY
    Revenue DESC;

SELECT TOP 20
    p.ProductID,
    p.ProductName,
    c.CategoryName,

    SUM(p.Price * s.Quantity * (1 - s.Discount)) AS Revenue,

    SUM(p.Price * s.Quantity * (1 - s.Discount))
        / SUM(
            SUM(p.Price * s.Quantity * (1 - s.Discount))
          ) OVER () AS RevenueShare

FROM sales s

JOIN products p
    ON s.ProductID = p.ProductID

JOIN categories c
    ON p.CategoryID = c.CategoryID

WHERE s.SalesDate IS NOT NULL

GROUP BY
    p.ProductID,
    p.ProductName,
    c.CategoryName

ORDER BY
    Revenue DESC;


WITH ProductRevenue AS
(
    SELECT
        c.CategoryID,
        c.CategoryName,
        p.ProductID,
        p.ProductName,

        SUM(
            p.Price * s.Quantity * (1 - s.Discount)
        ) AS Revenue,

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
        c.CategoryName,
        p.ProductID,
        p.ProductName
),

RankedProducts AS
(
    SELECT
        *,
        ROW_NUMBER() OVER
        (
            PARTITION BY CategoryID
            ORDER BY Revenue DESC
        ) AS ProductRank

    FROM ProductRevenue
)

SELECT
    CategoryID,
    CategoryName,
    ProductRank,
    ProductID,
    ProductName,
    Revenue,
    UnitsSold,
    TransactionCount

FROM RankedProducts

WHERE ProductRank <= 3

ORDER BY
    CategoryName,
    ProductRank;


WITH ProductRevenue AS
(
    SELECT
        c.CategoryID,
        c.CategoryName,
        p.ProductID,
        p.ProductName,

        SUM(
            p.Price * s.Quantity * (1 - s.Discount)
        ) AS Revenue

    FROM sales s

    JOIN products p
        ON s.ProductID = p.ProductID

    JOIN categories c
        ON p.CategoryID = c.CategoryID

    WHERE s.SalesDate IS NOT NULL

    GROUP BY
        c.CategoryID,
        c.CategoryName,
        p.ProductID,
        p.ProductName
),

RankedProducts AS
(
    SELECT
        *,
        ROW_NUMBER() OVER
        (
            PARTITION BY CategoryID
            ORDER BY Revenue DESC
        ) AS ProductRank

    FROM ProductRevenue
),

CategoryRevenue AS
(
    SELECT
        CategoryID,
        CategoryName,
        SUM(Revenue) AS CategoryRevenue

    FROM ProductRevenue

    GROUP BY
        CategoryID,
        CategoryName
),

Top3Revenue AS
(
    SELECT
        CategoryID,
        SUM(Revenue) AS Top3Revenue

    FROM RankedProducts

    WHERE ProductRank <= 3

    GROUP BY
        CategoryID
)

SELECT
    cr.CategoryID,
    cr.CategoryName,
    cr.CategoryRevenue,
    t3.Top3Revenue,

    t3.Top3Revenue / cr.CategoryRevenue AS Top3RevenueShare

FROM CategoryRevenue cr

JOIN Top3Revenue t3
    ON cr.CategoryID = t3.CategoryID

ORDER BY
    Top3RevenueShare DESC;