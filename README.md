# Sales Analysis with SQL

## 📊 Project Overview
This project explores sales data using SQL queries to extract useful business insights and support data-driven decision-making.

The analysis focuses on identifying top-performing products, understanding customer behavior, comparing regional performance, and tracking sales trends over time.

---

## 📁 Dataset
This project includes a sample dataset (`sales.csv`) that can be used to run and test the SQL queries.

---

## ▶️ How to Use

1. Import the `sales.csv` file into your SQL environment  
2. Create a table named `sales`  
3. Run the queries from `queries.sql`  

---

## 🎯 Project Objectives
The main goals of this project are:

- Analyze total sales by product category  
- Identify the top-performing products  
- Measure customer order activity  
- Compare sales performance across regions  
- Track monthly sales trends  
- Classify sales performance using business rules  

---

## 🛠 Tools Used
- SQL  
- GitHub  

---

## 🧠 SQL Skills Demonstrated
This project demonstrates the following SQL skills:

- `SELECT`
- `WHERE`
- `ORDER BY`
- `GROUP BY`
- `COUNT()`
- `SUM()`
- `AVG()`
- `CASE WHEN`
- Date-based analysis
- Business-focused querying

---

## 📂 Files Included
- `queries.sql` — SQL queries used to analyze the sales dataset  
- `sales.csv` — sample dataset  

---

## 💼 Business Value
This project helps answer important business questions such as:

- Which categories generate the highest revenue?  
- Which products perform best?  
- Which customers place the most orders?  
- Which regions perform better than others?  
- How do sales change over time?  

These insights can support better business decisions in sales, marketing, and operations.

---

## 📊 Sample Query Output

Example: Top 5 products by total sales

| Product Name | Total Sales |
|-------------|------------|
| Laptop      | 2500       |
| Phone       | 1700       |
| Desk        | 650        |

---

## 🧪 Example Query

```sql
-- Top 5 products by total sales
SELECT 
    product_name, 
    SUM(sales_amount) AS total_sales
FROM sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 5;
