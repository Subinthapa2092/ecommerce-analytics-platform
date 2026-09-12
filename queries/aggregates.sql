use EcommerceAnalytics;

select * from dbo.orders;
select * from dbo.OrderItems;
select * from dbo.payments;
select * from dbo.products;
go
-- 1) Task total number of orders per status 
-- 
select status, count(*) as ordercount from dbo.orders group by status;
-- 2) total revenue per product(using orderitems,quantity* unitPrice 
select p.productName,sum(oi.quantity * oi.unitprice) as totalrevenue 
from dbo.OrderItems as oi 
join dbo.Products as p on 
oi.ProductID = p.ProductID 
group by p.Productname 
order by sum(oi.quantity* oi.UnitPrice) desc;
--3) Average payment amount per payment method 
select method,avg(amount) as AveragePayment,count(*) as paymentcount 
from dbo.Payments group by method;

--4) which producsts have generatered more than a certain amount in revenue(having) 
select p.productName,sum(oi.quantity*oi.unitprice) as totalrevenue  
from dbo.OrderItems as oi 
join dbo.products as p 
on oi.ProductID = p.ProductID 
group by p.ProductName
having sum(oi.quantity * oi.unitprice) >100;
