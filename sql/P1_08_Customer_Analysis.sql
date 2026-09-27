USE GrocerySales;
GO

SELECT TOP 20
    c.CustomerID,
    CONCAT(
        c.FirstName,
        ' ',
        c.MiddleInitial,
        ' ',
        c.LastName
    ) AS CustomerName,

    SUM(p.Price * s.Quantity * (1 - s.Discount)) AS Revenue,

    SUM(s.Quantity) AS UnitsSold,

    COUNT(*) AS TransactionCount

FROM sales s

JOIN customers c
    ON s.CustomerID = c.CustomerID

JOIN products p
    ON s.ProductID = p.ProductID

WHERE s.SalesDate IS NOT NULL

GROUP BY
    c.CustomerID,
    c.FirstName,
    c.MiddleInitial,
    c.LastName

ORDER BY Revenue DESC;


SELECT TOP 20
    c.CustomerID,

    CONCAT(
        c.FirstName,
        ' ',
        c.MiddleInitial,
        ' ',
        c.LastName
    ) AS CustomerName,

    SUM(p.Price * s.Quantity * (1 - s.Discount)) AS Revenue,

    SUM(p.Price * s.Quantity * (1 - s.Discount))
        / SUM(
            SUM(p.Price * s.Quantity * (1 - s.Discount))
          ) OVER () AS RevenueShare,

    SUM(s.Quantity) AS UnitsSold,

    COUNT(*) AS TransactionCount

FROM sales s

JOIN customers c
    ON s.CustomerID = c.CustomerID

JOIN products p
    ON s.ProductID = p.ProductID

WHERE s.SalesDate IS NOT NULL

GROUP BY
    c.CustomerID,
    c.FirstName,
    c.MiddleInitial,
    c.LastName

ORDER BY Revenue DESC;


WITH CustomerRevenue AS
(
    SELECT
        c.CustomerID,

        CONCAT(
            c.FirstName,
            ' ',
            c.MiddleInitial,
            ' ',
            c.LastName
        ) AS CustomerName,

        SUM(
            p.Price * s.Quantity * (1 - s.Discount)
        ) AS Revenue

    FROM sales s

    JOIN customers c
        ON s.CustomerID = c.CustomerID

    JOIN products p
        ON s.ProductID = p.ProductID

    WHERE s.SalesDate IS NOT NULL

    GROUP BY
        c.CustomerID,
        c.FirstName,
        c.MiddleInitial,
        c.LastName
),

CustomerMetrics AS
(
    SELECT
        *,
        ROW_NUMBER() OVER (
            ORDER BY Revenue DESC
        ) AS CustomerRank,

        SUM(Revenue) OVER () AS TotalRevenue

    FROM CustomerRevenue
)

SELECT
    CustomerRank,
    CustomerID,
    CustomerName,
    Revenue,

    Revenue / TotalRevenue AS RevenueShare

FROM CustomerMetrics

WHERE CustomerRank <= 10

ORDER BY CustomerRank;


WITH CustomerRevenue AS
(
    SELECT
        c.CustomerID,

        SUM(
            p.Price * s.Quantity * (1 - s.Discount)
        ) AS Revenue

    FROM sales s

    JOIN customers c
        ON s.CustomerID = c.CustomerID

    JOIN products p
        ON s.ProductID = p.ProductID

    WHERE s.SalesDate IS NOT NULL

    GROUP BY
        c.CustomerID
),

RankedCustomers AS
(
    SELECT
        CustomerID,
        Revenue,

        ROW_NUMBER() OVER (
            ORDER BY Revenue DESC
        ) AS CustomerRank,

        SUM(Revenue) OVER () AS TotalRevenue

    FROM CustomerRevenue
)

SELECT
    SUM(Revenue) AS Top10Revenue,

    MAX(TotalRevenue) AS TotalRevenue,

    SUM(Revenue) / MAX(TotalRevenue) AS Top10RevenueShare

FROM RankedCustomers

WHERE CustomerRank <= 10;


