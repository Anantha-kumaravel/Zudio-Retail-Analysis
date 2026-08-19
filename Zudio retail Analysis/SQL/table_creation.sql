-- Zudio Retail Sales Performance Analytics
-- Table creation
-- Replace/add column definitions to exactly match the final project schema.

USE Zudio_Retail_Analytics;

CREATE TABLE Stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(100),
    city VARCHAR(100),
    state VARCHAR(100),
    tier VARCHAR(50),
    staff_count INT
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    store_id INT,
    order_date DATE,
    order_status VARCHAR(50),
    payment_mode VARCHAR(50)
);

CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT
);
