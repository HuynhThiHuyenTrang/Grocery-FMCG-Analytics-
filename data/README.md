# Data

## Dataset Overview

This project uses a Grocery / FMCG sales dataset containing 7 tables:

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

## Why Raw Data Is Not Uploaded

The raw dataset is not included in this GitHub repository because of its large size.

The project was analyzed using SQL Server and SQL Server Management Studio (SSMS).

Only documentation, SQL analysis scripts, and derived project outputs are included in the repository.

## Data Coverage

Valid non-null `SalesDate` records range from:

- 2018-01-01
- to 2018-05-09

There are 67,526 sales records with NULL `SalesDate`.

## Main Tables

| Table | Description |
|---|---|
| sales | Sales transaction records |
| products | Product information |
| categories | Product categories |
| customers | Customer information |
| employees | Employee information |
| cities | City information |
| countries | Country information |
