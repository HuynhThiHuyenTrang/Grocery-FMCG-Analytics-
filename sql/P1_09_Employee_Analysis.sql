USE GrocerySales;
GO

SELECT TOP 20
    e.EmployeeID,

    CONCAT(
        e.FirstName,
        ' ',
        e.MiddleInitial,
        ' ',
        e.LastName
    ) AS EmployeeName,

    SUM(
        p.Price * s.Quantity * (1 - s.Discount)
    ) AS Revenue,

    SUM(s.Quantity) AS UnitsSold,

    COUNT(*) AS TransactionCount

FROM sales s

JOIN employees e
    ON s.SalesPersonID = e.EmployeeID

JOIN products p
    ON s.ProductID = p.ProductID

WHERE s.SalesDate IS NOT NULL

GROUP BY
    e.EmployeeID,
    e.FirstName,
    e.MiddleInitial,
    e.LastName

ORDER BY
    Revenue DESC;


WITH EmployeeRevenue AS
(
    SELECT
        e.EmployeeID,

        CONCAT(
            e.FirstName,
            ' ',
            e.MiddleInitial,
            ' ',
            e.LastName
        ) AS EmployeeName,

        SUM(
            p.Price * s.Quantity * (1 - s.Discount)
        ) AS Revenue

    FROM sales s

    JOIN employees e
        ON s.SalesPersonID = e.EmployeeID

    JOIN products p
        ON s.ProductID = p.ProductID

    WHERE s.SalesDate IS NOT NULL

    GROUP BY
        e.EmployeeID,
        e.FirstName,
        e.MiddleInitial,
        e.LastName
),

RankedEmployee AS
(
    SELECT
        *,
        ROW_NUMBER() OVER (
            ORDER BY Revenue DESC
        ) AS RevenueRank
    FROM EmployeeRevenue
)

SELECT
    SUM(
        CASE
            WHEN RevenueRank <= 5 THEN Revenue
            ELSE 0
        END
    ) AS Top5Revenue,

    SUM(Revenue) AS TotalRevenue,

    SUM(
        CASE
            WHEN RevenueRank <= 5 THEN Revenue
            ELSE 0
        END
    ) / SUM(Revenue) * 100 AS Top5RevenueShare

FROM RankedEmployee;


SELECT TOP 20
    e.EmployeeID,

    CONCAT(
        e.FirstName,
        ' ',
        e.MiddleInitial,
        ' ',
        e.LastName
    ) AS EmployeeName,

    SUM(
        p.Price * s.Quantity * (1 - s.Discount)
    ) AS Revenue,

    COUNT(*) AS TransactionCount,

    SUM(
        p.Price * s.Quantity * (1 - s.Discount)
    ) / COUNT(*) AS AOV

FROM sales s

JOIN employees e
    ON s.SalesPersonID = e.EmployeeID

JOIN products p
    ON s.ProductID = p.ProductID

WHERE s.SalesDate IS NOT NULL

GROUP BY
    e.EmployeeID,
    e.FirstName,
    e.MiddleInitial,
    e.LastName

ORDER BY
    AOV DESC;


WITH EmployeeRevenue AS
(
    SELECT
        e.EmployeeID,

        CONCAT(
            e.FirstName,
            ' ',
            e.MiddleInitial,
            ' ',
            e.LastName
        ) AS EmployeeName,

        SUM(
            p.Price * s.Quantity * (1 - s.Discount)
        ) AS Revenue

    FROM sales s

    JOIN employees e
        ON s.SalesPersonID = e.EmployeeID

    JOIN products p
        ON s.ProductID = p.ProductID

    WHERE s.SalesDate IS NOT NULL

    GROUP BY
        e.EmployeeID,
        e.FirstName,
        e.MiddleInitial,
        e.LastName
)

SELECT
    EmployeeID,
    EmployeeName,
    Revenue,

    Revenue / SUM(Revenue) OVER () * 100
        AS RevenueShare

FROM EmployeeRevenue

ORDER BY
    Revenue DESC;


