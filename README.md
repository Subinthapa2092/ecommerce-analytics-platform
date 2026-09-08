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
| 3 | Data Quality + Constraints | 🟡 In progress (started Day 13) |
| 4 | SQL Querying | ⬜ Not started |
| 5 | Business Analytics | ⬜ Not started |
| 6 | Views + Procedures + Functions | ⬜ Not started |
| 7 | Performance Optimization | ⬜ Not started |
| 8 | Security | ⬜ Not started |
| 9 | Power BI Dashboard | ⬜ Not started |
| 10 | Backend API | ⬜ Not started |
| 11 | Frontend | ⬜ Not started |
| 12 | Deployment + Documentation | ⬜ Not started |
| 13 (stretch) | AI/Advanced Analytics | ⬜ Planned for after Day 60 |

## Build Log

### Day 6 — Customers table
- Created `EcommerceAnalytics` database
- Created `Customers` table with core columns
- Added UNIQUE on Email, CHECK on DateOfBirth (no future dates), CHECK on Gender
- Inserted sample customers

### Day 7 — Categories table
- Created `Categories` table with self-referencing FK (`ParentCategoryID → CategoryID`)
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
- Created OrderItems linking Orders + Products (two FKs)
- Learned why UnitPrice is stored separately from Products.Price
- Verified Quantity CHECK constraint rejects 0/negative values

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
- Tested 3 tables for constraint gaps by attempting invalid inserts
- Found: Products allows empty names, OrderItems allows negative prices, Orders allows future dates
- Fixes planned for Day 14

## Folder Structure

EcommerceAnalytics/
├── README.md
├── database/
│ ├── 01_database.sql
│ ├── 03_tables.sql
│ ├── 04_constraints.sql
│ ├── 05_sample_data.sql
│ └── 06_indexes.sql
├── queries/
├── views/
├── procedures/
├── functions/
├── analytics/
├── powerbi/
├── backend/
├── frontend/
└── documentation/


## How to Run

1. Open SQL Server Management Studio (or Azure Data Studio).
2. Run scripts in `database/` **in numeric order** (01 → 06).
3. Verify with `SELECT * FROM dbo.Customers;`