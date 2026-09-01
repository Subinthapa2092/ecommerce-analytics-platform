/* =========================================================
   04_constraints.sql
   Purpose: Data quality rules for Customers
   ========================================================= */

USE EcommerceAnalytics;
GO

-- Email must be unique
ALTER TABLE dbo.Customers
    ADD CONSTRAINT UQ_Customers_Email UNIQUE (Email);
GO

-- Basic email format check (must contain @ and a dot)
ALTER TABLE dbo.Customers
    ADD CONSTRAINT CK_Customers_Email_Format
    CHECK (Email LIKE '%_@__%.__%');
GO

-- Gender restricted to known values (nullable still allowed)
ALTER TABLE dbo.Customers
    ADD CONSTRAINT CK_Customers_Gender
    CHECK (Gender IS NULL OR Gender IN ('Male', 'Female', 'Other'));
GO

-- Customer must be a real person, not born in the future
ALTER TABLE dbo.Customers
    ADD CONSTRAINT CK_Customers_DOB
    CHECK (DateOfBirth IS NULL OR DateOfBirth <= CAST(GETDATE() AS DATE));
GO