SELECT
    SUM(
        p.Price * s.Quantity * (1 - s.Discount)
    ) AS TotalRevenue,

    COUNT(*) AS TransactionCount,

    SUM(
        p.Price * s.Quantity * (1 - s.Discount)
    ) / COUNT(*) AS AOV

FROM sales s

JOIN products p
    ON s.ProductID = p.ProductID

WHERE s.SalesDate IS NOT NULL;

SELECT TOP 20
    c.CustomerID,

    CONCAT(
        c.FirstName,
        ' ',
        c.MiddleInitial,
        ' ',
        c.LastName
    ) AS CustomerName,

    SUM(
        p.Price * s.Quantity * (1 - s.Discount)
    ) AS Revenue,

    COUNT(*) AS TransactionCount,

    SUM(
        p.Price * s.Quantity * (1 - s.Discount)
    ) / COUNT(*) AS AOV,

    SUM(s.Quantity) AS UnitsSold

FROM sales s

JOIN customers c
    ON s.CustomerID = c.CustomerID

JOIN products p
    ON s.ProductID = p.ProductID

WHERE s.SalesDate IS NOT NULL

GROUP BY
    c.CustomerID,
    c.FirstName,
    c.MiddleInitial,
    c.LastName

ORDER BY AOV DESC;


WITH CustomerTransactions AS
(
    SELECT
        CustomerID,
        COUNT(*) AS TransactionCount
    FROM sales
    WHERE SalesDate IS NOT NULL
    GROUP BY CustomerID
)

SELECT
    COUNT(*) AS TotalCustomers,

    SUM(
        CASE
            WHEN TransactionCount = 1 THEN 1
            ELSE 0
        END
    ) AS OneTimeCustomers,

    SUM(
        CASE
            WHEN TransactionCount > 1 THEN 1
            ELSE 0
        END
    ) AS RepeatCustomers,

    SUM(
        CASE
            WHEN TransactionCount = 1 THEN 1
            ELSE 0
        END
    ) * 1.0 / COUNT(*) AS OneTimeRate,

    SUM(
        CASE
            WHEN TransactionCount > 1 THEN 1
            ELSE 0
        END
    ) * 1.0 / COUNT(*) AS RepeatRate

FROM CustomerTransactions;


WITH CustomerTransactions AS
(
    SELECT
        CustomerID,
        COUNT(*) AS TransactionCount
    FROM sales
    WHERE SalesDate IS NOT NULL
    GROUP BY CustomerID
),

CustomerFrequency AS
(
    SELECT
        CustomerID,
        TransactionCount,

        CASE
            WHEN TransactionCount BETWEEN 1 AND 10
                THEN '1-10'
            WHEN TransactionCount BETWEEN 11 AND 30
                THEN '11-30'
            WHEN TransactionCount BETWEEN 31 AND 50
                THEN '31-50'
            WHEN TransactionCount BETWEEN 51 AND 100
                THEN '51-100'
            ELSE '>100'
        END AS TransactionFrequencyGroup

    FROM CustomerTransactions
)

SELECT
    TransactionFrequencyGroup,

    COUNT(*) AS CustomerCount,

    COUNT(*) * 1.0
        / SUM(COUNT(*)) OVER () AS CustomerShare

FROM CustomerFrequency

GROUP BY
    TransactionFrequencyGroup

ORDER BY
    CASE
        WHEN TransactionFrequencyGroup = '1-10' THEN 1
        WHEN TransactionFrequencyGroup = '11-30' THEN 2
        WHEN TransactionFrequencyGroup = '31-50' THEN 3
        WHEN TransactionFrequencyGroup = '51-100' THEN 4
        WHEN TransactionFrequencyGroup = '>100' THEN 5
    END;

WITH CustomerTransactions AS
(
    SELECT
        CustomerID,
        COUNT(*) AS TransactionCount
    FROM sales
    WHERE SalesDate IS NOT NULL
    GROUP BY CustomerID
)
SELECT
    MIN(TransactionCount) AS MinTransactions,
    MAX(TransactionCount) AS MaxTransactions,
    AVG(TransactionCount * 1.0) AS AvgTransactions
FROM CustomerTransactions;