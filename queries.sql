-- =====================================================
-- Sales Analysis with SQL
-- =====================================================

-- Sample table structure assumed:
-- sales(
--     order_id INT,
--     order_date DATE,
--     customer_name VARCHAR(100),
--     product_name VARCHAR(100),
--     category VARCHAR(50),
--     region VARCHAR(50),
--     sales_amount DECIMAL(10,2),
--     quantity INT
-- )

-- =====================================================
-- 1. View all data
-- =====================================================
SELECT *
FROM sales;

-- =====================================================
-- 2. Total sales by product category
-- =====================================================
SELECT 
    category,
    SUM(sales_amount) AS total_sales
FROM sales
GROUP BY category
ORDER BY total_sales DESC;

-- =====================================================
-- 3. Top 5 products by total sales
-- =====================================================
SELECT 
    product_name,
    SUM(sales_amount) AS total_sales
FROM sales
GROUP BY product_name
ORDER BY total_sales DESC
LIMIT 5;

-- =====================================================
-- 4. Average sales by region
-- =====================================================
SELECT 
    region,
    AVG(sales_amount) AS average_sales
FROM sales
GROUP BY region
ORDER BY average_sales DESC;

-- =====================================================
-- 5. Number of orders by customer
-- =====================================================
SELECT 
    customer_name,
    COUNT(order_id) AS total_orders
FROM sales
GROUP BY customer_name
ORDER BY total_orders DESC;

-- =====================================================
-- 6. Monthly sales trend
-- =====================================================
SELECT 
    EXTRACT(YEAR FROM order_date) AS sales_year,
    EXTRACT(MONTH FROM order_date) AS sales_month,
    SUM(sales_amount) AS total_sales
FROM sales
GROUP BY 
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY sales_year, sales_month;

-- =====================================================
-- 7. Total quantity sold by category
-- =====================================================
SELECT 
    category,
    SUM(quantity) AS total_quantity_sold
FROM sales
GROUP BY category
ORDER BY total_quantity_sold DESC;

-- =====================================================
-- 8. Top 10 customers by total spending
-- =====================================================
SELECT 
    customer_name,
    SUM(sales_amount) AS total_spent
FROM sales
GROUP BY customer_name
ORDER BY total_spent DESC
LIMIT 10;

-- =====================================================
-- 9. Highest single sale
-- =====================================================
SELECT 
    order_id,
    order_date,
    customer_name,
    product_name,
    sales_amount
FROM sales
ORDER BY sales_amount DESC
LIMIT 1;

-- =====================================================
-- 10. Sales performance classification
-- =====================================================
SELECT 
    product_name,
    sales_amount,
    CASE
        WHEN sales_amount >= 1000 THEN 'High'
        WHEN sales_amount >= 500 THEN 'Medium'
        ELSE 'Low'
    END AS sales_category
FROM sales
ORDER BY sales_amount DESC;

-- =====================================================
-- 11. Total sales by region and category
-- =====================================================
SELECT 
    region,
    category,
    SUM(sales_amount) AS total_sales
FROM sales
GROUP BY region, category
ORDER BY region, total_sales DESC;

-- =====================================================
-- 12. Orders placed after a specific date
-- =====================================================
SELECT 
    *
FROM sales
WHERE order_date >= '2023-01-01'
ORDER BY order_date;

-- =====================================================
-- 13. Products with sales above average
-- =====================================================
SELECT 
    product_name,
    sales_amount
FROM sales
WHERE sales_amount > (
    SELECT AVG(sales_amount)
    FROM sales
)
ORDER BY sales_amount DESC;

-- =====================================================
-- 14. Count of orders by region
-- =====================================================
SELECT 
    region,
    COUNT(order_id) AS total_orders
FROM sales
GROUP BY region
ORDER BY total_orders DESC;

-- =====================================================
-- 15. Total revenue generated per day
-- =====================================================
SELECT 
    order_date,
    SUM(sales_amount) AS daily_revenue
FROM sales
GROUP BY order_date
ORDER BY order_date;

