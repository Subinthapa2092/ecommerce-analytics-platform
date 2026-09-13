# Ecommerce Analytics Platform

A portfolio-grade E-Commerce Analytics Platform, built progressively alongside DP-800 study.
Goal: go from a raw transactional SQL Server database → business analytics → Power BI dashboard → backend API → frontend.

## Tech Stack (planned)
- Database: SQL Server (T-SQL)
- Analytics/BI: Power BI
- Backend: FastAPI (Python)
- Frontend: React

## Roadmap

| Phase | Focus | Status |
|---|---|---|
| 1 | Database Foundation | ✅ Done (Day 6) |
| 2 | Tables + Relationships | ✅ Done (Days 7–12) |
| 3 | Data Quality + Constraints | ✅ Done (Days 13–15) |
| 4 | SQL Querying | 🟡 In progress (started Day 19, runs 16–23) |
| 5 | Business Analytics | ⬜ Not started (Days 24–30) |
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
- Created `EcommerceAnalytics` database
- Created `Customers` table with core columns
- Added `UNIQUE` on Email, `CHECK` on DateOfBirth (no future dates), `CHECK` on Gender
- Inserted sample customers

### Day 7 — Categories table
- Created `Categories` table with a self-referencing FK (`ParentCategoryID → CategoryID`)
- Supports subcategories (e.g. Electronics → Phones)
- Inserted one parent + one child category to verify the FK

### Day 8 — Products table
- Created `Products` table with FK to Categories
- Added `CHECK (Price > 0)`
- Verified FK rejects a non-existent CategoryID

### Day 9 — Orders table
- Created `Orders` table with FK to Customers
- Added `CHECK` restricting Status to `Pending`, `Shipped`, `Delivered`, `Cancelled`
- Verified CHECK rejects an invalid status value

### Day 10 — OrderItems (junction table)
- Created `OrderItems` linking Orders + Products (two FKs)
- Learned why `UnitPrice` is stored separately from `Products.Price` (price history at time of sale)
- Verified `Quantity` CHECK constraint rejects 0/negative values

### Day 11 — Payments table
- Created `Payments` table with FK to Orders
- Added `CHECK` on Amount (> 0) and Method (Cash/Card/Online)
- Verified both CHECK constraints reject invalid values

### Day 12 — Inventory table
- Created `Inventory` table with FK to Products
- Added `UNIQUE` on ProductID (one stock record per product)
- Added `CHECK (StockQuantity >= 0)`
- **Phase 2 (Tables + Relationships) complete — all 7 tables built**

### Day 13 — Data Quality Audit
- Tested 3 tables by attempting invalid inserts, to find gaps before writing fixes
- Found three issues: Products allowed empty names, OrderItems allowed negative prices, Orders allowed future dates

### Day 14 — Data Quality Fixes
- Closed the three gaps found in the Day 13 audit with new CHECK constraints:
  - `CK_Products_Name_NotEmpty` — blocks empty-string product names
  - `CK_OrderItems_UnitPrice` — blocks zero/negative unit prices
  - `CK_Orders_NoFutureDate` — blocks order dates set in the future
- Re-ran the Day 13 failing tests to confirm all three are now rejected

### Day 15 — Final Data Quality Pass + Documentation
- Tested the remaining tables (Categories, Customers) for empty-string gaps
- Added `CK_Categories_Name_NotEmpty` and `CK_Customers_FirstName_LastName_NotEmpty`
- Confirmed Payments and Inventory needed no changes (already covered by existing checks)
- Wrote `documentation/data-quality-rules.md` — full constraint reference for all 7 tables
- **Phase 3 (Data Quality + Constraints) complete — schema is fully hardened**

### Day 16 — Basic SELECT Queries
- Started `queries/basic_queries.sql` — first file in Phase 4 (SQL Querying)
- Practiced `WHERE`, `ORDER BY`, `LIKE`, `TOP`
- Queries written: customers by city, products under a price threshold (cheapest first), 3 most recent orders, customers with Gmail addresses

### Day 17 — First JOINs
- Started `queries/joins.sql`
- Joined Customers + Orders to see customer names alongside their orders
- Joined Orders + OrderItems + Products (3-table join) to see actual product names, quantities, and prices per order

### Day 18 — Aggregate Functions and GROUP BY
- Started `queries/aggregates.sql`
- Practiced `COUNT`, `SUM`, `AVG` combined with `GROUP BY` on real data
- Queries: orders grouped by status, total revenue per product (joining OrderItems + Products), average payment amount per method, and products filtered with `HAVING` based on total revenue

### Day 19 — Subqueries
- Started `queries/subqueries.sql`
- Practiced nesting a `SELECT` inside another query's `WHERE` or `HAVING` clause
- Queries: products priced above the average, customers who have placed at least one order (using `IN` instead of a JOIN), the single most expensive product (using `MAX`), and orders with a total value above the overall average order value
- Key mistake caught and fixed: pointing a subquery at the wrong table/column (e.g. comparing CustomerID against OrderID) — same "which table, which column" discipline as foreign keys



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
│   └── data-quality-rules.md
├── queries/
│   ├── basic_queries.sql
│   ├── joins.sql
│   ├── aggregates.sql        
│   └── subqueries.sql        ← Day 19
├── views/
├── procedures/
├── functions/
├── analytics/
├── powerbi/
├── backend/
└── frontend/
```

## How to Run

1. Open SQL Server Management Studio (or Azure Data Studio).
2. Run scripts in `database/` **in numeric order** (01 → 06).
3. Verify with `SELECT * FROM dbo.Customers;`
4. Explore query examples in `queries/basic_queries.sql`.