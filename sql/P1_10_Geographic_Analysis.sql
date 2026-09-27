SELECT
    co.CountryID,
    co.CountryName,

    SUM(
        p.Price * s.Quantity * (1 - s.Discount)
    ) AS Revenue,

    SUM(s.Quantity) AS UnitsSold,

    COUNT(*) AS TransactionCount

FROM sales s

JOIN products p
    ON s.ProductID = p.ProductID

JOIN customers c
    ON s.CustomerID = c.CustomerID

JOIN cities ci
    ON c.CityID = ci.CityID

JOIN countries co
    ON ci.CountryID = co.CountryID

WHERE s.SalesDate IS NOT NULL

GROUP BY
    co.CountryID,
    co.CountryName

ORDER BY
    Revenue DESC;


SELECT TOP 20
    ci.CityID,
    ci.CityName,

    SUM(
        p.Price * s.Quantity * (1 - s.Discount)
    ) AS Revenue,

    SUM(s.Quantity) AS UnitsSold,

    COUNT(*) AS TransactionCount

FROM sales s

JOIN products p
    ON s.ProductID = p.ProductID

JOIN customers c
    ON s.CustomerID = c.CustomerID

JOIN cities ci
    ON c.CityID = ci.CityID

WHERE s.SalesDate IS NOT NULL

GROUP BY
    ci.CityID,
    ci.CityName

ORDER BY
    Revenue DESC;

WITH CityRevenue AS
(
    SELECT
        ci.CityID,
        ci.CityName,

        SUM(
            p.Price * s.Quantity * (1 - s.Discount)
        ) AS Revenue

    FROM sales s

    JOIN products p
        ON s.ProductID = p.ProductID

    JOIN customers c
        ON s.CustomerID = c.CustomerID

    JOIN cities ci
        ON c.CityID = ci.CityID

    WHERE s.SalesDate IS NOT NULL

    GROUP BY
        ci.CityID,
        ci.CityName
),

RankedCity AS
(
    SELECT
        *,
        ROW_NUMBER() OVER (
            ORDER BY Revenue DESC
        ) AS RevenueRank
    FROM CityRevenue
)

SELECT
    SUM(
        CASE
            WHEN RevenueRank <= 10 THEN Revenue
            ELSE 0
        END
    ) AS Top10CityRevenue,

    SUM(Revenue) AS TotalRevenue,

    SUM(
        CASE
            WHEN RevenueRank <= 10 THEN Revenue
            ELSE 0
        END
    ) / SUM(Revenue) * 100 AS Top10CityRevenueShare

FROM RankedCity;