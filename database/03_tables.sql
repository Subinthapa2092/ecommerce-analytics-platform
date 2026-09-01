use EcommerceAnalytics;
go

create table dbo.Customers
(CustomerID int identity(1,1) not null,
FirstName Nvarchar(100) not null,
LastName Nvarchar(100) not null,
Email Nvarchar(150) not null,
Phone Nvarchar(100) not null,
DateofBirth Date null,
City Nvarchar(100) null,
Country Nvarchar(50) null,
constraint PK_Customers Primary key(CustomerID));
go