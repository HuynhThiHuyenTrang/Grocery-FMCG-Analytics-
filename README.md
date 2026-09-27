# Project 1 – Grocery / FMCG Analytics

## Project Overview

This project analyzes grocery / FMCG sales data to understand revenue performance, product contribution, customer contribution, employee performance, and geographic patterns.

The project follows a business-oriented analytics workflow:

Business Problem → Data Profiling → Data Quality → Data Model → KPI Design → SQL Analysis → Insights → Power BI Dashboard → Recommendations

---

## Business Objective

Phân tích doanh thu, sản phẩm, khách hàng, nhân viên và thị trường theo thời gian để xác định các nhóm đóng góp chính vào kết quả kinh doanh và hỗ trợ doanh nghiệp ưu tiên các hoạt động bán hàng.

---

## Business Questions

- Revenue thay đổi như thế nào theo thời gian?
- Category nào đóng góp nhiều nhất vào Revenue?
- Product nào đóng góp nhiều nhất?
- Những khách hàng nào đóng góp nhiều nhất?
- Nhân viên nào tạo ra nhiều giao dịch và Revenue nhất?
- Revenue phân bổ như thế nào theo Geography?
- Discount có liên quan như thế nào đến Revenue?

---

## Dataset

The dataset contains 7 tables:

- categories
- cities
- countries
- customers
- employees
- products
- sales

The `sales` table contains 6,758,125 records.

The confirmed grain is:

> 1 row = 1 sales transaction / sales record.

The raw dataset is not uploaded to this repository because of its large size.

---

## Tools

- SQL Server
- SQL Server Management Studio (SSMS)
- Excel
- Power BI
- GitHub

---

## Project Structure

```text
Project1_Grocery_FMCG/
│
├── README.md
│
├── data/
│   └── README.md
│
├── docs/
│   ├── business_brief.md
│   ├── data_model.md
│   └── analysis_notes.md
│
└── sql/
    ├── P1_01_Data_Quality.sql
    ├── P1_02_Data_Model_PK_FK.sql
    ├── P1_03_Data_Dictionary.sql
    ├── P1_04_Revenue_Validation.sql
    └── P1_05_Revenue_Trend.sql
