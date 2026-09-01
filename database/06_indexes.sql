/* =========================================================
   06_indexes.sql
   Purpose: Supporting indexes for common lookups
   ========================================================= */

USE EcommerceAnalytics;
GO

-- Speeds up login/lookup by email (already unique, but explicit nonclustered index
-- is useful once other constraints/joins are added later)
IF NOT EXISTS (
    SELECT 1 FROM sys.indexes WHERE name = 'IX_Customers_Email' AND object_id = OBJECT_ID('dbo.Customers')
)
BEGIN
    CREATE NONCLUSTERED INDEX IX_Customers_Email
    ON dbo.Customers (Email);
END
GO

-- Speeds up filtering active customers by country (common for reporting)
IF NOT EXISTS (
    SELECT 1 FROM sys.indexes WHERE name = 'IX_Customers_Country_IsActive' AND object_id = OBJECT_ID('dbo.Customers')
)
BEGIN
    CREATE NONCLUSTERED INDEX IX_Customers_Country_IsActive
    ON dbo.Customers (Country, IsActive);
END
GO
