# SQL Querying Techniques Used

A reference of every SQL technique learned and applied during Phase 4 (Days 16–23), with the file where each lives.

## Basic filtering (Day 16) — `queries/basic_queries.sql`
- `WHERE` — filtering rows by a condition
- `ORDER BY` — sorting results ascending/descending
- `LIKE` with `%` wildcards — pattern matching (e.g. emails containing "gmail")
- `TOP` — limiting the number of rows returned

## Joins (Day 17) — `queries/joins.sql`
- `INNER JOIN` across 2 tables (Orders + Customers)
- `INNER JOIN` across 3 tables (Orders + OrderItems + Products)
- Table aliases (`o`, `c`, `oi`, `p`) for readable multi-table queries

## Aggregates + GROUP BY (Day 18) — `queries/aggregates.sql`
- `COUNT()`, `SUM()`, `AVG()` combined with `GROUP BY`
- `HAVING` to filter on aggregated values (unlike `WHERE`, which filters rows before grouping)
- Combining a JOIN with GROUP BY (revenue per product, across OrderItems + Products)

## Subqueries (Day 19) — `queries/subqueries.sql`
- Scalar subqueries — comparing a row against a single calculated value (`AVG`, `MAX`)
- `IN` subqueries — checking membership against a list returned by another query
- Common mistake caught: pointing a subquery at the wrong table/column (same discipline as foreign keys)

## CTEs (Day 20) — `queries/ctes.sql`
- `WITH name AS (...)` — naming a temporary result set for readability
- Rewriting subquery logic more clearly using CTEs instead of nesting

## Window functions (Days 21–22) — `queries/window_functions.sql`
- `RANK() OVER (ORDER BY ...)` — ranking rows without collapsing them (unlike GROUP BY)
- `SUM() OVER (ORDER BY ...)` — running/cumulative totals
- `PARTITION BY` — resetting a window calculation separately per group (e.g. per customer)

## Capstone (Day 23) — `queries/window_functions.sql`
Combined CTE + JOIN + GROUP BY + PARTITION BY in a single query to find the **top 2 products per category by revenue** — the same "top N per group" pattern needed later for the Power BI "Top Products" dashboard panel (Phase 9).

## Why this matters
Every technique above reappears in Phase 5 (Business Analytics) — but Phase 5 introduces no new syntax. It's the same toolbox applied question-first instead of technique-first: given a real business question, deciding which of the above techniques answers it.