---
layout: default
title: SQL Interview Cheat Sheet
description: Master SQL for coding interviews with LeetCode Top 50 SQL problems and advanced concepts
---

# SQL Interview Cheat Sheet

<div style="margin-bottom: 20px;">
  <a href="/hack_interview/" style="text-decoration: none; color: #007bff; font-weight: 500;">
    ← Back to Home
  </a>
</div>

## Master SQL for Coding Interviews with LeetCode Top 50 SQL Problems

> **📚 Based on LeetCode Top SQL 50 + Advanced Concepts**  
> **⏱️ Perfect for 1-4 weeks of interview prep**  
> **🎯 Covers 95% of SQL interview questions**

---

## 📋 Table of Contents

1. [**Basic SELECT & Filtering**](#basic-select--filtering)
2. [**Joins & Relationships**](#joins--relationships) 
3. [**Aggregate Functions & GROUP BY**](#aggregate-functions--group-by)
4. [**Window Functions**](#window-functions)
5. [**Subqueries & CTEs**](#subqueries--ctes)
6. [**String Functions & Pattern Matching**](#string-functions--pattern-matching)
7. [**Date & Time Functions**](#date--time-functions)
8. [**Advanced Topics**](#advanced-topics)
9. [**Performance Optimization**](#performance-optimization)
10. [**Common Patterns & Best Practices**](#common-patterns--best-practices)

---

## 🎯 Basic SELECT & Filtering

### Essential SELECT Operations
```sql
-- Basic SELECT
SELECT column1, column2 FROM table_name;

-- SELECT with conditions
SELECT * FROM products 
WHERE price > 100 AND category = 'Electronics';

-- DISTINCT values
SELECT DISTINCT category FROM products;

-- ORDER BY
SELECT * FROM products 
ORDER BY price DESC, name ASC;

-- LIMIT/TOP
SELECT TOP 5 * FROM products;  -- SQL Server
SELECT * FROM products LIMIT 5;  -- MySQL/PostgreSQL
```

### WHERE Clause Operators
```sql
-- Comparison operators
WHERE price > 100
WHERE price BETWEEN 50 AND 200
WHERE category IN ('Electronics', 'Books')
WHERE name LIKE 'iPhone%'  -- Starts with iPhone
WHERE name LIKE '%phone%'  -- Contains phone
WHERE description IS NULL
WHERE price IS NOT NULL

-- Logical operators
WHERE price > 100 AND category = 'Electronics'
WHERE price > 1000 OR category = 'Luxury'
WHERE NOT category = 'Books'
```

### CASE Statements
```sql
-- Simple CASE
SELECT product_name,
       CASE 
         WHEN price > 1000 THEN 'Expensive'
         WHEN price > 500 THEN 'Moderate'
         ELSE 'Cheap'
       END AS price_category
FROM products;

-- CASE in aggregate
SELECT category,
       SUM(CASE WHEN price > 100 THEN 1 ELSE 0 END) AS expensive_items
FROM products
GROUP BY category;
```

---

## 🔗 Joins & Relationships

### Join Types & Syntax
```sql
-- INNER JOIN (only matching records)
SELECT c.customer_name, o.order_date, o.total_amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id;

-- LEFT JOIN (all from left table)
SELECT c.customer_name, o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- RIGHT JOIN (all from right table)  
SELECT c.customer_name, o.order_date
FROM customers c
RIGHT JOIN orders o ON c.customer_id = o.customer_id;

-- FULL OUTER JOIN (all records from both tables)
SELECT c.customer_name, o.order_date
FROM customers c
FULL OUTER JOIN orders o ON c.customer_id = o.customer_id;
```

### Multiple Joins
```sql
SELECT c.customer_name, o.order_date, oi.product_name, oi.quantity
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
INNER JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_date >= '2024-01-01';
```

### Self Joins
```sql
-- Find employees and their managers
SELECT e1.employee_name, e2.employee_name AS manager_name
FROM employees e1
LEFT JOIN employees e2 ON e1.manager_id = e2.employee_id;
```

### Join Performance Tips
- Index join columns for better performance
- Use WHERE conditions to filter before joining
- Consider join order for large tables

---

## 📊 Aggregate Functions & GROUP BY

### Basic Aggregate Functions
```sql
-- Common aggregates
SELECT COUNT(*) AS total_orders,
       COUNT(DISTINCT customer_id) AS unique_customers,
       SUM(total_amount) AS total_revenue,
       AVG(total_amount) AS avg_order_value,
       MIN(order_date) AS first_order,
       MAX(order_date) AS last_order
FROM orders;
```

### GROUP BY Essentials
```sql
-- Group by single column
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category;

-- Group by multiple columns
SELECT category, brand, AVG(price) AS avg_price
FROM products
GROUP BY category, brand;

-- GROUP BY with ORDER BY
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category
ORDER BY product_count DESC;
```

### HAVING Clause
```sql
-- Filter groups after aggregation
SELECT category, COUNT(*) AS product_count
FROM products
GROUP BY category
HAVING COUNT(*) > 5;

-- HAVING vs WHERE
SELECT category, AVG(price) AS avg_price
FROM products
WHERE price > 10  -- Filter rows before grouping
GROUP BY category
HAVING AVG(price) > 100;  -- Filter groups after aggregation
```

### Advanced Grouping
```sql
-- GROUP BY with CASE
SELECT 
  CASE 
    WHEN price < 100 THEN 'Budget'
    WHEN price < 500 THEN 'Mid-range'
    ELSE 'Premium'
  END AS price_range,
  COUNT(*) AS product_count
FROM products
GROUP BY 
  CASE 
    WHEN price < 100 THEN 'Budget'
    WHEN price < 500 THEN 'Mid-range'
    ELSE 'Premium'
  END;
```

---

## 🪟 Window Functions

Window functions perform calculations across rows related to the current row without grouping the result set.

### Basic Window Function Syntax
```sql
SELECT column1, column2,
       FUNCTION_NAME() OVER (
         [PARTITION BY column]
         [ORDER BY column]
         [ROWS/RANGE frame_specification]
       ) AS result
FROM table_name;
```

### Ranking Functions
```sql
-- ROW_NUMBER: Unique sequential integers
SELECT employee_name, salary,
       ROW_NUMBER() OVER (ORDER BY salary DESC) AS row_num
FROM employees;

-- RANK: Same rank for ties, gaps in sequence
SELECT employee_name, salary,
       RANK() OVER (ORDER BY salary DESC) AS rank
FROM employees;

-- DENSE_RANK: Same rank for ties, no gaps
SELECT employee_name, salary,
       DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank
FROM employees;

-- NTILE: Divide into N buckets
SELECT employee_name, salary,
       NTILE(4) OVER (ORDER BY salary DESC) AS quartile
FROM employees;
```

### Aggregate Window Functions
```sql
-- Running totals
SELECT order_date, total_amount,
       SUM(total_amount) OVER (ORDER BY order_date) AS running_total
FROM orders;

-- Moving averages
SELECT order_date, total_amount,
       AVG(total_amount) OVER (
         ORDER BY order_date 
         ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
       ) AS moving_avg_3_days
FROM orders;

-- Cumulative counts
SELECT order_date,
       COUNT(*) OVER (ORDER BY order_date) AS cumulative_orders
FROM orders;
```

### Value/Offset Functions
```sql
-- LAG: Previous row value
SELECT order_date, total_amount,
       LAG(total_amount, 1) OVER (ORDER BY order_date) AS prev_amount
FROM orders;

-- LEAD: Next row value  
SELECT order_date, total_amount,
       LEAD(total_amount, 1) OVER (ORDER BY order_date) AS next_amount
FROM orders;

-- FIRST_VALUE: First value in window
SELECT employee_name, salary,
       FIRST_VALUE(salary) OVER (
         PARTITION BY department 
         ORDER BY salary DESC
       ) AS highest_salary_in_dept
FROM employees;

-- LAST_VALUE: Last value in window
SELECT employee_name, salary,
       LAST_VALUE(salary) OVER (
         PARTITION BY department 
         ORDER BY salary DESC
         ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS lowest_salary_in_dept
FROM employees;
```

### PARTITION BY Examples
```sql
-- Rank within each department
SELECT employee_name, department, salary,
       RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS dept_rank
FROM employees;

-- Running total by category
SELECT product_name, category, price,
       SUM(price) OVER (PARTITION BY category ORDER BY price) AS category_running_total
FROM products;
```

### Frame Specifications
```sql
-- ROWS BETWEEN
SELECT order_date, total_amount,
       SUM(total_amount) OVER (
         ORDER BY order_date
         ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
       ) AS sum_3_rows
FROM orders;

-- RANGE BETWEEN  
SELECT order_date, total_amount,
       AVG(total_amount) OVER (
         ORDER BY order_date
         RANGE BETWEEN INTERVAL '7' DAY PRECEDING AND CURRENT ROW
       ) AS avg_last_week
FROM orders;
```

---

## 🔍 Subqueries & CTEs

### Subquery Types

#### Scalar Subqueries (Single Value)
```sql
-- Find products with above-average price
SELECT product_name, price
FROM products
WHERE price > (SELECT AVG(price) FROM products);
```

#### Row Subqueries
```sql
-- Find employees with highest salary in each department
SELECT employee_name, department, salary
FROM employees e1
WHERE salary = (
  SELECT MAX(salary) 
  FROM employees e2 
  WHERE e2.department = e1.department
);
```

#### Table Subqueries
```sql
-- IN operator
SELECT customer_name
FROM customers
WHERE customer_id IN (
  SELECT DISTINCT customer_id 
  FROM orders 
  WHERE order_date >= '2024-01-01'
);

-- EXISTS operator (often more efficient than IN)
SELECT customer_name
FROM customers c
WHERE EXISTS (
  SELECT 1 
  FROM orders o 
  WHERE o.customer_id = c.customer_id 
  AND o.order_date >= '2024-01-01'
);
```

### Common Table Expressions (CTEs)
```sql
-- Basic CTE
WITH high_value_orders AS (
  SELECT customer_id, order_date, total_amount
  FROM orders
  WHERE total_amount > 1000
)
SELECT c.customer_name, h.order_date, h.total_amount
FROM customers c
INNER JOIN high_value_orders h ON c.customer_id = h.customer_id;

-- Multiple CTEs
WITH 
monthly_sales AS (
  SELECT 
    DATE_TRUNC('month', order_date) AS month,
    SUM(total_amount) AS total_sales
  FROM orders
  GROUP BY DATE_TRUNC('month', order_date)
),
avg_monthly_sales AS (
  SELECT AVG(total_sales) AS avg_sales
  FROM monthly_sales
)
SELECT m.month, m.total_sales, a.avg_sales
FROM monthly_sales m
CROSS JOIN avg_monthly_sales a
WHERE m.total_sales > a.avg_sales;
```

### Recursive CTEs
```sql
-- Employee hierarchy
WITH RECURSIVE employee_hierarchy AS (
  -- Base case: top-level managers
  SELECT employee_id, employee_name, manager_id, 1 AS level
  FROM employees
  WHERE manager_id IS NULL
  
  UNION ALL
  
  -- Recursive case: employees with managers
  SELECT e.employee_id, e.employee_name, e.manager_id, h.level + 1
  FROM employees e
  INNER JOIN employee_hierarchy h ON e.manager_id = h.employee_id
)
SELECT * FROM employee_hierarchy ORDER BY level, employee_name;
```

### Subquery vs JOIN Performance
```sql
-- Often slower: Correlated subquery
SELECT customer_name
FROM customers c
WHERE (
  SELECT COUNT(*) 
  FROM orders o 
  WHERE o.customer_id = c.customer_id
) > 5;

-- Usually faster: JOIN approach
SELECT DISTINCT c.customer_name
FROM customers c
INNER JOIN (
  SELECT customer_id
  FROM orders
  GROUP BY customer_id
  HAVING COUNT(*) > 5
) frequent_customers ON c.customer_id = frequent_customers.customer_id;
```

---

## 🔤 String Functions & Pattern Matching

### Basic String Functions
```sql
-- String length and manipulation
SELECT 
  customer_name,
  LENGTH(customer_name) AS name_length,
  UPPER(customer_name) AS upper_name,
  LOWER(customer_name) AS lower_name,
  TRIM(customer_name) AS trimmed_name
FROM customers;

-- Substring operations
SELECT 
  product_code,
  SUBSTRING(product_code, 1, 3) AS category_code,  -- First 3 chars
  LEFT(product_code, 3) AS left_part,             -- SQL Server
  RIGHT(product_code, 3) AS right_part            -- SQL Server
FROM products;

-- String concatenation
SELECT 
  CONCAT(first_name, ' ', last_name) AS full_name,  -- Standard SQL
  first_name + ' ' + last_name AS full_name_sqlserver,  -- SQL Server
  first_name || ' ' || last_name AS full_name_postgres   -- PostgreSQL
FROM employees;
```

### Pattern Matching with LIKE
```sql
-- Wildcard patterns
SELECT * FROM products WHERE product_name LIKE 'iPhone%';     -- Starts with iPhone
SELECT * FROM products WHERE product_name LIKE '%phone%';     -- Contains phone
SELECT * FROM products WHERE product_name LIKE '_Phone';      -- Second char starts Phone
SELECT * FROM products WHERE product_name LIKE 'iPhone[0-9]'; -- iPhone followed by digit (SQL Server)

-- Case-insensitive search
SELECT * FROM products WHERE LOWER(product_name) LIKE LOWER('%iPhone%');
```

### Regular Expressions (Platform Specific)
```sql
-- PostgreSQL REGEX
SELECT * FROM products 
WHERE product_name ~ '^iPhone [0-9]+$';  -- iPhone followed by numbers

-- MySQL REGEX
SELECT * FROM products 
WHERE product_name REGEXP '^iPhone [0-9]+$';

-- SQL Server (LIKE with patterns)
SELECT * FROM products 
WHERE product_name LIKE 'iPhone [0-9]%';
```

### String Replacement and Extraction
```sql
-- Replace characters
SELECT 
  product_name,
  REPLACE(product_name, 'iPhone', 'Apple iPhone') AS updated_name
FROM products;

-- Extract parts using string functions
SELECT 
  email,
  SUBSTRING(email, 1, CHARINDEX('@', email) - 1) AS username,  -- SQL Server
  SUBSTRING(email, CHARINDEX('@', email) + 1, LEN(email)) AS domain  -- SQL Server
FROM users;

-- PostgreSQL version
SELECT 
  email,
  SPLIT_PART(email, '@', 1) AS username,
  SPLIT_PART(email, '@', 2) AS domain
FROM users;
```

### Advanced String Operations
```sql
-- String aggregation
SELECT 
  department,
  STRING_AGG(employee_name, ', ') AS employee_list  -- PostgreSQL/SQL Server
FROM employees
GROUP BY department;

-- MySQL version
SELECT 
  department,
  GROUP_CONCAT(employee_name SEPARATOR ', ') AS employee_list
FROM employees
GROUP BY department;
```

---

## 📅 Date & Time Functions

### Basic Date Functions
```sql
-- Current date/time
SELECT 
  CURRENT_DATE AS today,
  CURRENT_TIME AS current_time,
  CURRENT_TIMESTAMP AS now,
  NOW() AS now_mysql;  -- MySQL specific

-- Date parts extraction
SELECT 
  order_date,
  YEAR(order_date) AS order_year,
  MONTH(order_date) AS order_month,
  DAY(order_date) AS order_day,
  DAYOFWEEK(order_date) AS day_of_week,  -- MySQL
  EXTRACT(YEAR FROM order_date) AS year_standard  -- Standard SQL
FROM orders;
```

### Date Arithmetic
```sql
-- Add/subtract time intervals
SELECT 
  order_date,
  DATE_ADD(order_date, INTERVAL 30 DAY) AS due_date,     -- MySQL
  order_date + INTERVAL '30 days' AS due_date_postgres,  -- PostgreSQL
  DATEADD(DAY, 30, order_date) AS due_date_sqlserver     -- SQL Server
FROM orders;

-- Date differences
SELECT 
  order_date,
  delivery_date,
  DATEDIFF(delivery_date, order_date) AS delivery_days,  -- MySQL
  delivery_date - order_date AS days_diff_postgres,      -- PostgreSQL
  DATEDIFF(DAY, order_date, delivery_date) AS days_sqlserver  -- SQL Server
FROM orders;
```

### Date Formatting
```sql
-- Format dates
SELECT 
  order_date,
  DATE_FORMAT(order_date, '%Y-%m') AS year_month,        -- MySQL
  TO_CHAR(order_date, 'YYYY-MM') AS year_month_postgres, -- PostgreSQL
  FORMAT(order_date, 'yyyy-MM') AS year_month_sqlserver  -- SQL Server
FROM orders;
```

### Date Truncation and Grouping
```sql
-- Group by month
SELECT 
  DATE_TRUNC('month', order_date) AS month,  -- PostgreSQL
  COUNT(*) AS orders_per_month
FROM orders
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY month;

-- SQL Server version
SELECT 
  DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1) AS month,
  COUNT(*) AS orders_per_month
FROM orders
GROUP BY DATEFROMPARTS(YEAR(order_date), MONTH(order_date), 1)
ORDER BY month;
```

### Time-based Filtering
```sql
-- Recent data
SELECT * FROM orders 
WHERE order_date >= CURRENT_DATE - INTERVAL '30 days';  -- PostgreSQL

-- Date ranges
SELECT * FROM orders 
WHERE order_date BETWEEN '2024-01-01' AND '2024-12-31';

-- Start/end of periods
SELECT * FROM orders 
WHERE order_date >= DATE_TRUNC('year', CURRENT_DATE);  -- This year's orders
```

---

## 🎯 Advanced Topics

### UNION Operations
```sql
-- UNION (removes duplicates)
SELECT customer_id, 'Online' AS channel FROM online_customers
UNION
SELECT customer_id, 'Store' AS channel FROM store_customers;

-- UNION ALL (keeps duplicates, faster)
SELECT customer_id, order_amount FROM q1_orders
UNION ALL
SELECT customer_id, order_amount FROM q2_orders;
```

### INTERSECT and EXCEPT
```sql
-- INTERSECT (common records)
SELECT customer_id FROM online_customers
INTERSECT
SELECT customer_id FROM store_customers;

-- EXCEPT/MINUS (records in first but not second)
SELECT customer_id FROM all_customers
EXCEPT
SELECT customer_id FROM churned_customers;
```

### NULL Handling
```sql
-- NULL checks and coalescing
SELECT 
  product_name,
  COALESCE(discount_price, regular_price) AS final_price,  -- First non-NULL value
  ISNULL(discount_price, regular_price) AS final_price_sqlserver,  -- SQL Server
  NVL(discount_price, regular_price) AS final_price_oracle         -- Oracle
FROM products;

-- NULL handling in comparisons
SELECT * FROM products 
WHERE discount_price IS NULL;  -- Never use = NULL

-- NULLIF function
SELECT 
  sales_amount,
  NULLIF(sales_amount, 0) AS non_zero_sales  -- Returns NULL if sales_amount = 0
FROM sales;
```

### Conditional Aggregates
```sql
-- Count with conditions
SELECT 
  department,
  COUNT(*) AS total_employees,
  COUNT(CASE WHEN salary > 50000 THEN 1 END) AS high_earners,
  SUM(CASE WHEN gender = 'F' THEN 1 ELSE 0 END) AS female_count
FROM employees
GROUP BY department;

-- Conditional sums
SELECT 
  product_category,
  SUM(CASE WHEN region = 'North' THEN sales_amount ELSE 0 END) AS north_sales,
  SUM(CASE WHEN region = 'South' THEN sales_amount ELSE 0 END) AS south_sales
FROM sales
GROUP BY product_category;
```

### Pivoting Data
```sql
-- Manual pivot using CASE
SELECT 
  product_id,
  SUM(CASE WHEN quarter = 'Q1' THEN sales_amount ELSE 0 END) AS Q1_sales,
  SUM(CASE WHEN quarter = 'Q2' THEN sales_amount ELSE 0 END) AS Q2_sales,
  SUM(CASE WHEN quarter = 'Q3' THEN sales_amount ELSE 0 END) AS Q3_sales,
  SUM(CASE WHEN quarter = 'Q4' THEN sales_amount ELSE 0 END) AS Q4_sales
FROM quarterly_sales
GROUP BY product_id;

-- SQL Server PIVOT syntax
SELECT product_id, Q1, Q2, Q3, Q4
FROM (
  SELECT product_id, quarter, sales_amount
  FROM quarterly_sales
) AS source_table
PIVOT (
  SUM(sales_amount)
  FOR quarter IN (Q1, Q2, Q3, Q4)
) AS pivot_table;
```

---

## ⚡ Performance Optimization

### Query Optimization Best Practices

#### 1. Index Usage
```sql
-- Create indexes on frequently queried columns
CREATE INDEX idx_orders_customer_date ON orders(customer_id, order_date);
CREATE INDEX idx_products_category ON products(category);

-- Composite indexes for multi-column queries
CREATE INDEX idx_sales_region_date_product ON sales(region, sale_date, product_id);
```

#### 2. Efficient WHERE Clauses
```sql
-- Good: SARGable (Search ARGument ABLE)
SELECT * FROM orders WHERE order_date >= '2024-01-01';

-- Bad: Non-SARGable (prevents index usage)
SELECT * FROM orders WHERE YEAR(order_date) = 2024;

-- Good: Use leading columns of composite indexes
SELECT * FROM sales WHERE region = 'North' AND sale_date >= '2024-01-01';

-- Bad: Skips leading column
SELECT * FROM sales WHERE sale_date >= '2024-01-01';  -- If index is (region, sale_date)
```

#### 3. JOIN Optimization
```sql
-- Index foreign keys
CREATE INDEX idx_orders_customer_id ON orders(customer_id);
CREATE INDEX idx_order_items_order_id ON order_items(order_id);

-- Efficient JOIN with proper filtering
SELECT c.customer_name, o.order_date, o.total_amount
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
WHERE o.order_date >= '2024-01-01'  -- Filter before JOIN when possible
  AND c.status = 'Active';
```

#### 4. Limit Data Retrieved
```sql
-- Use LIMIT/TOP for large result sets
SELECT TOP 100 * FROM products ORDER BY price DESC;

-- Pagination
SELECT * FROM products 
ORDER BY product_id
OFFSET 100 ROWS FETCH NEXT 20 ROWS ONLY;  -- SQL Server

-- Avoid SELECT *
SELECT product_id, product_name, price  -- Only needed columns
FROM products
WHERE category = 'Electronics';
```

### Query Execution Plans
```sql
-- Analyze query performance
EXPLAIN (ANALYZE, BUFFERS) SELECT ...;  -- PostgreSQL
EXPLAIN QUERY PLAN SELECT ...;          -- SQLite
SET SHOWPLAN_ALL ON; SELECT ...;        -- SQL Server
```

### Common Performance Anti-patterns
```sql
-- ❌ Avoid: Functions in WHERE clause
SELECT * FROM orders WHERE YEAR(order_date) = 2024;

-- ✅ Better: Date range
SELECT * FROM orders 
WHERE order_date >= '2024-01-01' AND order_date < '2025-01-01';

-- ❌ Avoid: Leading wildcards
SELECT * FROM customers WHERE customer_name LIKE '%john%';

-- ✅ Better: Trailing wildcard (when possible)
SELECT * FROM customers WHERE customer_name LIKE 'john%';

-- ❌ Avoid: Unnecessary DISTINCT
SELECT DISTINCT customer_id FROM orders;  -- If customer_id is already unique

-- ✅ Better: Remove unnecessary DISTINCT
SELECT customer_id FROM orders;
```

---

## 🎯 Common Patterns & Best Practices

### Top-N Queries
```sql
-- Top 5 customers by order value
SELECT customer_id, SUM(total_amount) AS total_spent
FROM orders
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;

-- Top 3 products per category
WITH ranked_products AS (
  SELECT product_name, category, sales_amount,
         ROW_NUMBER() OVER (PARTITION BY category ORDER BY sales_amount DESC) AS rn
  FROM product_sales
)
SELECT product_name, category, sales_amount
FROM ranked_products
WHERE rn <= 3;
```

### Running Totals and Moving Averages
```sql
-- Running total
SELECT order_date, daily_sales,
       SUM(daily_sales) OVER (ORDER BY order_date) AS running_total
FROM daily_sales_summary;

-- 7-day moving average
SELECT order_date, daily_sales,
       AVG(daily_sales) OVER (
         ORDER BY order_date 
         ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
       ) AS moving_avg_7_days
FROM daily_sales_summary;
```

### Duplicate Detection and Removal
```sql
-- Find duplicates
SELECT email, COUNT(*) as duplicate_count
FROM customers
GROUP BY email
HAVING COUNT(*) > 1;

-- Remove duplicates (keep first occurrence)
WITH ranked_customers AS (
  SELECT customer_id, email,
         ROW_NUMBER() OVER (PARTITION BY email ORDER BY customer_id) AS rn
  FROM customers
)
DELETE FROM customers
WHERE customer_id IN (
  SELECT customer_id 
  FROM ranked_customers 
  WHERE rn > 1
);
```

### Gap and Island Problems
```sql
-- Find missing dates in a sequence
WITH date_series AS (
  SELECT DATE '2024-01-01' + INTERVAL (n) DAY AS date
  FROM generate_series(0, 364) AS s(n)  -- PostgreSQL
),
missing_dates AS (
  SELECT ds.date
  FROM date_series ds
  LEFT JOIN orders o ON ds.date = o.order_date
  WHERE o.order_date IS NULL
)
SELECT * FROM missing_dates;
```

### Hierarchical Data Queries
```sql
-- Find all subordinates of a manager
WITH RECURSIVE subordinates AS (
  SELECT employee_id, employee_name, manager_id, 0 AS level
  FROM employees
  WHERE employee_id = 100  -- Specific manager
  
  UNION ALL
  
  SELECT e.employee_id, e.employee_name, e.manager_id, s.level + 1
  FROM employees e
  INNER JOIN subordinates s ON e.manager_id = s.employee_id
)
SELECT * FROM subordinates ORDER BY level, employee_name;
```

### Data Quality Checks
```sql
-- Check for data quality issues
SELECT 
  'Missing emails' AS issue,
  COUNT(*) AS count
FROM customers
WHERE email IS NULL OR email = ''

UNION ALL

SELECT 
  'Invalid email format' AS issue,
  COUNT(*) AS count
FROM customers
WHERE email NOT LIKE '%@%.%'

UNION ALL

SELECT 
  'Future order dates' AS issue,
  COUNT(*) AS count
FROM orders
WHERE order_date > CURRENT_DATE;
```

---

## 🚀 Interview Tips & Time Complexity

### Time Complexity Guidelines

| Operation | Best Case | Average Case | Worst Case | Notes |
|-----------|-----------|--------------|------------|--------|
| Index Seek | O(log n) | O(log n) | O(log n) | With proper B-tree index |
| Table Scan | O(n) | O(n) | O(n) | Full table scan |
| Hash Join | O(n + m) | O(n + m) | O(n * m) | When hash fits in memory |
| Nested Loop Join | O(n * m) | O(n * m) | O(n * m) | Without indexes |
| Sort | O(n log n) | O(n log n) | O(n log n) | External sort for large data |

### Common Interview Question Patterns

1. **Top-N per Group**: Use window functions with ROW_NUMBER()
2. **Running Totals**: Use SUM() OVER() with proper frame
3. **Date Calculations**: Know platform-specific date functions
4. **String Manipulation**: Master LIKE patterns and string functions
5. **Hierarchical Data**: Practice recursive CTEs
6. **Performance Questions**: Understand indexing and execution plans

### Best Practices Summary

✅ **DO:**
- Use appropriate indexes
- Write SARGable WHERE clauses
- Use EXISTS over IN for subqueries
- Limit result sets when possible
- Use CTEs for complex logic
- Comment complex queries

❌ **DON'T:**
- Use SELECT * in production
- Apply functions to WHERE clause columns
- Ignore NULL handling
- Use cursors when set-based logic works
- Create too many indexes
- Use non-standard SQL when portability matters

---

## 📚 Additional Resources

### LeetCode Top SQL 50 Categories
1. **Select** (5 problems) - Basic filtering and selection
2. **Basic Joins** (9 problems) - INNER/LEFT JOIN patterns  
3. **Basic Aggregate Functions** (8 problems) - COUNT, SUM, AVG, GROUP BY
4. **Sorting and Grouping** (7 problems) - ORDER BY, HAVING, DISTINCT
5. **Advanced Select and Joins** (7 problems) - Complex multi-table queries
6. **Subqueries** (7 problems) - Correlated and non-correlated subqueries
7. **Advanced String Functions** (7 problems) - LIKE, REGEXP, string manipulation

### Platform-Specific Notes
- **MySQL**: Use LIMIT, GROUP_CONCAT, DATE_FORMAT
- **PostgreSQL**: Use LIMIT, STRING_AGG, DATE_TRUNC, generate_series
- **SQL Server**: Use TOP, STRING_AGG, FORMAT, ROW_NUMBER() for pagination
- **Oracle**: Use ROWNUM, LISTAGG, TO_CHAR, CONNECT BY for hierarchical queries

---

*Happy querying! 🎯 Master these patterns and you'll be ready for 95% of SQL interview questions.* 