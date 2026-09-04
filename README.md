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
| 1 | Database Foundation | 🟡 In progress (started Day 6) |
| 2 | Tables + Relationships | ⬜ Not started |
| 3 | Data Quality + Constraints | ⬜ Not started |
| 4 | SQL Querying | ⬜ Not started |
| 5 | Business Analytics | ⬜ Not started |
| 6 | Views + Procedures + Functions | ⬜ Not started |
| 7 | Performance Optimization | ⬜ Not started |
| 8 | Security | ⬜ Not started |
| 9 | Power BI Dashboard | ⬜ Not started |
| 10 | Backend API | ⬜ Not started |
| 11 | Frontend | ⬜ Not started |
| 12 | Deployment + Documentation | ⬜ Not started |

## Build Log

### Day 10 — OrderItems (junction table)
- Created OrderItems linking Orders + Products (two FKs)
- Learned why UnitPrice is stored separately from Products.Price
- Verified Quantity CHECK constraint rejects 0/negative values

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
├── queries/
├── views/
├── procedures/
├── functions/
├── analytics/
├── powerbi/
├── backend/
├── frontend/
└── documentation/
```

## How to Run

1. Open SQL Server Management Studio (or Azure Data Studio).
2. Run scripts in `database/` **in numeric order** (01 → 10).
3. Verify with `SELECT * FROM dbo.Customers;`
