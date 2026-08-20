# Zudio Retail Sales Performance Analytics — Data Dictionary

## Dataset Overview

The Zudio dataset contains 5 connected tables — **Stores, Products, Customers, Orders,
and Order Items** — used to analyze sales performance, product performance, store
performance, and customer behavior. Each table holds roughly 2,000 records, with a
small number of intentional data-quality issues (duplicates, nulls, invalid values,
broken links) included on purpose to practice real-world data cleaning.

---

## Table 1: stores

| Column | Data Type | Description | Example |
|---|---|---|---|
| store_id | INT | Unique identifier for each store (primary key) | 1 |
| store_name | VARCHAR(100) | Name of the store | Zudio - Rajkot Mall 1 |
| city | VARCHAR(50) | City where the store is located | Rajkot |
| state | VARCHAR(50) | State where the store is located | Gujarat |
| tier | INT | City tier classification — 1 = Metro, 2 = Growing City, 3 = Emerging | 2 |
| phone | VARCHAR(30) | Store contact phone number | 7000012345 |
| email | VARCHAR(100) | Store contact email | store1@zudio.in |
| open_date | DATE | Date the store opened | 2022-03-15 |
| selling_area_sqft | INT | Store's selling floor area, in square feet | 3112 |
| staff_count | INT | Number of staff working at the store | 22 |

## Table 2: products

| Column | Data Type | Description | Example |
|---|---|---|---|
| product_id | INT | Unique identifier for each product (primary key) | 1 |
| product_name | VARCHAR(150) | Full product name | Zudio Trend Women Dresses #1 |
| category | VARCHAR(50) | Product category — Women, Men, or Kids | Women |
| clothing_type | VARCHAR(50) | Type of clothing item | Dresses |
| brand | VARCHAR(50) | Product's brand label | Zudio Trend |
| list_price | DECIMAL(10,2) | Standard listed price, in ₹ | 1299.00 |

## Table 3: customers

| Column | Data Type | Description | Example |
|---|---|---|---|
| customer_id | INT | Unique identifier for each customer (primary key) | 1 |
| first_name | VARCHAR(50) | Customer's first name | Aarav |
| last_name | VARCHAR(50) | Customer's last name | Sharma |
| email | VARCHAR(100) | Customer's email address | aarav.sharma1@mail.com |
| phone | VARCHAR(30) | Customer's phone number | 7000012345 |
| city | VARCHAR(50) | Customer's city | Mumbai |
| state | VARCHAR(50) | Customer's state | Maharashtra |
| signup_date | DATE | Date the customer signed up | 2023-04-12 |

## Table 4: orders

| Column | Data Type | Description | Example |
|---|---|---|---|
| order_id | INT | Unique identifier for each order (primary key) | 1 |
| customer_id | INT | Links to the customer who placed the order (foreign key → customers) | 245 |
| store_id | INT | Links to the store where the order was placed (foreign key → stores) | 87 |
| order_date | DATE | Date the order was placed | 2024-06-18 |
| order_status | VARCHAR(20) | Status of the order — Completed, Returned, or Cancelled | Completed |
| payment_mode | VARCHAR(20) | Method of payment — UPI, Card, Cash, or Net Banking | UPI |

## Table 5: order_items

| Column | Data Type | Description | Example |
|---|---|---|---|
| order_item_id | INT | Unique identifier for each order line item (surrogate primary key) | 1 |
| order_id | INT | Links to the parent order (foreign key → orders) | 1 |
| product_id | INT | Links to the product sold (foreign key → products) | 452 |
| quantity | INT | Number of units sold in this line item | 2 |
| list_price | DECIMAL(10,2) | Product's listed price at the time of sale, in ₹ | 1299.00 |
| discount_pct | DECIMAL(5,1) | Discount percentage applied to this item | 10.0 |
| selling_price | DECIMAL(10,2) | Final price after discount, in ₹ | 1169.10 |
| profit | DECIMAL(10,2) | Profit earned on this line item, in ₹ | 350.00 |

> **Note on order_item_id:** the original raw export had no reliable primary key —
> the same `order_item_id` appeared on unrelated rows. The final table uses a
> regenerated, guaranteed-unique `order_item_id` (surrogate key) created during cleaning.

---

## Power Query Derived Columns

| Column | Table | Description | Example |
|---|---|---|---|
| Price Band | products | Groups products into price ranges | Budget / Mid / Premium |
| Year | customers | Signup year, pulled out of signup_date | 2024 |

> Fill in the exact Price Band cut-offs you used (e.g. Budget = below ₹X, Mid =
> ₹X–₹Y, Premium = above ₹Y) so this table matches your Power Query step exactly.
> If you added other calculated columns (like a Tier Label or Region), tell me and
> I'll add them here too.

---

## Category Definitions

### Order Status
| Category | Meaning |
|---|---|
| Completed | Order was fulfilled successfully (~88% of orders) |
| Returned | Order was returned by the customer (~8% of orders) |
| Cancelled | Order was cancelled before fulfillment (~4% of orders) |

### Payment Mode
UPI · Card · Cash · Net Banking

### Store Tier
| Tier | Meaning |
|---|---|
| 1 | Metro city store |
| 2 | Growing city store |
| 3 | Emerging city store |

---

## Data Quality Checks

The dataset was checked for the following issues, all deliberately introduced to
practice real-world data cleaning:

- Duplicate primary keys (`order_item_id` reused across unrelated rows)
- Missing values (email, phone, price, quantity, discount, order_status, order_date)
- Invalid numeric values (negative or zero selling area, price, and quantity)
- Broken foreign keys (orders/order_items pointing to a customer, store, product,
  or order that doesn't exist)
- Inconsistent text formatting (mixed casing and extra whitespace in city, category,
  and payment_mode)
- Exact duplicate rows

All of these were found and resolved using SQL, moving the data from raw staging
tables into final, constraint-checked tables.

---

## Power BI Data Model

```
Dim_Date
   |
   | 1 : *
   |
Orders  ──── * : 1 ────  Customers
   |                        
   | 1 : *                  
   |                        
Order_Items ──── * : 1 ──── Products

Stores ──── 1 : * ──── Orders
```

- **Customers → Orders**, using customer_id
- **Stores → Orders**, using store_id
- **Orders → Order_Items**, using order_id
- **Products → Order_Items**, using product_id
- **Dim_Date → Orders**, using order_date

---

## Key Analytical Measures

**Order Item Measures**
Total Sales · Total Profit · Total Units Sold · Total Discount · Profit Margin % · Average Selling Price

**Order Measures**
Total Orders · Completed Orders · Returned Orders · Cancelled Orders · Completion Rate % · Return Rate %

**Product Measures**
Total Products · Average Product Price · Total Categories · Total Brands

**Store Measures**
Total Stores · Total Staff · Average Staff per Store · Total Selling Area

**Customer Measures**
Total Customers · Average Customers per State · Total Customer Cities · Total Customer States
