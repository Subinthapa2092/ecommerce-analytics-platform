-- use EcommerceAnalytics;
-- 1) Products price above the average price 
with AvgPrice as (
select avg(price) as AveragePrice 
from dbo.Products)
select ProductName,Price from 
dbo.Products,AvgPrice
where Price > AveragePrice;
--2)  Orders with total value above the average order value

with orderTotals as(
select OrderId,sum(quantity*unitprice) as orderTotal
from dbo.OrderItems 
group by orderID 
)
select * from orderTotals 
where ordertotal >(select avg(orderTotal) from ordertotals);

--3) 3. Customer order counts
with CustomerOrderCounts as(
select customerid,count(*) as totalorders 
from dbo.Orders group by CustomerID 
)
select c.FirstName,c.LastName,coc.totalorders from 
dbo.Customers as c 
join CustomerOrderCounts as coc 
on coc.CustomerID = c.CustomerID 
order by coc.totalorders desc;