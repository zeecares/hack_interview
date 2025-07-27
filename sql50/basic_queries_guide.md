# Basic Queries - SQL 50 Study Guide

Master the fundamentals of SQL data retrieval and filtering through 8 essential problems.

## Table of Contents
1. [Select All Employees](#1-select-all-employees)
2. [Find High Salary Employees](#2-find-high-salary-employees)
3. [List Unique Departments](#3-list-unique-departments)
4. [Sort Employees by Salary](#4-sort-employees-by-salary)
5. [Find Employees with NULL Values](#5-find-employees-with-null-values)
6. [Pattern Matching with Names](#6-pattern-matching-with-names)
7. [Salary Range Analysis](#7-salary-range-analysis)
8. [Calculate Employee Metrics](#8-calculate-employee-metrics)

---

## 1. Recyclable and Low Fat Products (LC 1757)

**🔗 LeetCode Link:** [Recyclable and Low Fat Products - LeetCode #1757](https://leetcode.com/problems/recyclable-and-low-fat-products/)

### 📊 Schema First (Active Analysis)
Before writing any SQL, spend 2-3 minutes analyzing the table structure:

**Schema Analysis Questions:**
1. What information is stored about each employee?
2. Which column would uniquely identify each employee?
3. What might be the business purpose of each column?

*Take time to understand the data model before continuing...*

**Table Structure:**
```sql
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    low_fats ENUM('Y','N'),
    recyclable ENUM('Y','N')
);

-- Sample Data
INSERT INTO Products VALUES
(0, 'Y', 'N'),
(1, 'Y', 'Y'),
(2, 'N', 'Y'),
(3, 'Y', 'Y'),
(4, 'N', 'N');
```

### 💡 Query Construction (Guided Learning)

#### Step 1: Understanding Data Requirements
> **Guided Question:** What does "select all employees" mean in terms of columns and rows?

<details>
<summary>💭 Think about it, then click to reveal</summary>

"Select all employees" typically means:
- **Columns**: All available columns for each employee
- **Rows**: Every employee record in the table
- **No filtering**: We want the complete dataset

This is the most basic SELECT operation in SQL.
</details>

#### Step 2: Basic SELECT Syntax
> **Guided Question:** What SQL keywords do you need to retrieve all data from a table?

<details>
<summary>💭 Think about it, then click to reveal</summary>

The basic syntax is:
```sql
SELECT column_list FROM table_name;
```

For all columns, we can use:
- `SELECT *` (asterisk means "all columns")
- Or list each column explicitly: `SELECT col1, col2, col3`

The `*` is convenient but explicit column lists are often better for production code.
</details>

#### Step 3: Best Practices Consideration
> **Guided Question:** When might you avoid using SELECT * in real applications?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Avoid `SELECT *` when:
- **Performance**: You only need specific columns
- **Maintainability**: Table structure might change
- **Security**: Some columns might contain sensitive data
- **Network**: Transferring unnecessary data

Explicit column selection is generally preferred in production applications.
</details>

### Solutions

#### Approach 1: Basic AND Condition
```sql
-- Find products that are both low fat and recyclable
SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';
```

**Explanation:**
- `WHERE` clause filters rows based on conditions
- `AND` operator requires both conditions to be true
- Returns only products meeting both criteria
- Simple filtering using equality comparison

#### Approach 2: Explicit Column Selection
```sql
-- Show all information for qualifying products
SELECT product_id, low_fats, recyclable
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';
```

**Trade-offs:**
- **Explicit**: More verbose but clearer intent
- **Wildcard**: Shorter but less specific
- **Performance**: Minimal difference for small tables
- **Maintainability**: Explicit is more robust to schema changes

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
Try writing both queries from memory:

**Step-by-step checklist:**
- [ ] Write a SELECT statement using *
- [ ] Write a SELECT statement with explicit columns
- [ ] Identify the table name correctly
- [ ] Ensure proper SQL syntax (semicolon, etc.)

#### Schema Variations
Practice adapting your solution:
- What if you only wanted first_name and salary?
- How would you select all columns from a table named "Staff"?
- What happens if you misspell a column name?

#### Reflection Questions
After solving, think about:

1. **Query Logic:** Can you explain the difference between * and explicit columns?
2. **Performance:** Which approach would be better for a table with 50 columns?
3. **Alternative Approaches:** Are there other ways to see table data?
4. **Pattern Recognition:** What other problems require "select all" operations?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding basic SELECT syntax: ___/5
- [ ] Writing simple queries: ___/5  
- [ ] Choosing between * and explicit columns: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Practice more basic SELECT variations
- Try selecting specific columns to build familiarity

---

## 2. Find Customer Referee (LC 584)

**🔗 LeetCode Link:** [Find Customer Referee - LeetCode #584](https://leetcode.com/problems/find-customer-referee/)

### 📊 Schema First (Active Analysis)
Using the same Employees table from Problem 1:

**Schema Analysis Questions:**
1. Which column contains salary information?
2. What would define "high salary" in this context?
3. How would you filter rows based on a condition?

### 💡 Query Construction (Guided Learning)

#### Step 1: Understanding Filtering Requirements
> **Guided Question:** How do you limit query results to only rows that meet certain criteria?

<details>
<summary>💭 Think about it, then click to reveal</summary>

SQL uses the `WHERE` clause to filter rows:
- Comes after the `FROM` clause
- Contains conditions that evaluate to true/false
- Only rows where condition is true are returned

For salary filtering, we need to compare the salary column to a threshold value.
</details>

#### Step 2: Comparison Operators
> **Guided Question:** What SQL operator would you use to find salaries greater than a specific amount?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Common comparison operators:
- `>` greater than
- `>=` greater than or equal to
- `<` less than
- `<=` less than or equal to
- `=` equal to
- `!=` or `<>` not equal to

For "high salary" (let's say > 70000), we'd use: `WHERE salary > 70000`
</details>

#### Step 3: Result Set Considerations
> **Guided Question:** What columns should you return for a "high salary employees" query?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Consider what information would be useful:
- **Basic**: Employee name and salary
- **Complete**: All employee information for context
- **Analytical**: Maybe just names for a simple list

The choice depends on the business requirement and how the data will be used.
</details>

### Solutions

#### Approach 1: Basic High Salary Filter
```sql
-- Find employees earning more than $70,000
SELECT first_name, last_name, salary
FROM Employees
WHERE salary > 70000;
```

#### Approach 2: Complete Information with Sorting
```sql
-- Get all information for high earners, sorted by salary
SELECT *
FROM Employees
WHERE salary > 70000
ORDER BY salary DESC;
```

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
**Step-by-step checklist:**
- [ ] Add a WHERE clause after FROM
- [ ] Use the correct comparison operator
- [ ] Choose appropriate columns to display
- [ ] Consider adding ORDER BY for better results

---

## 3. List Unique Departments

**🔗 LeetCode Link:** [Find Duplicate Emails - LeetCode #182](https://leetcode.com/problems/duplicate-emails/)

### 📊 Schema First (Active Analysis)

**Schema Analysis Questions:**
1. Which column contains department information?
2. Why might there be duplicate department values?
3. What does "unique" mean in this context?

### 💡 Query Construction (Guided Learning)

#### Step 1: Understanding Duplicates
> **Guided Question:** Why would a departments column have repeated values?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Multiple employees can work in the same department:
- Each employee row has their department
- Department names repeat for each employee in that department
- We want to see each department name only once

This is where `DISTINCT` becomes useful.
</details>

#### Step 2: DISTINCT Keyword
> **Guided Question:** How does SQL eliminate duplicate values from results?

<details>
<summary>💭 Think about it, then click to reveal</summary>

The `DISTINCT` keyword:
- Goes immediately after `SELECT`
- Removes duplicate rows from the result set
- Works on the entire row or specified columns
- Syntax: `SELECT DISTINCT column_name FROM table_name`
</details>

#### Step 3: Sorting Considerations
> **Guided Question:** How could you make the unique departments list more readable?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Add sorting with `ORDER BY`:
- Alphabetical order is usually most readable
- `ORDER BY department ASC` (ascending, A-Z)
- `ORDER BY department DESC` (descending, Z-A)
- ASC is default, so `ORDER BY department` works too
</details>

### Solutions

#### Approach 1: Simple Distinct
```sql
-- Get unique department names
SELECT DISTINCT department
FROM Employees;
```

#### Approach 2: Sorted Unique Departments
```sql
-- Get unique departments in alphabetical order
SELECT DISTINCT department
FROM Employees
ORDER BY department;
```

#### Approach 3: With Count Information
```sql
-- Show departments with employee count
SELECT department, COUNT(*) as employee_count
FROM Employees
GROUP BY department
ORDER BY department;
```

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
**Step-by-step checklist:**
- [ ] Use DISTINCT keyword correctly
- [ ] Select the appropriate column
- [ ] Add sorting for readability
- [ ] Compare results with and without DISTINCT

---

*Continue with remaining problems following the same enhanced learning format...*

## Quick Reference

### SQL Keywords Covered
- `SELECT` - Choose columns to retrieve
- `FROM` - Specify source table
- `WHERE` - Filter rows by conditions  
- `DISTINCT` - Remove duplicates
- `ORDER BY` - Sort results
- `*` - All columns wildcard

### Common Patterns
1. **Basic Retrieval**: `SELECT columns FROM table`
2. **Filtering**: `SELECT columns FROM table WHERE condition`
3. **Unique Values**: `SELECT DISTINCT column FROM table`
4. **Sorting**: `SELECT columns FROM table ORDER BY column`

### Next Steps
After mastering basic queries, proceed to [Sorting & Aggregation Guide](sorting_aggregation_guide.md) to learn GROUP BY and aggregate functions.