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
Data Preparation & Cleaning

The dataset was prepared before creating the Power BI dashboards.

The data preparation process included:

Checking table structures.
Checking primary and foreign key columns.
Validating customer IDs.
Validating store IDs.
Validating product IDs.
Checking duplicate records.
Checking blank and missing values.
Standardizing payment mode values.
Checking order status values.
Validating India city and state combinations.
Checking order dates against store opening dates.
Checking product pricing.
Checking discount values.
Checking quantity values.
Validating profit values.
Preparing clean tables for Power BI.
SQL Analysis

SQL was used to create and validate the project database before connecting it to Power BI.

The SQL process included:

Database Creation
Created the retail database.
Created the required tables.
Defined primary keys.
Defined foreign keys.
Data Validation
Checked duplicate records.
Checked missing values.
Checked invalid values.
Checked relationships between tables.
Validated product, customer, store, and order IDs.
Data Cleaning
Standardized inconsistent values.
Cleaned payment mode values.
Validated order status.
Checked numerical fields.
Verified relationships between transactional tables and master tables.
Analysis

SQL was also used to perform basic retail analysis and validate results before building Power BI measures.
Power BI Dashboard

The Power BI report contains four interactive dashboards.

1. Sales Overview Dashboard

The Sales Overview dashboard provides a high-level view of Zudio's overall sales and order performance.

Key KPIs
Total Sales
Total Profit
Total Orders
Completion Rate %
Average Selling Price
Visualizations
Total Sales by Month

Shows how sales change across different months.

Column used:

DateTable[Month]

Measure:

Total Sales

Total Orders by Order Status

Shows the distribution of:

Completed
Returned
Cancelled
Unknown

Column used:

orders[order_status]

Measure:

Total Orders

Total Sales by Payment Mode

Shows sales generated through different payment methods.

Column used:

orders[payment_mode]

Measure:

Total Sales

Profit Margin by Month

Shows monthly changes in profit margin.

Column used:

DateTable[Month]

Measure:

Profit Margin %

Slicers
Order Date
Order Status
Payment Mode
2. Product Performance Dashboard

The Product Performance dashboard focuses on product-level sales and profitability.

Key KPIs
Total Products
Total Categories
Total Brands
Average Product Price
Visualizations
Total Sales by Category

Compares sales between:

Women
Men
Kids

Column:

products[category]

Measure:

Total Sales

Total Sales by Product Name

Shows products based on their sales performance.

Column:

products[product_name]

Measure:

Total Sales

Profit Margin % by Brand

Compares profit margin across different brands.

Column:

products[brand]

Measure:

Profit Margin %

Total Sales by Clothing Type

Shows sales performance across different clothing types.

Examples include:

Hoodies
Pants
Dresses
Sweaters
Jeans
Tops
Jackets

Column:

products[clothing_type]

Measure:

Total Sales

Slicers
Category
Brand
Price Band
3. Store Performance Dashboard

The Store Performance dashboard analyzes store-level performance and operations.

Key KPIs
Total Stores
Total Staff
Average Staff per Store
Total Selling Area
Total Sales
Visualizations
Total Sales by Tier

Compares sales generated by different store tiers.

Column:

stores[tier]

Measure:

Total Sales

Store Locations

Shows the geographical distribution of stores.

Location fields:

stores[state]
stores[city]

Measure:

Total Sales

Top 10 Stores by Sales

Identifies the highest-performing stores.

Column:

stores[store_name]

Measure:

Total Sales

A Top N filter is used to display the top 10 stores.

Staff Count and Total Sales by Store

Analyzes the relationship between store staff count and sales.

X Axis:

stores[staff_count]

Y Axis:

Total Sales

Details:

stores[store_name]

This helps compare store staffing levels with sales performance.

Slicers
Tier
State
City
4. Customer Performance Dashboard

The Customer Performance dashboard provides insights into customer distribution and sales contribution.

Key KPIs
Total Customers
Total Customer Cities
Total Customer States
Average Customers per State
Total Sales
Visualizations
Total Customers by State

Shows the number of customers in each state.

Column:

customers[state]

Measure:

Total Customers

Total Customers by Year

Shows customer distribution across different signup years.

Column:

DateTable[Year]

Measure:

Total Customers

Top 10 Customers by Total Sales

Identifies customers generating the highest sales.

Column:

Customer name / merged customer name

Measure:

Total Sales

Customer Distribution by State and City

Shows the geographical distribution of customers.

Location fields:

customers[state]
customers[city]

Measure:

Total Sales

