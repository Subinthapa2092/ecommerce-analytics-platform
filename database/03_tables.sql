use EcommerceAnalytics;
go

--- Creating the Customers Tables 
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

--- Creating the Categories Tables 
use EcommerceAnalytics;
go

create table dbo.Categories
(
    CategoryID int identity(1,1) not null,
    CategoryName nvarchar(100) not null,
    ParentCategoryID int null,
    constraint PK_Categories primary key (CategoryID),
    constraint FK_Categories_Parent foreign key (ParentCategoryID)
        references dbo.Categories(CategoryID)
);
--- Creating the Products Table 
use EcommerceAnalytics
create table dbo.Products
(
ProductID int identity(1,1) not null,
ProductName nvarchar(100) not null,
Price Decimal(10,2) not null,
CategoryID int not null,
IsActive bit default (1) not null,
constraint PK_Products primary key(ProductID),
constraint FK_Products_categories 
Foreign key (CategoryID) references dbo.Categories(CategoryID),
constraint ck_Products_Price check (price >0));