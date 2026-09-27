SELECT
    ProductID,
    COUNT(*) AS row_count
FROM products
GROUP BY ProductID
HAVING COUNT(*) > 1;

SELECT
    CustomerID,
    COUNT(*) AS row_count
FROM customers
GROUP BY CustomerID
HAVING COUNT(*) > 1;

SELECT
    EmployeeID,
    COUNT(*) AS row_count
FROM employees
GROUP BY EmployeeID
HAVING COUNT(*) > 1;

SELECT
    CategoryID,
    COUNT(*) AS row_count
FROM categories
GROUP BY CategoryID
HAVING COUNT(*) > 1;

SELECT
    CityID,
    COUNT(*) AS row_count
FROM cities
GROUP BY CityID
HAVING COUNT(*) > 1;

SELECT
    CountryID,
    COUNT(*) AS row_count
FROM countries
GROUP BY CountryID
HAVING COUNT(*) > 1;

ALTER TABLE cities
ADD CONSTRAINT FK_cities_countries
FOREIGN KEY (CountryID)
REFERENCES countries(CountryID);
GO

ALTER TABLE customers
ADD CONSTRAINT FK_customers_cities
FOREIGN KEY (CityID)
REFERENCES cities(CityID);
GO

ALTER TABLE employees
ADD CONSTRAINT FK_employees_cities
FOREIGN KEY (CityID)
REFERENCES cities(CityID);
GO

ALTER TABLE products
ADD CONSTRAINT FK_products_categories
FOREIGN KEY (CategoryID)
REFERENCES categories(CategoryID);
GO

ALTER TABLE sales
ADD CONSTRAINT FK_sales_customers
FOREIGN KEY (CustomerID)
REFERENCES customers(CustomerID);
GO

ALTER TABLE sales
ADD CONSTRAINT FK_sales_employees
FOREIGN KEY (SalesPersonID)
REFERENCES employees(EmployeeID);
GO

ALTER TABLE sales
ADD CONSTRAINT FK_sales_products
FOREIGN KEY (ProductID)
REFERENCES products(ProductID);
GO