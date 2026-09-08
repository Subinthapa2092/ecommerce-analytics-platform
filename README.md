# Ecommerce Analytics Platform

A portfolio-grade E-Commerce Analytics Platform built progressively alongside DP-800 study.

**Goal:** SQL Server database → SQL analytics → Power BI → FastAPI → React.

## Tech Stack

* **Database:** SQL Server / T-SQL
* **Analytics:** Power BI / Python
* **Backend:** FastAPI
* **Frontend:** React

## Roadmap

| Phase | Focus                          | Status         |
| ----- | ------------------------------ | -------------- |
| 1     | Database Foundation            | ✅ Done         |
| 2     | Tables + Relationships         | ✅ Done         |
| 3     | Data Quality + Constraints     | 🟡 In Progress |
| 4     | SQL Querying                   | ⬜              |
| 5     | Business Analytics             | ⬜              |
| 6     | Views + Procedures + Functions | ⬜              |
| 7     | Performance Optimization       | ⬜              |
| 8     | Security                       | ⬜              |
| 9     | Power BI Dashboard             | ⬜              |
| 10    | Backend API                    | ⬜              |
| 11    | Frontend                       | ⬜              |
| 12    | Deployment + Documentation     | ⬜              |
| 13    | AI / Advanced Analytics        | ⬜ Stretch      |

## Progress

### Day 6–12 — Database Foundation

* Created `EcommerceAnalytics` database.
* Built 7 core tables.
* Added primary keys, foreign keys, UNIQUE and CHECK constraints.
* Tested relationships and invalid data cases.

### Day 13 — Data Quality Audit

Found three issues:

* Products allow empty names.
* OrderItems allow negative prices.
* Orders allow future dates.

**Next:** Fix the identified constraints and continue the SQL Server build.

## Folder Structure

```text
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

1. Open SQL Server Management Studio.
2. Run the scripts in order: `01 → 03 → 04 → 05 → 06`.
3. Select the database:

```sql
USE EcommerceAnalytics;
GO
```

4. Verify:

```sql
SELECT * FROM dbo.Customers;
```

## Status

🚧 **Currently in development — Day 13**
