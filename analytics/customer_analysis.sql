-- Day 26 Top Customers & Spending 
select * from dbo.Customers;
select * from dbo.Orders;
select * from dbo.OrderItems;
---1) top 5 customers by total spend 
select top 5 c.firstname,c.lastname,sum(oi.quantity*oi.unitprice) as totalspend
from dbo.Customers as c 
join dbo.orders as o on 
c.customerid = o.customerid 
join dbo.OrderItems as oi 
on o.orderid = oi.OrderID 
group by c.CustomerID,c.FirstName,c.LastName 
order by totalspend desc;
--2) Number of orders per customer , highest first 
select c.firstname,c.lastname,count(o.orderid)as ordercount 
from dbo.Customers as c 
join dbo.Orders as o 
on c.CustomerID = o.CustomerID 
group by c.FirstName,c.LastName ,c.CustomerID
order by ordercount desc;
--3) customers who spend above the average customer spend 
-- ( subquerey +CTE combo) 
with customerspend as(
select c.customerid,sum(oi.quantity*oi.unitprice) as totalspend
from dbo.Customers as c 
join dbo.Orders as o  
on c.CustomerID = o.CustomerID 
join dbo.OrderItems as oi on
o.orderid = oi.orderid 
group by c.CustomerID)
select * from customerspend 
where totalspend >(select avg(totalspend) from customerspend);