# Project 1 – Data Model

## 1. Data Model Overview

Dataset gồm 7 bảng:

- countries
- cities
- customers
- employees
- categories
- products
- sales

Bảng `sales` là bảng giao dịch chính.

Grain của bảng sales:

> 1 row = 1 sales transaction / sales record.

`TransactionNumber` được kiểm tra không trùng và số lượng distinct transaction bằng số lượng bản ghi sales.

---

## 2. Primary Keys

| Table | Primary Key |
|---|---|
| countries | CountryID |
| cities | CityID |
| customers | CustomerID |
| employees | EmployeeID |
| categories | CategoryID |
| products | ProductID |
| sales | SalesID |

Các primary key đã được kiểm tra không có duplicate.

---

## 3. Foreign Keys

| Child Table | Foreign Key | Parent Table | Parent Key |
|---|---|---|---|
| cities | CountryID | countries | CountryID |
| customers | CityID | cities | CityID |
| employees | CityID | cities | CityID |
| products | CategoryID | categories | CategoryID |
| sales | CustomerID | customers | CustomerID |
| sales | SalesPersonID | employees | EmployeeID |
| sales | ProductID | products | ProductID |

Các foreign key đã được tạo trong SQL Server.

Các logical referential integrity checks không phát hiện orphan records.

---

## 4. Logical Relationships

countries 1:N cities

cities 1:N customers

cities 1:N employees

categories 1:N products

customers 1:N sales

employees 1:N sales

products 1:N sales

---

## 5. Main Analytical Flow

The main analytical flow is based on several dimensions connected to the `sales` transaction table.

### Geography → Customer → Sales

countries
→ cities
→ customers
→ sales

### Geography → Employee → Sales

countries
→ cities
→ employees
→ sales

### Category → Product → Sales

categories
→ products
→ sales

Bảng `sales` được kết hợp với các bảng dimension liên quan để phân tích Revenue, Gross Sales, Units Sold và Transaction Count theo các góc nhìn:

- Geography
- Customer
- Employee
- Category
- Product
- Time
categories
→ products
→ sales

Bảng `sales` được kết hợp với `products` để lấy `Price` và xây dựng các derived sales metrics.
