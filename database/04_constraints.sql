-- 1. Email must be unique no two customers share one email so
alter table dbo.Customers
add constraint UQ_Customers_Email unique(Email);
--2. DateofBirth can't be in the future so
alter table dbo.Customers
-- checkin the date of birth is less than or equal to the current date
add constraint CK_Customers_DOB 
check(DateofBirth <= cast(getDate() as Date));

-- Day 14: Data quality fixes from Day 13 audit

ALTER TABLE dbo.Products
    ADD CONSTRAINT CK_Products_Name_NotEmpty
    CHECK (LEN(ProductName) > 0);

ALTER TABLE dbo.OrderItems
    ADD CONSTRAINT CK_OrderItems_UnitPrice
    CHECK (unitprice > 0);   -- fill this in yourself first

ALTER TABLE dbo.Orders
    ADD CONSTRAINT CK_Orders_NoFutureDate
    CHECK (OrderDate <= SYSUTCDATETIME());
-- Day 15: Data quality fixes for the Category table and Customers table

alter table dbo.Categories add constraint ck_Categories_Name_NotEmpty check(len(CategoryName) >0);
alter table dbo.Customers add constraint ck_Customers_FirstName_LastName_NotEmpty check(len(FirstName) >0 and len(LastName) >0);