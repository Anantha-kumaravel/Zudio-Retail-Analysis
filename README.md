# Zudio Retail Sales Performance Analytics Dashboard

An end-to-end Business Intelligence project that analyzes Zudio retail sales performance using **SQL, Power BI, and DAX**. The project transforms retail transaction data into an interactive multi-page dashboard to understand sales, products, stores, customers, orders, and profitability.

---

## Project Overview

The **Zudio Retail Sales Performance Analytics Dashboard** is a Business Intelligence project designed to provide a clear view of retail business performance.

The project focuses on four major analytical areas:

1. **Sales Overview** – sales, profit, orders, payment methods, order status, and monthly trends.
2. **Product Performance** – category, brand, clothing type, product sales, pricing, and profit margin.
3. **Store Performance** – store sales, store tier, staff, selling area, location, and store-level performance.
4. **Customer Performance** – customer distribution, states, cities, yearly customer trends, and customer sales.

The complete workflow includes dataset preparation, data cleaning, SQL database creation, data validation, Power BI data modeling, DAX measure creation, dashboard development, and business insights.

---

## Project Objectives

The main objectives of this project are:

- Analyze overall Zudio retail sales performance.
- Understand monthly sales and profit trends.
- Monitor total orders and order completion rate.
- Identify high-performing product categories and clothing types.
- Compare product and brand performance.
- Analyze store-level sales performance.
- Understand sales performance across different store tiers.
- Analyze staff count and store sales relationships.
- Understand customer distribution across states and cities.
- Identify high-value customers.
- Create meaningful KPIs using DAX.
- Build an interactive and easy-to-understand Power BI dashboard.
- Provide business insights that can support better retail decision-making.

---

## Problem Statement

The project aims to build a clear and meaningful dashboard that helps understand Zudio's **sales, product, store, and customer performance** using interactive Business Intelligence analysis.

---

## Industry

**Fashion Retail / Retail Industry**

The project focuses on analyzing retail operations in a fashion and lifestyle business environment.

---

## Tools & Technologies

- **SQL / MySQL** – database creation, table creation, data cleaning, validation, and analysis
- **Power BI** – dashboard development and interactive data visualization
- **DAX** – KPI creation and business calculations
- **Power BI Data Modeling** – relationships between fact and dimension tables
- **Microsoft Excel / CSV** – dataset preparation and data storage
- **GitHub** – project version control and documentation

---

## Dataset Description

The project uses a synthetic Zudio-style retail dataset designed for Business Intelligence analysis.

The dataset contains five main tables:

### 1. Stores

Contains information about Zudio stores.

Important columns include:

- `store_id`
- `store_name`
- `city`
- `state`
- `tier`
- `open_date`
- `staff_count`
- `selling_area_sqft`
- `phone`
- `email`

### 2. Products

Contains information about products sold in the stores.

Important columns include:

- `product_id`
- `product_name`
- `category`
- `clothing_type`
- `brand`
- `list_price`
- `price_band`

### 3. Customers

Contains customer information.

Important columns include:

- `customer_id`
- `first_name`
- `last_name`
- `city`
- `email`
- `phone`
- `state`
- `signup_date`

### 4. Orders

Contains information about customer orders.

Important columns include:

- `order_id`
- `customer_id`
- `store_id`
- `order_date`
- `order_status`
- `payment_mode`

### 5. Order Items

Contains product-level information for each order.

Important columns include:

- `order_item_id`
- `order_id`
- `product_id`
- `quantity`
- `list_price`
- `discount_pct`
- `discount_amount`
- `profit`

---

## Data Model

The project follows a retail-style relational data model.

The main relationships include:

```text
Customers
    |
    | customer_id
    |
   Orders
    |
    | order_id
    |
Order Items
    |
    | product_id
    |
Products

Orders
    |
    | store_id
    |
Stores

Orders
    |
    | order_date
    |
Date Table
