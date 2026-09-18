
USE EcommerceAnalytics;
GO

-- Question 1: What is our total revenue across all orders?
-- Simple SUM across every order item ever recorded.
SELECT 
    SUM(Quantity * UnitPrice) AS TotalRevenue
FROM dbo.OrderItems;
GO

-- Question 2: How does revenue break down month by month?
-- FORMAT() turns a full OrderDate (e.g. 2026-05-18) into
-- just 'yyyy-MM' (e.g. '2026-05'), so all orders placed in
-- the same month get grouped together.
SELECT 
    FORMAT(o.OrderDate, 'yyyy-MM') AS Month,
    SUM(oi.Quantity * oi.UnitPrice) AS MonthlyRevenue
FROM dbo.OrderItems oi
JOIN dbo.Orders o 
    ON oi.OrderID = o.OrderID
GROUP BY FORMAT(o.OrderDate, 'yyyy-MM')
ORDER BY Month;
GO

-- Question 3: What is the average value of an order?
-- Can't just AVG(UnitPrice) directly -- that would average
-- individual line-item prices, not whole-order totals.
-- So the subquery first calculates ONE total per OrderID,
-- then the outer query averages those per-order totals.
SELECT 
    AVG(OrderTotal) AS AverageOrderValue
FROM (
    SELECT 
        OrderID, 
        SUM(Quantity * UnitPrice) AS OrderTotal
    FROM dbo.OrderItems
    GROUP BY OrderID
) AS OrderTotals;
GO