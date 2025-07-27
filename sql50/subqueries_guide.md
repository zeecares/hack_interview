---
title: "Subqueries - SQL 50 Study Guide"
description: "Master nested queries, EXISTS, IN, and correlated subqueries through 7 essential problems"
---

# Subqueries - SQL 50 Study Guide 🔍

Master advanced query composition through nested queries, correlated subqueries, and advanced filtering with 7 carefully selected problems from LeetCode's SQL 50.

## Table of Contents
1. [Immediate Food Delivery II](#1-immediate-food-delivery-ii-lc-1174)
2. [Game Play Analysis IV](#2-game-play-analysis-iv-lc-550)
3. [Number of Unique Subjects Taught by Each Teacher](#3-number-of-unique-subjects-taught-by-each-teacher-lc-2356)
4. [User Activity for the Past 30 Days I](#4-user-activity-for-the-past-30-days-i-lc-1141)
5. [Product Sales Analysis III](#5-product-sales-analysis-iii-lc-1070)
6. [Biggest Single Number](#6-biggest-single-number-lc-619)
7. [Customers Who Bought All Products](#7-customers-who-bought-all-products-lc-1045)

---

## 1. Immediate Food Delivery II (LC 1174)

**🔗 LeetCode Link:** [Immediate Food Delivery II - LeetCode #1174](https://leetcode.com/problems/immediate-food-delivery-ii/)

### 📊 Schema First (Active Analysis)
Before writing any SQL, spend 2-3 minutes analyzing the table structure:

**Schema Analysis Questions:**
1. What constitutes an "immediate" delivery?
2. How do you identify first orders for each customer?
3. What's the relationship between order date and preferred delivery date?

*Take time to understand the data model before continuing...*

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Delivery (
    delivery_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    customer_pref_delivery_date DATE
);

-- Sample Data
INSERT INTO Delivery VALUES
(1, 1, '2019-08-01', '2019-08-02'),
(2, 2, '2019-08-02', '2019-08-02'),
(3, 1, '2019-08-11', '2019-08-12'),
(4, 3, '2019-08-24', '2019-08-24'),
(5, 3, '2019-08-21', '2019-08-22'),
(6, 2, '2019-08-11', '2019-08-13');
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Understanding "First Order"
> **Guided Question:** How do you identify the first order for each customer?

<details>
<summary>💭 Think about it, then click to reveal</summary>

To find first orders:
- Group by customer_id
- Find MIN(order_date) for each customer
- This gives the earliest order date per customer

We need to identify which delivery records correspond to these first order dates.
</details>

#### Step 2: Subquery Strategy
> **Guided Question:** How do you filter to only first orders using a subquery?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Subquery approach:
```sql
WHERE (customer_id, order_date) IN (
    SELECT customer_id, MIN(order_date)
    FROM Delivery
    GROUP BY customer_id
)
```

This filters the main query to only include orders that match both customer_id and their minimum order_date.
</details>

#### Step 3: Immediate Delivery Logic
> **Guided Question:** What makes a delivery "immediate"?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Immediate delivery criteria:
- `order_date = customer_pref_delivery_date`
- Customer wants delivery on the same day they ordered
- Any difference means it's scheduled for later (not immediate)
</details>

#### Step 4: Percentage Calculation
> **Guided Question:** How do you calculate the percentage of immediate first orders?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Percentage formula:
- Count of immediate first orders ÷ Total first orders × 100
- Use CASE WHEN to count immediate deliveries
- Use COUNT(*) for total first orders
- Multiply by 100.0 for percentage (ensure float division)
</details>

### Solutions

#### Approach 1: Subquery with Aggregation
```sql
-- Calculate percentage of immediate first orders
SELECT 
    ROUND(
        SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS immediate_percentage
FROM Delivery
WHERE (customer_id, order_date) IN (
    SELECT customer_id, MIN(order_date)
    FROM Delivery
    GROUP BY customer_id
);
```

**Explanation:**
- Subquery finds first order date for each customer
- Main query filters to only first orders
- `CASE WHEN` counts immediate deliveries (same day)
- Division and multiplication by 100.0 calculates percentage
- `ROUND(..., 2)` formats to 2 decimal places

#### Approach 2: Using Window Functions
```sql
-- Alternative using window functions
WITH FirstOrders AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) as rn
    FROM Delivery
)
SELECT 
    ROUND(
        SUM(CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS immediate_percentage
FROM FirstOrders
WHERE rn = 1;
```

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
Try writing the query from memory:

**Step-by-step checklist:**
- [ ] Write subquery to find first order dates per customer
- [ ] Use IN clause to filter main query to first orders only
- [ ] Add CASE WHEN logic for immediate delivery identification
- [ ] Calculate percentage with proper division and rounding
- [ ] Verify logic with sample data

#### Schema Variations
Practice adapting your solution:
- What if you wanted the percentage for each customer individually?
- How would you find customers who NEVER had immediate delivery?
- What if you wanted to exclude customers with only one order?

#### Reflection Questions
After solving, think about:

1. **Subquery Logic:** Why use (customer_id, order_date) tuple matching?
2. **Performance:** How might the subquery affect query performance?
3. **Alternative Approaches:** Could you solve this with EXISTS instead of IN?
4. **Pattern Recognition:** When else would you need "first occurrence" logic?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Writing subqueries for filtering: ___/5
- [ ] Understanding tuple matching with IN: ___/5
- [ ] Calculating percentages with conditional aggregation: ___/5
- [ ] Identifying "first" records per group: ___/5

---

## 2. Game Play Analysis IV (LC 550)

**🔗 LeetCode Link:** [Game Play Analysis IV - LeetCode #550](https://leetcode.com/problems/game-play-analysis-iv/)

### 📊 Schema First (Active Analysis)

**Schema Analysis Questions:**
1. What constitutes "consecutive day" login behavior?
2. How do you identify the first login date for each player?
3. What's the relationship between first login and next-day login?

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Activity (
    player_id INT,
    device_id INT,
    event_date DATE,
    games_played INT,
    PRIMARY KEY (player_id, event_date)
);

-- Sample Data
INSERT INTO Activity VALUES
(1, 2, '2016-03-01', 5),
(1, 2, '2016-03-02', 6),
(2, 3, '2017-06-25', 1),
(3, 1, '2016-03-02', 0),
(3, 4, '2018-07-03', 5);
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Finding First Login Dates
> **Guided Question:** How do you identify each player's first login date?

<details>
<summary>💭 Think about it, then click to reveal</summary>

First login subquery:
```sql
SELECT player_id, MIN(event_date) as first_login
FROM Activity
GROUP BY player_id
```

This gives us one record per player with their earliest login date.
</details>

#### Step 2: Checking Next-Day Login
> **Guided Question:** How do you verify if a player logged in the day after their first login?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Next-day verification:
- Join first login dates with original activity table
- Check if there's a record for `first_login + 1 day`
- Use DATE_ADD or similar function for date arithmetic

Join condition: `a.event_date = DATE_ADD(first_login.first_login, INTERVAL 1 DAY)`
</details>

### Solutions

#### Approach 1: Subquery with Date Arithmetic
```sql
-- Calculate fraction of players who logged in day after first login
SELECT 
    ROUND(
        COUNT(DISTINCT a2.player_id) * 1.0 / COUNT(DISTINCT a1.player_id), 
        2
    ) AS fraction
FROM (
    SELECT player_id, MIN(event_date) as first_login
    FROM Activity
    GROUP BY player_id
) a1
LEFT JOIN Activity a2 
    ON a1.player_id = a2.player_id 
    AND a2.event_date = DATE_ADD(a1.first_login, INTERVAL 1 DAY);
```

**Explanation:**
- Subquery finds first login date per player
- LEFT JOIN checks for activity on the next day
- `COUNT(DISTINCT a2.player_id)` counts players who logged in next day
- `COUNT(DISTINCT a1.player_id)` counts total players
- Division gives fraction of players with consecutive logins

#### Approach 2: Using EXISTS
```sql
-- Alternative approach with EXISTS
SELECT 
    ROUND(
        SUM(CASE WHEN EXISTS (
            SELECT 1 FROM Activity a2 
            WHERE a2.player_id = first_logins.player_id 
            AND a2.event_date = DATE_ADD(first_logins.first_login, INTERVAL 1 DAY)
        ) THEN 1 ELSE 0 END) * 1.0 / COUNT(*), 
        2
    ) AS fraction
FROM (
    SELECT player_id, MIN(event_date) as first_login
    FROM Activity
    GROUP BY player_id
) first_logins;
```

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
**Step-by-step checklist:**
- [ ] Create subquery for first login dates
- [ ] Join or use EXISTS to check next-day activity
- [ ] Count players with consecutive logins vs total players
- [ ] Calculate fraction with proper decimal handling
- [ ] Round result to required decimal places

---

## 3. Number of Unique Subjects Taught by Each Teacher (LC 2356)

**🔗 LeetCode Link:** [Number of Unique Subjects Taught by Each Teacher - LeetCode #2356](https://leetcode.com/problems/number-of-unique-subjects-taught-by-each-teacher/)

### Solutions

```sql
-- Count unique subjects per teacher
SELECT 
    teacher_id,
    COUNT(DISTINCT subject_id) AS cnt
FROM Teacher
GROUP BY teacher_id;
```

**Key Concepts:**
- Simple GROUP BY aggregation
- `COUNT(DISTINCT)` to count unique values
- No subquery needed for this straightforward problem

---

## 4. User Activity for the Past 30 Days I (LC 1141)

**🔗 LeetCode Link:** [User Activity for the Past 30 Days I - LeetCode #1141](https://leetcode.com/problems/user-activity-for-the-past-30-days-i/)

### Solutions

```sql
-- Count daily active users in past 30 days
SELECT 
    activity_date AS day,
    COUNT(DISTINCT user_id) AS active_users
FROM Activity
WHERE activity_date BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
GROUP BY activity_date;
```

**Key Concepts:**
- Date range filtering with BETWEEN
- `DATE_SUB` for date arithmetic
- `COUNT(DISTINCT)` for unique user count per day

---

## 5. Product Sales Analysis III (LC 1070)

**🔗 LeetCode Link:** [Product Sales Analysis III - LeetCode #1070](https://leetcode.com/problems/product-sales-analysis-iii/)

### 📊 Schema First (Active Analysis)

**Schema Analysis Questions:**
1. How do you identify the first year of sales for each product?
2. What information is needed for first-year sales analysis?
3. How do you filter to only first-year records?

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Sales (
    sale_id INT,
    product_id INT,
    year INT,
    quantity INT,
    price INT,
    PRIMARY KEY (sale_id, year)
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(10)
);
```
</details>

### Solutions

#### Approach 1: Subquery for First Year
```sql
-- Get first year sales information for each product
SELECT 
    product_id,
    year AS first_year,
    quantity,
    price
FROM Sales
WHERE (product_id, year) IN (
    SELECT product_id, MIN(year)
    FROM Sales
    GROUP BY product_id
);
```

**Explanation:**
- Subquery finds minimum (first) year for each product
- Tuple matching `(product_id, year)` ensures correct first-year records
- Returns complete first-year sales information

#### Approach 2: Using Window Functions
```sql
-- Alternative with window functions
WITH RankedSales AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY year) as rn
    FROM Sales
)
SELECT product_id, year as first_year, quantity, price
FROM RankedSales
WHERE rn = 1;
```

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
**Step-by-step checklist:**
- [ ] Write subquery to find first year per product
- [ ] Use tuple matching for accurate filtering
- [ ] Select appropriate columns for result
- [ ] Verify logic with multi-year product data

---

## 6. Biggest Single Number (LC 619)

**🔗 LeetCode Link:** [Biggest Single Number - LeetCode #619](https://leetcode.com/problems/biggest-single-number/)

### 📊 Schema First (Active Analysis)

**Schema Analysis Questions:**
1. What makes a number "single" (appears only once)?
2. How do you find the largest among single numbers?
3. What should happen if no single numbers exist?

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE MyNumbers (
    num INT
);

-- Sample Data
INSERT INTO MyNumbers VALUES
(8), (8), (3), (3), (1), (4), (5), (6);
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Identifying Single Numbers
> **Guided Question:** How do you find numbers that appear exactly once?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Use GROUP BY and HAVING:
```sql
SELECT num
FROM MyNumbers
GROUP BY num
HAVING COUNT(*) = 1
```

This groups identical numbers and keeps only groups with count = 1.
</details>

#### Step 2: Finding the Maximum
> **Guided Question:** How do you get the largest number from the single numbers?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Apply MAX to the single numbers:
- Wrap the single number query in a subquery
- Apply MAX() to get the largest single number
- Handle case where no single numbers exist (returns NULL)
</details>

### Solutions

#### Approach 1: Subquery with MAX
```sql
-- Find the largest number that appears only once
SELECT MAX(num) AS num
FROM (
    SELECT num
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(*) = 1
) AS single_numbers;
```

**Explanation:**
- Inner query finds all numbers appearing exactly once
- Outer query applies MAX to find largest single number
- Returns NULL if no single numbers exist (which is appropriate)

#### Approach 2: Using Window Functions
```sql
-- Alternative approach with window functions
WITH NumberCounts AS (
    SELECT num, COUNT(*) OVER (PARTITION BY num) as cnt
    FROM MyNumbers
)
SELECT MAX(CASE WHEN cnt = 1 THEN num END) AS num
FROM NumberCounts;
```

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
**Step-by-step checklist:**
- [ ] Group numbers and count occurrences
- [ ] Filter to numbers appearing exactly once
- [ ] Apply MAX to find largest single number
- [ ] Handle edge case of no single numbers
- [ ] Test with various data scenarios

---

## 7. Customers Who Bought All Products (LC 1045)

**🔗 LeetCode Link:** [Customers Who Bought All Products - LeetCode #1045](https://leetcode.com/problems/customers-who-bought-all-products/)

### 📊 Schema First (Active Analysis)

**Schema Analysis Questions:**
1. How do you verify a customer bought "all" products?
2. What's the relationship between total products and customer purchases?
3. How do you count distinct products per customer?

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Customer (
    customer_id INT,
    product_key INT
);

CREATE TABLE Product (
    product_key INT PRIMARY KEY
);

-- Sample Data
INSERT INTO Customer VALUES
(1, 5), (2, 6), (3, 5), (3, 6), (1, 6);

INSERT INTO Product VALUES
(5), (6);
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Counting Total Products
> **Guided Question:** How do you determine how many products exist in total?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Total product count:
```sql
SELECT COUNT(*) FROM Product
```

This gives the total number of available products that customers could potentially buy.
</details>

#### Step 2: Counting Customer Purchases
> **Guided Question:** How do you count distinct products purchased by each customer?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Customer purchase counts:
```sql
SELECT customer_id, COUNT(DISTINCT product_key)
FROM Customer
GROUP BY customer_id
```

This shows how many different products each customer has purchased.
</details>

#### Step 3: Comparing Counts
> **Guided Question:** How do you identify customers who bought all products?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Compare customer purchases to total products:
- Customer's distinct product count = Total product count
- Use HAVING clause to filter groups
- Or use subquery to get total count for comparison
</details>

### Solutions

#### Approach 1: Subquery Comparison
```sql
-- Find customers who bought all available products
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (
    SELECT COUNT(*) FROM Product
);
```

**Explanation:**
- Main query groups purchases by customer
- `COUNT(DISTINCT product_key)` counts unique products per customer
- Subquery `(SELECT COUNT(*) FROM Product)` gets total product count
- `HAVING` clause filters to customers with complete purchases

#### Approach 2: Using ALL/ANY (if supported)
```sql
-- Alternative approach checking product existence
SELECT DISTINCT customer_id
FROM Customer c1
WHERE NOT EXISTS (
    SELECT product_key 
    FROM Product p
    WHERE NOT EXISTS (
        SELECT 1 
        FROM Customer c2 
        WHERE c2.customer_id = c1.customer_id 
        AND c2.product_key = p.product_key
    )
);
```

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
**Step-by-step checklist:**
- [ ] Count total available products
- [ ] Count distinct products per customer
- [ ] Use HAVING to compare counts
- [ ] Verify logic with sample data
- [ ] Consider edge cases (no products, no customers)

---

## 📚 Key Concepts Summary

### Subquery Types Mastered
- **Scalar Subqueries** - Return single value for comparison
- **Table Subqueries** - Return multiple rows for IN/EXISTS operations  
- **Correlated Subqueries** - Reference outer query columns
- **Non-Correlated Subqueries** - Independent of outer query

### Subquery Patterns
1. **Filtering with IN**: `WHERE column IN (SELECT ...)`
2. **Existence Checking**: `WHERE EXISTS (SELECT 1 FROM ...)`
3. **Comparison**: `WHERE column = (SELECT MAX(...) FROM ...)`
4. **Tuple Matching**: `WHERE (col1, col2) IN (SELECT col1, col2 FROM ...)`

### Advanced Techniques
- **Date Arithmetic**: `DATE_ADD`, `DATE_SUB`, `INTERVAL`
- **Conditional Aggregation**: `SUM(CASE WHEN condition THEN 1 ELSE 0 END)`
- **Tuple Comparisons**: `(customer_id, order_date) IN (...)`
- **Window Functions vs Subqueries**: Alternative approaches for ranking

### Performance Considerations
- **EXISTS vs IN**: EXISTS often faster for large datasets
- **Correlated vs Non-Correlated**: Non-correlated usually more efficient
- **Subquery vs JOIN**: JOINs often perform better than subqueries
- **Index Usage**: Ensure subquery predicates can use indexes

### Common Use Cases
1. **First/Last Records**: Find earliest or latest occurrence per group
2. **Missing Relationships**: Identify records without corresponding data
3. **Comparison to Aggregates**: Compare individual values to group statistics
4. **Complex Filtering**: Multi-level conditions that simple WHERE can't handle

### Next Steps
Master advanced analytics with [Window Functions Guide](window_functions_guide.md).