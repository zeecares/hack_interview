---
title: "Sorting & Aggregation - SQL 50 Study Guide"
description: "Master ORDER BY, GROUP BY, and aggregate functions through 8 essential problems"
---

# Sorting & Aggregation - SQL 50 Study Guide 📊

Master data organization and summary analysis through 8 carefully selected problems from LeetCode's SQL 50.

## Table of Contents
1. [Not Boring Movies](#1-not-boring-movies-lc-620)
2. [Average Selling Price](#2-average-selling-price-lc-1251)
3. [Project Employees I](#3-project-employees-i-lc-1075)
4. [Percentage of Users Attended a Contest](#4-percentage-of-users-attended-a-contest-lc-1633)
5. [Queries Quality and Percentage](#5-queries-quality-and-percentage-lc-1211)
6. [Monthly Transactions I](#6-monthly-transactions-i-lc-1193)
7. [Classes More Than 5 Students](#7-classes-more-than-5-students-lc-596)
8. [Find Followers Count](#8-find-followers-count-lc-1729)

---

## 1. Not Boring Movies (LC 620)

**🔗 LeetCode Link:** [Not Boring Movies - LeetCode #620](https://leetcode.com/problems/not-boring-movies/)

### 📊 Schema First (Active Analysis)
Before writing any SQL, spend 2-3 minutes analyzing the table structure:

**Schema Analysis Questions:**
1. What makes a movie "boring" according to the schema?
2. How is movie rating stored and what might be a threshold?
3. What does the id column tell us about filtering criteria?

*Take time to understand the data model before continuing...*

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Cinema (
    id INT PRIMARY KEY,
    movie VARCHAR(255),
    description VARCHAR(255),
    rating FLOAT
);

-- Sample Data
INSERT INTO Cinema VALUES
(1, 'War', 'great 3D', 8.9),
(2, 'Science', 'fiction', 8.5),
(3, 'irish', 'boring', 6.2),
(4, 'Ice song', 'Fantasy', 8.6),
(5, 'House card', 'Interesting', 9.1);
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Understanding Multiple Conditions
> **Guided Question:** How do you filter rows based on multiple criteria simultaneously?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Multiple conditions require combining filters:
- **AND**: Both conditions must be true
- **OR**: Either condition can be true
- **Priority**: Use parentheses for complex logic

For "not boring" movies, we need:
- Description is NOT 'boring'
- AND rating above a certain threshold
- AND id is odd (based on problem requirements)
</details>

#### Step 2: Working with Text Comparisons
> **Guided Question:** How do you check if a text field does NOT contain a specific value?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Text comparison options:
- `!=` or `<>` for "not equal to"
- `NOT LIKE` for pattern matching
- `IS NOT NULL` for non-null values

For checking if description is not 'boring': `description != 'boring'`
</details>

#### Step 3: Checking for Odd Numbers
> **Guided Question:** How do you identify odd-numbered IDs in SQL?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Use the modulo operator:
- `MOD(id, 2) = 1` or `id % 2 = 1`
- Returns remainder when dividing by 2
- Odd numbers have remainder 1, even numbers have remainder 0
</details>

#### Step 4: Sorting Results
> **Guided Question:** How should movie results be ordered for better user experience?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Consider logical ordering:
- **By rating**: Highest rated first (`ORDER BY rating DESC`)
- **By movie name**: Alphabetical (`ORDER BY movie ASC`)
- **By ID**: Original order (`ORDER BY id ASC`)

Rating-based sorting makes most sense for movie recommendations.
</details>

### Solutions

#### Approach 1: Basic Filtering with Sorting
```sql
-- Find non-boring movies with good ratings
SELECT id, movie, description, rating
FROM Cinema
WHERE description != 'boring' 
  AND rating >= 8.0 
  AND MOD(id, 2) = 1
ORDER BY rating DESC;
```

**Explanation:**
- Filters out movies with 'boring' description
- Keeps only movies with rating >= 8.0
- Includes only odd-numbered IDs
- Sorts by rating in descending order

#### Approach 2: Using Alternative Syntax
```sql
-- Alternative approach with different operators
SELECT id, movie, description, rating
FROM Cinema
WHERE description <> 'boring' 
  AND rating >= 8.0 
  AND id % 2 = 1
ORDER BY rating DESC;
```

**Key Differences:**
- `<>` instead of `!=` (both work the same)
- `%` instead of `MOD()` (both work the same)
- Same logical structure and results

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
Try writing the query from memory:

**Step-by-step checklist:**
- [ ] SELECT all necessary columns
- [ ] Add WHERE clause with multiple conditions
- [ ] Use AND to combine conditions properly
- [ ] Include odd ID filter using modulo
- [ ] Add appropriate ORDER BY clause

#### Schema Variations
Practice adapting your solution:
- What if we wanted movies with rating >= 7.0?
- How would you find boring movies instead?
- What if we wanted even-numbered IDs?

#### Reflection Questions
After solving, think about:

1. **Condition Logic:** Can you explain why we use AND instead of OR?
2. **Performance:** Which condition might be most selective?
3. **Alternative Approaches:** Could you use CASE statements here?
4. **Pattern Recognition:** What other problems require multiple filters?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Writing WHERE clauses with multiple conditions: ___/5
- [ ] Using comparison operators for text: ___/5
- [ ] Working with modulo operator: ___/5
- [ ] Applying ORDER BY effectively: ___/5

---

## 2. Average Selling Price (LC 1251)

**🔗 LeetCode Link:** [Average Selling Price - LeetCode #1251](https://leetcode.com/problems/average-selling-price/)

### 📊 Schema First (Active Analysis)

**Schema Analysis Questions:**
1. How are prices and units sold related across tables?
2. What does the date range in Prices table represent?
3. How do you calculate weighted averages?

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Prices (
    product_id INT,
    start_date DATE,
    end_date DATE,
    price INT,
    PRIMARY KEY (product_id, start_date, end_date)
);

CREATE TABLE UnitsSold (
    product_id INT,
    purchase_date DATE,
    units INT
);

-- Sample Data
INSERT INTO Prices VALUES
(1, '2019-02-17', '2019-02-28', 5),
(1, '2019-03-01', '2019-03-22', 20),
(2, '2019-02-01', '2019-02-20', 15),
(2, '2019-02-21', '2019-03-31', 30);

INSERT INTO UnitsSold VALUES
(1, '2019-02-25', 100),
(1, '2019-03-01', 15),
(2, '2019-02-10', 200),
(2, '2019-03-22', 30);
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Understanding Date Range Joins
> **Guided Question:** How do you join tables when one has date ranges and another has specific dates?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Date range joins require:
- JOIN condition on product_id (matching products)
- AND purchase_date BETWEEN start_date AND end_date
- This ensures we get the right price for each sale date

Example: If someone bought product 1 on '2019-02-25', we need the price that was valid on that date.
</details>

#### Step 2: Calculating Weighted Averages
> **Guided Question:** How do you calculate average selling price when different quantities are sold at different prices?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Weighted average formula:
- Total Revenue = SUM(price × units)
- Total Units = SUM(units)
- Average Price = Total Revenue ÷ Total Units

This gives more weight to sales with higher quantities, which is realistic for average selling price.
</details>

#### Step 3: Handling Products with No Sales
> **Guided Question:** What should happen to products that exist in Prices but have no sales?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Business logic consideration:
- **LEFT JOIN**: Include all products, even with no sales
- **INNER JOIN**: Only products with actual sales
- **COALESCE/ISNULL**: Handle null values appropriately

Typically, we'd use LEFT JOIN and return 0 or NULL for products with no sales.
</details>

### Solutions

#### Approach 1: Weighted Average with Date Range Join
```sql
-- Calculate average selling price per product
SELECT 
    p.product_id,
    ROUND(
        COALESCE(
            SUM(p.price * u.units) / NULLIF(SUM(u.units), 0), 
            0
        ), 2
    ) AS average_price
FROM Prices p
LEFT JOIN UnitsSold u 
    ON p.product_id = u.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;
```

**Explanation:**
- `LEFT JOIN` ensures all products appear in results
- `BETWEEN` matches purchase dates to valid price periods
- `SUM(price * units)` calculates total revenue
- `SUM(units)` calculates total units sold
- `NULLIF` prevents division by zero
- `COALESCE` handles products with no sales
- `ROUND(..., 2)` formats to 2 decimal places

#### Approach 2: Simplified Version (Inner Join)
```sql
-- Only show products with actual sales
SELECT 
    p.product_id,
    ROUND(SUM(p.price * u.units) / SUM(u.units), 2) AS average_price
FROM Prices p
INNER JOIN UnitsSold u 
    ON p.product_id = u.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
GROUP BY p.product_id;
```

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
**Step-by-step checklist:**
- [ ] JOIN tables on both product_id and date range
- [ ] Calculate weighted average using SUM aggregations
- [ ] Handle division by zero scenarios
- [ ] Use appropriate JOIN type for business requirements
- [ ] Format results with proper rounding

---

## 3. Project Employees I (LC 1075)

**🔗 LeetCode Link:** [Project Employees I - LeetCode #1075](https://leetcode.com/problems/project-employees-i/)

### 📊 Schema First (Active Analysis)

**Schema Analysis Questions:**
1. How are projects and employees related?
2. What aggregation is needed for employee experience?
3. How do you group data for project-level analysis?

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Project (
    project_id INT,
    employee_id INT,
    PRIMARY KEY (project_id, employee_id)
);

CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    name VARCHAR(10),
    experience_years INT
);

-- Sample Data
INSERT INTO Project VALUES
(1, 1), (1, 2), (1, 3),
(2, 1), (2, 4);

INSERT INTO Employee VALUES
(1, 'Khaled', 3),
(2, 'Ali', 2),
(3, 'John', 1),
(4, 'Doe', 2);
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Understanding Project-Employee Relationships
> **Guided Question:** What information do you need to combine from both tables?

<details>
<summary>💭 Think about it, then click to reveal</summary>

We need to:
- Join Project and Employee tables on employee_id
- Group by project_id to get project-level statistics
- Calculate average experience_years for each project
- Include project_id in the final result
</details>

#### Step 2: Aggregation Strategy
> **Guided Question:** How do you calculate average experience per project?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Process:
1. JOIN to get project_id, employee_id, experience_years
2. GROUP BY project_id to aggregate per project
3. AVG(experience_years) to calculate average experience
4. ROUND to format the result appropriately
</details>

### Solutions

#### Approach 1: Basic Average Calculation
```sql
-- Calculate average experience years per project
SELECT 
    p.project_id,
    ROUND(AVG(e.experience_years), 2) AS average_years
FROM Project p
INNER JOIN Employee e ON p.employee_id = e.employee_id
GROUP BY p.project_id;
```

**Explanation:**
- INNER JOIN connects projects with employee details
- GROUP BY project_id aggregates data per project
- AVG() calculates mean experience across project employees
- ROUND() formats to 2 decimal places for readability

#### Approach 2: With Additional Statistics
```sql
-- Include more project statistics
SELECT 
    p.project_id,
    COUNT(p.employee_id) AS employee_count,
    ROUND(AVG(e.experience_years), 2) AS average_years,
    MIN(e.experience_years) AS min_experience,
    MAX(e.experience_years) AS max_experience
FROM Project p
INNER JOIN Employee e ON p.employee_id = e.employee_id
GROUP BY p.project_id
ORDER BY p.project_id;
```

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
**Step-by-step checklist:**
- [ ] JOIN Project and Employee tables correctly
- [ ] GROUP BY project_id for aggregation
- [ ] Use AVG() function for experience calculation
- [ ] Apply ROUND() for proper formatting
- [ ] Consider additional metrics for comprehensive analysis

---

## 4. Percentage of Users Attended a Contest (LC 1633)

**🔗 LeetCode Link:** [Percentage of Users Attended a Contest - LeetCode #1633](https://leetcode.com/problems/percentage-of-users-attended-a-contest/)

### 📊 Schema First (Active Analysis)

**Schema Analysis Questions:**
1. How do you calculate participation percentage?
2. What's the relationship between total users and contest participants?
3. How do you handle percentage calculations and rounding?

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    user_name VARCHAR(20)
);

CREATE TABLE Register (
    contest_id INT,
    user_id INT,
    PRIMARY KEY (contest_id, user_id)
);

-- Sample Data
INSERT INTO Users VALUES
(6, 'Alice'), (2, 'Bob'), (7, 'Alex');

INSERT INTO Register VALUES
(215, 6), (209, 2), (208, 2), (210, 6), (208, 6), (209, 7), (209, 6), (215, 7), (208, 7), (210, 2), (207, 2), (210, 7);
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Understanding Percentage Calculation
> **Guided Question:** How do you calculate the percentage of users who attended each contest?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Percentage formula:
- Participants in contest ÷ Total users × 100
- Need to count distinct participants per contest
- Need total count of all users
- Use subquery or JOIN to get both values
</details>

#### Step 2: Handling Division and Rounding
> **Guided Question:** What considerations are needed for percentage calculations in SQL?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Key considerations:
- **Data types**: Ensure floating-point division
- **Rounding**: Use ROUND() with appropriate decimal places
- **Null handling**: Consider what happens with 0 users
- **Performance**: Subquery vs JOIN for total count
</details>

### Solutions

#### Approach 1: Using Subquery for Total Count
```sql
-- Calculate participation percentage per contest
SELECT 
    contest_id,
    ROUND(
        COUNT(DISTINCT user_id) * 100.0 / (
            SELECT COUNT(*) FROM Users
        ), 2
    ) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC, contest_id ASC;
```

**Explanation:**
- `COUNT(DISTINCT user_id)` counts unique participants per contest
- Subquery `(SELECT COUNT(*) FROM Users)` gets total user count
- `* 100.0` converts to percentage and ensures float division
- `ROUND(..., 2)` formats to 2 decimal places
- `ORDER BY percentage DESC, contest_id ASC` sorts by percentage then contest ID

#### Approach 2: Using Cross Join for Total Count
```sql
-- Alternative approach with cross join
SELECT 
    r.contest_id,
    ROUND(
        COUNT(DISTINCT r.user_id) * 100.0 / total_users.user_count, 
        2
    ) AS percentage
FROM Register r
CROSS JOIN (SELECT COUNT(*) AS user_count FROM Users) total_users
GROUP BY r.contest_id, total_users.user_count
ORDER BY percentage DESC, r.contest_id ASC;
```

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
**Step-by-step checklist:**
- [ ] Count distinct participants per contest
- [ ] Get total number of users
- [ ] Calculate percentage with proper division
- [ ] Round to appropriate decimal places
- [ ] Sort results logically

---

## 5. Queries Quality and Percentage (LC 1211)

**🔗 LeetCode Link:** [Queries Quality and Percentage - LeetCode #1211](https://leetcode.com/problems/queries-quality-and-percentage/)

### 📊 Schema First (Active Analysis)

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Queries (
    query_name VARCHAR(30),
    result VARCHAR(50),
    position INT,
    rating INT
);

-- Sample Data
INSERT INTO Queries VALUES
('Dog', 'Golden Retriever', 1, 5),
('Dog', 'German Shepherd', 2, 5),
('Dog', 'Mule', 200, 1),
('Cat', 'Shirazi', 5, 2),
('Cat', 'Siamese', 3, 3),
('Cat', 'Sphynx', 7, 4);
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Understanding Quality Metrics
> **Guided Question:** How do you calculate query quality and poor query percentage?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Two metrics needed:
1. **Quality**: Average of (rating/position) for each query
2. **Poor Query %**: Percentage of queries with rating < 3

Both require grouping by query_name and using aggregate functions.
</details>

### Solutions

```sql
-- Calculate quality metrics per query
SELECT 
    query_name,
    ROUND(AVG(rating * 1.0 / position), 2) AS quality,
    ROUND(
        SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 
        2
    ) AS poor_query_percentage
FROM Queries
WHERE query_name IS NOT NULL
GROUP BY query_name;
```

---

## 6. Monthly Transactions I (LC 1193)

**🔗 LeetCode Link:** [Monthly Transactions I - LeetCode #1193](https://leetcode.com/problems/monthly-transactions-i/)

### 📊 Schema First (Active Analysis)

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Transactions (
    id INT PRIMARY KEY,
    country VARCHAR(4),
    state ENUM('approved', 'declined'),
    amount INT,
    trans_date DATE
);
```
</details>

### Solutions

```sql
-- Monthly transaction summary by country
SELECT 
    DATE_FORMAT(trans_date, '%Y-%m') AS month,
    country,
    COUNT(*) AS trans_count,
    SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
    SUM(amount) AS trans_total_amount,
    SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY DATE_FORMAT(trans_date, '%Y-%m'), country;
```

---

## 7. Classes More Than 5 Students (LC 596)

**🔗 LeetCode Link:** [Classes More Than 5 Students - LeetCode #596](https://leetcode.com/problems/classes-more-than-5-students/)

### Solutions

```sql
-- Find classes with 5 or more students
SELECT class
FROM Courses
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;
```

---

## 8. Find Followers Count (LC 1729)

**🔗 LeetCode Link:** [Find Followers Count - LeetCode #1729](https://leetcode.com/problems/find-followers-count/)

### Solutions

```sql
-- Count followers per user
SELECT 
    user_id,
    COUNT(follower_id) AS followers_count
FROM Followers
GROUP BY user_id
ORDER BY user_id;
```

---

## 📚 Key Concepts Summary

### SQL Keywords Mastered
- `ORDER BY` - Sort results ascending/descending
- `GROUP BY` - Aggregate data by categories
- `HAVING` - Filter groups (vs WHERE for rows)
- `COUNT()`, `SUM()`, `AVG()` - Aggregate functions
- `ROUND()` - Number formatting
- `DATE_FORMAT()` - Date formatting

### Aggregation Patterns
1. **Basic Grouping**: `GROUP BY column`
2. **Conditional Aggregation**: `SUM(CASE WHEN condition THEN value ELSE 0 END)`
3. **Percentage Calculations**: `COUNT(*) * 100.0 / total`
4. **Weighted Averages**: `SUM(value * weight) / SUM(weight)`

### Best Practices
- Always use `ROUND()` for financial/percentage calculations
- Consider `DISTINCT` when counting unique items
- Use `HAVING` instead of `WHERE` for group-level filtering
- Handle division by zero with `NULLIF()` or `CASE`

### Next Steps
Master joins and table relationships in [Joins Guide](joins_guide.md).