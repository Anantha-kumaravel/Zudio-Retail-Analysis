

# Zudio Retail Sales Performance Analytics Dashboard

**Author:** Anantha Kumaravel R

**Role:** Data & Business Analyst with AI at Anudip Pallavaram | AI & Data Science Enthusiast

**Industry:** Fashion Retail / E-Commerce

## 📖 Project Overview

The Zudio Retail Sales Performance Analytics Dashboard is an end-to-end Business Intelligence project designed to provide actionable insights into retail operations. By transforming raw transaction data using SQL and Power BI, this project delivers a comprehensive, interactive multi-page dashboard to monitor sales, product performance, store efficiency, and customer behavior.

**Key Objectives:**

* Analyze monthly sales, profit trends, and order completion rates.
* Identify high-performing product categories, clothing types, and brands.
* Evaluate store-level performance across different geographic tiers and staffing levels.
* Map customer distribution and identify high-value buyers.
* Develop dynamic KPIs using DAX to support data-driven retail decision-making.

---

## 🛠️ Tools & Technologies

* **Database & Analysis:** SQL, MySQL
* **Business Intelligence:** Power BI, DAX
* **Data Processing:** Microsoft Excel, CSV, Power Query
* **Version Control:** Git, GitHub

---

## 🔗 Data Model & Relationships

The project utilizes a robust relational data model (Star Schema) consisting of Fact and Dimension tables to ensure optimized querying and filtering in Power BI.

* **Customers (Dimension)** `1 ---- *` **Orders (Fact)** *(via customer_id)*
* **Stores (Dimension)** `1 ---- *` **Orders (Fact)** *(via store_id)*
* **Date Table (Dimension)** `1 ---- *` **Orders (Fact)** *(via order_date)*
* **Orders (Fact)** `1 ---- *` **Order Items (Fact)** *(via order_id)*
* **Products (Dimension)** `1 ---- *` **Order Items (Fact)** *(via product_id)*

---

## 🧮 Core DAX Measures

Custom DAX (Data Analysis Expressions) measures were created to drive the interactive KPIs across the dashboard:

| Measure Name | Description / Logic |
| --- | --- |
| **Total Sales** | Calculates the total revenue generated. *(e.g., `SUM('Order Items'[list_price] * 'Order Items'[quantity])`)* |
| **Total Profit** | Calculates the absolute profit across all items. *(e.g., `SUM('Order Items'[profit])`)* |
| **Total Orders** | Counts the unique number of transactions. *(e.g., `DISTINCTCOUNT(Orders[order_id])`)* |
| **Profit Margin %** | Evaluates profitability efficiency. *(e.g., `DIVIDE([Total Profit], [Total Sales], 0)`)* |
| **Completion Rate %** | Tracks fulfillment success. *(e.g., `DIVIDE(CALCULATE([Total Orders], Orders[order_status]="Completed"), [Total Orders], 0)`)* |
| **Average Selling Price** | Averages the revenue per item sold. *(e.g., `DIVIDE([Total Sales], SUM('Order Items'[quantity]), 0)`)* |

---

## 🧹 Data Preparation & Cleaning

Before building the dashboard, the dataset underwent rigorous validation and cleaning using SQL and Power Query:

* **Validation:** Verified primary and foreign key constraints across all tables (Customer IDs, Store IDs, Product IDs).
* **Standardization:** Cleaned inconsistent `payment_mode` and `order_status` values.
* **Geographic Mapping:** Validated India city and state combinations for accurate mapping.
* **Logic Checks:** Ensured `order_date` values did not pre-date store `open_date` values and validated discount and profit numerical fields.

---

## 📊 Dashboard Highlights

The Power BI report is divided into four distinct, interactive pages:

### 1. Sales Overview
<img width="1159" height="655" alt="Screenshot 2026-08-19 210138" src="https://github.com/user-attachments/assets/727a5a64-ccf9-43bf-b105-d431800d832b" />


* **KPIs:** Total Sales, Total Profit, Total Orders, Completion Rate, Average Selling Price.
* **Insights:** Monthly sales and profit margin trends, revenue by payment mode, and order status distribution (Completed, Returned, Cancelled).

### 2. Product Performance

* **KPIs:** Total Products, Total Categories, Total Brands, Average Product Price.
* **Insights:** Sales by category (Women, Men, Kids), top-performing clothing types (Hoodies, Jeans, Tops), and profit margins by brand.

### 3. Store Performance

* **KPIs:** Total Stores, Total Staff, Average Staff per Store, Total Selling Area.
* **Insights:** Geographic distribution of locations, sales performance by store tier, and the correlation between staff count and total revenue.

### 4. Customer Performance

* **KPIs:** Total Customers, Active Cities, Active States, Average Customers per State.
* **Insights:** Yearly customer acquisition trends, regional density maps, and identification of the top 10 highest-value customers.

---

## 📁 Repository Structure

```text
Zudio-Retail-Sales-Performance-Analytics/
│
├── README.md
├── SQL/
│   ├── database_creation.sql
│   ├── table_creation.sql
│   ├── data_cleaning.sql
│   └── analysis_queries.sql
├── Dataset/
│   ├── customers.csv
│   ├── products.csv
│   ├── orders.csv
│   ├── order_items.csv
│   └── stores.csv
├── PowerBI/
│   └── Zudio_Retail_Analysis_Dashboard.pbix
├── Screenshots/
│   ├── sales_overview.png
│   ├── product_performance.png
│   ├── store_performance.png
│   └── customer_performance.png
└── Documentation/
    ├── Zudio_Project_Documentation.pdf
    └── Data_Dictionary.xlsx

```

---

## 🚀 How to Run the Project

**1. Clone the Repository**
Download or clone the project to your local machine using Git.

```bash
git clone <your-github-repository-url>

```

**2. Setup the Database**
Open your preferred SQL environment (e.g., MySQL Workbench) and execute the scripts in the `SQL/` folder in the following order:

1. `database_creation.sql`
2. `table_creation.sql`
3. `data_cleaning.sql`
4. `analysis_queries.sql`

**3. Explore the Dashboard**

* Open `PowerBI/Zudio_Retail_Analysis_Dashboard.pbix` using Microsoft Power BI Desktop.
* If required, update the data source path to point to your local `Dataset/` folder.
* Navigate to **Home → Refresh** to update the dashboard using the available dataset.
* Use the slicers on each page to dynamically filter the analysis.