Slicers
State
City
Year

Project Workflow
Synthetic Retail Dataset
          |
          v
Data Collection & Preparation
          |
          v
Data Cleaning & Validation
          |
          v
SQL Database Creation
          |
          v
Table Creation & Relationships
          |
          v
SQL Analysis & Validation
          |
          v
Power BI Data Import
          |
          v
Data Transformation
          |
          v
Data Modeling
          |
          v
DAX Measure Creation
          |
          v
Interactive Dashboard Development
          |
          +-----------------------------+
          |             |               |
          v             v               v
   Sales Overview   Product       Store Performance
                    Performance
          |
          v
   Customer Performance
          |
          v
Business Insights
Repository Structure
Zudio-Retail-Sales-Performance-Analytics/
│
├── README.md
│
├── SQL/
│   ├── database_creation.sql
│   ├── table_creation.sql
│   ├── data_cleaning.sql
│   └── analysis_queries.sql
│
├── Dataset/
│   ├── customers.csv
│   ├── products.csv
│   ├── orders.csv
│   ├── order_items.csv
│   └── stores.csv
│
├── PowerBI/
│   └── Zudio_Retail_Analysis_Dashboard.pbix
│
├── Screenshots/
│   ├── sales_overview.png
│   ├── product_performance.png
│   ├── store_performance.png
│   └── customer_performance.png
│
└── Documentation/
    ├── Zudio_Project_Documentation.pdf
    └── Data_Dictionary.xlsx

Dashboard Screenshots
Sales Overview
<img width="1159" height="655" alt="Screenshot 2026-08-19 210138" src="https://github.com/user-attachments/assets/620792d3-a6f5-4c68-b1a7-de5e832cf1e5" />


The Sales Overview dashboard provides an overall view of sales, profit, orders, order status, payment modes, and monthly performance.

Product Performance
<img width="1138" height="647" alt="Screenshot 2026-08-19 210205" src="https://github.com/user-attachments/assets/d9aadf19-7170-4226-b3c1-bb97e6e0a465" />


The Product Performance dashboard analyzes categories, products, brands, clothing types, pricing, and profit margins.

Store Performance
<img width="1162" height="654" alt="Screenshot 2026-08-19 210250" src="https://github.com/user-attachments/assets/665f0ba5-9db8-44b3-b78b-91bbad70663f" />


The Store Performance dashboard analyzes store sales, store tiers, staff count, selling area, and geographical distribution.

Customer Performance
<img width="1152" height="642" alt="Screenshot 2026-08-19 210305" src="https://github.com/user-attachments/assets/39e94717-90d8-4833-8b23-3ca143932841" />


The Customer Performance dashboard analyzes customer distribution, states, cities, yearly trends, and customer sales contribution.

How to Run the Project
1. Clone or Download the Repository

Download the repository or clone it using Git.

git clone <your-github-repository-url>
2. Prepare the Dataset

The datasets are available inside the:

Dataset/

folder.

3. Run the SQL Files

Open the SQL files using MySQL Workbench or another SQL environment.

Run the files in the following order:

1. database_creation.sql
2. table_creation.sql
3. data_cleaning.sql
4. analysis_queries.sql
4. Open Power BI

Open:

PowerBI/Zudio_Retail_Analysis_Dashboard.pbix

using Microsoft Power BI Desktop.

5. Check the Data Source

If required, update the dataset path in Power BI.

6. Refresh the Dashboard

In Power BI:

Home → Refresh

This will update the dashboard using the available dataset.

7. Explore the Dashboards

Navigate through the four dashboard pages:

Sales Overview
        ↓
Product Performance
        ↓
Store Performance
        ↓
Customer Performance

Use the available slicers to filter the analysis.

Skills Demonstrated
SQL
MySQL
Power BI
DAX
Data Cleaning
Data Validation
Data Modeling
Data Visualization
KPI Development
Retail Sales Analysis
Product Analysis
Store Analysis
Customer Analysis
Business Intelligence
Interactive Dashboard Development
Business Problem Solving
Project Outcome

The completed Zudio Retail Sales Performance Analytics Dashboard provides an interactive view of retail business performance across sales, products, stores, and customers.

The four-page Power BI report allows users to move from a high-level sales overview to detailed product, store, and customer analysis.

The project demonstrates how SQL, Power BI, and DAX can be combined to convert raw retail data into meaningful business insights
Author

Anantha Kumaravel R

AF05261077| Data & Business Analyst With AI AT Anudip Pallavaram

Data Analyst | AI & Data Science Enthusiast
