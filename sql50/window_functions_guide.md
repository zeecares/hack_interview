---
title: "Window Functions - SQL 50 Study Guide"
description: "Master ROW_NUMBER, RANK, LEAD/LAG, and advanced analytics through 8 essential problems"
---

# Window Functions - SQL 50 Study Guide 🪟

Master advanced analytical queries through ranking, running totals, and comparative analysis with 8 carefully selected window function problems from LeetCode's SQL 50.

## Table of Contents
1. [The Number of Employees Which Report to Each Employee](#1-the-number-of-employees-which-report-to-each-employee-lc-1731)
2. [Primary Department for Each Employee](#2-primary-department-for-each-employee-lc-1789)
3. [Triangle Judgement](#3-triangle-judgement-lc-610)
4. [Consecutive Numbers](#4-consecutive-numbers-lc-180)
5. [Product Price at a Given Date](#5-product-price-at-a-given-date-lc-1164)
6. [Last Person to Fit in the Bus](#6-last-person-to-fit-in-the-bus-lc-1204)
7. [Count Salary Categories](#7-count-salary-categories-lc-1907)
8. [Employees Whose Manager Left the Company](#8-employees-whose-manager-left-the-company-lc-1978)

---

## 1. The Number of Employees Which Report to Each Employee (LC 1731)

**🔗 LeetCode Link:** [The Number of Employees Which Report to Each Employee - LeetCode #1731](https://leetcode.com/problems/the-number-of-employees-which-report-to-each-employee/)

### 📊 Schema First (Active Analysis)
Before writing any SQL, spend 2-3 minutes analyzing the table structure:

**Schema Analysis Questions:**
1. How are manager-employee relationships represented?
2. What information is needed to analyze reporting structures?
3. How do you calculate average age of direct reports?

*Take time to understand the data model before continuing...*

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(20),
    reports_to INT,
    age INT
);

-- Sample Data
INSERT INTO Employees VALUES
(9, 'Hercy', NULL, 43),
(6, 'Alice', 9, 41),
(4, 'Bob', 9, 36),
(2, 'Winston', NULL, 37);
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Understanding Manager-Employee Relationships
> **Guided Question:** How do you identify who reports to whom in this schema?

<details>
<summary>💭 Think about it, then click to reveal</summary>

The relationship structure:
- `reports_to` column contains the manager's employee_id
- NULL in `reports_to` means the person is a top-level manager
- Self-join connects employees with their managers
- Manager information comes from joining on `reports_to = employee_id`
</details>

#### Step 2: Counting Direct Reports
> **Guided Question:** How do you count the number of people reporting to each manager?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Counting approach:
- GROUP BY the manager's employee_id
- COUNT the number of direct reports
- Only include managers who have at least one direct report
- Self-join pattern: `employees e1 JOIN employees e2 ON e1.employee_id = e2.reports_to`
</details>

#### Step 3: Calculating Average Age
> **Guided Question:** How do you calculate the average age of direct reports for each manager?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Average calculation:
- Use AVG() function on the age of direct reports
- Group by manager to get average per manager
- ROUND() to format the average appropriately
- The age comes from the employees table (direct reports)
</details>

### Solutions

#### Approach 1: Self-Join with Aggregation
```sql
-- Count employees and average age of direct reports per manager
SELECT 
    manager.employee_id,
    manager.name,
    COUNT(employee.employee_id) AS reports_count,
    ROUND(AVG(employee.age)) AS average_age
FROM Employees manager
INNER JOIN Employees employee ON manager.employee_id = employee.reports_to
GROUP BY manager.employee_id, manager.name
ORDER BY manager.employee_id;
```

**Explanation:**
- Self-join connects managers with their direct reports
- `manager.employee_id = employee.reports_to` establishes the relationship
- `COUNT(employee.employee_id)` counts direct reports per manager
- `AVG(employee.age)` calculates average age of reports
- `GROUP BY` aggregates data per manager
- Only managers with reports appear (INNER JOIN behavior)

#### Approach 2: Using Subquery for Validation
```sql
-- Alternative with explicit manager filtering
SELECT 
    m.employee_id,
    m.name,
    COUNT(e.employee_id) AS reports_count,
    ROUND(AVG(e.age)) AS average_age
FROM Employees m
INNER JOIN Employees e ON m.employee_id = e.reports_to
WHERE m.employee_id IN (
    SELECT DISTINCT reports_to 
    FROM Employees 
    WHERE reports_to IS NOT NULL
)
GROUP BY m.employee_id, m.name
ORDER BY m.employee_id;
```

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
Try writing the query from memory:

**Step-by-step checklist:**
- [ ] Set up self-join with appropriate aliases (manager/employee)
- [ ] Use correct join condition (manager.id = employee.reports_to)
- [ ] GROUP BY manager information for aggregation
- [ ] COUNT direct reports accurately
- [ ] Calculate and round average age properly
- [ ] Add ORDER BY for consistent results

#### Schema Variations
Practice adapting your solution:
- What if you wanted to include managers with zero reports?
- How would you find the oldest/youngest direct report per manager?
- What if you needed to calculate total salary cost per manager?

#### Reflection Questions
After solving, think about:

1. **Self-Join Logic:** Why use INNER JOIN instead of LEFT JOIN?
2. **Hierarchy Analysis:** How would you extend this to show multiple management levels?
3. **Performance:** What indexes would help this query perform better?
4. **Data Quality:** What happens if there are circular reporting relationships?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding self-join patterns: ___/5
- [ ] Using aggregation with GROUP BY: ___/5
- [ ] Calculating averages and rounding: ___/5
- [ ] Analyzing hierarchical data structures: ___/5

---

## 2. Primary Department for Each Employee (LC 1789)

**🔗 LeetCode Link:** [Primary Department for Each Employee - LeetCode #1789](https://leetcode.com/problems/primary-department-for-each-employee/)

### 📊 Schema First (Active Analysis)

**Schema Analysis Questions:**
1. What does "primary department" mean in this context?
2. How do you handle employees with only one department?
3. What's the business logic for department assignment priority?

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Employee (
    employee_id INT,
    department_id INT,
    primary_flag ENUM('Y','N'),
    PRIMARY KEY (employee_id, department_id)
);

-- Sample Data
INSERT INTO Employee VALUES
(1, 1, 'N'),
(2, 1, 'Y'),
(2, 2, 'N'),
(3, 3, 'N'),
(4, 2, 'N'),
(4, 3, 'Y'),
(4, 4, 'N');
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Understanding Primary Department Logic
> **Guided Question:** What rules determine an employee's primary department?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Business rules:
1. If employee has a department with primary_flag = 'Y', that's the primary department
2. If employee has only one department (regardless of flag), that's the primary department
3. Each employee should have exactly one primary department in the result

This requires conditional logic to handle both cases.
</details>

#### Step 2: Window Function Strategy
> **Guided Question:** How can window functions help identify primary departments?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Window function approach:
- Use `ROW_NUMBER()` to rank departments per employee
- Priority: primary_flag = 'Y' first, then any department
- `ORDER BY primary_flag DESC` puts 'Y' before 'N'
- Take the first row (rn = 1) for each employee
</details>

### Solutions

#### Approach 1: Using Window Functions
```sql
-- Find primary department for each employee
WITH RankedDepartments AS (
    SELECT 
        employee_id,
        department_id,
        primary_flag,
        ROW_NUMBER() OVER (
            PARTITION BY employee_id 
            ORDER BY primary_flag DESC, department_id
        ) as rn
    FROM Employee
)
SELECT employee_id, department_id
FROM RankedDepartments
WHERE rn = 1;
```

**Explanation:**
- `PARTITION BY employee_id` creates separate ranking per employee
- `ORDER BY primary_flag DESC` prioritizes 'Y' over 'N'
- `department_id` provides consistent ordering for tie-breaking
- `ROW_NUMBER()` assigns rank 1 to the primary department
- Filter `WHERE rn = 1` gets the primary department per employee

#### Approach 2: Union of Primary and Single Department Cases
```sql
-- Alternative approach handling two cases separately
SELECT employee_id, department_id
FROM Employee
WHERE primary_flag = 'Y'

UNION

SELECT employee_id, department_id
FROM Employee e1
WHERE primary_flag = 'N' 
AND NOT EXISTS (
    SELECT 1 FROM Employee e2 
    WHERE e1.employee_id = e2.employee_id 
    AND e2.primary_flag = 'Y'
)
AND employee_id IN (
    SELECT employee_id 
    FROM Employee 
    GROUP BY employee_id 
    HAVING COUNT(*) = 1
);
```

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
**Step-by-step checklist:**
- [ ] Use window function to rank departments per employee
- [ ] Priority order: primary_flag = 'Y' first
- [ ] Handle employees with single departments
- [ ] Filter to get one result per employee
- [ ] Test with various employee scenarios

---

## 3. Triangle Judgement (LC 610)

**🔗 LeetCode Link:** [Triangle Judgement - LeetCode #610](https://leetcode.com/problems/triangle-judgement/)

### Solutions

```sql
-- Determine if three sides can form a triangle
SELECT 
    x, y, z,
    CASE 
        WHEN x + y > z AND x + z > y AND y + z > x 
        THEN 'Yes' 
        ELSE 'No' 
    END AS triangle
FROM Triangle;
```

**Key Concepts:**
- Triangle inequality theorem: sum of any two sides > third side
- CASE statement for conditional logic
- Simple mathematical validation

---

## 4. Consecutive Numbers (LC 180)

**🔗 LeetCode Link:** [Consecutive Numbers - LeetCode #180](https://leetcode.com/problems/consecutive-numbers/)

### 📊 Schema First (Active Analysis)

**Schema Analysis Questions:**
1. What constitutes "consecutive" in this context?
2. How do you identify patterns spanning multiple rows?
3. What's the minimum sequence length required?

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Logs (
    id INT PRIMARY KEY,
    num INT
);

-- Sample Data
INSERT INTO Logs VALUES
(1, 1), (2, 1), (3, 1), (4, 2), (5, 1), (6, 2), (7, 2);
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Understanding Consecutive Sequences
> **Guided Question:** How do you identify numbers that appear in consecutive rows?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Consecutive identification:
- Use window functions to access adjacent rows
- `LAG()` and `LEAD()` functions show previous/next values
- Compare current row with neighbors
- Look for patterns where 3+ consecutive rows have same number
</details>

#### Step 2: Window Function Approach
> **Guided Question:** How can LEAD() function help identify consecutive sequences?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Window function strategy:
```sql
SELECT num,
       LEAD(num, 1) OVER (ORDER BY id) AS next1,
       LEAD(num, 2) OVER (ORDER BY id) AS next2
FROM Logs
```

Then filter where `num = next1 AND num = next2` (3 consecutive same numbers).
</details>

### Solutions

#### Approach 1: Using LEAD Window Function
```sql
-- Find numbers appearing at least 3 times consecutively
SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT 
        num,
        LEAD(num, 1) OVER (ORDER BY id) AS next1,
        LEAD(num, 2) OVER (ORDER BY id) AS next2
    FROM Logs
) ranked
WHERE num = next1 AND num = next2;
```

**Explanation:**
- `LEAD(num, 1)` gets the next row's number
- `LEAD(num, 2)` gets the number two rows ahead
- Filter where current = next1 = next2 (three consecutive same numbers)
- `DISTINCT` removes duplicate numbers from result

#### Approach 2: Using LAG and LEAD
```sql
-- Alternative checking both directions
SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT 
        num,
        LAG(num, 1) OVER (ORDER BY id) AS prev1,
        LEAD(num, 1) OVER (ORDER BY id) AS next1
    FROM Logs
) ranked
WHERE (num = prev1 AND num = next1)  -- Middle of 3 consecutive
   OR (num = LEAD(num, 1) OVER (ORDER BY id) 
       AND num = LEAD(num, 2) OVER (ORDER BY id)); -- Start of 3 consecutive
```

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
**Step-by-step checklist:**
- [ ] Use LEAD() to access future row values
- [ ] Compare current row with next 2 rows
- [ ] Filter for 3 consecutive identical numbers
- [ ] Use DISTINCT to avoid duplicate results
- [ ] Order by id for proper sequence analysis

---

## 5. Product Price at a Given Date (LC 1164)

**🔗 LeetCode Link:** [Product Price at a Given Date - LeetCode #1164](https://leetcode.com/problems/product-price-at-a-given-date/)

### 📊 Schema First (Active Analysis)

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Products (
    product_id INT,
    new_price INT,
    change_date DATE,
    PRIMARY KEY (product_id, change_date)
);

-- Sample Data
INSERT INTO Products VALUES
(1, 20, '2019-08-14'),
(2, 50, '2019-08-14'),
(1, 30, '2019-08-15'),
(1, 35, '2019-08-16'),
(2, 65, '2019-08-17'),
(3, 20, '2019-08-18');
```
</details>

### Solutions

#### Approach 1: Window Functions with Conditional Logic
```sql
-- Get product prices as of 2019-08-16
WITH PriceHistory AS (
    SELECT 
        product_id,
        new_price,
        change_date,
        ROW_NUMBER() OVER (
            PARTITION BY product_id 
            ORDER BY change_date DESC
        ) as rn
    FROM Products
    WHERE change_date <= '2019-08-16'
),
AllProducts AS (
    SELECT DISTINCT product_id FROM Products
)
SELECT 
    ap.product_id,
    COALESCE(ph.new_price, 10) AS price
FROM AllProducts ap
LEFT JOIN PriceHistory ph ON ap.product_id = ph.product_id AND ph.rn = 1;
```

**Key Concepts:**
- Window function to rank price changes by date
- Handle products with no price changes before target date
- Default price of 10 for products without prior changes

---

## 6. Last Person to Fit in the Bus (LC 1204)

**🔗 LeetCode Link:** [Last Person to Fit in the Bus - LeetCode #1204](https://leetcode.com/problems/last-person-to-fit-in-the-bus/)

### Solutions

```sql
-- Find last person who can board without exceeding weight limit
WITH RunningWeight AS (
    SELECT 
        person_name,
        weight,
        turn,
        SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue
)
SELECT person_name
FROM RunningWeight
WHERE total_weight <= 1000
ORDER BY turn DESC
LIMIT 1;
```

**Key Concepts:**
- Running total using window function
- `SUM() OVER (ORDER BY turn)` creates cumulative sum
- Filter to valid weights, then get last person

---

## 7. Count Salary Categories (LC 1907)

**🔗 LeetCode Link:** [Count Salary Categories - LeetCode #1907](https://leetcode.com/problems/count-salary-categories/)

### Solutions

```sql
-- Count accounts in each salary category
WITH SalaryCategories AS (
    SELECT 'Low Salary' AS category
    UNION ALL
    SELECT 'Average Salary'
    UNION ALL
    SELECT 'High Salary'
),
CategorizedAccounts AS (
    SELECT 
        account_id,
        CASE 
            WHEN income < 20000 THEN 'Low Salary'
            WHEN income BETWEEN 20000 AND 50000 THEN 'Average Salary'
            ELSE 'High Salary'
        END AS category
    FROM Accounts
)
SELECT 
    sc.category,
    COALESCE(COUNT(ca.account_id), 0) AS accounts_count
FROM SalaryCategories sc
LEFT JOIN CategorizedAccounts ca ON sc.category = ca.category
GROUP BY sc.category;
```

**Key Concepts:**
- Create all possible categories to ensure complete results
- CASE statement for conditional categorization
- LEFT JOIN to include categories with zero counts

---

## 8. Employees Whose Manager Left the Company (LC 1978)

**🔗 LeetCode Link:** [Employees Whose Manager Left the Company - LeetCode #1978](https://leetcode.com/problems/employees-whose-manager-left-the-company/)

### Solutions

```sql
-- Find employees whose managers left and salary < 30000
SELECT employee_id
FROM Employees
WHERE salary < 30000
  AND manager_id IS NOT NULL
  AND manager_id NOT IN (
      SELECT employee_id 
      FROM Employees
  )
ORDER BY employee_id;
```

**Key Concepts:**
- NOT IN subquery to find missing managers
- Multiple conditions in WHERE clause
- Handle NULL manager_id appropriately

---

## 📚 Key Concepts Summary

### Window Functions Mastered
- **ROW_NUMBER()** - Assign unique sequential numbers
- **RANK()** - Assign ranks with gaps for ties
- **DENSE_RANK()** - Assign ranks without gaps
- **LEAD()/LAG()** - Access next/previous row values
- **SUM() OVER()** - Running totals and cumulative calculations
- **COUNT() OVER()** - Running counts

### Window Function Syntax
```sql
function_name([column]) OVER (
    [PARTITION BY column1, column2, ...]
    [ORDER BY column3, column4, ...]
    [ROWS/RANGE frame_specification]
)
```

### Common Patterns
1. **Ranking**: `ROW_NUMBER() OVER (PARTITION BY category ORDER BY value DESC)`
2. **Running Totals**: `SUM(amount) OVER (ORDER BY date)`
3. **Previous/Next Values**: `LAG(value, 1) OVER (ORDER BY date)`
4. **Moving Averages**: `AVG(value) OVER (ORDER BY date ROWS 2 PRECEDING)`

### Advanced Applications
- **Gap and Island Problems**: Finding consecutive sequences
- **Time Series Analysis**: Comparing current vs previous periods
- **Ranking and Top-N**: Finding top performers in categories
- **Running Calculations**: Cumulative sums, moving averages
- **Data Quality**: Identifying outliers and patterns

### Performance Tips
- Window functions often perform better than correlated subqueries
- Proper indexing on PARTITION BY and ORDER BY columns improves performance
- Consider materializing complex window function results for reuse
- LIMIT with ORDER BY can optimize "top-N" queries

### Next Steps
Master text processing and temporal analysis in [String & Date Functions Guide](string_date_guide.md).