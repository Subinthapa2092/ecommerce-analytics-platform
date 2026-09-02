-- inserting the 3 rows for Customers Data
insert into dbo.Customers(FirstName,LastName,
Email,Phone,
DateofBirth,City,Country)values
('Subin','Thapa','subinthapa2092@gmail.com','9761875043','2007-09-20','Dhunibensi-09 ,Dhading','Nepal'),
('Rahul','Sharma','rahul123@gmail.com','9761808910','2004-09-20','NewRoad-09,Kathmandu','Nepal'),
('Mahin','Rajat','mahin12@gmail.com','9733343343','2009-02-20','NewDelhi','India');
select * from dbo.Customers;
-- inserting the 3 rows for the 
insert into dbo.Categories(CategoryName,ParentCategoryID)
values('Electronics',null),
('Phones',1);
select * from dbo.Categories;