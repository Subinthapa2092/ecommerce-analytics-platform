# Ecommerce Analytics Platform

A portfolio-grade E-Commerce Analytics Platform, built progressively alongside DP-800 study. The goal is to go from a raw transactional SQL Server database, through business analytics, to a Power BI dashboard, a backend API, and finally a frontend.

## Tech Stack (planned)

Database: SQL Server (T-SQL). Analytics/BI: Power BI. Backend: FastAPI (Python). Frontend: React.

## Roadmap

| Phase | Focus | Status |
|---|---|---|
| 1 | Database Foundation | ✅ Done (Day 6) |
| 2 | Tables + Relationships | ✅ Done (Days 7–12) |
| 3 | Data Quality + Constraints | ✅ Done (Days 13–15) |
| 4 | SQL Querying | ✅ Done (Days 16–23) |
| 5 | Business Analytics | 🟡 In progress (started Day 27, runs 24–30) |
| 6 | Views + Procedures + Functions | ⬜ Not started (Days 31–35) |
| 7 | Performance Optimization | ⬜ Not started (Days 36–39) |
| 8 | Security | ⬜ Not started (Days 40–42) |
| 9 | Power BI Dashboard | ⬜ Not started (Days 43–47) |
| 10 | Backend API | ⬜ Not started (Days 48–50) |
| 11 | Frontend | ⬜ Not started (Days 51–53) |
| 12 | Deployment + Documentation | ⬜ Not started (Day 54) |
| 13 (stretch) | AI/Advanced Analytics | ⬜ Planned for after Day 60 |

## Build Log

### Day 6 — Customers table

Created the `EcommerceAnalytics` database and the `Customers` table with its core columns. Added a `UNIQUE` constraint on Email, a `CHECK` on DateOfBirth to block future dates, and a `CHECK` on Gender. Inserted sample customers to confirm everything worked.

### Day 7 — Categories table

Created the `Categories` table with a self-referencing foreign key (`ParentCategoryID → CategoryID`), so the schema supports subcategories such as Electronics → Phones. Inserted one parent category and one child category to verify the foreign key worked correctly.

### Day 8 — Products table

Created the `Products` table with a foreign key to Categories, and added a `CHECK (Price > 0)` constraint. Verified the foreign key correctly rejects a non-existent CategoryID.

### Day 9 — Orders table

Created the `Orders` table with a foreign key to Customers, and added a `CHECK` constraint restricting Status to `Pending`, `Shipped`, `Delivered`, or `Cancelled`. Verified the constraint rejects an invalid status value.

### Day 10 — OrderItems (junction table)

Created `OrderItems`, linking Orders and Products through two foreign keys. Learned why `UnitPrice` is stored separately from `Products.Price` — so historical orders keep the price at the time of sale, even if the product's current price later changes. Verified the `Quantity` CHECK constraint rejects zero or negative values.

### Day 11 — Payments table

Created the `Payments` table with a foreign key to Orders, and added CHECK constraints on Amount (greater than 0) and Method (Cash, Card, or Online). Verified both constraints reject invalid values.

### Day 12 — Inventory table

Created the `Inventory` table with a foreign key to Products, a `UNIQUE` constraint on ProductID so each product has exactly one stock record, and a `CHECK (StockQuantity >= 0)` constraint. This completed Phase 2 — all 7 tables were now built.

### Day 13 — Data Quality Audit

Tested three tables by attempting invalid inserts, to find gaps before writing fixes. Found three issues: Products allowed empty names, OrderItems allowed negative prices, and Orders allowed future dates.

### Day 14 — Data Quality Fixes

Closed the three gaps found in the Day 13 audit with new CHECK constraints: `CK_Products_Name_NotEmpty` blocks empty-string product names, `CK_OrderItems_UnitPrice` blocks zero or negative unit prices, and `CK_Orders_NoFutureDate` blocks order dates set in the future. Re-ran the Day 13 failing tests to confirm all three are now correctly rejected.

### Day 15 — Final Data Quality Pass + Documentation

Tested the remaining tables, Categories and Customers, for the same kind of empty-string gaps. Added `CK_Categories_Name_NotEmpty` and `CK_Customers_FirstName_LastName_NotEmpty`. Confirmed Payments and Inventory needed no changes, since they were already covered by existing checks. Wrote `documentation/data-quality-rules.md`, a full constraint reference for all 7 tables. This completed Phase 3 — the schema is now fully hardened.

### Day 16 — Basic SELECT Queries

Started `queries/basic_queries.sql`, the first file in Phase 4 (SQL Querying). Practiced `WHERE`, `ORDER BY`, `LIKE`, and `TOP`. Queries covered customers by city, products under a price threshold sorted cheapest first, the 3 most recent orders, and customers with Gmail addresses.

### Day 17 — First JOINs

