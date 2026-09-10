use EcommerceAnalytics;

select * from dbo.Orders;
select * from dbo.Products;
select * from dbo.Customers;
-- 1st work : Customers from a Specific City 
select FirstName,LastName,City from dbo.Customers 
where city = 'NewDelhi';

--- 2nd Products under a certain price, and cheapest first 

select ProductName,Price from dbo.Products where 
price < 200 order by price asc;

--- 3rd the most recent orders 
select top 3* from dbo.orders 
order by OrderDate desc;
--- 4th Customers whose email contains 'gmail'
select FirstName,LastName,Email
from dbo.Customers where email like '%gmail%';
--- Testing with the city 
select FirstName,LastName,City from 
dbo.Customers where city like '%Kathmandu%';