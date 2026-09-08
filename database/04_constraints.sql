-- 1. Email must be unique no two customers share one email so
alter table dbo.Customers
add constraint UQ_Customers_Email unique(Email);
--2. DateofBirth can't be in the future so
alter table dbo.Customers
-- checkin the date of birth is less than or equal to the current date
add constraint CK_Customers_DOB 
check(DateofBirth <= cast(getDate() as Date));