Started `queries/joins.sql`. Joined Customers and Orders to see customer names alongside their orders, then joined Orders, OrderItems, and Products together in a 3-table join to see actual product names, quantities, and prices per order.

### Day 18 — Aggregate Functions and GROUP BY

Started `queries/aggregates.sql`. Practiced `COUNT`, `SUM`, and `AVG` combined with `GROUP BY` on real data. Queries covered orders grouped by status, total revenue per product by joining OrderItems and Products, average payment amount per method, and products filtered with `HAVING` based on total revenue.

### Day 19 — Subqueries

Started `queries/subqueries.sql`. Practiced nesting a `SELECT` inside another query's `WHERE` or `HAVING` clause. Queries covered products priced above the average, customers who have placed at least one order using `IN` instead of a join, the single most expensive product using `MAX`, and orders with a total value above the overall average order value. Along the way, caught and fixed a mistake pointing a subquery at the wrong table and column — the same "which table, which column" discipline learned earlier with foreign keys.

### Day 20 — CTEs (Common Table Expressions)

Started `queries/ctes.sql`. Learned `WITH name AS (...)` for naming a temporary result set, and rewrote subquery-style logic more clearly using CTEs instead of nesting. Queries covered products above average price, orders above average order value, and customer order counts.

### Day 21 — First Window Function (RANK)

Started `queries/window_functions.sql`. Learned `RANK() OVER (ORDER BY ...)`, which ranks rows without collapsing them the way GROUP BY alone does. Queries covered ranking products by total revenue generated and ranking customers by total amount spent.

### Day 22 — Running Totals (SUM OVER, PARTITION BY)

Continued `queries/window_functions.sql`. Learned `SUM() OVER (ORDER BY ...)` for cumulative running totals, and `PARTITION BY` to reset a calculation separately per group. Queries covered a running total of revenue by order date and an order count per customer that restarts at 1 for each new customer. Along the way, debugged an "Ambiguous column name" error, the first real case of needing table aliases on every shared column name across a join.

### Day 23 — Capstone Query + Phase 4 Documentation

Wrote a capstone query combining a CTE, a join, GROUP BY, and PARTITION BY to find the top 2 products per category by revenue. Wrote `documentation/querying-techniques.md`, a full summary of every SQL technique learned in Phase 4. This completed Phase 4 — filtering, joins, aggregates, subqueries, CTEs, and window functions were all covered and applied to real data.

### Day 24 — Sales Overview

Started `analytics/sales_analysis.sql`, the first file in the analytics folder, marking the shift from Phase 4's technique-focused queries to Phase 5's business-question-focused ones. Answered three foundational sales questions using SQL already learned in Phase 4: total revenue across all orders, total revenue broken down by month using `FORMAT()` to group dates, and the average order value calculated through a subquery that first totals each order individually. No new SQL syntax was introduced; the focus was applying existing tools to real business questions rather than practice exercises.

### Day 25 — Product Performance

Started `analytics/product_analysis.sql`. Answered three product-focused questions: total revenue broken down by category, the top 5 products by quantity sold rather than revenue, and the lowest 3 performing products by revenue using ascending order instead of descending. Same SQL tools as Phase 4, applied to a different angle of the business.

### Day 26 — Top Customers & Spending

Started `analytics/customer_analysis.sql`. Answered three customer-focused questions: the top 5 customers by total spend, the number of orders placed per customer, and customers who spent above the average customer spend, using a CTE combined with a subquery.

### Day 27 — Repeat Customers & Segmentation

Continued `analytics/customer_analysis.sql`. Identified repeat customers using `HAVING COUNT(...) > 1`, introduced `CASE` to label customers as "High Value" or "Regular" based on total spend, and wrote the project's first `LEFT JOIN` to find customers with zero orders — a question `INNER JOIN` alone couldn't answer, since it would hide exactly those unmatched rows.
## Folder Structure

```
EcommerceAnalytics/
├── README.md
├── database/
│   ├── 01_database.sql
│   ├── 03_tables.sql
│   ├── 04_constraints.sql
│   ├── 05_sample_data.sql
│   └── 06_indexes.sql
├── documentation/
│   ├── data-quality-rules.md
│   └── querying-techniques.md
├── queries/
│   ├── basic_queries.sql
│   ├── joins.sql
│   ├── aggregates.sql
│   ├── subqueries.sql
│   ├── ctes.sql
│   └── window_functions.sql
├── analytics/
│   ├── sales_analysis.sql
│   ├── product_analysis.sql
│   └── customer_analysis.sql
├── views/
├── procedures/
├── functions/
├── powerbi/
├── backend/
└── frontend/
```

## How to Run

Open SQL Server Management Studio or Azure Data Studio. Run the scripts in `database/` in numeric order, from 01 to 06. Verify the setup with `SELECT * FROM dbo.Customers;`. From there, explore the query examples in `queries/`, where each file covers one SQL technique in the order it was learned, and `analytics/` for business-question queries.