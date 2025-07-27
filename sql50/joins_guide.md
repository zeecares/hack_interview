---
title: "Joins - SQL 50 Study Guide"
description: "Master table relationships through INNER, LEFT, RIGHT, and FULL OUTER joins with 9 essential problems"
---

# Joins - SQL 50 Study Guide 🔗

Master table relationships and data combination through 9 carefully selected join problems from LeetCode's SQL 50.

## Table of Contents
1. [Replace Employee ID With The Unique Identifier](#1-replace-employee-id-with-the-unique-identifier-lc-1378)
2. [Product Sales Analysis I](#2-product-sales-analysis-i-lc-1068)
3. [Customer Who Visited but Did Not Make Any Transactions](#3-customer-who-visited-but-did-not-make-any-transactions-lc-1581)
4. [Rising Temperature](#4-rising-temperature-lc-197)
5. [Average Time of Process per Machine](#5-average-time-of-process-per-machine-lc-1661)
6. [Employee Bonus](#6-employee-bonus-lc-577)
7. [Students and Examinations](#7-students-and-examinations-lc-1280)
8. [Managers with at Least 5 Direct Reports](#8-managers-with-at-least-5-direct-reports-lc-570)
9. [Confirmation Rate](#9-confirmation-rate-lc-1934)

---

## 1. Replace Employee ID With The Unique Identifier (LC 1378)

**🔗 LeetCode Link:** [Replace Employee ID With The Unique Identifier - LeetCode #1378](https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/)

### 📊 Schema First (Active Analysis)
Before writing any SQL, spend 2-3 minutes analyzing the table structure:

**Schema Analysis Questions:**
1. What is the relationship between Employees and EmployeeUNI tables?
2. Which employees might not have unique identifiers?
3. What type of join preserves all employee records?

*Take time to understand the data model before continuing...*

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(20)
);

CREATE TABLE EmployeeUNI (
    id INT,
    unique_id INT,
    PRIMARY KEY (id, unique_id)
);

-- Sample Data
INSERT INTO Employees VALUES
(1, 'Alice'), (7, 'Bob'), (11, 'Meir'), (90, 'Winston'), (3, 'Jonathan');

INSERT INTO EmployeeUNI VALUES
(3, 1), (11, 2), (90, 3);
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Understanding the Join Requirement
> **Guided Question:** What happens to employees who don't have a unique_id in the EmployeeUNI table?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Based on the problem requirements:
- We want to show ALL employees from the Employees table
- If an employee has a unique_id, show it
- If an employee doesn't have a unique_id, show NULL
- This requires a LEFT JOIN to preserve all employee records
</details>

#### Step 2: Choosing the Right Join Type
> **Guided Question:** Which join type ensures all employees appear in the result, even without unique identifiers?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Join types comparison:
- **INNER JOIN**: Only employees with unique_id (excludes some employees)
- **LEFT JOIN**: All employees + their unique_id if exists (correct choice)
- **RIGHT JOIN**: All unique_ids + employee names if exists
- **FULL OUTER JOIN**: All records from both tables

LEFT JOIN is correct because we want all employees as the main dataset.
</details>

#### Step 3: Handling NULL Values
> **Guided Question:** How should NULL unique_id values be presented in the result?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Options for NULL handling:
- **Show NULL**: Most standard and clear (`unique_id` will be NULL)
- **Show empty string**: `COALESCE(unique_id, '')` 
- **Show placeholder**: `COALESCE(unique_id, 'No ID')`

The problem typically expects NULL values for missing unique_ids.
</details>

### Solutions

#### Approach 1: Basic LEFT JOIN
```sql
-- Show all employees with their unique identifiers
SELECT 
    eu.unique_id,
    e.name
FROM Employees e
LEFT JOIN EmployeeUNI eu ON e.id = eu.id;
```

**Explanation:**
- `LEFT JOIN` preserves all records from Employees table
- `ON e.id = eu.id` matches employees with their unique identifiers
- Employees without unique_id will have NULL in unique_id column
- Result shows unique_id first, then name as typically requested

#### Approach 2: With Explicit NULL Handling
```sql
-- Show all employees with explicit NULL handling
SELECT 
    COALESCE(eu.unique_id, NULL) AS unique_id,
    e.name
FROM Employees e
LEFT JOIN EmployeeUNI eu ON e.id = eu.id
ORDER BY e.name;
```

**Key Differences:**
- `COALESCE()` makes NULL handling explicit (though redundant here)
- `ORDER BY e.name` provides consistent result ordering
- Same logical result as Approach 1

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
Try writing the query from memory:

**Step-by-step checklist:**
- [ ] Start with FROM clause identifying main table (Employees)
- [ ] Add LEFT JOIN to preserve all employee records
- [ ] Use correct ON condition to match employee IDs
- [ ] SELECT unique_id first, then name
- [ ] Verify that employees without unique_id show NULL

#### Schema Variations
Practice adapting your solution:
- What if you only wanted employees WITH unique identifiers?
- How would you count employees without unique identifiers?
- What if multiple employees could share the same unique_id?

#### Reflection Questions
After solving, think about:

1. **Join Logic:** Why LEFT JOIN instead of INNER JOIN?
2. **Data Integrity:** What does it mean when an employee has no unique_id?
3. **Alternative Approaches:** Could you solve this with EXISTS/NOT EXISTS?
4. **Pattern Recognition:** When else would you use LEFT JOIN?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding LEFT JOIN mechanics: ___/5
- [ ] Choosing appropriate join types: ___/5
- [ ] Handling NULL values in joins: ___/5
- [ ] Reading join requirements from problem description: ___/5

---

## 2. Product Sales Analysis I (LC 1068)

**🔗 LeetCode Link:** [Product Sales Analysis I - LeetCode #1068](https://leetcode.com/problems/product-sales-analysis-i/)

### 📊 Schema First (Active Analysis)

**Schema Analysis Questions:**
1. How are sales transactions related to product information?
2. What information from each table is needed in the result?
3. Would any sales exist without corresponding products?

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

-- Sample Data
INSERT INTO Sales VALUES
(1, 100, 2008, 10, 5000),
(2, 100, 2009, 12, 5000),
(7, 200, 2011, 15, 9000);

INSERT INTO Product VALUES
(100, 'Nokia'),
(200, 'Apple'),
(300, 'Samsung');
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Identifying Required Information
> **Guided Question:** What columns do we need from each table to show sales with product names?

<details>
<summary>💭 Think about it, then click to reveal</summary>

From the Sales table:
- `year` - when the sale occurred
- `price` - sale price

From the Product table:
- `product_name` - human-readable product name

The `product_id` is the linking key but may not be needed in the final output.
</details>

#### Step 2: Choosing Join Strategy
> **Guided Question:** Should we use INNER JOIN or LEFT JOIN for sales and products?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Consider the business logic:
- **INNER JOIN**: Only sales for products that exist in Product table
- **LEFT JOIN**: All sales, even if product doesn't exist in Product table

Since products are typically created before sales, INNER JOIN is usually appropriate. The problem statement suggests we want sales WITH product names.
</details>

### Solutions

#### Approach 1: Basic INNER JOIN
```sql
-- Get sales information with product names
SELECT 
    p.product_name,
    s.year,
    s.price
FROM Sales s
INNER JOIN Product p ON s.product_id = p.product_id;
```

**Explanation:**
- `INNER JOIN` connects sales with product information
- Only sales with valid products appear in results
- Result shows product_name, year, and price as typically requested

#### Approach 2: With Additional Sales Details
```sql
-- Include more comprehensive sales information
SELECT 
    s.sale_id,
    p.product_name,
    s.year,
    s.quantity,
    s.price,
    (s.quantity * s.price) AS total_amount
FROM Sales s
INNER JOIN Product p ON s.product_id = p.product_id
ORDER BY s.year, p.product_name;
```

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
**Step-by-step checklist:**
- [ ] Identify the linking column between tables (product_id)
- [ ] Use INNER JOIN for sales with valid products
- [ ] SELECT required columns from both tables
- [ ] Consider whether calculated columns add value
- [ ] Add sorting for better result presentation

---

## 3. Customer Who Visited but Did Not Make Any Transactions (LC 1581)

**🔗 LeetCode Link:** [Customer Who Visited but Did Not Make Any Transactions - LeetCode #1581](https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/)

### 📊 Schema First (Active Analysis)

**Schema Analysis Questions:**
1. How do visits relate to transactions?
2. What constitutes a visit without a transaction?
3. How do you identify missing relationships between tables?

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Visits (
    visit_id INT PRIMARY KEY,
    customer_id INT
);

CREATE TABLE Transactions (
    transaction_id INT PRIMARY KEY,
    visit_id INT,
    amount INT
);

-- Sample Data
INSERT INTO Visits VALUES
(1, 23), (2, 9), (4, 30), (5, 54), (6, 96), (7, 54), (8, 54);

INSERT INTO Transactions VALUES
(2, 5, 310), (3, 5, 300), (9, 5, 200), (12, 1, 910), (13, 2, 970);
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Understanding "No Transactions"
> **Guided Question:** How do you find visits that don't have corresponding transactions?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Two approaches to find missing relationships:
1. **LEFT JOIN + WHERE NULL**: Join all visits, filter where no transaction exists
2. **NOT EXISTS**: Use subquery to check for transaction existence

LEFT JOIN approach:
```sql
FROM Visits v 
LEFT JOIN Transactions t ON v.visit_id = t.visit_id 
WHERE t.visit_id IS NULL
```
</details>

#### Step 2: Counting Visit Frequency
> **Guided Question:** The problem asks for count of visits per customer - what does this mean?

<details>
<summary>💭 Think about it, then click to reveal</summary>

We need to:
- Find visits with no transactions
- Group by customer_id
- Count how many such visits each customer made
- This shows which customers visited multiple times without buying
</details>

### Solutions

#### Approach 1: LEFT JOIN with NULL Check
```sql
-- Find customers who visited but never made transactions
SELECT 
    v.customer_id,
    COUNT(v.visit_id) AS count_no_trans
FROM Visits v
LEFT JOIN Transactions t ON v.visit_id = t.visit_id
WHERE t.visit_id IS NULL
GROUP BY v.customer_id;
```

**Explanation:**
- `LEFT JOIN` connects all visits with their transactions (if any)
- `WHERE t.visit_id IS NULL` filters to visits without transactions
- `GROUP BY customer_id` aggregates by customer
- `COUNT(v.visit_id)` counts visits per customer with no transactions

#### Approach 2: Using NOT EXISTS
```sql
-- Alternative approach using NOT EXISTS
SELECT 
    customer_id,
    COUNT(*) AS count_no_trans
FROM Visits v
WHERE NOT EXISTS (
    SELECT 1 
    FROM Transactions t 
    WHERE t.visit_id = v.visit_id
)
GROUP BY customer_id;
```

**Trade-offs:**
- **LEFT JOIN**: More explicit, easier to extend with transaction details
- **NOT EXISTS**: More direct logic, potentially better performance

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
**Step-by-step checklist:**
- [ ] Use LEFT JOIN or NOT EXISTS to find missing relationships
- [ ] Filter to visits without transactions
- [ ] Group by customer_id for aggregation
- [ ] Count visits per customer appropriately
- [ ] Verify results make business sense

---

## 4. Rising Temperature (LC 197)

**🔗 LeetCode Link:** [Rising Temperature - LeetCode #197](https://leetcode.com/problems/rising-temperature/)

### 📊 Schema First (Active Analysis)

**Schema Analysis Questions:**
1. How do you compare today's temperature with yesterday's?
2. What constitutes a "rising" temperature?
3. How do you handle date arithmetic in joins?

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Weather (
    id INT PRIMARY KEY,
    recordDate DATE,
    temperature INT
);

-- Sample Data
INSERT INTO Weather VALUES
(1, '2015-01-01', 10),
(2, '2015-01-02', 25),
(3, '2015-01-03', 20),
(4, '2015-01-04', 30);
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Self-Join Strategy
> **Guided Question:** How do you compare a row with the previous day's row in the same table?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Self-join approach:
- Join the Weather table with itself
- One instance represents "today" (w1)
- Other instance represents "yesterday" (w2)
- Join condition: `w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)`
- Filter where `w1.temperature > w2.temperature`
</details>

#### Step 2: Date Arithmetic
> **Guided Question:** What's the best way to identify consecutive days?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Options for date comparison:
- `DATE_ADD(w2.recordDate, INTERVAL 1 DAY) = w1.recordDate`
- `DATEDIFF(w1.recordDate, w2.recordDate) = 1`
- `w1.recordDate = w2.recordDate + INTERVAL 1 DAY`

All work similarly, but DATE_ADD is most explicit about adding one day.
</details>

### Solutions

#### Approach 1: Self-Join with DATE_ADD
```sql
-- Find days with higher temperature than previous day
SELECT w1.id
FROM Weather w1
INNER JOIN Weather w2 
    ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE w1.temperature > w2.temperature;
```

**Explanation:**
- Self-join creates pairs of consecutive days
- `DATE_ADD(w2.recordDate, INTERVAL 1 DAY)` finds next day
- `w1.temperature > w2.temperature` filters for rising temperature
- Returns ID of days with higher temperature than previous day

#### Approach 2: Using DATEDIFF
```sql
-- Alternative using DATEDIFF function
SELECT w1.id
FROM Weather w1
INNER JOIN Weather w2 
    ON DATEDIFF(w1.recordDate, w2.recordDate) = 1
WHERE w1.temperature > w2.temperature;
```

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
**Step-by-step checklist:**
- [ ] Set up self-join with appropriate aliases
- [ ] Create join condition for consecutive dates
- [ ] Add WHERE clause for temperature comparison
- [ ] Select the correct ID column
- [ ] Test with sample data to verify logic

---

## 5. Average Time of Process per Machine (LC 1661)

**🔗 LeetCode Link:** [Average Time of Process per Machine - LeetCode #1661](https://leetcode.com/problems/average-time-of-process-per-machine/)

### 📊 Schema First (Active Analysis)

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Activity (
    machine_id INT,
    process_id INT,
    activity_type ENUM('start', 'end'),
    timestamp FLOAT,
    PRIMARY KEY (machine_id, process_id, activity_type)
);

-- Sample Data
INSERT INTO Activity VALUES
(0, 0, 'start', 0.712),
(0, 0, 'end', 1.520),
(0, 1, 'start', 3.140),
(0, 1, 'end', 4.120),
(1, 0, 'start', 0.550),
(1, 0, 'end', 1.550);
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Understanding Process Duration
> **Guided Question:** How do you calculate the duration of each process?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Each process has two records:
- One with activity_type = 'start'
- One with activity_type = 'end'
- Duration = end_timestamp - start_timestamp
- Need to join these records to calculate duration
</details>

### Solutions

```sql
-- Calculate average processing time per machine
SELECT 
    s.machine_id,
    ROUND(AVG(e.timestamp - s.timestamp), 3) AS processing_time
FROM Activity s
INNER JOIN Activity e 
    ON s.machine_id = e.machine_id 
    AND s.process_id = e.process_id
    AND s.activity_type = 'start'
    AND e.activity_type = 'end'
GROUP BY s.machine_id;
```

**Explanation:**
- Self-join matches start and end records for same machine/process
- `e.timestamp - s.timestamp` calculates process duration
- `AVG()` gets average duration per machine
- `ROUND(..., 3)` formats to 3 decimal places

---

## 6. Employee Bonus (LC 577)

**🔗 LeetCode Link:** [Employee Bonus - LeetCode #577](https://leetcode.com/problems/employee-bonus/)

### Solutions

```sql
-- Find employees with bonus less than 1000 or no bonus
SELECT 
    e.name,
    b.bonus
FROM Employee e
LEFT JOIN Bonus b ON e.empId = b.empId
WHERE b.bonus < 1000 OR b.bonus IS NULL;
```

---

## 7. Students and Examinations (LC 1280)

**🔗 LeetCode Link:** [Students and Examinations - LeetCode #1280](https://leetcode.com/problems/students-and-examinations/)

### Solutions

```sql
-- Show exam attendance for all student-subject combinations
SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM Students s
CROSS JOIN Subjects sub
LEFT JOIN Examinations e 
    ON s.student_id = e.student_id 
    AND sub.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name;
```

**Key Concepts:**
- `CROSS JOIN` creates all possible student-subject combinations
- `LEFT JOIN` adds actual exam attendance
- `COUNT()` handles both attended and non-attended exams

---

## 8. Managers with at Least 5 Direct Reports (LC 570)

**🔗 LeetCode Link:** [Managers with at Least 5 Direct Reports - LeetCode #570](https://leetcode.com/problems/managers-with-at-least-5-direct-reports/)

### Solutions

```sql
-- Find managers with 5+ direct reports
SELECT m.name
FROM Employee e
INNER JOIN Employee m ON e.managerId = m.id
GROUP BY m.id, m.name
HAVING COUNT(e.id) >= 5;
```

**Key Concepts:**
- Self-join to connect employees with their managers
- `GROUP BY` manager to count reports
- `HAVING` filters groups (not individual rows)

---

## 9. Confirmation Rate (LC 1934)

**🔗 LeetCode Link:** [Confirmation Rate - LeetCode #1934](https://leetcode.com/problems/confirmation-rate/)

### Solutions

```sql
-- Calculate confirmation rate per user
SELECT 
    s.user_id,
    ROUND(
        COALESCE(
            SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) * 1.0 / COUNT(c.user_id),
            0
        ), 2
    ) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id;
```

**Key Concepts:**
- `LEFT JOIN` includes users with no confirmation attempts
- `CASE WHEN` for conditional counting
- `COALESCE` handles users with no confirmations

---

## 📚 Key Concepts Summary

### Join Types Mastered
- **INNER JOIN** - Only matching records from both tables
- **LEFT JOIN** - All records from left table + matches from right
- **RIGHT JOIN** - All records from right table + matches from left
- **FULL OUTER JOIN** - All records from both tables
- **CROSS JOIN** - Cartesian product of all combinations
- **Self-Join** - Table joined with itself

### Join Patterns
1. **Basic Relationship**: `table1 JOIN table2 ON table1.id = table2.foreign_id`
2. **Missing Records**: `LEFT JOIN ... WHERE right_table.id IS NULL`
3. **Self-Comparison**: `table1 t1 JOIN table1 t2 ON t1.date = t2.date + 1`
4. **Date Range**: `ON date BETWEEN start_date AND end_date`

### Best Practices
- Use table aliases for readability (`e` for Employee, `m` for Manager)
- Be explicit about join types (don't rely on implicit INNER JOIN)
- Consider NULL handling in LEFT/RIGHT joins
- Use appropriate join types based on business requirements
- Test edge cases (missing relationships, duplicate keys)

### Next Steps
Master advanced querying techniques in [Subqueries Guide](subqueries_guide.md).