-- Zudio Retail Sales Performance Analytics
-- Basic analysis queries

USE Zudio_Retail_Analytics;

SELECT order_status, COUNT(*) AS total_orders
FROM Orders
GROUP BY order_status
ORDER BY total_orders DESC;

SELECT payment_mode, COUNT(*) AS total_orders
FROM Orders
GROUP BY payment_mode
ORDER BY total_orders DESC;

-- Replace oi.sales_amount with the actual sales column in Order_Items.
SELECT p.category, SUM(oi.sales_amount) AS total_sales
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.category
ORDER BY total_sales DESC;

SELECT s.store_name, SUM(oi.sales_amount) AS total_sales
FROM Stores s
JOIN Orders o ON s.store_id = o.store_id
JOIN Order_Items oi ON o.order_id = oi.order_id
GROUP BY s.store_name
ORDER BY total_sales DESC;

SELECT p.product_name, SUM(oi.sales_amount) AS total_sales
FROM Products p
JOIN Order_Items oi ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC
LIMIT 10;
