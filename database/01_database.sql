/* =========================================================
   01_database.sql
   Purpose: Create the EcommerceAnalytics database
   Phase: 1 - Database Foundation
   ========================================================= */

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'EcommerceAnalytics')
BEGIN
    CREATE DATABASE EcommerceAnalytics;
END
GO

USE EcommerceAnalytics;
GO
