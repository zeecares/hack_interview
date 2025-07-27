---
title: "String & Date Functions - SQL 50 Study Guide"
description: "Master text manipulation, pattern matching, and temporal analysis through 6 essential problems"
---

# String & Date Functions - SQL 50 Study Guide 📅

Master text processing and temporal analysis through string manipulation, pattern matching, and date arithmetic with 6 carefully selected problems from LeetCode's SQL 50.

## Table of Contents
1. [Fix Names in a Table](#1-fix-names-in-a-table-lc-1667)
2. [Find Users With Valid E-Mails](#2-find-users-with-valid-e-mails-lc-1517)
3. [Patients With a Condition](#3-patients-with-a-condition-lc-1527)
4. [Delete Duplicate Emails](#4-delete-duplicate-emails-lc-196)
5. [Second Highest Salary](#5-second-highest-salary-lc-176)
6. [Group Sold Products By The Date](#6-group-sold-products-by-the-date-lc-1484)

---

## 1. Fix Names in a Table (LC 1667)

**🔗 LeetCode Link:** [Fix Names in a Table - LeetCode #1667](https://leetcode.com/problems/fix-names-in-a-table/)

### 📊 Schema First (Active Analysis)
Before writing any SQL, spend 2-3 minutes analyzing the table structure:

**Schema Analysis Questions:**
1. What format should names be in after "fixing"?
2. How do you handle different cases in text?
3. What string functions help with case conversion?

*Take time to understand the data model before continuing...*

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(40)
);

-- Sample Data
INSERT INTO Users VALUES
(1, 'aLice'),
(2, 'bOB'),
(3, 'charlie'),
(4, 'DIANA'),
(5, 'eve');
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Understanding Name Format Requirements
> **Guided Question:** What does "fix names" mean in terms of capitalization?

<details>
<summary>💭 Think about it, then click to reveal</summary>

"Proper case" formatting means:
- First letter should be uppercase
- All other letters should be lowercase
- Example: 'aLice' → 'Alice', 'bOB' → 'Bob'

This requires combining string functions for case conversion.
</details>

#### Step 2: String Function Strategy
> **Guided Question:** Which SQL functions help with case conversion?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Key string functions:
- `UPPER(string)` - converts entire string to uppercase
- `LOWER(string)` - converts entire string to lowercase  
- `LEFT(string, n)` or `SUBSTRING(string, 1, 1)` - gets first character
- `RIGHT(string, n)` or `SUBSTRING(string, 2)` - gets remaining characters
- `CONCAT()` - combines strings
</details>

#### Step 3: Constructing Proper Case
> **Guided Question:** How do you combine functions to create proper case formatting?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Proper case construction:
```sql
CONCAT(
    UPPER(LEFT(name, 1)),           -- First letter uppercase
    LOWER(SUBSTRING(name, 2))       -- Rest lowercase
)
```

Alternative approaches:
- `UPPER(SUBSTRING(name, 1, 1)) + LOWER(SUBSTRING(name, 2))`
- Platform-specific functions like `INITCAP()` (Oracle/PostgreSQL)
</details>

### Solutions

#### Approach 1: Using CONCAT with UPPER/LOWER
```sql
-- Fix names to proper case format
SELECT 
    user_id,
    CONCAT(
        UPPER(LEFT(name, 1)),
        LOWER(SUBSTRING(name, 2))
    ) AS name
FROM Users
ORDER BY user_id;
```

**Explanation:**
- `LEFT(name, 1)` extracts the first character
- `UPPER()` converts first character to uppercase
- `SUBSTRING(name, 2)` gets all characters from position 2 onward
- `LOWER()` converts remaining characters to lowercase
- `CONCAT()` combines the parts into proper case
- `ORDER BY user_id` provides consistent result ordering

#### Approach 2: Using String Concatenation Operator
```sql
-- Alternative using concatenation operator (MySQL/PostgreSQL)
SELECT 
    user_id,
    UPPER(SUBSTRING(name, 1, 1)) || LOWER(SUBSTRING(name, 2)) AS name
FROM Users
ORDER BY user_id;
```

#### Approach 3: Platform-Specific Solutions
```sql
-- PostgreSQL INITCAP function
SELECT user_id, INITCAP(name) AS name
FROM Users
ORDER BY user_id;

-- SQL Server alternative
SELECT 
    user_id,
    UPPER(LEFT(name, 1)) + LOWER(RIGHT(name, LEN(name) - 1)) AS name
FROM Users
ORDER BY user_id;
```

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
Try writing the query from memory:

**Step-by-step checklist:**
- [ ] Extract first character and convert to uppercase
- [ ] Extract remaining characters and convert to lowercase
- [ ] Combine parts using CONCAT or concatenation operator
- [ ] Maintain original user_id in result
- [ ] Add ORDER BY for consistent results

#### Schema Variations
Practice adapting your solution:
- How would you handle middle names or multiple words?
- What if names contain numbers or special characters?
- How would you handle NULL or empty names?

#### Reflection Questions
After solving, think about:

1. **String Manipulation:** What other text formatting challenges use similar patterns?
2. **Performance:** How do string functions affect query performance?
3. **Data Quality:** What validation should happen before name formatting?
4. **Internationalization:** How do different languages affect capitalization rules?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Using UPPER/LOWER functions: ___/5
- [ ] Extracting substrings with LEFT/SUBSTRING: ___/5
- [ ] Combining strings with CONCAT: ___/5
- [ ] Understanding string function behavior: ___/5

---

## 2. Find Users With Valid E-Mails (LC 1517)

**🔗 LeetCode Link:** [Find Users With Valid E-Mails - LeetCode #1517](https://leetcode.com/problems/find-users-with-valid-e-mails/)

### 📊 Schema First (Active Analysis)

**Schema Analysis Questions:**
1. What constitutes a "valid" email address format?
2. How do you validate email patterns using SQL?
3. What are the specific validation rules for this problem?

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(30),
    mail VARCHAR(50)
);

-- Sample Data
INSERT INTO Users VALUES
(1, 'Winston', 'winston@leetcode.com'),
(2, 'Jonathan', 'jonathanisgreat'),
(3, 'Annabelle', 'bella-@leetcode.com'),
(4, 'Sally', 'sally.come@leetcode.com'),
(5, 'Marwan', 'quarz#2020@leetcode.com'),
(6, 'David', 'david69@gmail.com'),
(7, 'Shapiro', '.shapo@leetcode.com');
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Understanding Email Validation Rules
> **Guided Question:** What are the typical rules for valid email addresses in this problem?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Common email validation rules:
- Must contain exactly one '@' symbol
- Must end with '@leetcode.com'
- Prefix (before @) must start with a letter
- Prefix can contain letters, digits, underscore, period, dash
- Cannot start with period or special characters

Pattern: `[letter][letters/digits/._-]*@leetcode.com`
</details>

#### Step 2: Regular Expression Strategy
> **Guided Question:** How do you use REGEXP/RLIKE for pattern matching?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Regular expression approach:
```sql
WHERE mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\\.com$'
```

Pattern breakdown:
- `^` - start of string
- `[a-zA-Z]` - first character must be letter
- `[a-zA-Z0-9_.-]*` - followed by any number of valid characters
- `@leetcode\\.com` - must end with literal '@leetcode.com'
- `$` - end of string
</details>

#### Step 3: Alternative Non-Regex Approach
> **Guided Question:** How could you validate emails without regular expressions?

<details>
<summary>💭 Think about it, then click to reveal</summary>

String function approach:
- Check if email ends with '@leetcode.com' using `RIGHT()` or `LIKE`
- Extract prefix before '@' and validate character by character
- Use `ASCII()` function to check character ranges
- More complex but works on all SQL platforms
</details>

### Solutions

#### Approach 1: Using Regular Expressions (MySQL)
```sql
-- Find users with valid @leetcode.com email addresses
SELECT *
FROM Users
WHERE mail REGEXP '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\\.com$';
```

**Explanation:**
- `^[a-zA-Z]` ensures email starts with a letter
- `[a-zA-Z0-9_.-]*` allows valid characters in prefix
- `@leetcode\\.com$` ensures proper domain ending
- `\\` escapes the period in the domain

#### Approach 2: String Functions Alternative
```sql
-- Alternative without regex (more portable)
SELECT *
FROM Users
WHERE mail LIKE '%@leetcode.com'
  AND mail NOT LIKE '@%'
  AND mail NOT LIKE '.%'
  AND mail NOT LIKE '_%@%'
  AND SUBSTRING(mail, 1, 1) REGEXP '^[a-zA-Z]$'
  AND LENGTH(mail) > LENGTH('@leetcode.com');
```

#### Approach 3: Platform-Specific Solutions
```sql
-- PostgreSQL using similar pattern matching
SELECT *
FROM Users
WHERE mail ~ '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode\.com$';

-- SQL Server using LIKE patterns (limited validation)
SELECT *
FROM Users
WHERE mail LIKE '[a-zA-Z]%@leetcode.com'
  AND mail NOT LIKE '%[^a-zA-Z0-9._-]%@leetcode.com';
```

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
**Step-by-step checklist:**
- [ ] Identify valid email format requirements
- [ ] Choose appropriate pattern matching method
- [ ] Test regex pattern with sample data
- [ ] Handle edge cases (empty strings, special characters)
- [ ] Verify all valid emails are included, invalid ones excluded

---

## 3. Patients With a Condition (LC 1527)

**🔗 LeetCode Link:** [Patients With a Condition - LeetCode #1527](https://leetcode.com/problems/patients-with-a-condition/)

### 📊 Schema First (Active Analysis)

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(30),
    conditions VARCHAR(100)
);

-- Sample Data
INSERT INTO Patients VALUES
(1, 'Daniel', 'YFEV COUGH'),
(2, 'Alice', ''),
(3, 'Bob', 'DIAB100 MYOP'),
(4, 'George', 'ACNE DIAB100'),
(5, 'Alain', 'DIAB201');
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Understanding Condition Patterns
> **Guided Question:** How do you find patients with Type I Diabetes (DIAB1 prefix)?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Type I Diabetes pattern:
- Condition codes starting with 'DIAB1'
- Could be 'DIAB100', 'DIAB101', etc.
- Must match at word boundaries, not within other codes
- Example: 'DIAB100' matches, but 'PREDIAB100' should not
</details>

#### Step 2: Pattern Matching Strategy
> **Guided Question:** What pattern matching approach ensures accurate condition matching?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Accurate matching requires:
- Match 'DIAB1' at the beginning of conditions string
- OR match 'DIAB1' after a space (separate condition)
- Use REGEXP or LIKE with appropriate patterns
- Consider case sensitivity requirements
</details>

### Solutions

#### Approach 1: Using REGEXP for Word Boundaries
```sql
-- Find patients with Type I Diabetes (DIAB1 prefix)
SELECT *
FROM Patients
WHERE conditions REGEXP '\\bDIAB1';
```

**Explanation:**
- `\\b` represents word boundary in regex
- `DIAB1` matches the specific condition prefix
- Word boundary ensures we don't match within other condition codes

#### Approach 2: Using LIKE with Multiple Patterns
```sql
-- Alternative using LIKE patterns
SELECT *
FROM Patients
WHERE conditions LIKE 'DIAB1%'        -- Starts with DIAB1
   OR conditions LIKE '% DIAB1%';     -- DIAB1 after space
```

#### Approach 3: More Explicit Pattern Matching
```sql
-- Comprehensive pattern matching
SELECT *
FROM Patients
WHERE conditions REGEXP '(^|[[:space:]])DIAB1';
```

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
**Step-by-step checklist:**
- [ ] Understand condition code format and boundaries
- [ ] Choose appropriate pattern matching method
- [ ] Test with various condition combinations
- [ ] Ensure no false positives from partial matches
- [ ] Verify case sensitivity handling

---

## 4. Delete Duplicate Emails (LC 196)

**🔗 LeetCode Link:** [Delete Duplicate Emails - LeetCode #196](https://leetcode.com/problems/delete-duplicate-emails/)

### Solutions

```sql
-- Delete duplicate emails, keeping the one with smallest id
DELETE p1 
FROM Person p1
INNER JOIN Person p2 
WHERE p1.email = p2.email 
  AND p1.id > p2.id;
```

**Key Concepts:**
- Self-join to identify duplicates
- DELETE with JOIN syntax (MySQL specific)
- Keep record with minimum ID for each email

**Alternative approaches:**
```sql
-- Using window function (for platforms supporting it)
WITH RankedEmails AS (
    SELECT id, email,
           ROW_NUMBER() OVER (PARTITION BY email ORDER BY id) as rn
    FROM Person
)
DELETE FROM Person 
WHERE id IN (
    SELECT id FROM RankedEmails WHERE rn > 1
);

-- Using subquery approach
DELETE FROM Person
WHERE id NOT IN (
    SELECT MIN(id) FROM Person GROUP BY email
);
```

---

## 5. Second Highest Salary (LC 176)

**🔗 LeetCode Link:** [Second Highest Salary - LeetCode #176](https://leetcode.com/problems/second-highest-salary/)

### Solutions

#### Approach 1: Using LIMIT with OFFSET
```sql
-- Find second highest salary using LIMIT
SELECT 
    (SELECT DISTINCT salary 
     FROM Employee 
     ORDER BY salary DESC 
     LIMIT 1 OFFSET 1) AS SecondHighestSalary;
```

#### Approach 2: Using Window Functions
```sql
-- Using DENSE_RANK window function
SELECT 
    CASE WHEN COUNT(*) >= 2 
         THEN salary 
         ELSE NULL 
    END AS SecondHighestSalary
FROM (
    SELECT salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) as rank_num
    FROM Employee
) ranked
WHERE rank_num = 2;
```

#### Approach 3: Using MAX with Subquery
```sql
-- Traditional approach with MAX and subquery
SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);
```

**Key Concepts:**
- Handling cases where second highest doesn't exist (return NULL)
- DISTINCT to handle duplicate salaries
- Different ranking approaches (RANK vs DENSE_RANK vs ROW_NUMBER)

---

## 6. Group Sold Products By The Date (LC 1484)

**🔗 LeetCode Link:** [Group Sold Products By The Date - LeetCode #1484](https://leetcode.com/problems/group-sold-products-by-the-date/)

### 📊 Schema First (Active Analysis)

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Activities (
    sell_date DATE,
    product VARCHAR(20)
);

-- Sample Data
INSERT INTO Activities VALUES
('2020-05-30', 'Headphone'),
('2020-06-01', 'Pencil'),
('2020-06-02', 'Mask'),
('2020-05-30', 'Basketball'),
('2020-06-01', 'Bible'),
('2020-06-02', 'Mask'),
('2020-05-30', 'T-Shirt');
```
</details>

### Solutions

```sql
-- Group products sold by date with count and concatenated list
SELECT 
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    GROUP_CONCAT(DISTINCT product ORDER BY product ASC SEPARATOR ',') AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;
```

**Key Concepts:**
- `GROUP_CONCAT()` to concatenate strings (MySQL)
- `DISTINCT` to avoid duplicate products
- `ORDER BY` within GROUP_CONCAT for sorted output
- `SEPARATOR` to specify delimiter

**Platform Alternatives:**
```sql
-- PostgreSQL
SELECT 
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    STRING_AGG(DISTINCT product, ',' ORDER BY product) AS products
FROM Activities
GROUP BY sell_date
ORDER BY sell_date;

-- SQL Server
SELECT 
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    STRING_AGG(product, ',') WITHIN GROUP (ORDER BY product) AS products
FROM (SELECT DISTINCT sell_date, product FROM Activities) t
GROUP BY sell_date
ORDER BY sell_date;
```

---

## 📚 Key Concepts Summary

### String Functions Mastered
- **UPPER()/LOWER()** - Case conversion
- **LEFT()/RIGHT()** - Extract characters from ends
- **SUBSTRING()** - Extract characters from specific positions
- **CONCAT()** - Combine strings
- **LENGTH()/LEN()** - String length
- **REGEXP/RLIKE** - Pattern matching with regular expressions
- **LIKE** - Simple pattern matching with wildcards
- **GROUP_CONCAT()** - Aggregate strings into delimited list

### Date Functions Covered
- **NOW()/CURRENT_DATE** - Current date/time
- **DATE_ADD()/DATE_SUB()** - Date arithmetic
- **DATEDIFF()** - Calculate difference between dates
- **DATE_FORMAT()** - Format dates for display
- **EXTRACT()** - Extract parts of dates (year, month, day)

### Regular Expression Patterns
- **^** - Start of string
- **$** - End of string
- **[a-zA-Z]** - Character classes
- **\\.** - Escaped literal characters
- **\\b** - Word boundaries
- **\*** - Zero or more repetitions
- **+** - One or more repetitions

### Common Text Processing Patterns
1. **Email Validation**: Complex regex patterns for format validation
2. **Name Formatting**: Case conversion and proper capitalization
3. **Code Matching**: Finding specific patterns within text fields
4. **Data Cleaning**: Removing duplicates and standardizing formats
5. **String Aggregation**: Combining multiple values into single field

### Platform Differences
- **MySQL**: REGEXP, GROUP_CONCAT
- **PostgreSQL**: ~, STRING_AGG, INITCAP
- **SQL Server**: LIKE patterns, STRING_AGG with WITHIN GROUP
- **Oracle**: REGEXP_LIKE, LISTAGG, INITCAP

### Performance Considerations
- String functions can be expensive on large datasets
- Regular expressions are powerful but can impact performance
- Consider creating computed columns for frequently used string manipulations
- Indexing strategies for text search (full-text indexes, computed columns)

### Next Steps
Master complex analytical queries in [Advanced SQL Guide](advanced_sql_guide.md).