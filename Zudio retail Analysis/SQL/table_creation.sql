-- Zudio Retail Sales Performance Analytics
-- Table creation
-- Replace/add column definitions to exactly match the final project schema.

USE Zudio_Retail_Analytics;
CREATE TABLE stores(
store_id INT,
store_name VARCHAR(100),
city VARCHAR(100),
state VARCHAR(100),
tier VARCHAR(100),
phone INT,
email VARCHAR(100),
open_date DATE,
selling_area_sqft INT,
staff_count int
);

CREATE TABLE products(
product_id INT,
product_name VARCHAR(100),
category VARCHAR(100),
clothing_type VARCHAR(100),
brand VARCHAR(100),
list_price DECIMAL
);

CREATE TABLE orders(
order_id INT,
customer_id INT,
store_id INT,
order_date DATE,
order_status VARCHAR(100),
payment_mode VARCHAR(100)
);

CREATE TABLE order_items(
order_item_id INT,
order_id INT,
product_id INT,
quantity INT,
list_price DECIMAL,
discount_pct INT,
selling_price DECIMAL,
profit DECIMAL
);

CREATE TABLE customers(
customer_id INT,
first_name VARCHAR(100),
last_name VARCHAR(100),
email VARCHAR(100),
phone VARCHAR(100),
city VARCHAR(100),
state VARCHAR(100),
signup_date date
);







