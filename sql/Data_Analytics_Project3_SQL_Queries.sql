-- Data Analytics Project 3: SQL Data Analysis
-- Source: Data_Analytics_Project1_Cleaned(1).xlsx / Cleaned Data
-- Table name used below: orders
-- The queries cover the Project 3 requirements: SELECT, WHERE, ORDER BY, GROUP BY, COUNT, SUM, AVG.
-- Additional practice includes HAVING and LIMIT.

CREATE TABLE orders (
    OrderID TEXT, Date DATE, CustomerID TEXT, Product TEXT, Quantity INTEGER,
    UnitPrice REAL, ShippingAddress TEXT, PaymentMethod TEXT, OrderStatus TEXT,
    TrackingNumber TEXT, ItemsInCart INTEGER, CouponCode TEXT,
    ReferralSource TEXT, TotalPrice REAL
);

-- Q1: SELECT — inspect the first 10 rows.
SELECT OrderID, Product, Quantity, UnitPrice, TotalPrice FROM orders LIMIT 10;

-- Q2: WHERE + ORDER BY — high-value orders above 2000.
SELECT OrderID, Product, TotalPrice FROM orders WHERE TotalPrice > 2000 ORDER BY TotalPrice DESC;

-- Q3: GROUP BY + COUNT — number of orders per product.
SELECT Product, COUNT(*) AS OrderCount FROM orders GROUP BY Product ORDER BY OrderCount DESC;

-- Q4: GROUP BY + SUM — total units sold per product.
SELECT Product, SUM(Quantity) AS TotalQuantity FROM orders GROUP BY Product ORDER BY TotalQuantity DESC;

-- Q5: GROUP BY + AVG — average unit price per product.
SELECT Product, AVG(UnitPrice) AS AvgUnitPrice FROM orders GROUP BY Product ORDER BY AvgUnitPrice DESC;

-- Q6: GROUP BY + SUM — revenue by product.
SELECT Product, SUM(TotalPrice) AS TotalRevenue FROM orders GROUP BY Product ORDER BY TotalRevenue DESC;

-- Q7: GROUP BY — order count and total order value by status.
SELECT OrderStatus, COUNT(*) AS OrderCount, SUM(TotalPrice) AS TotalValue FROM orders GROUP BY OrderStatus ORDER BY TotalValue DESC;

-- Q8: GROUP BY + COUNT + AVG — payment method performance.
SELECT PaymentMethod, COUNT(*) AS Orders, AVG(TotalPrice) AS AvgOrderValue FROM orders GROUP BY PaymentMethod ORDER BY AvgOrderValue DESC;

-- Q9: GROUP BY + COUNT + SUM — revenue by referral source.
SELECT ReferralSource, COUNT(*) AS Orders, SUM(TotalPrice) AS Revenue FROM orders GROUP BY ReferralSource ORDER BY Revenue DESC;

-- Q10: GROUP BY + COUNT + AVG — coupon usage and average order value.
SELECT CouponCode, COUNT(*) AS Orders, AVG(TotalPrice) AS AvgOrderValue FROM orders GROUP BY CouponCode ORDER BY AvgOrderValue DESC;

-- Q11: HAVING — statuses whose average order value exceeds 1000.
SELECT OrderStatus, AVG(TotalPrice) AS AvgOrderValue FROM orders GROUP BY OrderStatus HAVING AVG(TotalPrice) > 1000 ORDER BY AvgOrderValue DESC;

-- Q12: Combined aggregation — product performance summary.
SELECT Product, COUNT(*) AS Orders, SUM(TotalPrice) AS Revenue, AVG(TotalPrice) AS AvgOrderValue FROM orders GROUP BY Product ORDER BY Revenue DESC;

-- Q13: GROUP BY year — annual order and revenue trend.
SELECT strftime('%Y', Date) AS Year, COUNT(*) AS Orders, SUM(TotalPrice) AS Revenue FROM orders GROUP BY Year ORDER BY Year;

-- Q14: HAVING — products generating more than 150,000 revenue.
SELECT Product, SUM(TotalPrice) AS Revenue FROM orders GROUP BY Product HAVING SUM(TotalPrice) > 150000 ORDER BY Revenue DESC;

-- Q15: ORDER BY + LIMIT — top 10 highest-value orders.
SELECT OrderID, Date, Product, TotalPrice FROM orders ORDER BY TotalPrice DESC LIMIT 10;
