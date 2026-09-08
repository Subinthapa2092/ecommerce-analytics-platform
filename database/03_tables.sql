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

--- Creating the Orders Table's 
use EcommerceAnalytics
create table dbo.Orders(
OrderID int identity(1,1) not null,
CustomerID int not null,
OrderDate Datetime2 default (sysutcdatetime()) not null,
Status Nvarchar(25) default ('Pending') not null,
constraint PK_Orders primary key (OrderID),
constraint FK_Orders_Customers foreign key (CustomerID)
references dbo.Customers(CustomerID),
constraint CK_Orders_Status check(Status in ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
);

-- Creating the Orders Items table 

create table dbo.OrderItems
(OrderItemID int identity(1,1) not null,
OrderID int not null,
ProductID int not null,
Quantity int not null,
UnitPrice decimal(10,2) not null,
constraint PK_OrderItems primary key(OrderItemID),
constraint FK_OrderItems_Orders foreign key (OrderID)
references dbo.Orders(OrderID),
constraint Fk_OrderItems_Products 
foreign key(ProductID)
references dbo.Products(ProductID),
constraint CK_OrderItems_Quantity 
check(Quantity > 0)
);

-- Creating the  Payments table 

use EcommerceAnalytics
create table dbo.Payments
(
    PaymentID int identity(1,1) not null,
    OrderID int not null,
    Amount decimal(10,2) not null,
    Method nvarchar(20) not null,
    PaidAt datetime2 default(sysutcdatetime()) not null,
    constraint PK_Payments primary key(PaymentID),
    constraint FK_Payments_Orders foreign key(OrderID) 
        references dbo.Orders(OrderID),
    constraint CK_Payments_Amount check(Amount>0),
    constraint CK_Payments_Method check(Method IN ('Cash','Card','Online'))
);

-- creatted the Inventory table 
create table dbo.Inventory
( InventoryID int identity(1,1) not null,
ProductID int not null,
StockQuantity int not null,
LastRestockedAt datetime2 default (Sysutcdatetime()) not null,
constraint PK_Inventory primary key(InventoryID),
constraint FK_Inventory_Products foreign key (ProductID)
references dbo.Products(ProductID),
constraint UQ_Inventory_Product unique(ProductID),
constraint CK_Inventory_Stock check (StockQuantity >=0)
);
go
