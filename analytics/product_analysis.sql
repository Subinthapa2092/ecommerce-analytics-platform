-- Day 25 Product Performance 
select * from dbo.products;
select * from dbo.categories;
select * from dbo.OrderItems;

---1) Revenue by Category 

select cat.CategoryName,sum(oi.quantity* oi.unitprice) as categoryRevenue 
from dbo.OrderItems as oi 
join dbo.Products as p 
on oi.ProductID = p.ProductID 
join dbo.Categories as cat
on p.CategoryID = cat.CategoryID 
group by CategoryName 
order by categoryRevenue desc;

--- 2) Top 5 products by quantity sold 
select  top 5 p.productname, sum(oi.quantity) as totalquantitysold 
from dbo.OrderItems as oi 
join dbo.Products as p 
on oi.ProductID = p.ProductID 
group by ProductName 
order by totalquantitysold desc;

--3) Lowest 3 products by revenue 
select top 3 p.productname,sum(oi.quantity* oi.unitprice) as totalrevenue 
from dbo.OrderItems as oi 
join dbo.products as p on oi.productid = p.ProductID 
group by p.ProductName 
order by totalrevenue asc;