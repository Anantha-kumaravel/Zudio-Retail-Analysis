-- Zudio Retail Sales Performance Analytics
-- Data cleaning checks/examples

USE Zudio_Retail_Analytics;

UPDATE Orders
SET payment_mode = 'UPI'
WHERE LOWER(payment_mode) = 'upi';

SELECT COUNT(*) AS blank_order_status
FROM Orders
WHERE order_status IS NULL OR TRIM(order_status) = '';

SELECT COUNT(*) AS blank_payment_mode
FROM Orders
WHERE payment_mode IS NULL OR TRIM(payment_mode) = '';

SELECT order_id, COUNT(*) AS duplicate_count
FROM Orders
GROUP BY order_id
HAVING COUNT(*) > 1;
