use EcommerceAnalytics;
-- 1) Products price above the average product price 
select * from dbo.products;
select * from dbo.Customers;
select * from dbo.OrderItems

-- 1. Products priced above the average product price
select ProductName,Price from dbo.Products  where price >(select avg(price) from dbo.Products);
-- 2. Customers who have placed at least one order (using a subquery, not a JOIN this time)
select firstName,LASTName from dbo.Customers where CustomerID in(select CustomerID  from dbo.Orders);
-- 3. The single most expensive product (subquery finding the max, outer query finding which row that is)
select PRODUCTName,Price from dbo.Products where price  = (select max(price) from dbo.Products);
-- 4. Orders with a total value (via OrderItems) higher than the overall average order value
select orderID,Sum(quantity*unitprice) as ordertotal
from dbo.OrderItems group by OrderID having sum(Quantity*UnitPrice) >
(select avg(quantity*unitprice)  from dbo.OrderItems);