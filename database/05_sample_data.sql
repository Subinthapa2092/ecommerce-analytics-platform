-- inserting the 3 rows for Customers Data
insert into dbo.Customers(FirstName,LastName,
Email,Phone,
DateofBirth,City,Country)values
('Subin','Thapa','subinthapa2092@gmail.com','9761875043','2007-09-20','Dhunibensi-09 ,Dhading','Nepal'),
('Rahul','Sharma','rahul123@gmail.com','9761808910','2004-09-20','NewRoad-09,Kathmandu','Nepal'),
('Mahin','Rajat','mahin12@gmail.com','9733343343','2009-02-20','NewDelhi','India');
select * from dbo.Customers;
-- inserting the 2 rows for the  Categories table
insert into dbo.Categories(CategoryName,ParentCategoryID)
values('Electronics',null),
('Phones',1);
select * from dbo.Categories;
--- inserting the values on the product table
insert into dbo.Products(ProductName,Price,CategoryID)
values('iphone 15',99900,2),('Samsung Galaxy S24',799900.99,2);

-- inserting the values on the Order table 
insert into dbo.Orders(CustomerID,Status) values(1,'Pending'),
(2,'Shipped'),(3,'Delivered');
---inserting the values of the OrderItems 

insert into dbo.OrderItems(OrderID,ProductID,Quantity,UnitPrice)values
(1,2,1,999.99),
(2,3,2,79.00),
(3,3,5,50.00);