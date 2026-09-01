/* =========================================================
   03_tables.sql
   Purpose: Core table(s) for Phase 1
   Table:   Customers
   ========================================================= */

USE EcommerceAnalytics;
GO

IF OBJECT_ID('dbo.Customers', 'U') IS NOT NULL
    DROP TABLE dbo.Customers;
GO

CREATE TABLE dbo.Customers
(
    CustomerID      INT             IDENTITY(1,1)   NOT NULL,
    FirstName       NVARCHAR(50)                    NOT NULL,
    LastName        NVARCHAR(50)                    NOT NULL,
    Email           NVARCHAR(100)                   NOT NULL,
    Phone           NVARCHAR(20)                    NULL,
    Gender          NVARCHAR(10)                    NULL,
    DateOfBirth     DATE                            NULL,
    City            NVARCHAR(50)                    NULL,
    Country         NVARCHAR(50)                    NULL,
    IsActive        BIT             CONSTRAINT DF_Customers_IsActive DEFAULT (1) NOT NULL,
    CreatedAt       DATETIME2       CONSTRAINT DF_Customers_CreatedAt DEFAULT (SYSUTCDATETIME()) NOT NULL,

    CONSTRAINT PK_Customers PRIMARY KEY CLUSTERED (CustomerID)
);
GO
