---
title: "Advanced SQL - SQL 50 Study Guide"
description: "Master CTEs, CASE statements, UNION operations, and complex analytical queries through 4 essential problems"
---

# Advanced SQL - SQL 50 Study Guide 🚀

Master sophisticated analytical techniques through Common Table Expressions (CTEs), conditional logic, set operations, and complex query composition with 4 carefully selected advanced problems from LeetCode's SQL 50.

## Table of Contents
1. [Exchange Seats](#1-exchange-seats-lc-626)
2. [Movie Rating](#2-movie-rating-lc-1341)
3. [Restaurant Growth](#3-restaurant-growth-lc-1321)
4. [Friend Requests II: Who Has the Most Friends](#4-friend-requests-ii-who-has-the-most-friends-lc-602)

---

## 1. Exchange Seats (LC 626)

**🔗 LeetCode Link:** [Exchange Seats - LeetCode #626](https://leetcode.com/problems/exchange-seats/)

### 📊 Schema First (Active Analysis)
Before writing any SQL, spend 2-3 minutes analyzing the table structure:

**Schema Analysis Questions:**
1. What pattern defines the seat exchange logic?
2. How do you handle odd vs even positioned seats?
3. What happens to the last seat if total count is odd?

*Take time to understand the data model before continuing...*

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Seat (
    id INT PRIMARY KEY,
    student VARCHAR(255)
);

-- Sample Data
INSERT INTO Seat VALUES
(1, 'Abbot'),
(2, 'Doris'),
(3, 'Emerson'),
(4, 'Green'),
(5, 'Jeames');
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Understanding Exchange Pattern
> **Guided Question:** What's the pattern for swapping adjacent seats?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Exchange pattern:
- Seat 1 ↔ Seat 2 (odd id=1 gets even student, even id=2 gets odd student)
- Seat 3 ↔ Seat 4 (odd id=3 gets even student, even id=4 gets odd student)
- Seat 5 stays same if no pair (odd total count)

Logic:
- If id is odd: get student from id+1 (unless it's the last seat)
- If id is even: get student from id-1
</details>

#### Step 2: Conditional Logic Strategy
> **Guided Question:** How do you implement different logic for odd/even seats?

<details>
<summary>💭 Think about it, then click to reveal</summary>

CASE statement approach:
```sql
CASE 
    WHEN id % 2 = 1 AND id < (SELECT COUNT(*) FROM Seat) 
    THEN (student from id+1)
    WHEN id % 2 = 0 
    THEN (student from id-1)
    ELSE (current student)  -- Last odd seat stays same
END
```

Need to handle the "getting student from different id" part.
</details>

#### Step 3: Self-Join vs Subquery Approach
> **Guided Question:** How do you get the student name from a different seat id?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Two main approaches:

**Self-Join approach:**
- Join Seat table with itself
- Match odd seats with id+1 and even seats with id-1

**Subquery approach:**
- Use subqueries within CASE statement to fetch student names
- More readable but potentially less performant

**Window function approach:**
- Use LAG/LEAD to access adjacent rows
- Clean and modern solution
</details>

### Solutions

#### Approach 1: CASE Statement with Subqueries
```sql
-- Exchange adjacent seats using conditional logic
SELECT 
    id,
    CASE 
        WHEN id % 2 = 1 AND id < (SELECT COUNT(*) FROM Seat) 
        THEN (SELECT student FROM Seat WHERE id = s.id + 1)
        WHEN id % 2 = 0 
        THEN (SELECT student FROM Seat WHERE id = s.id - 1)
        ELSE student
    END AS student
FROM Seat s
ORDER BY id;
```

**Explanation:**
- `id % 2 = 1` identifies odd-numbered seats
- `id < (SELECT COUNT(*) FROM Seat)` ensures odd seat has a pair
- Subqueries fetch student names from adjacent seats
- `ELSE student` handles the last odd seat (no exchange)

#### Approach 2: Self-Join Approach
```sql
-- Alternative using self-join for seat exchanges
SELECT 
    s1.id,
    CASE 
        WHEN s1.id % 2 = 1 AND s2.id IS NOT NULL THEN s2.student
        WHEN s1.id % 2 = 0 THEN s3.student
        ELSE s1.student
    END AS student
FROM Seat s1
LEFT JOIN Seat s2 ON s1.id + 1 = s2.id  -- Next seat for odd ids
LEFT JOIN Seat s3 ON s1.id - 1 = s3.id  -- Previous seat for even ids
ORDER BY s1.id;
```

#### Approach 3: Window Functions (Modern SQL)
```sql
-- Using LAG and LEAD window functions
WITH SeatExchange AS (
    SELECT 
        id,
        student,
        LAG(student) OVER (ORDER BY id) AS prev_student,
        LEAD(student) OVER (ORDER BY id) AS next_student,
        COUNT(*) OVER () AS total_seats
    FROM Seat
)
SELECT 
    id,
    CASE 
        WHEN id % 2 = 1 AND id < total_seats THEN next_student
        WHEN id % 2 = 0 THEN prev_student
        ELSE student
    END AS student
FROM SeatExchange
ORDER BY id;
```

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
Try writing the query from memory:

**Step-by-step checklist:**
- [ ] Identify odd vs even seat logic using modulo operator
- [ ] Handle the last odd seat special case
- [ ] Use CASE statement for conditional student assignment
- [ ] Choose appropriate method (subquery/join/window) for getting adjacent students
- [ ] Test with both even and odd total seat counts

#### Schema Variations
Practice adapting your solution:
- What if seat IDs aren't consecutive (gaps in sequence)?
- How would you handle exchanging seats in groups of 3?
- What if you needed to rotate seats instead of simple pairwise exchange?

#### Reflection Questions
After solving, think about:

1. **Conditional Logic:** How does CASE statement complexity affect readability?
2. **Performance:** Which approach (subquery vs join vs window) performs best?
3. **Edge Cases:** How do you ensure the solution handles boundary conditions?
4. **Scalability:** How would this solution perform with millions of seats?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Using CASE statements for complex conditional logic: ___/5
- [ ] Handling edge cases in data manipulation: ___/5
- [ ] Choosing between different SQL approaches: ___/5
- [ ] Understanding modulo arithmetic in SQL: ___/5

---

## 2. Movie Rating (LC 1341)

**🔗 LeetCode Link:** [Movie Rating - LeetCode #1341](https://leetcode.com/problems/movie-rating/)

### 📊 Schema First (Active Analysis)

**Schema Analysis Questions:**
1. What constitutes the "most active" user and "highest-rated" movie?
2. How do you handle ties in both categories?
3. What's the relationship between users, movies, and ratings?

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(30)
);

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE MovieRating (
    movie_id INT,
    user_id INT,
    rating INT,
    created_at DATE,
    PRIMARY KEY (movie_id, user_id)
);

-- Sample Data
INSERT INTO Movies VALUES
(1, 'Avengers'), (2, 'Frozen 2'), (3, 'Joker');

INSERT INTO Users VALUES
(1, 'Daniel'), (2, 'Monica'), (3, 'Maria'), (4, 'James');

INSERT INTO MovieRating VALUES
(1, 1, 3, '2020-01-12'),
(1, 2, 4, '2020-02-11'),
(1, 3, 2, '2020-02-12'),
(2, 1, 5, '2020-02-17'),
(2, 2, 2, '2020-02-01'),
(3, 1, 3, '2020-02-22'),
(3, 2, 4, '2020-02-25');
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Understanding the Two-Part Problem
> **Guided Question:** What are the two separate analyses needed for this problem?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Two distinct queries needed:
1. **Most Active User**: User who has rated the most movies
2. **Highest Average Rating**: Movie with the highest average rating in February 2020

Need to combine these results using UNION, with proper tie-breaking rules.
</details>

#### Step 2: Most Active User Logic
> **Guided Question:** How do you find the user who rated the most movies?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Most active user analysis:
- COUNT ratings per user
- ORDER BY count DESC, then by name ASC (tie-breaker)
- LIMIT 1 to get the top result
- JOIN with Users table to get user name

```sql
SELECT u.name
FROM MovieRating mr
JOIN Users u ON mr.user_id = u.user_id
GROUP BY mr.user_id, u.name
ORDER BY COUNT(*) DESC, u.name ASC
LIMIT 1
```
</details>

#### Step 3: Highest Rated Movie Logic
> **Guided Question:** How do you find the movie with highest average rating in February 2020?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Highest rated movie analysis:
- Filter to February 2020 ratings
- Calculate AVG(rating) per movie
- ORDER BY average DESC, then by title ASC (tie-breaker)
- LIMIT 1 to get the top result
- JOIN with Movies table to get movie title

```sql
SELECT m.title
FROM MovieRating mr
JOIN Movies m ON mr.movie_id = m.movie_id
WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
GROUP BY mr.movie_id, m.title
ORDER BY AVG(mr.rating) DESC, m.title ASC
LIMIT 1
```
</details>

#### Step 4: Combining Results with UNION
> **Guided Question:** How do you combine two different result sets into a single output?

<details>
<summary>💭 Think about it, then click to reveal</summary>

UNION combination:
- Both queries must return same number of columns with compatible types
- Use UNION ALL since we want both results (no deduplication needed)
- Results will be stacked vertically
- First result = most active user, second result = highest-rated movie

```sql
(Query for most active user)
UNION ALL
(Query for highest-rated movie)
```
</details>

### Solutions

#### Approach 1: UNION of Two Separate Analyses
```sql
-- Find most active user and highest-rated movie in February 2020
(
    SELECT u.name AS results
    FROM MovieRating mr
    JOIN Users u ON mr.user_id = u.user_id
    GROUP BY mr.user_id, u.name
    ORDER BY COUNT(*) DESC, u.name ASC
    LIMIT 1
)
UNION ALL
(
    SELECT m.title AS results
    FROM MovieRating mr
    JOIN Movies m ON mr.movie_id = m.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY mr.movie_id, m.title
    ORDER BY AVG(mr.rating) DESC, m.title ASC
    LIMIT 1
);
```

**Explanation:**
- First query finds user with most ratings, tie-broken alphabetically
- Second query finds movie with highest average rating in Feb 2020
- UNION ALL combines results into single column named "results"
- Each subquery uses proper JOINs to get names/titles
- ORDER BY and LIMIT within parentheses for each part

#### Approach 2: Using CTEs for Clarity
```sql
-- More readable version using CTEs
WITH MostActiveUser AS (
    SELECT u.name AS results
    FROM MovieRating mr
    JOIN Users u ON mr.user_id = u.user_id
    GROUP BY mr.user_id, u.name
    ORDER BY COUNT(*) DESC, u.name ASC
    LIMIT 1
),
HighestRatedMovie AS (
    SELECT m.title AS results
    FROM MovieRating mr
    JOIN Movies m ON mr.movie_id = m.movie_id
    WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
    GROUP BY mr.movie_id, m.title
    ORDER BY AVG(mr.rating) DESC, m.title ASC
    LIMIT 1
)
SELECT results FROM MostActiveUser
UNION ALL
SELECT results FROM HighestRatedMovie;
```

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
**Step-by-step checklist:**
- [ ] Write query to find most active user with proper tie-breaking
- [ ] Write query to find highest-rated movie in specific time period
- [ ] Combine both queries using UNION ALL
- [ ] Ensure proper JOINs to get names/titles instead of IDs
- [ ] Test tie-breaking logic with sample data

---

## 3. Restaurant Growth (LC 1321)

**🔗 LeetCode Link:** [Restaurant Growth - LeetCode #1321](https://leetcode.com/problems/restaurant-growth/)

### 📊 Schema First (Active Analysis)

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE Customer (
    customer_id INT,
    name VARCHAR(20),
    visited_on DATE,
    amount INT,
    PRIMARY KEY (customer_id, visited_on)
);

-- Sample Data
INSERT INTO Customer VALUES
(1, 'Jhon', '2019-01-01', 100),
(2, 'Daniel', '2019-01-02', 110),
(3, 'Jade', '2019-01-03', 120),
(4, 'Khaled', '2019-01-04', 130),
(5, 'Winston', '2019-01-05', 110),
(6, 'Elvis', '2019-01-06', 140),
(7, 'Anna', '2019-01-07', 150);
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Understanding Moving Average Window
> **Guided Question:** What constitutes a "7-day moving average" for restaurant revenue?

<details>
<summary>💭 Think about it, then click to reveal</summary>

7-day moving average requirements:
- For each date, calculate sum of amounts for that date and previous 6 days
- Calculate average by dividing by 7
- Only include dates that have at least 6 previous days of data
- Window: current day + 6 preceding days = 7 total days
</details>

#### Step 2: Window Function Strategy
> **Guided Question:** How do window functions help calculate moving averages?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Window function approach:
```sql
SUM(amount) OVER (
    ORDER BY visited_on 
    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
) AS total_amount
```

This creates a sliding window that:
- Orders by date
- Includes current row and 6 preceding rows
- Calculates running sum for each 7-day period
</details>

### Solutions

#### Approach 1: Window Functions with Frame Specification
```sql
-- Calculate 7-day moving average for restaurant revenue
WITH DailyTotals AS (
    SELECT 
        visited_on,
        SUM(amount) AS daily_amount
    FROM Customer
    GROUP BY visited_on
),
MovingAverages AS (
    SELECT 
        visited_on,
        SUM(daily_amount) OVER (
            ORDER BY visited_on 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount,
        ROUND(
            AVG(daily_amount) OVER (
                ORDER BY visited_on 
                ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
            ), 2
        ) AS average_amount,
        ROW_NUMBER() OVER (ORDER BY visited_on) AS day_number
    FROM DailyTotals
)
SELECT visited_on, amount, average_amount
FROM MovingAverages
WHERE day_number >= 7
ORDER BY visited_on;
```

**Explanation:**
- First CTE aggregates daily totals (handles multiple customers per day)
- Second CTE calculates 7-day moving sums and averages
- `ROWS BETWEEN 6 PRECEDING AND CURRENT ROW` defines the 7-day window
- Filter `day_number >= 7` ensures we only show complete 7-day periods
- `ROUND(..., 2)` formats average to 2 decimal places

#### Approach 2: Self-Join Approach (Alternative)
```sql
-- Alternative using self-join for moving average
WITH DailyTotals AS (
    SELECT visited_on, SUM(amount) AS daily_amount
    FROM Customer
    GROUP BY visited_on
)
SELECT 
    d1.visited_on,
    SUM(d2.daily_amount) AS amount,
    ROUND(AVG(d2.daily_amount), 2) AS average_amount
FROM DailyTotals d1
JOIN DailyTotals d2 
    ON d2.visited_on BETWEEN DATE_SUB(d1.visited_on, INTERVAL 6 DAY) 
                          AND d1.visited_on
GROUP BY d1.visited_on
HAVING COUNT(*) = 7  -- Ensure exactly 7 days in the window
ORDER BY d1.visited_on;
```

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
**Step-by-step checklist:**
- [ ] Group data by date to handle multiple customers per day
- [ ] Use window function with proper frame specification
- [ ] Calculate both sum and average for 7-day periods
- [ ] Filter to only include complete 7-day windows
- [ ] Format average to appropriate decimal places

---

## 4. Friend Requests II: Who Has the Most Friends (LC 602)

**🔗 LeetCode Link:** [Friend Requests II: Who Has the Most Friends - LeetCode #602](https://leetcode.com/problems/friend-requests-ii-who-has-the-most-friends/)

### 📊 Schema First (Active Analysis)

<details>
<summary>💭 Click to see schema</summary>

**Table Structure:**
```sql
CREATE TABLE RequestAccepted (
    requester_id INT,
    accepter_id INT,
    accept_date DATE,
    PRIMARY KEY (requester_id, accepter_id)
);

-- Sample Data
INSERT INTO RequestAccepted VALUES
(1, 2, '2016-06-03'),
(1, 3, '2016-06-08'),
(2, 3, '2016-06-08'),
(3, 4, '2016-06-09');
```
</details>

### 💡 Query Construction (Guided Learning)

#### Step 1: Understanding Bidirectional Friendships
> **Guided Question:** How do accepted friend requests create bidirectional relationships?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Friendship relationship:
- Each accepted request creates a bidirectional friendship
- If person A requests and person B accepts, both A and B are friends of each other
- Need to count each person's total friends (as requester + as accepter)
- Example: (1,2) accepted means person 1 has person 2 as friend, and person 2 has person 1 as friend
</details>

#### Step 2: UNION Strategy for Counting
> **Guided Question:** How do you count friends from both requester and accepter perspectives?

<details>
<summary>💭 Think about it, then click to reveal</summary>

UNION approach:
1. Count friends where person is the requester
2. Count friends where person is the accepter  
3. UNION ALL to combine both counts
4. GROUP BY person to get total friend count
5. Find the person with maximum count

```sql
SELECT requester_id as person_id FROM RequestAccepted
UNION ALL
SELECT accepter_id as person_id FROM RequestAccepted
```
</details>

### Solutions

#### Approach 1: UNION ALL with Aggregation
```sql
-- Find person with most friends from accepted requests
WITH AllFriendships AS (
    SELECT requester_id AS person_id
    FROM RequestAccepted
    UNION ALL
    SELECT accepter_id AS person_id
    FROM RequestAccepted
)
SELECT 
    person_id AS id,
    COUNT(*) AS num
FROM AllFriendships
GROUP BY person_id
ORDER BY COUNT(*) DESC
LIMIT 1;
```

**Explanation:**
- UNION ALL combines all friendship connections (both directions)
- Each accepted request contributes 2 rows: one for requester, one for accepter
- GROUP BY person_id counts total friendships per person
- ORDER BY COUNT(*) DESC finds person with most friends
- LIMIT 1 returns the top result

#### Approach 2: Separate Counts with Addition
```sql
-- Alternative approach calculating requester and accepter counts separately
WITH FriendCounts AS (
    SELECT 
        person_id,
        COALESCE(requester_count, 0) + COALESCE(accepter_count, 0) AS num
    FROM (
        SELECT requester_id AS person_id FROM RequestAccepted
        UNION
        SELECT accepter_id AS person_id FROM RequestAccepted
    ) all_people
    LEFT JOIN (
        SELECT requester_id, COUNT(*) AS requester_count
        FROM RequestAccepted
        GROUP BY requester_id
    ) req_counts ON all_people.person_id = req_counts.requester_id
    LEFT JOIN (
        SELECT accepter_id, COUNT(*) AS accepter_count
        FROM RequestAccepted
        GROUP BY accepter_id
    ) acc_counts ON all_people.person_id = acc_counts.accepter_id
)
SELECT person_id AS id, num
FROM FriendCounts
ORDER BY num DESC
LIMIT 1;
```

### 🎯 Query Practice & Self-Assessment

#### Implementation Challenge
**Step-by-step checklist:**
- [ ] Understand bidirectional nature of friendships
- [ ] Use UNION ALL to count from both perspectives
- [ ] GROUP BY to aggregate friendship counts per person
- [ ] ORDER BY and LIMIT to find person with most friends
- [ ] Test with sample data to verify counting logic

---

## 📚 Key Concepts Summary

### Advanced SQL Techniques Mastered
- **Common Table Expressions (CTEs)** - WITH clauses for readable complex queries
- **CASE Statements** - Complex conditional logic and data transformation
- **UNION/UNION ALL** - Combining result sets from multiple queries
- **Window Functions with Frames** - Advanced analytical calculations
- **Self-Joins** - Joining tables with themselves for complex relationships
- **Subqueries in SELECT** - Nested queries for dynamic value lookup

### Complex Query Patterns
1. **Conditional Data Transformation**: Using CASE for complex business logic
2. **Multi-Part Analysis**: UNION to combine different analytical perspectives
3. **Moving Calculations**: Window functions with frame specifications
4. **Bidirectional Relationships**: Handling symmetric data relationships
5. **Tie-Breaking Logic**: ORDER BY with multiple criteria for deterministic results

### Performance Optimization Techniques
- **CTEs vs Subqueries**: When to use each for readability and performance
- **Window Functions vs Self-Joins**: Modern analytical approach vs traditional methods
- **UNION vs UNION ALL**: Understanding when deduplication is needed
- **Indexing Strategy**: Supporting complex queries with appropriate indexes

### Advanced Analytical Concepts
- **Moving Averages**: Time-series analysis with sliding windows
- **Ranking with Ties**: Handling tie-breaking in competitive scenarios  
- **Graph Relationships**: Modeling and querying network-like data
- **Conditional Aggregation**: Computing different metrics based on conditions

### Real-World Applications
1. **Business Intelligence**: Moving averages for trend analysis
2. **Social Networks**: Friend relationship analysis and recommendations
3. **Customer Analytics**: User activity patterns and segmentation
4. **Operational Reporting**: Complex KPI calculations and dashboards

### Best Practices for Complex Queries
- **Readability**: Use CTEs to break down complex logic
- **Testing**: Validate each component separately before combining
- **Documentation**: Comment complex business logic within queries
- **Performance**: Monitor execution plans for optimization opportunities
- **Maintainability**: Structure queries for easy modification and extension

### Database-Specific Considerations
- **MySQL**: LIMIT syntax, specific string functions
- **PostgreSQL**: Advanced window function features, better CTE support
- **SQL Server**: Different pagination approach, T-SQL extensions
- **Oracle**: Analytical functions, hierarchical queries

This completes the comprehensive SQL 50 study guide series, covering the full spectrum from basic queries to advanced analytical techniques. Each guide builds upon previous concepts while introducing new complexity levels appropriate for technical interview preparation.