-- use EcommerceAnalytics;
select * from dbo.Customers;
select * from dbo.Orders;
select * from dbo.Orderitems;
select * from dbo.Products;
--- 1st join table of Customers and Orders 
select c.FirstName,c.LastName,c.Email,o.orderid,o.orderdate,o.status from dbo.Orders as o join dbo.Customers as c on o.CustomerID = c.CustomerID;
-- 2nd join table of Orders + OrdersItems+products 
select o.orderid,o.orderdate,
oi.orderitemID,oi.Quantity,p.ProductName,
oi.UnitPrice
from dbo.Orders as o 
join dbo.OrderItems as oi 
on o.orderid = oi.orderid
join dbo.Products as p 
on oi.productid = p.productid;
