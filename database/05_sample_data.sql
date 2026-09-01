/* =========================================================
   05_sample_data.sql
   Purpose: Seed data for testing Phase 1
   ========================================================= */

USE EcommerceAnalytics;
GO

INSERT INTO dbo.Customers (FirstName, LastName, Email, Phone, Gender, DateOfBirth, City, Country)
VALUES
('John',    'Doe',      'john.doe@example.com',      '9800000001', 'Male',   '1995-03-12', 'Kathmandu', 'Nepal'),
('Emily',   'Johnson',  'emily.johnson@example.com', '9800000002', 'Female', '1998-07-22', 'Pokhara',   'Nepal'),
('Michael', 'Brown',    'michael.brown@example.com', '9800000003', 'Male',   '1990-11-02', 'Lalitpur',  'Nepal'),
('Sarah',   'Davis',    'sarah.davis@example.com',   '9800000004', 'Female', '2000-01-15', 'Biratnagar','Nepal'),
('David',   'Wilson',   'david.wilson@example.com',  '9800000005', 'Male',   '1993-09-30', 'Butwal',    'Nepal');
GO

SELECT * FROM dbo.Customers;
GO
