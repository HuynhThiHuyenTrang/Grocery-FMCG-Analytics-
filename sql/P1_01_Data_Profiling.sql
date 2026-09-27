SELECT TOP 10 *
FROM sales;

SELECT COUNT(*) AS total_rows
FROM sales;

SELECT 
    MIN(SalesDate) AS min_sales_date,
    MAX(SalesDate) AS max_sales_date
FROM sales;

SELECT 
    COUNT(DISTINCT TransactionNumber) AS total_transactions
FROM sales;

SELECT 
    TransactionNumber,
    COUNT(*) AS row_count
FROM sales
GROUP BY TransactionNumber
HAVING COUNT(*) > 1;

SELECT 
    COUNT(DISTINCT CustomerID) AS total_customers
FROM sales;

SELECT 
    COUNT(DISTINCT ProductID) AS total_products
FROM sales;

SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN TotalPrice = 0 THEN 1 ELSE 0 END) AS zero_price_rows,
    SUM(CASE WHEN TotalPrice <> 0 THEN 1 ELSE 0 END) AS nonzero_price_rows,
    SUM(CASE WHEN TotalPrice IS NULL THEN 1 ELSE 0 END) AS null_price_rows,
    MIN(TotalPrice) AS min_total_price,
    MAX(TotalPrice) AS max_total_price
FROM sales;

SELECT
    COUNT(*) AS total_products,
    MIN(Price) AS min_price,
    MAX(Price) AS max_price,
    AVG(Price) AS avg_price
FROM products;

SELECT TOP 10
    ProductID,
    ProductName,
    Price
FROM products
ORDER BY Price DESC;

SELECT TOP 20
    s.SalesID,
    s.ProductID,
    p.ProductName,
    p.Price,
    s.Quantity,
    s.Discount,
    s.TotalPrice,
    p.Price * s.Quantity AS CalculatedGross
FROM sales AS s
INNER JOIN products AS p
    ON s.ProductID = p.ProductID;

SELECT
    Discount,
    COUNT(*) AS row_count
FROM sales
GROUP BY Discount
ORDER BY Discount;

SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN Quantity <= 0 THEN 1 ELSE 0 END) AS invalid_quantity_rows,
    SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS null_quantity_rows,
    SUM(CASE WHEN p.Price <= 0 THEN 1 ELSE 0 END) AS invalid_price_rows,
    SUM(CASE WHEN p.Price IS NULL THEN 1 ELSE 0 END) AS null_price_rows
FROM sales AS s
LEFT JOIN products AS p
    ON s.ProductID = p.ProductID;

SELECT
    SalesID,
    COUNT(*) AS row_count
FROM sales
GROUP BY SalesID
HAVING COUNT(*) > 1;

SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN SalesID IS NULL THEN 1 ELSE 0 END) AS null_sales_id,
    SUM(CASE WHEN SalesPersonID IS NULL THEN 1 ELSE 0 END) AS null_salesperson_id,
    SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
    SUM(CASE WHEN ProductID IS NULL THEN 1 ELSE 0 END) AS null_product_id,
    SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS null_quantity,
    SUM(CASE WHEN Discount IS NULL THEN 1 ELSE 0 END) AS null_discount,
    SUM(CASE WHEN TotalPrice IS NULL THEN 1 ELSE 0 END) AS null_total_price,
    SUM(CASE WHEN SalesDate IS NULL THEN 1 ELSE 0 END) AS null_sales_date,
    SUM(CASE WHEN TransactionNumber IS NULL THEN 1 ELSE 0 END) AS null_transaction_number
FROM sales;

SELECT COUNT(*) AS orphan_product_rows
FROM sales AS s
LEFT JOIN products AS p
    ON s.ProductID = p.ProductID
WHERE p.ProductID IS NULL;

SELECT COUNT(*) AS orphan_customer_rows
FROM sales AS s
LEFT JOIN customers AS c
    ON s.CustomerID = c.CustomerID
WHERE c.CustomerID IS NULL;

SELECT COUNT(*) AS orphan_salesperson_rows
FROM sales AS s
LEFT JOIN employees AS e
    ON s.SalesPersonID = e.EmployeeID
WHERE e.EmployeeID IS NULL;

SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN Discount < 0 THEN 1 ELSE 0 END) AS negative_discount_rows,
    SUM(CASE WHEN Discount > 1 THEN 1 ELSE 0 END) AS over_100_percent_rows
FROM sales;

SELECT
    COUNT(*) AS null_salesdate_rows,
    SUM(Quantity) AS total_quantity
FROM sales
WHERE SalesDate IS NULL;

SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN SalesDate IS NULL THEN 1 ELSE 0 END) AS null_salesdate_rows,
    CAST(
        100.0 * SUM(CASE WHEN SalesDate IS NULL THEN 1 ELSE 0 END) / COUNT(*)
        AS DECIMAL(10,2)
    ) AS null_salesdate_pct
FROM sales;

SELECT
    MIN(SalesDate) AS min_valid_sales_date,
    MAX(SalesDate) AS max_valid_sales_date,
    COUNT(*) AS non_null_salesdate_rows
FROM sales
WHERE SalesDate IS NOT NULL;