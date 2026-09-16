-- use EcommerceAnalytics;
select * from dbo.OrderItems;
select * from dbo.Products;
select * from dbo.Orders;
select * from dbo.Customers;

--- Day 21 work: first window functions (RANK)

-- Task 1: Rank products by total revenue generated (best seller = rank 1)
select 
    p.ProductName, 
    sum(oi.Quantity * oi.unitprice) as TotalRevenue,
    -- RANK() assigns 1, 2, 3... based on revenue, highest first (DESC)
    -- runs AFTER the GROUP BY totals are calculated
    rank() over (order by sum(oi.quantity * oi.unitprice) desc) as RevenueRank
from dbo.orderItems as oi  
join dbo.products as p 
    on oi.productid = p.productid 
group by p.productname;

-- Task 2: Rank customers by total amount spent (biggest spender = rank 1)
select 
    c.firstname, 
    c.lastname,
    sum(oi.quantity * oi.unitprice) as TotalSpend,
    -- same RANK() pattern as Task 1, but ranking customers instead of products
    -- needs 2 joins here: Customers -> Orders -> OrderItems, since spend isn't stored directly on Customers
    rank() over (order by sum(oi.quantity * oi.unitprice) desc) as SpendRank
from dbo.customers as c 
join dbo.orders as o 
    on c.customerID = o.customerid 
join dbo.orderitems as oi  
    on o.orderid = oi.orderid 
group by c.customerid, c.firstname, c.lastname;