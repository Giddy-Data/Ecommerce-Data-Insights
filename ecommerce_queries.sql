-- select str_to_date(DateAdded, '%m/%d/%Y') as converted_date from ecommerce2.ecommerce;
SET SQL_SAFE_UPDATES = 0;
-- UPDATE ecommerce2.ecommerce 
-- SET converted_date = STR_TO_DATE(DateAdded, '%m/%d/%Y');
-- ALTER TABLE ecommerce2.ecommerce drop column DateAdded;

 select * from ecommerce2.ecommerce;
-- Total Revenue
SELECT SUM(Sales) AS total_revenue FROM ecommerce2.ecommerce;

-- What is the total revenue per month?
SELECT DATE_FORMAT(converted_date, '%Y-%m') AS month, SUM(Sales) AS total_revenue
FROM ecommerce2.ecommerce
GROUP BY month
ORDER BY month;

-- What is the total revenue by category?
SELECT Category, SUM(Sales) AS total_revenue
FROM ecommerce2.ecommerce
GROUP BY Category
ORDER BY total_revenue DESC;

-- Average Order Value
SELECT SUM(Sales) / COUNT(DISTINCT ProductID) AS avg_order_value FROM ecommerce2.ecommerce;


-- Top 5 Best-Selling Products
SELECT ProductName, SUM(Sales) AS total_revenue
FROM ecommerce2.ecommerce
GROUP BY ProductName
ORDER BY total_revenue DESC
LIMIT 5;

-- What is the busiest sales month?
SELECT DATE_FORMAT(converted_date, '%Y-%m') AS month, COUNT(*) AS total_orders
FROM ecommerce2.ecommerce
GROUP BY month
ORDER BY total_orders DESC
LIMIT 1;

-- What is the total discount given per month?
SELECT DATE_FORMAT(converted_date, '%Y-%m') AS month, 
      round(SUM(Discount), 2) AS total_discount
FROM ecommerce2.ecommerce
GROUP BY month
ORDER BY month;

-- How much revenue was generated after applying discounts?
SELECT SUM(Sales - Discount) AS net_revenue FROM ecommerce2.ecommerce;

-- What is the average discount per product category?
SELECT Category, AVG(Discount) AS avg_discount
FROM ecommerce2.ecommerce
GROUP BY Category
ORDER BY avg_discount DESC;

-- How much profit was lost due to discounts?
SELECT SUM(Discount) AS total_discount_loss FROM ecommerce;

-- What is the revenue for orders with and without discounts?
SELECT 
    CASE WHEN Discount > 0 THEN 'Discounted Orders' ELSE 'Full Price Orders' END AS order_type,
    SUM(Sales) AS revenue
FROM ecommerce
GROUP BY order_type;

-- Do higher discounts lead to more sales?
SELECT Discount, SUM(Sales) AS revenue
FROM ecommerce
GROUP BY Discount
ORDER BY Discount DESC;






















 






