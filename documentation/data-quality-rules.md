# Data Quality Rules

A single-page reference of every constraint enforced across the EcommerceAnalytics schema.
Built during Phase 3 (Days 13–15) after auditing all 7 tables for gaps.

## Customers
- `Email` — `UNIQUE`, must match a basic email format (`CK_Customers_Email_Format`)
- `DateOfBirth` — cannot be in the future (`CK_Customers_DOB`)
- `Gender` — must be `Male`, `Female`, `Other`, or `NULL` (`CK_Customers_Gender`)
- `FirstName` / `LastName` — cannot be empty strings (`CK_Customers_FirstName_LastName_NotEmpty`)
- `IsActive` — defaults to `1` if not provided

## Categories
- `CategoryName` — cannot be an empty string (`CK_Categories_Name_NotEmpty`)
- `ParentCategoryID` — self-referencing FK to `CategoryID` (`FK_Categories_Parent`), nullable for top-level categories

## Products
- `Price` — must be greater than 0 (`CK_Products_Price`)
- `ProductName` — cannot be an empty string (`CK_Products_Name_NotEmpty`)
- `CategoryID` — must reference an existing row in `Categories` (`FK_Products_Categories`)
- `IsActive` — defaults to `1` if not provided

## Orders
- `Status` — must be one of `Pending`, `Shipped`, `Delivered`, `Cancelled` (`CK_Orders_Status`)
- `OrderDate` — cannot be set in the future (`CK_Orders_NoFutureDate`)
- `CustomerID` — must reference an existing row in `Customers` (`FK_Orders_Customers`)
- `OrderDate` — defaults to the current UTC timestamp if not provided

## OrderItems
- `Quantity` — must be greater than 0 (`CK_OrderItems_Quantity`)
- `UnitPrice` — must be greater than 0 (`CK_OrderItems_UnitPrice`)
- `OrderID` — must reference an existing row in `Orders` (`FK_OrderItems_Orders`)
- `ProductID` — must reference an existing row in `Products` (`FK_OrderItems_Products`)
- Note: `UnitPrice` is stored per order item (not read from `Products.Price`) so historical orders keep the price at time of sale, even if the product's current price later changes.

## Payments
- `Amount` — must be greater than 0 (`CK_Payments_Amount`)
- `Method` — must be `Cash`, `Card`, or `Online` (`CK_Payments_Method`)
- `OrderID` — must reference an existing row in `Orders` (`FK_Payments_Orders`)
- `PaidAt` — defaults to the current UTC timestamp if not provided

## Inventory
- `StockQuantity` — must be greater than or equal to 0 (`CK_Inventory_Stock`)
- `ProductID` — `UNIQUE` (`UQ_Inventory_Product`, guarantees exactly one stock record per product), and must reference an existing row in `Products` (`FK_Inventory_Products`)
- `LastRestockedAt` — defaults to the current UTC timestamp if not provided

## Audit Method

Each gap listed above was found by deliberately attempting an invalid insert (empty strings, negative numbers, future dates, non-existent foreign keys) and observing whether SQL Server rejected it. Where a test succeeded when it shouldn't have, a matching `CHECK` or `UNIQUE` constraint was added via `ALTER TABLE`, then the same test was re-run to confirm it now fails.