---
render_with_liquid: false
---

# Dynamic Programming Study Guide - Blind 75 LeetCode Problems

## Table of Contents
1. [Introduction to Dynamic Programming](#introduction-to-dynamic-programming)
2. [Core Concepts and Prerequisites](#core-concepts-and-prerequisites)
3. [Problem-First Approach to DP](#problem-first-approach-to-dp)
4. [The 11 DP Problems](#the-11-dp-problems)
   - [1. Climbing Stairs](#1-climbing-stairs)
   - [2. Coin Change](#2-coin-change)
   - [3. Longest Increasing Subsequence](#3-longest-increasing-subsequence)
   - [4. Longest Common Subsequence](#4-longest-common-subsequence)
   - [5. Word Break Problem](#5-word-break-problem)
   - [6. Combination Sum](#6-combination-sum)
   - [7. House Robber](#7-house-robber)
   - [8. House Robber II](#8-house-robber-ii)
   - [9. Decode Ways](#9-decode-ways)
   - [10. Unique Paths](#10-unique-paths)
   - [11. Jump Game](#11-jump-game)
5. [Common DP Patterns Summary](#common-dp-patterns-summary)
6. [Space Optimization Techniques](#space-optimization-techniques)

---

## Introduction to Dynamic Programming

Dynamic Programming (DP) is an algorithmic technique that solves complex problems by breaking them down into simpler subproblems. It's particularly useful when the same subproblems occur multiple times in a recursive solution.

### Key Characteristics of DP Problems:
1. **Optimal Substructure**: Optimal solution can be constructed from optimal solutions of subproblems
2. **Overlapping Subproblems**: Same subproblems are solved multiple times
3. **Decision Making**: At each step, we make a choice that affects future decisions

---

## Core Concepts and Prerequisites

### 1. Recursion
Understanding recursive problem-solving is fundamental to DP. Every DP problem starts with a recursive solution.

### 2. Memoization (Top-Down DP)
- Store results of expensive function calls
- Return cached result when same inputs occur again
- Uses recursion with memory

### 3. Tabulation (Bottom-Up DP)
- Build solution iteratively from base cases
- Fill up a table/array in a bottom-up manner
- Usually more space-efficient

### 4. State Definition
- Identify what parameters uniquely define a subproblem
- These parameters become dimensions of your DP table

---

## Problem-First Approach to DP

### How to Identify DP Problems:
1. **Optimization**: Find maximum/minimum value
2. **Counting**: Count number of ways to do something
3. **Decision Making**: Yes/No questions about possibility
4. **Choices**: At each step, you have multiple choices
5. **Future depends on past**: Current decision affects future options

### Steps to Solve DP Problems:
1. **Identify the recursive structure**
2. **Define the state(s)**
3. **Write the recurrence relation**
4. **Identify base cases**
5. **Implement memoization (top-down)**
6. **Convert to tabulation (bottom-up)**
7. **Optimize space if possible**

---

## The 11 DP Problems

### 1. Climbing Stairs

**🔗 LeetCode Link:** [Climbing Stairs - LeetCode #70](https://leetcode.com/problems/climbing-stairs/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. If you're standing at step n, what are the only two ways you could have arrived there?
2. How might the number of ways to reach step n relate to the number of ways to reach previous steps?
3. What would be the base cases for very small values (like n=1 or n=2)?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Pattern Recognition
> **Guided Question:** Look at small examples: n=1 (1 way), n=2 (2 ways), n=3 (?). Can you find a pattern by thinking about how to reach step 3?

<details>
<summary>💭 Think about it, then click to reveal</summary>

To reach step 3, you can either:
- Come from step 2 by taking 1 step
- Come from step 1 by taking 2 steps

Since there are 2 ways to reach step 2 and 1 way to reach step 1, there are 2 + 1 = 3 ways to reach step 3.

This reveals the Fibonacci pattern: `ways(n) = ways(n-1) + ways(n-2)`
</details>

#### Step 2: Recurrence Relation Discovery
> **Guided Question:** Why does this recurrence relation make sense? What choice are you making at each step?

<details>
<summary>💭 Think about it, then click to reveal</summary>

At each step, you have exactly two choices:
- Take a 1-step (which means you need to count all ways to reach the previous step)
- Take a 2-step (which means you need to count all ways to reach the step before that)

The recurrence captures this decision-making process. The total ways is the sum of both choices.
</details>

#### Step 3: Implementation Strategy
> **Guided Question:** Given this recurrence relation, what's the most efficient way to compute the answer? Do you need to store all previous values?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Since each value only depends on the two previous values, you only need to store the last two results as you iterate. This gives you O(1) space complexity instead of O(n).

You can also use memoization (top-down) or tabulation (bottom-up) depending on your preference.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Handle base cases (n ≤ 1)
- [ ] Initialize first two values (ways to reach step 0 and 1)
- [ ] Use either iteration with two variables or DP array
- [ ] Apply recurrence: current = prev1 + prev2
- [ ] Return the result for step n

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Can you explain why this problem follows the Fibonacci sequence?
2. **Complexity Analysis:** What's the time and space complexity of your solution?
3. **Trade-offs:** When would you choose memoization vs tabulation vs space-optimized iteration?
4. **Pattern Recognition:** What other problems might use this same "sum of previous states" pattern?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the problem: ___/5
- [ ] Implementing brute force: ___/5  
- [ ] Implementing optimal solution: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Consider trying variations like "Climbing Stairs with k steps" or "Min Cost Climbing Stairs"

**Problem Statement**: You're climbing a staircase. It takes n steps to reach the top. Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

**Example**:
- Input: n = 3
- Output: 3 (1+1+1, 1+2, 2+1)

**Knowledge Prerequisites**:
- Basic recursion
- Understanding of Fibonacci sequence
- Memoization concepts

**First Principles**:
To reach step n, you can come from:
- Step (n-1) by taking 1 step
- Step (n-2) by taking 2 steps

This gives us: `ways(n) = ways(n-1) + ways(n-2)`

**Problem-First Approach**:
1. **Identify pattern**: At each step, we have 2 choices (1 or 2 steps)
2. **State definition**: `dp[i]` = number of ways to reach step i
3. **Recurrence**: `dp[i] = dp[i-1] + dp[i-2]`
4. **Base cases**: `dp[0] = 1`, `dp[1] = 1`

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: Recursive with Memoization (Top-Down)
class ClimbingStairs {
    public int climbStairs(int n) {
        int[] memo = new int[n + 1];
        return helper(n, memo);
    }
    
    private int helper(int n, int[] memo) {
        // Base cases
        if (n <= 1) return 1;
        
        // Check memo
        if (memo[n] != 0) return memo[n];
        
        // Recurrence relation
        memo[n] = helper(n - 1, memo) + helper(n - 2, memo);
        return memo[n];
    }
}

// Approach 2: Iterative Bottom-Up (Tabulation)
class ClimbingStairs {
    public int climbStairs(int n) {
        if (n <= 1) return 1;
        
        int[] dp = new int[n + 1];
        dp[0] = 1;
        dp[1] = 1;
        
        for (int i = 2; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        
        return dp[n];
    }
}

// Approach 3: Space Optimized
class ClimbingStairs {
    public int climbStairs(int n) {
        if (n <= 1) return 1;
        
        int prev2 = 1, prev1 = 1;
        
        for (int i = 2; i <= n; i++) {
            int current = prev1 + prev2;
            prev2 = prev1;
            prev1 = current;
        }
        
        return prev1;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: Recursive with Memoization (Top-Down)
class ClimbingStairs:
    def climbStairs(self, n: int) -> int:
        memo = {}
        return self.helper(n, memo)
    
    def helper(self, n: int, memo: dict) -> int:
        # Base cases
        if n <= 1:
            return 1
        
        # Check memo
        if n in memo:
            return memo[n]
        
        # Recurrence relation
        memo[n] = self.helper(n - 1, memo) + self.helper(n - 2, memo)
        return memo[n]

# Approach 2: Iterative Bottom-Up (Tabulation)
class ClimbingStairs:
    def climbStairs(self, n: int) -> int:
        if n <= 1:
            return 1
        
        dp = [0] * (n + 1)
        dp[0] = 1
        dp[1] = 1
        
        for i in range(2, n + 1):
            dp[i] = dp[i - 1] + dp[i - 2]
        
        return dp[n]

# Approach 3: Space Optimized
class ClimbingStairs:
    def climbStairs(self, n: int) -> int:
        if n <= 1:
            return 1
        
        prev2, prev1 = 1, 1
        
        for i in range(2, n + 1):
            current = prev1 + prev2
            prev2 = prev1
            prev1 = current
        
        return prev1
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: Recursive with Memoization (Top-Down)
class ClimbingStairs {
    climbStairs(n) {
        const memo = new Map();
        return this.helper(n, memo);
    }
    
    helper(n, memo) {
        // Base cases
        if (n <= 1) return 1;
        
        // Check memo
        if (memo.has(n)) return memo.get(n);
        
        // Recurrence relation
        const result = this.helper(n - 1, memo) + this.helper(n - 2, memo);
        memo.set(n, result);
        return result;
    }
}

// Approach 2: Iterative Bottom-Up (Tabulation)
class ClimbingStairs {
    climbStairs(n) {
        if (n <= 1) return 1;
        
        const dp = new Array(n + 1);
        dp[0] = 1;
        dp[1] = 1;
        
        for (let i = 2; i <= n; i++) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        
        return dp[n];
    }
}

// Approach 3: Space Optimized
class ClimbingStairs {
    climbStairs(n) {
        if (n <= 1) return 1;
        
        let prev2 = 1, prev1 = 1;
        
        for (let i = 2; i <= n; i++) {
            const current = prev1 + prev2;
            prev2 = prev1;
            prev1 = current;
        }
        
        return prev1;
    }
}
```
  </div>
</div>

<p><strong>Complexity Analysis</strong>:</p>
<ul>
<li><strong>Memoization</strong>: Time O(n), Space O(n)</li>
<li><strong>Tabulation</strong>: Time O(n), Space O(n)</li>
<li><strong>Space Optimized</strong>: Time O(n), Space O(1)</li>
</ul>

**Key Insights & Patterns**:
- This is the classic Fibonacci pattern
- Applicable to problems where answer depends on previous few states
- Foundation for more complex step-based problems

**State Transition Explanation**:
```
dp[i] = dp[i-1] + dp[i-2]
```
The number of ways to reach step i equals the sum of ways to reach the two previous steps.

---

### 2. Coin Change

**🔗 LeetCode Link:** [Coin Change - LeetCode #322](https://leetcode.com/problems/coin-change/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. Why might a greedy approach (always choosing the largest coin) fail for this problem?
2. If you want to make amount X, what coin choices give you subproblems you might have already solved?
3. What should you return if it's impossible to make the exact amount?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding the Optimization Problem
> **Guided Question:** What makes this different from simply counting ways? Why can't you just use any coin combination?

<details>
<summary>💭 Think about it, then click to reveal</summary>

This is an optimization problem - you want the **minimum** number of coins, not just any valid combination. This means at each step, you need to consider all possible coin choices and pick the one that leads to the optimal solution.

The key insight: for amount X, you need to try using each coin denomination and see which choice leads to the minimum total coins.
</details>

#### Step 2: Recurrence Relation Discovery
> **Guided Question:** If you use a coin of value C to make amount X, what's the remaining subproblem? How does this help you build a recurrence?

<details>
<summary>💭 Think about it, then click to reveal</summary>

If you use coin C for amount X, you need the minimum coins for amount (X - C), plus 1 for the coin you just used.

Recurrence: `dp[amount] = min(dp[amount - coin] + 1)` for all valid coins

The "min" operation is crucial - you're exploring all coin choices and taking the best one.
</details>

#### Step 3: Handling Edge Cases and Implementation
> **Guided Question:** What should your base case be? How do you handle impossible amounts? How do you ensure you don't use a coin larger than the current amount?

<details>
<summary>💭 Think about it, then click to reveal</summary>

- Base case: `dp[0] = 0` (zero coins needed for amount 0)
- For impossible amounts: Initialize with a value larger than any possible answer (like amount + 1)
- Constraint check: Only use coin if `coin <= current_amount`
- Final check: If result > amount, return -1 (impossible)

This is an "unbounded knapsack" problem - you can use each coin multiple times.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Initialize DP array with impossible values (amount + 1)
- [ ] Set base case: dp[0] = 0
- [ ] For each amount from 1 to target, try all coins
- [ ] Only use coin if coin <= current amount
- [ ] Take minimum: dp[amount] = min(dp[amount], dp[amount - coin] + 1)
- [ ] Return dp[amount] > amount ? -1 : dp[amount]

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does greedy approach fail? Can you give a counter-example?
2. **Complexity Analysis:** What's the time complexity in terms of amount and number of coins?
3. **Trade-offs:** When would you use top-down vs bottom-up approach?
4. **Pattern Recognition:** How is this similar to unbounded knapsack problems?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the problem: ___/5
- [ ] Implementing brute force: ___/5  
- [ ] Implementing optimal solution: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Consider trying "Coin Change 2" (counting combinations) to deepen understanding

**Problem Statement**: Given coins of certain denominations and a total amount, find the minimum number of coins needed to make up that amount. Return -1 if impossible.

**Example**:
- Input: coins = [1,3,4], amount = 6
- Output: 2 (3+3)

**Knowledge Prerequisites**:
- Understanding of optimization problems
- Greedy vs optimal approach awareness
- Infinite supply concept

**First Principles**:
For each amount, try using each coin and take the minimum:
`dp[amount] = min(dp[amount - coin] + 1)` for all valid coins

**Problem-First Approach**:
1. **Identify pattern**: Optimization problem with choices
2. **State definition**: `dp[i]` = minimum coins needed for amount i
3. **Recurrence**: `dp[i] = min(dp[i], dp[i - coin] + 1)` for each coin
4. **Base case**: `dp[0] = 0`

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: Recursive with Memoization (Top-Down)
class CoinChange {
    public int coinChange(int[] coins, int amount) {
        int[] memo = new int[amount + 1];
        Arrays.fill(memo, -1);
        
        int result = helper(coins, amount, memo);
        return result == Integer.MAX_VALUE ? -1 : result;
    }
    
    private int helper(int[] coins, int amount, int[] memo) {
        // Base cases
        if (amount == 0) return 0;
        if (amount < 0) return Integer.MAX_VALUE;
        
        // Check memo
        if (memo[amount] != -1) return memo[amount];
        
        int minCoins = Integer.MAX_VALUE;
        
        // Try each coin
        for (int coin : coins) {
            int subResult = helper(coins, amount - coin, memo);
            if (subResult != Integer.MAX_VALUE) {
                minCoins = Math.min(minCoins, subResult + 1);
            }
        }
        
        memo[amount] = minCoins;
        return minCoins;
    }
}

// Approach 2: Iterative Bottom-Up (Tabulation)
class CoinChange {
    public int coinChange(int[] coins, int amount) {
        int[] dp = new int[amount + 1];
        Arrays.fill(dp, amount + 1); // Initialize with impossible value
        dp[0] = 0;
        
        for (int i = 1; i <= amount; i++) {
            for (int coin : coins) {
                if (coin <= i) {
                    dp[i] = Math.min(dp[i], dp[i - coin] + 1);
                }
            }
        }
        
        return dp[amount] > amount ? -1 : dp[amount];
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: Recursive with Memoization (Top-Down)
class CoinChange:
    def coinChange(self, coins, amount):
        memo = {}
        
        def helper(amount):
            # Base cases
            if amount == 0:
                return 0
            if amount < 0:
                return float('inf')
            
            # Check memo
            if amount in memo:
                return memo[amount]
            
            min_coins = float('inf')
            
            # Try each coin
            for coin in coins:
                sub_result = helper(amount - coin)
                if sub_result != float('inf'):
                    min_coins = min(min_coins, sub_result + 1)
            
            memo[amount] = min_coins
            return min_coins
        
        result = helper(amount)
        return result if result != float('inf') else -1

# Approach 2: Iterative Bottom-Up (Tabulation)
class CoinChange:
    def coinChange(self, coins, amount):
        dp = [amount + 1] * (amount + 1)  # Initialize with impossible value
        dp[0] = 0
        
        for i in range(1, amount + 1):
            for coin in coins:
                if coin <= i:
                    dp[i] = min(dp[i], dp[i - coin] + 1)
        
        return dp[amount] if dp[amount] <= amount else -1
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: Recursive with Memoization (Top-Down)
class CoinChange {
    coinChange(coins, amount) {
        const memo = new Map();
        
        const helper = (amount) => {
            // Base cases
            if (amount === 0) return 0;
            if (amount < 0) return Infinity;
            
            // Check memo
            if (memo.has(amount)) return memo.get(amount);
            
            let minCoins = Infinity;
            
            // Try each coin
            for (const coin of coins) {
                const subResult = helper(amount - coin);
                if (subResult !== Infinity) {
                    minCoins = Math.min(minCoins, subResult + 1);
                }
            }
            
            memo.set(amount, minCoins);
            return minCoins;
        };
        
        const result = helper(amount);
        return result === Infinity ? -1 : result;
    }
}

// Approach 2: Iterative Bottom-Up (Tabulation)
class CoinChange {
    coinChange(coins, amount) {
        const dp = new Array(amount + 1).fill(amount + 1); // Initialize with impossible value
        dp[0] = 0;
        
        for (let i = 1; i <= amount; i++) {
            for (const coin of coins) {
                if (coin <= i) {
                    dp[i] = Math.min(dp[i], dp[i - coin] + 1);
                }
            }
        }
        
        return dp[amount] > amount ? -1 : dp[amount];
    }
}
```
  </div>
</div>

<p><strong>Complexity Analysis</strong>:</p>
<ul>
<li><strong>Time</strong>: O(amount × coins.length)</li>
<li><strong>Space</strong>: O(amount)</li>
</ul>

**Key Insights & Patterns**:
- Classic "unbounded knapsack" variant
- Greedy approach doesn't always work
- Pattern applicable to resource optimization problems

**State Transition Explanation**:
```
dp[i] = min(dp[i], dp[i - coin] + 1) for each coin where coin <= i
```
For amount i, try using each coin and take the minimum cost.

---

### 3. Longest Increasing Subsequence

**🔗 LeetCode Link:** [Longest Increasing Subsequence - LeetCode #300](https://leetcode.com/problems/longest-increasing-subsequence/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What's the difference between a subsequence and a subarray? Why does this matter for the problem?
2. For each element in the array, what decision do you need to make regarding the longest increasing subsequence?
3. If you know the LIS ending at each previous position, how can you determine the LIS ending at the current position?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding Subsequences vs Subarrays
> **Guided Question:** Given array [10,9,2,5,3,7,101,18], what's a valid increasing subsequence? Does it need to be contiguous?

<details>
<summary>💭 Think about it, then click to reveal</summary>

A subsequence maintains relative order but doesn't need to be contiguous. For example:
- [2,5,7,101] is valid (indices 2,3,5,6)
- [10,101] is valid (indices 0,6)
- [9,2,5] is invalid (not increasing)

This means for each element, you can either include it in your LIS or skip it, but you must maintain the relative order from the original array.
</details>

#### Step 2: State Definition and Recurrence
> **Guided Question:** If dp[i] represents the length of LIS ending at index i, how do you compute dp[i] using previous values?

<details>
<summary>💭 Think about it, then click to reveal</summary>

For each position i, you look at all previous positions j where nums[j] < nums[i]. You can extend any LIS ending at position j by including nums[i].

Recurrence: `dp[i] = max(dp[j] + 1)` for all j < i where nums[j] < nums[i]

Base case: `dp[i] = 1` (each element forms a subsequence of length 1 by itself)

The final answer is `max(dp[i])` across all positions.
</details>

#### Step 3: Optimization Insight
> **Guided Question:** The basic DP solution is O(n²). Can you think of a way to use binary search to improve this? What would you need to maintain?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Key insight: Maintain an array where `tails[i]` = smallest ending element of all increasing subsequences of length i+1.

For each new element:
- If it's larger than all elements in tails, append it (extend longest sequence)
- Otherwise, use binary search to find the position where it should replace an existing element

This works because replacing a larger element with a smaller one gives us better potential for future extensions, while maintaining the same length.

Time complexity: O(n log n)
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing both the O(n²) and O(n log n) solutions:

**Step-by-step checklist (O(n²) DP):**
- [ ] Initialize dp array where dp[i] = 1 for all i
- [ ] For each position i, check all previous positions j
- [ ] If nums[j] < nums[i], update dp[i] = max(dp[i], dp[j] + 1)
- [ ] Return the maximum value in dp array

**Step-by-step checklist (O(n log n) Binary Search):**
- [ ] Maintain tails array for smallest endings
- [ ] For each element, use binary search to find insertion position
- [ ] Either append (if larger than all) or replace element at found position
- [ ] Return length of tails array

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Can you explain why the tails array optimization works?
2. **Complexity Analysis:** Why is the binary search approach faster? When would you use each?
3. **Trade-offs:** What are the space requirements for each approach?
4. **Pattern Recognition:** What other subsequence problems use similar techniques?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the problem: ___/5
- [ ] Implementing brute force: ___/5  
- [ ] Implementing optimal solution: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Consider trying "Russian Doll Envelopes" or "Number of LIS" for advanced practice

**Problem Statement**: Given an integer array, return the length of the longest strictly increasing subsequence.

**Example**:
- Input: [10,9,2,5,3,7,101,18]
- Output: 4 ([2,3,7,101])

**Knowledge Prerequisites**:
- Subsequence vs subarray understanding
- Binary search (for optimized solution)
- Patience sorting concept

**First Principles**:
For each element, we can either:
1. Start a new subsequence
2. Extend an existing subsequence if current element is larger

**Problem-First Approach**:
1. **Identify pattern**: Subsequence optimization problem
2. **State definition**: `dp[i]` = length of LIS ending at index i
3. **Recurrence**: `dp[i] = max(dp[j] + 1)` for all j < i where arr[j] < arr[i]
4. **Base case**: `dp[i] = 1` for all i

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: DP Solution O(n²)
class LongestIncreasingSubsequence {
    public int lengthOfLIS(int[] nums) {
        if (nums.length == 0) return 0;
        
        int[] dp = new int[nums.length];
        Arrays.fill(dp, 1);
        int maxLength = 1;
        
        for (int i = 1; i < nums.length; i++) {
            for (int j = 0; j < i; j++) {
                if (nums[j] < nums[i]) {
                    dp[i] = Math.max(dp[i], dp[j] + 1);
                }
            }
            maxLength = Math.max(maxLength, dp[i]);
        }
        
        return maxLength;
    }
}

// Approach 2: Binary Search + DP O(n log n)
class LongestIncreasingSubsequence {
    public int lengthOfLIS(int[] nums) {
        List<Integer> tails = new ArrayList<>();
        
        for (int num : nums) {
            int pos = binarySearch(tails, num);
            
            if (pos == tails.size()) {
                tails.add(num);
            } else {
                tails.set(pos, num);
            }
        }
        
        return tails.size();
    }
    
    private int binarySearch(List<Integer> tails, int target) {
        int left = 0, right = tails.size();
        
        while (left < right) {
            int mid = left + (right - left) / 2;
            if (tails.get(mid) < target) {
                left = mid + 1;
            } else {
                right = mid;
            }
        }
        
        return left;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: DP Solution O(n²)
class LongestIncreasingSubsequence:
    def lengthOfLIS(self, nums):
        if not nums:
            return 0
        
        dp = [1] * len(nums)
        max_length = 1
        
        for i in range(1, len(nums)):
            for j in range(i):
                if nums[j] < nums[i]:
                    dp[i] = max(dp[i], dp[j] + 1)
            max_length = max(max_length, dp[i])
        
        return max_length

# Approach 2: Binary Search + DP O(n log n)
import bisect

class LongestIncreasingSubsequence:
    def lengthOfLIS(self, nums):
        tails = []
        
        for num in nums:
            pos = bisect.bisect_left(tails, num)
            
            if pos == len(tails):
                tails.append(num)
            else:
                tails[pos] = num
        
        return len(tails)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: DP Solution O(n²)
class LongestIncreasingSubsequence {
    lengthOfLIS(nums) {
        if (nums.length === 0) return 0;
        
        const dp = new Array(nums.length).fill(1);
        let maxLength = 1;
        
        for (let i = 1; i < nums.length; i++) {
            for (let j = 0; j < i; j++) {
                if (nums[j] < nums[i]) {
                    dp[i] = Math.max(dp[i], dp[j] + 1);
                }
            }
            maxLength = Math.max(maxLength, dp[i]);
        }
        
        return maxLength;
    }
}

// Approach 2: Binary Search + DP O(n log n)
class LongestIncreasingSubsequence {
    lengthOfLIS(nums) {
        const tails = [];
        
        for (const num of nums) {
            const pos = this.binarySearch(tails, num);
            
            if (pos === tails.length) {
                tails.push(num);
            } else {
                tails[pos] = num;
            }
        }
        
        return tails.length;
    }
    
    binarySearch(tails, target) {
        let left = 0, right = tails.length;
        
        while (left < right) {
            const mid = Math.floor((left + right) / 2);
            if (tails[mid] < target) {
                left = mid + 1;
            } else {
                right = mid;
            }
        }
        
        return left;
    }
}
```
  </div>
</div>

<p><strong>Complexity Analysis</strong>:</p>
<ul>
<li><strong>DP Approach</strong>: Time O(n²), Space O(n)</li>
<li><strong>Binary Search</strong>: Time O(n log n), Space O(n)</li>
</ul>
<p><strong>Key Insights &amp; Patterns</strong>:</p>
<ul>
<li>Classic subsequence optimization</li>
<li>Binary search optimization technique</li>
<li>Pattern for "longest/shortest subsequence" problems</li>
</ul>
<p><strong>State Transition Explanation</strong>:</p>
<ul>

---

### 4. Longest Common Subsequence

**🔗 LeetCode Link:** [Longest Common Subsequence - LeetCode #1143](https://leetcode.com/problems/longest-common-subsequence/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. When comparing two strings character by character, what are the possible decisions you can make at each step?
2. If characters at current positions match, how does this affect the LCS? If they don't match?
3. Why might this require a 2D DP table instead of a 1D array?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding the Decision Space
> **Guided Question:** At each position (i,j) in the two strings, what are all the possible choices you have for building the LCS?

<details>
<summary>💭 Think about it, then click to reveal</summary>

When comparing text1[i] and text2[j], you have three choices:
1. If characters match: Include this character in LCS (move diagonally)
2. Skip current character in text1 (move down in the table)
3. Skip current character in text2 (move right in the table)

The key insight: You're trying all possible ways to align the two strings to find the longest common subsequence.
</details>

#### Step 2: 2D State Definition
> **Guided Question:** Why do you need a 2D table? What does dp[i][j] represent, and how does it relate to the subproblems?

<details>
<summary>💭 Think about it, then click to reveal</summary>

`dp[i][j]` = length of LCS between first i characters of text1 and first j characters of text2.

You need 2D because the state depends on positions in BOTH strings. Each cell represents the optimal solution for a specific prefix combination.

Recurrence:
- If text1[i-1] == text2[j-1]: `dp[i][j] = dp[i-1][j-1] + 1`
- Else: `dp[i][j] = max(dp[i-1][j], dp[i][j-1])`
</details>

#### Step 3: Character Matching Strategy
> **Guided Question:** When characters match vs. don't match, why do you use different strategies? What's the intuition behind each case?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**When characters match**: You've found a character that contributes to the LCS! Include it and continue with the remaining substrings (dp[i-1][j-1] + 1).

**When characters don't match**: One of the current characters won't be in the optimal LCS. Try skipping each character and take the better option:
- Skip from text1: dp[i-1][j] 
- Skip from text2: dp[i][j-1]
- Take the maximum

This covers all possible alignments systematically.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Create 2D DP table of size (m+1) x (n+1)
- [ ] Initialize base cases: dp[0][j] = dp[i][0] = 0
- [ ] For each cell (i,j), check if characters match
- [ ] If match: dp[i][j] = dp[i-1][j-1] + 1
- [ ] If no match: dp[i][j] = max(dp[i-1][j], dp[i][j-1])
- [ ] Return dp[m][n]

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Can you trace through a small example step by step?
2. **Complexity Analysis:** Why is this O(m×n) time? Can you optimize space to O(min(m,n))?
3. **Trade-offs:** When would you use the space-optimized version vs. the full 2D table?
4. **Pattern Recognition:** How is this related to edit distance? What other string problems use similar approaches?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the problem: ___/5
- [ ] Implementing brute force: ___/5  
- [ ] Implementing optimal solution: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Consider trying "Edit Distance" or "Shortest Common Supersequence" for related practice

**Problem Statement**: Given two strings, find the length of their longest common subsequence.

**Example**:
- Input: text1 = "abcde", text2 = "ace"
- Output: 3 ("ace")

**Knowledge Prerequisites**:
- 2D DP concepts
- String manipulation
- Subsequence definition

**First Principles**:
For each character in both strings:
- If characters match: include in LCS
- If they don't match: take maximum from either excluding current character

**Problem-First Approach**:
1. **Identify pattern**: Two-sequence comparison
2. **State definition**: `dp[i][j]` = LCS length for first i chars of text1 and first j chars of text2
3. **Recurrence**: 
   - If text1[i-1] == text2[j-1]: `dp[i][j] = dp[i-1][j-1] + 1`
   - Else: `dp[i][j] = max(dp[i-1][j], dp[i][j-1])`
4. **Base case**: `dp[0][j] = dp[i][0] = 0`

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: 2D DP
class LongestCommonSubsequence {
    public int longestCommonSubsequence(String text1, String text2) {
        int m = text1.length(), n = text2.length();
        int[][] dp = new int[m + 1][n + 1];
        
        for (int i = 1; i <= m; i++) {
            for (int j = 1; j <= n; j++) {
                if (text1.charAt(i - 1) == text2.charAt(j - 1)) {
                    dp[i][j] = dp[i - 1][j - 1] + 1;
                } else {
                    dp[i][j] = Math.max(dp[i - 1][j], dp[i][j - 1]);
                }
            }
        }
        
        return dp[m][n];
    }
}

// Approach 2: Space Optimized (1D DP)
class LongestCommonSubsequence {
    public int longestCommonSubsequence(String text1, String text2) {
        int m = text1.length(), n = text2.length();
        
        // Use shorter string for space optimization
        if (m < n) {
            return longestCommonSubsequence(text2, text1);
        }
        
        int[] dp = new int[n + 1];
        
        for (int i = 1; i <= m; i++) {
            int prev = 0;
            for (int j = 1; j <= n; j++) {
                int temp = dp[j];
                if (text1.charAt(i - 1) == text2.charAt(j - 1)) {
                    dp[j] = prev + 1;
                } else {
                    dp[j] = Math.max(dp[j], dp[j - 1]);
                }
                prev = temp;
            }
        }
        
        return dp[n];
    }
}

// Approach 3: Recursive with Memoization
class LongestCommonSubsequence {
    public int longestCommonSubsequence(String text1, String text2) {
        int[][] memo = new int[text1.length()][text2.length()];
        for (int[] row : memo) {
            Arrays.fill(row, -1);
        }
        return helper(text1, text2, 0, 0, memo);
    }
    
    private int helper(String text1, String text2, int i, int j, int[][] memo) {
        if (i == text1.length() || j == text2.length()) {
            return 0;
        }
        
        if (memo[i][j] != -1) {
            return memo[i][j];
        }
        
        if (text1.charAt(i) == text2.charAt(j)) {
            memo[i][j] = 1 + helper(text1, text2, i + 1, j + 1, memo);
        } else {
            memo[i][j] = Math.max(
                helper(text1, text2, i + 1, j, memo),
                helper(text1, text2, i, j + 1, memo)
            );
        }
        
        return memo[i][j];
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: 2D DP
class LongestCommonSubsequence:
    def longestCommonSubsequence(self, text1: str, text2: str) -> int:
        m, n = len(text1), len(text2)
        dp = [[0] * (n + 1) for _ in range(m + 1)]
        
        for i in range(1, m + 1):
            for j in range(1, n + 1):
                if text1[i - 1] == text2[j - 1]:
                    dp[i][j] = dp[i - 1][j - 1] + 1
                else:
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
        
        return dp[m][n]

# Approach 2: Space Optimized (1D DP)
class LongestCommonSubsequence:
    def longestCommonSubsequence(self, text1: str, text2: str) -> int:
        m, n = len(text1), len(text2)
        
        # Use shorter string for space optimization
        if m < n:
            return self.longestCommonSubsequence(text2, text1)
        
        dp = [0] * (n + 1)
        
        for i in range(1, m + 1):
            prev = 0
            for j in range(1, n + 1):
                temp = dp[j]
                if text1[i - 1] == text2[j - 1]:
                    dp[j] = prev + 1
                else:
                    dp[j] = max(dp[j], dp[j - 1])
                prev = temp
        
        return dp[n]

# Approach 3: Recursive with Memoization
class LongestCommonSubsequence:
    def longestCommonSubsequence(self, text1: str, text2: str) -> int:
        memo = {}
        
        def helper(i, j):
            if i == len(text1) or j == len(text2):
                return 0
            
            if (i, j) in memo:
                return memo[(i, j)]
            
            if text1[i] == text2[j]:
                memo[(i, j)] = 1 + helper(i + 1, j + 1)
            else:
                memo[(i, j)] = max(helper(i + 1, j), helper(i, j + 1))
            
            return memo[(i, j)]
        
        return helper(0, 0)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: 2D DP
class LongestCommonSubsequence {
    longestCommonSubsequence(text1, text2) {
        const m = text1.length, n = text2.length;
        const dp = Array(m + 1).fill().map(() => Array(n + 1).fill(0));
        
        for (let i = 1; i <= m; i++) {
            for (let j = 1; j <= n; j++) {
                if (text1[i - 1] === text2[j - 1]) {
                    dp[i][j] = dp[i - 1][j - 1] + 1;
                } else {
                    dp[i][j] = Math.max(dp[i - 1][j], dp[i][j - 1]);
                }
            }
        }
        
        return dp[m][n];
    }
}

// Approach 2: Space Optimized (1D DP)
class LongestCommonSubsequence {
    longestCommonSubsequence(text1, text2) {
        let m = text1.length, n = text2.length;
        
        // Use shorter string for space optimization
        if (m < n) {
            return this.longestCommonSubsequence(text2, text1);
        }
        
        const dp = new Array(n + 1).fill(0);
        
        for (let i = 1; i <= m; i++) {
            let prev = 0;
            for (let j = 1; j <= n; j++) {
                const temp = dp[j];
                if (text1[i - 1] === text2[j - 1]) {
                    dp[j] = prev + 1;
                } else {
                    dp[j] = Math.max(dp[j], dp[j - 1]);
                }
                prev = temp;
            }
        }
        
        return dp[n];
    }
}

// Approach 3: Recursive with Memoization
class LongestCommonSubsequence {
    longestCommonSubsequence(text1, text2) {
        const memo = new Map();
        
        const helper = (i, j) => {
            if (i === text1.length || j === text2.length) {
                return 0;
            }
            
            const key = `${i},${j}`;
            if (memo.has(key)) {
                return memo.get(key);
            }
            
            let result;
            if (text1[i] === text2[j]) {
                result = 1 + helper(i + 1, j + 1);
            } else {
                result = Math.max(helper(i + 1, j), helper(i, j + 1));
            }
            
            memo.set(key, result);
            return result;
        };
        
        return helper(0, 0);
    }
}
```
  </div>
</div>

<p><strong>Complexity Analysis</strong>:</p>
<ul>
<li><strong>2D DP</strong>: Time O(m×n), Space O(m×n)</li>
<li><strong>Space Optimized</strong>: Time O(m×n), Space O(min(m,n))</li>
</ul>

**Key Insights & Patterns**:
- Foundation for edit distance and diff algorithms
- Template for two-sequence DP problems
- Space optimization using rolling array

**State Transition Explanation**:
```
if text1[i-1] == text2[j-1]:
    dp[i][j] = dp[i-1][j-1] + 1
else:
    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
```

---

### 5. Word Break Problem

**🔗 LeetCode Link:** [Word Break - LeetCode #139](https://leetcode.com/problems/word-break/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What strategy would you use to check if a string can be broken into dictionary words?
2. If you can break string[0...i] into valid words, how does that help with breaking string[0...j] where j > i?
3. What data structure would give you fast lookup for checking if a word exists in the dictionary?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: String Partitioning Strategy
> **Guided Question:** How can you systematically check all possible ways to break the string? What does each "break" represent?

<details>
<summary>💭 Think about it, then click to reveal</summary>

You need to try all possible prefix-suffix splits:
- For each position i in the string, check if prefix[0...i] is a valid word
- If it is, recursively check if the remaining suffix can also be broken

This creates a tree of possibilities where each node represents a potential word boundary.

The key insight: If you can break string[0...j] AND string[j+1...i] is a valid word, then you can break string[0...i].
</details>

#### Step 2: Boolean DP State Definition
> **Guided Question:** What should dp[i] represent? How is this different from optimization problems like "minimum coins"?

<details>
<summary>💭 Think about it, then click to reveal</summary>

`dp[i]` = true if string[0...i-1] can be segmented into dictionary words.

This is a **boolean DP** problem - you're checking possibility, not optimizing a value.

Recurrence: `dp[i] = true` if there exists any j where:
- `dp[j] = true` (prefix can be broken)
- `string[j...i-1]` is in dictionary (current segment is valid)

Base case: `dp[0] = true` (empty string can always be "broken")
</details>

#### Step 3: Dictionary Lookup Optimization
> **Guided Question:** How can you make dictionary lookups efficient? What optimization can you apply based on word lengths?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Dictionary Optimization**: Use HashSet for O(1) lookup instead of List with O(n) search.

**Length Optimization**: Instead of checking all possible j values, only check j values within the maximum word length in the dictionary. This can significantly reduce the search space.

**Early Termination**: Once you find one valid split for dp[i], you can break early since you only need to know if it's possible.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Convert word list to HashSet for O(1) lookup
- [ ] Create boolean dp array of size (n+1)
- [ ] Set dp[0] = true (base case)
- [ ] For each position i from 1 to n, check all valid prefixes
- [ ] For each j from 0 to i-1, check if dp[j] && dict.contains(s.substring(j, i))
- [ ] Return dp[n]

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why is the base case dp[0] = true? What does it represent?
2. **Complexity Analysis:** What's the time complexity? How does the max word length optimization help?
3. **Trade-offs:** When would you use top-down vs bottom-up? What about the space complexity?
4. **Pattern Recognition:** How is this similar to other string partitioning problems?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the problem: ___/5
- [ ] Implementing brute force: ___/5  
- [ ] Implementing optimal solution: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Consider trying "Word Break II" (return all possible sentences) for advanced practice

**Problem Statement**: Given a string and a dictionary of words, determine if the string can be segmented into space-separated sequence of dictionary words.

**Example**:
- Input: s = "leetcode", wordDict = ["leet","code"]
- Output: true

**Knowledge Prerequisites**:
- String manipulation
- Set data structure for O(1) lookup
- Boolean DP concepts

**First Principles**:
A string can be broken if:
- It's empty (base case)
- There exists a valid prefix that's in dictionary AND the remaining suffix can also be broken

**Problem-First Approach**:
1. **Identify pattern**: String partitioning with constraints
2. **State definition**: `dp[i]` = true if substring s[0...i-1] can be segmented
3. **Recurrence**: `dp[i] = true` if there exists j where `dp[j] = true` and `s[j...i-1]` is in dictionary
4. **Base case**: `dp[0] = true` (empty string)

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: Bottom-Up DP
class WordBreak {
    public boolean wordBreak(String s, List<String> wordDict) {
        Set<String> wordSet = new HashSet<>(wordDict);
        boolean[] dp = new boolean[s.length() + 1];
        dp[0] = true;
        
        for (int i = 1; i <= s.length(); i++) {
            for (int j = 0; j < i; j++) {
                if (dp[j] && wordSet.contains(s.substring(j, i))) {
                    dp[i] = true;
                    break;
                }
            }
        }
        
        return dp[s.length()];
    }
}

// Approach 2: Top-Down with Memoization
class WordBreak {
    public boolean wordBreak(String s, List<String> wordDict) {
        Set<String> wordSet = new HashSet<>(wordDict);
        Boolean[] memo = new Boolean[s.length()];
        return helper(s, 0, wordSet, memo);
    }
    
    private boolean helper(String s, int start, Set<String> wordSet, Boolean[] memo) {
        if (start == s.length()) {
            return true;
        }
        
        if (memo[start] != null) {
            return memo[start];
        }
        
        for (int end = start + 1; end <= s.length(); end++) {
            String prefix = s.substring(start, end);
            if (wordSet.contains(prefix) && helper(s, end, wordSet, memo)) {
                memo[start] = true;
                return true;
            }
        }
        
        memo[start] = false;
        return false;
    }
}

// Approach 3: Optimized with Max Word Length
class WordBreak {
    public boolean wordBreak(String s, List<String> wordDict) {
        Set<String> wordSet = new HashSet<>(wordDict);
        int maxLen = 0;
        for (String word : wordDict) {
            maxLen = Math.max(maxLen, word.length());
        }
        
        boolean[] dp = new boolean[s.length() + 1];
        dp[0] = true;
        
        for (int i = 1; i <= s.length(); i++) {
            for (int j = Math.max(0, i - maxLen); j < i; j++) {
                if (dp[j] && wordSet.contains(s.substring(j, i))) {
                    dp[i] = true;
                    break;
                }
            }
        }
        
        return dp[s.length()];
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: Bottom-Up DP
class WordBreak:
    def wordBreak(self, s: str, wordDict: list) -> bool:
        word_set = set(wordDict)
        dp = [False] * (len(s) + 1)
        dp[0] = True
        
        for i in range(1, len(s) + 1):
            for j in range(i):
                if dp[j] and s[j:i] in word_set:
                    dp[i] = True
                    break
        
        return dp[len(s)]

# Approach 2: Top-Down with Memoization
class WordBreak:
    def wordBreak(self, s: str, wordDict: list) -> bool:
        word_set = set(wordDict)
        memo = {}
        
        def helper(start):
            if start == len(s):
                return True
            
            if start in memo:
                return memo[start]
            
            for end in range(start + 1, len(s) + 1):
                prefix = s[start:end]
                if prefix in word_set and helper(end):
                    memo[start] = True
                    return True
            
            memo[start] = False
            return False
        
        return helper(0)

# Approach 3: Optimized with Max Word Length
class WordBreak:
    def wordBreak(self, s: str, wordDict: list) -> bool:
        word_set = set(wordDict)
        max_len = max(len(word) for word in wordDict) if wordDict else 0
        
        dp = [False] * (len(s) + 1)
        dp[0] = True
        
        for i in range(1, len(s) + 1):
            for j in range(max(0, i - max_len), i):
                if dp[j] and s[j:i] in word_set:
                    dp[i] = True
                    break
        
        return dp[len(s)]
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: Bottom-Up DP
class WordBreak {
    wordBreak(s, wordDict) {
        const wordSet = new Set(wordDict);
        const dp = new Array(s.length + 1).fill(false);
        dp[0] = true;
        
        for (let i = 1; i <= s.length; i++) {
            for (let j = 0; j < i; j++) {
                if (dp[j] && wordSet.has(s.substring(j, i))) {
                    dp[i] = true;
                    break;
                }
            }
        }
        
        return dp[s.length];
    }
}

// Approach 2: Top-Down with Memoization
class WordBreak {
    wordBreak(s, wordDict) {
        const wordSet = new Set(wordDict);
        const memo = new Map();
        
        const helper = (start) => {
            if (start === s.length) {
                return true;
            }
            
            if (memo.has(start)) {
                return memo.get(start);
            }
            
            for (let end = start + 1; end <= s.length; end++) {
                const prefix = s.substring(start, end);
                if (wordSet.has(prefix) && helper(end)) {
                    memo.set(start, true);
                    return true;
                }
            }
            
            memo.set(start, false);
            return false;
        };
        
        return helper(0);
    }
}

// Approach 3: Optimized with Max Word Length
class WordBreak {
    wordBreak(s, wordDict) {
        const wordSet = new Set(wordDict);
        const maxLen = Math.max(...wordDict.map(word => word.length));
        
        const dp = new Array(s.length + 1).fill(false);
        dp[0] = true;
        
        for (let i = 1; i <= s.length; i++) {
            for (let j = Math.max(0, i - maxLen); j < i; j++) {
                if (dp[j] && wordSet.has(s.substring(j, i))) {
                    dp[i] = true;
                    break;
                }
            }
        }
        
        return dp[s.length];
    }
}
```
  </div>
</div>

<p><strong>Complexity Analysis</strong>:</p>
<ul>
<li><strong>Time</strong>: O(n² × m) where n = string length, m = average word length</li>
<li><strong>Space</strong>: O(n + W) where W = total characters in dictionary</li>
<li><strong>Optimized</strong>: O(n × maxWordLength × m)</li>
</ul>

**Key Insights & Patterns**:
- String partitioning pattern
- Optimization using word length bounds
- Boolean DP for existence problems

**State Transition Explanation**:
```
dp[i] = OR over all j where dp[j] = true AND s[j:i] in wordDict
```

---

### 6. Combination Sum

**🔗 LeetCode Link:** [Combination Sum IV - LeetCode #377](https://leetcode.com/problems/combination-sum-iv/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. Is this primarily a DP problem or a backtracking problem? What's the difference between listing solutions vs counting solutions?
2. If you can use each number multiple times, how does this affect your approach compared to problems with single-use items?
3. What's the relationship between making target sum X and making smaller target sums?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding Problem Variants
> **Guided Question:** The LeetCode link shows "Combination Sum IV" which counts combinations. How is this different from the original "Combination Sum" that lists all combinations?

<details>
<summary>💭 Think about it, then click to reveal</summary>

There are actually multiple variants:
- **Combination Sum I**: List all unique combinations that sum to target (Backtracking)
- **Combination Sum IV**: Count number of combinations that sum to target (DP)

For **listing combinations**: Use backtracking to explore all possibilities
For **counting combinations**: Use DP to avoid recomputing the same subproblems

The key insight: DP is ideal when you only need the count, not the actual combinations.
</details>

#### Step 2: Unbounded Knapsack Pattern Recognition  
> **Guided Question:** Since numbers can be reused multiple times, how does this relate to other DP problems you've seen? What does "unbounded" mean?

<details>
<summary>💭 Think about it, then click to reveal</summary>

This is an **unbounded knapsack** problem:
- "Unbounded" = you can use each item (number) unlimited times
- "Knapsack" = you're trying to achieve a target sum (capacity)

Recurrence for counting: `dp[target] = sum(dp[target - num])` for all valid nums

This is similar to Coin Change, but instead of minimizing coins, you're counting ways to make the target.
</details>

#### Step 3: Order Independence vs Order Dependence
> **Guided Question:** In Combination Sum IV, does the order of numbers matter? How does this affect your DP approach compared to traditional combinations?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Order matters** in Combination Sum IV: [1,2] and [2,1] are counted as different combinations.

This means for each target sum, you try adding each number and count all the ways to make the remaining sum.

**Implementation difference**:
- Iterate through target sums (outer loop)
- For each target, try all numbers (inner loop)
- This ensures all orderings are considered

If order didn't matter, you'd iterate through numbers first to avoid duplicates.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing both the backtracking (listing) and DP (counting) solutions:

**Step-by-step checklist (DP - Counting):**
- [ ] Create dp array where dp[i] = ways to make sum i
- [ ] Set dp[0] = 1 (one way to make sum 0: use no numbers)
- [ ] For each target sum from 1 to target
- [ ] For each number in candidates, if num <= current_sum
- [ ] Add dp[current_sum - num] to dp[current_sum]
- [ ] Return dp[target]

**Step-by-step checklist (Backtracking - Listing):**
- [ ] Use recursive function with current combination and remaining target
- [ ] Base case: if target == 0, add current combination to results
- [ ] For each candidate >= current number (to avoid duplicates)
- [ ] If candidate <= target, recursively explore with candidate added
- [ ] Backtrack by removing the candidate

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Can you explain why DP works for counting but not for listing all combinations?
2. **Complexity Analysis:** What's the time complexity of each approach? When would you use each?
3. **Trade-offs:** How does allowing unlimited reuse change the problem compared to single-use variants?
4. **Pattern Recognition:** How does this relate to other unbounded knapsack problems?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the problem: ___/5
- [ ] Implementing brute force: ___/5  
- [ ] Implementing optimal solution: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Consider trying "Combination Sum II" (with duplicates) or "Partition Equal Subset Sum" for related practice

**Problem Statement**: Given an array of distinct integers and a target, return all unique combinations where the numbers sum to target. Numbers can be used multiple times.

**Example**:
- Input: candidates = [2,3,6,7], target = 7
- Output: [[2,2,3],[7]]

**Knowledge Prerequisites**:
- Backtracking vs DP distinction
- Understanding when DP applies vs when backtracking is needed
- Counting vs listing solutions

**First Principles**:
This is primarily a backtracking problem, but DP can be used for counting combinations or checking possibility.

**Problem-First Approach**:
1. **Identify pattern**: This is backtracking for listing solutions
2. **DP variant**: Count number of ways to make target
3. **State definition**: `dp[i]` = number of ways to make sum i
4. **Recurrence**: `dp[i] += dp[i - candidate]` for each candidate

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: Backtracking (Standard Solution)
class CombinationSum {
    public List<List<Integer>> combinationSum(int[] candidates, int target) {
        List<List<Integer>> result = new ArrayList<>();
        List<Integer> current = new ArrayList<>();
        backtrack(candidates, target, 0, current, result);
        return result;
    }
    
    private void backtrack(int[] candidates, int target, int start, 
                          List<Integer> current, List<List<Integer>> result) {
        if (target == 0) {
            result.add(new ArrayList<>(current));
            return;
        }
        
        for (int i = start; i < candidates.length; i++) {
            if (candidates[i] <= target) {
                current.add(candidates[i]);
                backtrack(candidates, target - candidates[i], i, current, result);
                current.remove(current.size() - 1);
            }
        }
    }
}

// Approach 2: DP for Counting Combinations
class CombinationSum {
    public int combinationSum4(int[] nums, int target) {
        int[] dp = new int[target + 1];
        dp[0] = 1;
        
        for (int i = 1; i <= target; i++) {
            for (int num : nums) {
                if (num <= i) {
                    dp[i] += dp[i - num];
                }
            }
        }
        
        return dp[target];
    }
}

// Approach 3: DP for Checking Possibility
class CombinationSum {
    public boolean canPartition(int[] nums, int target) {
        boolean[] dp = new boolean[target + 1];
        dp[0] = true;
        
        for (int num : nums) {
            for (int i = target; i >= num; i--) {
                dp[i] = dp[i] || dp[i - num];
            }
        }
        
        return dp[target];
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: Backtracking (Standard Solution)
class CombinationSum:
    def combinationSum(self, candidates, target):
        result = []
        
        def backtrack(remaining, current, start):
            if remaining == 0:
                result.append(current[:])  # Add copy of current
                return
            
            for i in range(start, len(candidates)):
                if candidates[i] <= remaining:
                    current.append(candidates[i])
                    backtrack(remaining - candidates[i], current, i)
                    current.pop()
        
        backtrack(target, [], 0)
        return result

# Approach 2: DP for Counting Combinations
class CombinationSum:
    def combinationSum4(self, nums, target):
        dp = [0] * (target + 1)
        dp[0] = 1
        
        for i in range(1, target + 1):
            for num in nums:
                if num <= i:
                    dp[i] += dp[i - num]
        
        return dp[target]

# Approach 3: DP for Checking Possibility
class CombinationSum:
    def canPartition(self, nums, target):
        dp = [False] * (target + 1)
        dp[0] = True
        
        for num in nums:
            for i in range(target, num - 1, -1):
                dp[i] = dp[i] or dp[i - num]
        
        return dp[target]
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: Backtracking (Standard Solution)
class CombinationSum {
    combinationSum(candidates, target) {
        const result = [];
        
        const backtrack = (remaining, current, start) => {
            if (remaining === 0) {
                result.push([...current]);  // Add copy of current
                return;
            }
            
            for (let i = start; i < candidates.length; i++) {
                if (candidates[i] <= remaining) {
                    current.push(candidates[i]);
                    backtrack(remaining - candidates[i], current, i);
                    current.pop();
                }
            }
        };
        
        backtrack(target, [], 0);
        return result;
    }
}

// Approach 2: DP for Counting Combinations
class CombinationSum {
    combinationSum4(nums, target) {
        const dp = new Array(target + 1).fill(0);
        dp[0] = 1;
        
        for (let i = 1; i <= target; i++) {
            for (const num of nums) {
                if (num <= i) {
                    dp[i] += dp[i - num];
                }
            }
        }
        
        return dp[target];
    }
}

// Approach 3: DP for Checking Possibility
class CombinationSum {
    canPartition(nums, target) {
        const dp = new Array(target + 1).fill(false);
        dp[0] = true;
        
        for (const num of nums) {
            for (let i = target; i >= num; i--) {
                dp[i] = dp[i] || dp[i - num];
            }
        }
        
        return dp[target];
    }
}
```
  </div>
</div>

<p><strong>Complexity Analysis</strong>:</p>
<ul>
<li><strong>Backtracking</strong>: O(2^target) in worst case</li>
<li><strong>DP Counting</strong>: Time O(target × nums.length), Space O(target)</li>
</ul>

**Key Insights & Patterns**:
- Difference between listing solutions vs counting solutions
- DP for optimization, backtracking for enumeration
- Unbounded knapsack pattern for counting

---

### 7. House Robber

**🔗 LeetCode Link:** [House Robber - LeetCode #198](https://leetcode.com/problems/house-robber/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. If you're at house i, what are your two choices? How does this constraint affect your decision-making?
2. What information do you need to know about previous houses to make the optimal decision at the current house?
3. How might the optimal solution for houses 0 to i-1 help you find the optimal solution for houses 0 to i?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding the Constraint
> **Guided Question:** Why can't you use a greedy approach (always picking the house with the most money)? What does the "adjacent houses" constraint really mean for your choices?

<details>
<summary>💭 Think about it, then click to reveal</summary>

The adjacent constraint means that if you rob house i, you cannot rob house i-1 or i+1. This creates a fundamental choice at each house:
- **Choice 1**: Rob this house (and thus skip the previous house)
- **Choice 2**: Skip this house (and keep whatever optimal solution you had up to the previous house)

A greedy approach fails because a high-value house might be surrounded by other high-value houses, making the local optimal choice globally suboptimal.

This constraint pattern appears in many DP problems - decisions have consequences that ripple through future choices.
</details>

#### Step 2: State Definition and Recurrence Discovery
> **Guided Question:** If you define dp[i] as "maximum money you can rob from houses 0 to i", how can you compute dp[i] using previous values? What are the two scenarios you need to consider?

<details>
<summary>💭 Think about it, then click to reveal</summary>

For house i, you have exactly two options:

**Option 1 - Rob house i**: 
- You get nums[i] money from this house
- But you cannot rob house i-1, so you get the best solution from houses 0 to i-2
- Total: `nums[i] + dp[i-2]`

**Option 2 - Skip house i**: 
- You get 0 money from this house
- But you keep the best solution from houses 0 to i-1
- Total: `dp[i-1]`

Recurrence: `dp[i] = max(nums[i] + dp[i-2], dp[i-1])`

This is similar to Fibonacci, but with a max operation and values from the array!
</details>

#### Step 3: Space Optimization Strategy
> **Guided Question:** Looking at the recurrence relation, do you need to store all previous results, or can you optimize space? What's the minimum information you need to track?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Since dp[i] only depends on dp[i-1] and dp[i-2], you only need to track the last two values as you iterate forward.

**Space optimization pattern**:
- `prev2` = dp[i-2] (best solution excluding previous house)
- `prev1` = dp[i-1] (best solution including previous house)
- `current` = max(prev1, prev2 + nums[i])

This reduces space complexity from O(n) to O(1) while maintaining the same logic. This optimization pattern appears frequently in linear DP problems.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Handle edge cases (empty array, single house)
- [ ] Initialize variables for the first two houses
- [ ] For each subsequent house, apply the recurrence relation
- [ ] Use either DP array or space-optimized variables
- [ ] Return the maximum money from the last decision

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Can you explain why dp[i] = max(dp[i-1], dp[i-2] + nums[i]) captures all possibilities?
2. **Complexity Analysis:** What's the time and space complexity of both the array and optimized versions?
3. **Trade-offs:** When would you use the DP array version vs the space-optimized version?
4. **Pattern Recognition:** What other problems use this "include vs exclude" decision pattern?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the problem: ___/5
- [ ] Implementing brute force: ___/5  
- [ ] Implementing optimal solution: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Consider trying "House Robber II" (circular constraint) to test understanding

**Problem Statement**: You are a robber planning to rob houses along a street. Each house has money. Adjacent houses have security systems connected. Determine maximum money you can rob without alerting police.

**Example**:
- Input: [1,2,3,1]
- Output: 4 (rob house 0 and 2)

**Knowledge Prerequisites**:
- Understanding constraints (can't rob adjacent)
- State-based decision making
- Optimization with constraints

**First Principles**:
For each house, we have two choices:
1. Rob this house + max from houses before previous
2. Don't rob this house + max from previous house

**Problem-First Approach**:
1. **Identify pattern**: Linear DP with constraints
2. **State definition**: `dp[i]` = maximum money from houses 0 to i
3. **Recurrence**: `dp[i] = max(dp[i-1], dp[i-2] + nums[i])`
4. **Base cases**: `dp[0] = nums[0]`, `dp[1] = max(nums[0], nums[1])`

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: Standard DP
class HouseRobber {
    public int rob(int[] nums) {
        if (nums.length == 0) return 0;
        if (nums.length == 1) return nums[0];
        
        int[] dp = new int[nums.length];
        dp[0] = nums[0];
        dp[1] = Math.max(nums[0], nums[1]);
        
        for (int i = 2; i < nums.length; i++) {
            dp[i] = Math.max(dp[i - 1], dp[i - 2] + nums[i]);
        }
        
        return dp[nums.length - 1];
    }
}

// Approach 2: Space Optimized
class HouseRobber {
    public int rob(int[] nums) {
        if (nums.length == 0) return 0;
        if (nums.length == 1) return nums[0];
        
        int prev2 = nums[0];
        int prev1 = Math.max(nums[0], nums[1]);
        
        for (int i = 2; i < nums.length; i++) {
            int current = Math.max(prev1, prev2 + nums[i]);
            prev2 = prev1;
            prev1 = current;
        }
        
        return prev1;
    }
}

// Approach 3: Recursive with Memoization
class HouseRobber {
    public int rob(int[] nums) {
        int[] memo = new int[nums.length];
        Arrays.fill(memo, -1);
        return helper(nums, 0, memo);
    }
    
    private int helper(int[] nums, int i, int[] memo) {
        if (i >= nums.length) return 0;
        
        if (memo[i] != -1) return memo[i];
        
        // Two choices: rob this house or skip it
        int robCurrent = nums[i] + helper(nums, i + 2, memo);
        int skipCurrent = helper(nums, i + 1, memo);
        
        memo[i] = Math.max(robCurrent, skipCurrent);
        return memo[i];
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: Standard DP
class HouseRobber:
    def rob(self, nums):
        if not nums:
            return 0
        if len(nums) == 1:
            return nums[0]
        
        dp = [0] * len(nums)
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])
        
        for i in range(2, len(nums)):
            dp[i] = max(dp[i - 1], dp[i - 2] + nums[i])
        
        return dp[-1]

# Approach 2: Space Optimized
class HouseRobber:
    def rob(self, nums):
        if not nums:
            return 0
        if len(nums) == 1:
            return nums[0]
        
        prev2 = nums[0]
        prev1 = max(nums[0], nums[1])
        
        for i in range(2, len(nums)):
            current = max(prev1, prev2 + nums[i])
            prev2 = prev1
            prev1 = current
        
        return prev1

# Approach 3: Recursive with Memoization
class HouseRobber:
    def rob(self, nums):
        memo = {}
        
        def helper(i):
            if i >= len(nums):
                return 0
            
            if i in memo:
                return memo[i]
            
            # Two choices: rob this house or skip it
            rob_current = nums[i] + helper(i + 2)
            skip_current = helper(i + 1)
            
            memo[i] = max(rob_current, skip_current)
            return memo[i]
        
        return helper(0)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: Standard DP
class HouseRobber {
    rob(nums) {
        if (nums.length === 0) return 0;
        if (nums.length === 1) return nums[0];
        
        const dp = new Array(nums.length);
        dp[0] = nums[0];
        dp[1] = Math.max(nums[0], nums[1]);
        
        for (let i = 2; i < nums.length; i++) {
            dp[i] = Math.max(dp[i - 1], dp[i - 2] + nums[i]);
        }
        
        return dp[nums.length - 1];
    }
}

// Approach 2: Space Optimized
class HouseRobber {
    rob(nums) {
        if (nums.length === 0) return 0;
        if (nums.length === 1) return nums[0];
        
        let prev2 = nums[0];
        let prev1 = Math.max(nums[0], nums[1]);
        
        for (let i = 2; i < nums.length; i++) {
            const current = Math.max(prev1, prev2 + nums[i]);
            prev2 = prev1;
            prev1 = current;
        }
        
        return prev1;
    }
}

// Approach 3: Recursive with Memoization
class HouseRobber {
    rob(nums) {
        const memo = new Map();
        
        const helper = (i) => {
            if (i >= nums.length) return 0;
            
            if (memo.has(i)) return memo.get(i);
            
            // Two choices: rob this house or skip it
            const robCurrent = nums[i] + helper(i + 2);
            const skipCurrent = helper(i + 1);
            
            const result = Math.max(robCurrent, skipCurrent);
            memo.set(i, result);
            return result;
        };
        
        return helper(0);
    }
}
```
  </div>
</div>

<p><strong>Complexity Analysis</strong>:</p>
<ul>
<li><strong>Time</strong>: O(n)</li>
<li><strong>Space</strong>: O(n) for DP array, O(1) for optimized version</li>
</ul>

**Key Insights & Patterns**:
- Classic constraint-based optimization
- Pattern for problems with "can't use adjacent" constraints
- Foundation for circular and 2D house robber variants

**State Transition Explanation**:
```
dp[i] = max(dp[i-1], dp[i-2] + nums[i])
```
Either skip current house or rob it (and skip previous).

---

### 8. House Robber II

**🔗 LeetCode Link:** [House Robber II - LeetCode #213](https://leetcode.com/problems/house-robber-ii/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. How does the circular arrangement change the constraint compared to the linear House Robber problem?
2. If you rob the first house, what constraint does that impose on the last house? What if you don't rob the first house?
3. How might you break this circular problem into subproblems you already know how to solve?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Constraint Analysis
> **Guided Question:** In a circular arrangement, what new constraint emerges that didn't exist in the linear version? How does this affect your decision space?

<details>
<summary>💭 Think about it, then click to reveal</summary>

The key insight is that **you cannot rob both the first and last house** because they are now adjacent in the circle. This creates a mutual exclusion constraint.

This means you have two distinct scenarios to consider:
- **Scenario 1**: You might rob the first house (so you definitely can't rob the last house)
- **Scenario 2**: You might rob the last house (so you definitely can't rob the first house)

The circular constraint effectively creates two separate linear problems!
</details>

#### Step 2: Problem Decomposition Strategy
> **Guided Question:** How can you transform this circular problem into problems you already know how to solve? What would be the two subproblems?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Since you can't rob both first and last house, you can break this into two linear House Robber problems:

**Subproblem 1**: Rob houses from index 0 to n-2 (exclude the last house)
- This ensures if you rob the first house, you won't rob the last house
- This is just the regular House Robber problem on a smaller array

**Subproblem 2**: Rob houses from index 1 to n-1 (exclude the first house)  
- This ensures if you rob the last house, you won't rob the first house
- This is again the regular House Robber problem on a smaller array

**Final answer**: Take the maximum of both subproblems!

This demonstrates a powerful problem-solving technique: reducing complex constraints to simpler, known problems.
</details>

#### Step 3: Edge Case Handling
> **Guided Question:** What happens when there are very few houses (1, 2, or 3 houses)? Do you still need to consider both subproblems?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Edge cases require special handling**:

- **1 house**: No circular constraint issue - just rob the single house
- **2 houses**: Pick the one with more money (they're adjacent, so you can only rob one)
- **3+ houses**: Use the two-subproblem approach

For 2 houses, you don't need the complex logic because there are only two choices anyway.

**Implementation tip**: Handle small cases explicitly, then use the general algorithm for larger inputs. This pattern of "special cases + general algorithm" is common in DP problems.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Handle edge cases (1 house, 2 houses)
- [ ] Create helper function for linear House Robber problem
- [ ] Solve subproblem 1: houses[0...n-2] (excluding last)
- [ ] Solve subproblem 2: houses[1...n-1] (excluding first)
- [ ] Return maximum of both subproblems

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does solving two linear problems guarantee you handle the circular constraint correctly?
2. **Complexity Analysis:** How does the time complexity compare to the original House Robber problem?
3. **Trade-offs:** Could you solve this with a single pass? What would make that more complex?
4. **Pattern Recognition:** What other problems can be solved by "breaking circular constraints into linear subproblems"?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the problem: ___/5
- [ ] Implementing brute force: ___/5  
- [ ] Implementing optimal solution: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Consider trying "House Robber III" (binary tree version) for advanced practice

**Problem Statement**: Same as House Robber, but houses are arranged in a circle. First and last houses are adjacent.

**Example**:
- Input: [2,3,2]
- Output: 3 (rob house 1)

**Knowledge Prerequisites**:
- House Robber I solution
- Handling circular constraints
- Breaking down complex constraints

**First Principles**:
In a circle, we can't rob both first and last house. So we solve two subproblems:
1. Rob houses 0 to n-2 (exclude last)
2. Rob houses 1 to n-1 (exclude first)

**Problem-First Approach**:
1. **Identify pattern**: Circular constraint → linear subproblems
2. **State definition**: Same as House Robber I for each subproblem
3. **Recurrence**: Same as House Robber I
4. **Constraint handling**: Solve two separate linear problems

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: Two Linear Robberies
class HouseRobberII {
    public int rob(int[] nums) {
        if (nums.length == 1) return nums[0];
        if (nums.length == 2) return Math.max(nums[0], nums[1]);
        
        // Case 1: Rob houses 0 to n-2 (exclude last)
        int robFirst = robLinear(nums, 0, nums.length - 2);
        
        // Case 2: Rob houses 1 to n-1 (exclude first)
        int robLast = robLinear(nums, 1, nums.length - 1);
        
        return Math.max(robFirst, robLast);
    }
    
    private int robLinear(int[] nums, int start, int end) {
        int prev2 = 0, prev1 = 0;
        
        for (int i = start; i <= end; i++) {
            int current = Math.max(prev1, prev2 + nums[i]);
            prev2 = prev1;
            prev1 = current;
        }
        
        return prev1;
    }
}

// Approach 2: Alternative Implementation
class HouseRobberII {
    public int rob(int[] nums) {
        if (nums.length == 1) return nums[0];
        
        return Math.max(
            robHelper(Arrays.copyOfRange(nums, 0, nums.length - 1)),
            robHelper(Arrays.copyOfRange(nums, 1, nums.length))
        );
    }
    
    private int robHelper(int[] nums) {
        int rob = 0, notRob = 0;
        
        for (int num : nums) {
            int currRob = notRob + num;
            notRob = Math.max(notRob, rob);
            rob = currRob;
        }
        
        return Math.max(rob, notRob);
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: Two Linear Robberies
class HouseRobberII:
    def rob(self, nums):
        if len(nums) == 1:
            return nums[0]
        if len(nums) == 2:
            return max(nums[0], nums[1])
        
        # Case 1: Rob houses 0 to n-2 (exclude last)
        rob_first = self.rob_linear(nums, 0, len(nums) - 2)
        
        # Case 2: Rob houses 1 to n-1 (exclude first)
        rob_last = self.rob_linear(nums, 1, len(nums) - 1)
        
        return max(rob_first, rob_last)
    
    def rob_linear(self, nums, start, end):
        prev2, prev1 = 0, 0
        
        for i in range(start, end + 1):
            current = max(prev1, prev2 + nums[i])
            prev2 = prev1
            prev1 = current
        
        return prev1

# Approach 2: Alternative Implementation
class HouseRobberII:
    def rob(self, nums):
        if len(nums) == 1:
            return nums[0]
        
        return max(
            self.rob_helper(nums[:-1]),  # Exclude last
            self.rob_helper(nums[1:])    # Exclude first
        )
    
    def rob_helper(self, nums):
        rob, not_rob = 0, 0
        
        for num in nums:
            curr_rob = not_rob + num
            not_rob = max(not_rob, rob)
            rob = curr_rob
        
        return max(rob, not_rob)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: Two Linear Robberies
class HouseRobberII {
    rob(nums) {
        if (nums.length === 1) return nums[0];
        if (nums.length === 2) return Math.max(nums[0], nums[1]);
        
        // Case 1: Rob houses 0 to n-2 (exclude last)
        const robFirst = this.robLinear(nums, 0, nums.length - 2);
        
        // Case 2: Rob houses 1 to n-1 (exclude first)
        const robLast = this.robLinear(nums, 1, nums.length - 1);
        
        return Math.max(robFirst, robLast);
    }
    
    robLinear(nums, start, end) {
        let prev2 = 0, prev1 = 0;
        
        for (let i = start; i <= end; i++) {
            const current = Math.max(prev1, prev2 + nums[i]);
            prev2 = prev1;
            prev1 = current;
        }
        
        return prev1;
    }
}

// Approach 2: Alternative Implementation
class HouseRobberII {
    rob(nums) {
        if (nums.length === 1) return nums[0];
        
        return Math.max(
            this.robHelper(nums.slice(0, -1)),  // Exclude last
            this.robHelper(nums.slice(1))       // Exclude first
        );
    }
    
    robHelper(nums) {
        let rob = 0, notRob = 0;
        
        for (const num of nums) {
            const currRob = notRob + num;
            notRob = Math.max(notRob, rob);
            rob = currRob;
        }
        
        return Math.max(rob, notRob);
    }
}
```
  </div>
</div>

<p><strong>Complexity Analysis</strong>:</p>
<ul>
<li><strong>Time</strong>: O(n)</li>
<li><strong>Space</strong>: O(1)</li>
</ul>

**Key Insights & Patterns**:
- Circular constraints → multiple linear subproblems
- Pattern for breaking down complex constraints
- Reusing linear solutions for circular problems

**State Transition Explanation**:
Same as House Robber I, but applied to two different ranges to handle circular constraint.

---

### 9. Decode Ways

**🔗 LeetCode Link:** [Decode Ways - LeetCode #91](https://leetcode.com/problems/decode-ways/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. When looking at a digit in the string, how many ways can it potentially be decoded? What determines these options?
2. How does the validity of single-digit vs. two-digit interpretations affect the total number of ways?
3. What's the relationship between the number of ways to decode a string and the number of ways to decode its prefixes?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding Valid Decodings
> **Guided Question:** Given the string "12", what are all the possible ways to decode it? What makes each interpretation valid or invalid?

<details>
<summary>💭 Think about it, then click to reveal</summary>

For "12", there are two valid decodings:
1. "1" + "2" → "A" + "B" → "AB"
2. "12" → "L" → "L"

**Validity rules**:
- Single digit: Must be 1-9 (not 0)
- Two digits: Must be 10-26

At each position, you're essentially asking: "Can I decode this character by itself? Can I decode it together with the previous character?"

This choice pattern suggests a DP approach where each decision affects future possibilities.
</details>

#### Step 2: Recurrence Relation Discovery
> **Guided Question:** If you know the number of ways to decode a string up to position i-1 and position i-2, how can you compute the ways to decode up to position i?

<details>
<summary>💭 Think about it, then click to reveal</summary>

At position i, you have up to two ways to extend previous decodings:

**Option 1 - Single digit decoding**: 
- If s[i] is valid (1-9), you can extend all decodings ending at i-1
- Add: `dp[i-1]` ways

**Option 2 - Two digit decoding**:
- If s[i-1:i+1] is valid (10-26), you can extend all decodings ending at i-2  
- Add: `dp[i-2]` ways

**Recurrence**: `dp[i] = (valid_single ? dp[i-1] : 0) + (valid_double ? dp[i-2] : 0)`

This is similar to Fibonacci, but with conditional additions based on digit validity!
</details>

#### Step 3: Handling Invalid Cases and Edge Conditions
> **Guided Question:** What happens when you encounter a '0' in the string? How do you handle the start of the string and various edge cases?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Critical edge cases**:

1. **Leading zero**: If string starts with '0', it's impossible to decode → return 0
2. **Isolated zero**: A '0' can only be part of "10" or "20", never by itself
3. **Invalid two-digit**: Numbers > 26 cannot be decoded as two digits

**Base cases**:
- `dp[0] = 1` (empty string has one way to decode: decode nothing)
- `dp[1] = 1` if first character is valid, otherwise 0

**String handling**: Be careful with 0-based vs 1-based indexing when checking `s[i-1]` for digit validity.

The key insight: '0' creates constraints - it can only appear as the second digit in "10" or "20".
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Handle edge case: empty string or starts with '0'
- [ ] Initialize DP array with base cases (dp[0] = 1)
- [ ] For each position, check single-digit validity (1-9)
- [ ] For each position, check two-digit validity (10-26)  
- [ ] Apply recurrence: dp[i] = sum of valid options
- [ ] Return dp[n]

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why is this problem similar to Fibonacci but with constraints? How do the constraints change the solution?
2. **Complexity Analysis:** What's the time and space complexity? How could you optimize space?
3. **Trade-offs:** When would you choose top-down memoization vs bottom-up tabulation for this problem?
4. **Pattern Recognition:** What other string parsing problems use similar "single vs double character" decision patterns?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the problem: ___/5
- [ ] Implementing brute force: ___/5  
- [ ] Implementing optimal solution: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Consider trying "Decode Ways II" (with '*' wildcards) for advanced practice

**Problem Statement**: A message containing letters A-Z is encoded as numbers 1-26. Given an encoded message, return the number of ways to decode it.

**Example**:
- Input: "12"
- Output: 2 ("AB" or "L")

**Knowledge Prerequisites**:
- String to integer conversion
- Multi-choice decision making
- Path counting in DP

**First Principles**:
At each position, we can:
1. Decode single digit (if valid: 1-9)
2. Decode two digits (if valid: 10-26)

**Problem-First Approach**:
1. **Identify pattern**: Path counting with constraints
2. **State definition**: `dp[i]` = number of ways to decode string up to index i
3. **Recurrence**: 
   - If single digit valid: `dp[i] += dp[i-1]`
   - If two digits valid: `dp[i] += dp[i-2]`
4. **Base cases**: `dp[0] = 1`, handle first character

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: Standard DP
class DecodeWays {
    public int numDecodings(String s) {
        if (s == null || s.length() == 0 || s.charAt(0) == '0') {
            return 0;
        }
        
        int n = s.length();
        int[] dp = new int[n + 1];
        dp[0] = 1;
        dp[1] = 1;
        
        for (int i = 2; i <= n; i++) {
            // Single digit
            if (s.charAt(i - 1) != '0') {
                dp[i] += dp[i - 1];
            }
            
            // Two digits
            int twoDigit = Integer.parseInt(s.substring(i - 2, i));
            if (twoDigit >= 10 && twoDigit <= 26) {
                dp[i] += dp[i - 2];
            }
        }
        
        return dp[n];
    }
}

// Approach 2: Space Optimized
class DecodeWays {
    public int numDecodings(String s) {
        if (s == null || s.length() == 0 || s.charAt(0) == '0') {
            return 0;
        }
        
        int prev2 = 1, prev1 = 1;
        
        for (int i = 1; i < s.length(); i++) {
            int current = 0;
            
            // Single digit
            if (s.charAt(i) != '0') {
                current += prev1;
            }
            
            // Two digits
            int twoDigit = Integer.parseInt(s.substring(i - 1, i + 1));
            if (twoDigit >= 10 && twoDigit <= 26) {
                current += prev2;
            }
            
            prev2 = prev1;
            prev1 = current;
        }
        
        return prev1;
    }
}

// Approach 3: Recursive with Memoization
class DecodeWays {
    public int numDecodings(String s) {
        Integer[] memo = new Integer[s.length()];
        return helper(s, 0, memo);
    }
    
    private int helper(String s, int index, Integer[] memo) {
        if (index == s.length()) return 1;
        if (s.charAt(index) == '0') return 0;
        
        if (memo[index] != null) return memo[index];
        
        int result = helper(s, index + 1, memo);
        
        if (index + 1 < s.length()) {
            int twoDigit = Integer.parseInt(s.substring(index, index + 2));
            if (twoDigit <= 26) {
                result += helper(s, index + 2, memo);
            }
        }
        
        memo[index] = result;
        return result;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: Standard DP
class DecodeWays:
    def numDecodings(self, s: str) -> int:
        if not s or s[0] == '0':
            return 0
        
        n = len(s)
        dp = [0] * (n + 1)
        dp[0] = 1
        dp[1] = 1
        
        for i in range(2, n + 1):
            # Single digit
            if s[i - 1] != '0':
                dp[i] += dp[i - 1]
            
            # Two digits
            two_digit = int(s[i - 2:i])
            if 10 <= two_digit <= 26:
                dp[i] += dp[i - 2]
        
        return dp[n]

# Approach 2: Space Optimized
class DecodeWays:
    def numDecodings(self, s: str) -> int:
        if not s or s[0] == '0':
            return 0
        
        prev2, prev1 = 1, 1
        
        for i in range(1, len(s)):
            current = 0
            
            # Single digit
            if s[i] != '0':
                current += prev1
            
            # Two digits
            two_digit = int(s[i - 1:i + 1])
            if 10 <= two_digit <= 26:
                current += prev2
            
            prev2 = prev1
            prev1 = current
        
        return prev1

# Approach 3: Recursive with Memoization
class DecodeWays:
    def numDecodings(self, s: str) -> int:
        memo = {}
        
        def helper(index):
            if index == len(s):
                return 1
            if s[index] == '0':
                return 0
            
            if index in memo:
                return memo[index]
            
            result = helper(index + 1)
            
            if index + 1 < len(s):
                two_digit = int(s[index:index + 2])
                if two_digit <= 26:
                    result += helper(index + 2)
            
            memo[index] = result
            return result
        
        return helper(0)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: Standard DP
class DecodeWays {
    numDecodings(s) {
        if (!s || s.length === 0 || s[0] === '0') {
            return 0;
        }
        
        const n = s.length;
        const dp = new Array(n + 1).fill(0);
        dp[0] = 1;
        dp[1] = 1;
        
        for (let i = 2; i <= n; i++) {
            // Single digit
            if (s[i - 1] !== '0') {
                dp[i] += dp[i - 1];
            }
            
            // Two digits
            const twoDigit = parseInt(s.substring(i - 2, i));
            if (twoDigit >= 10 && twoDigit <= 26) {
                dp[i] += dp[i - 2];
            }
        }
        
        return dp[n];
    }
}

// Approach 2: Space Optimized
class DecodeWays {
    numDecodings(s) {
        if (!s || s.length === 0 || s[0] === '0') {
            return 0;
        }
        
        let prev2 = 1, prev1 = 1;
        
        for (let i = 1; i < s.length; i++) {
            let current = 0;
            
            // Single digit
            if (s[i] !== '0') {
                current += prev1;
            }
            
            // Two digits
            const twoDigit = parseInt(s.substring(i - 1, i + 1));
            if (twoDigit >= 10 && twoDigit <= 26) {
                current += prev2;
            }
            
            prev2 = prev1;
            prev1 = current;
        }
        
        return prev1;
    }
}

// Approach 3: Recursive with Memoization
class DecodeWays {
    numDecodings(s) {
        const memo = new Map();
        
        const helper = (index) => {
            if (index === s.length) return 1;
            if (s[index] === '0') return 0;
            
            if (memo.has(index)) return memo.get(index);
            
            let result = helper(index + 1);
            
            if (index + 1 < s.length) {
                const twoDigit = parseInt(s.substring(index, index + 2));
                if (twoDigit <= 26) {
                    result += helper(index + 2);
                }
            }
            
            memo.set(index, result);
            return result;
        };
        
        return helper(0);
    }
}
```
  </div>
</div>

<p><strong>Complexity Analysis</strong>:</p>
<ul>
<li><strong>Time</strong>: O(n)</li>
<li><strong>Space</strong>: O(n) for DP, O(1) for optimized</li>
</ul>

<p><strong>Key Insights &amp; Patterns</strong>:</p>
<ul>
<li>Similar to Fibonacci but with validity constraints</li>
<li>Pattern for string parsing with multiple interpretations</li>
<li>Handling edge cases with invalid characters</li>
</ul>

**State Transition Explanation**:
```
dp[i] = (valid single digit ? dp[i-1] : 0) + (valid two digits ? dp[i-2] : 0)
```

---

### 10. Unique Paths

**🔗 LeetCode Link:** [Unique Paths - LeetCode #62](https://leetcode.com/problems/unique-paths/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What are the only two directions the robot can move? How does this constraint simplify the problem?
2. To reach any cell (i,j), which cells could the robot have come from? How does this help build a solution?
3. Can you think of this problem in terms of combinations? How many total moves does the robot need to make?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Movement Constraint Analysis
> **Guided Question:** With only "right" and "down" moves allowed, what's special about how you can reach any given cell? How does this create a natural subproblem structure?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Since the robot can only move right or down, to reach any cell (i,j), the robot must have come from either:
- Cell (i-1,j) by moving down, OR
- Cell (i,j-1) by moving right

This creates a perfect subproblem structure: the number of ways to reach (i,j) equals the sum of ways to reach the two possible previous positions.

**Key insight**: This constraint eliminates cycles and creates a dependency graph that naturally fits DP. No cell can be reached in multiple different ways from the same starting position.
</details>

#### Step 2: 2D DP vs Mathematical Insight
> **Guided Question:** You can solve this with 2D DP, but there's also a direct mathematical formula. Can you think about this as a combinations problem? What choices does the robot make?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**DP Approach**: `dp[i][j] = dp[i-1][j] + dp[i][j-1]` with base cases dp[0][j] = dp[i][0] = 1.

**Mathematical Insight**: 
- To reach (m-1, n-1) from (0,0), robot makes exactly (m-1) down moves and (n-1) right moves
- Total moves = (m-1) + (n-1) = m+n-2
- Question becomes: "In how many ways can you arrange (m-1) down moves among (m+n-2) total moves?"
- Answer: C(m+n-2, m-1) = (m+n-2)! / ((m-1)! × (n-1)!)

The DP approach builds this combination step by step, while the mathematical approach calculates it directly.
</details>

#### Step 3: Space Optimization Strategy
> **Guided Question:** Looking at the 2D DP recurrence, do you need to store the entire 2D table, or can you optimize space? What's the minimal information needed?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Since dp[i][j] only depends on dp[i-1][j] (directly above) and dp[i][j-1] (directly left), you only need to store one row at a time.

**Space optimization pattern**:
- Use 1D array where dp[j] represents paths to column j in current row
- When processing column j: dp[j] = dp[j] + dp[j-1]
  - dp[j] (before update) = paths from above  
  - dp[j-1] = paths from left
  - dp[j] (after update) = total paths to current cell

This reduces space from O(m×n) to O(min(m,n)) by processing the grid row by row.

**Pro tip**: Always optimize along the smaller dimension to minimize space usage.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing all three approaches from memory:

**Step-by-step checklist (2D DP):**
- [ ] Create 2D DP table of size m×n
- [ ] Initialize first row and first column to 1
- [ ] Fill table using recurrence: dp[i][j] = dp[i-1][j] + dp[i][j-1]
- [ ] Return dp[m-1][n-1]

**Step-by-step checklist (Space Optimized):**
- [ ] Create 1D array of size n, initialize to 1
- [ ] For each row, update array using: dp[j] += dp[j-1]
- [ ] Return dp[n-1]

**Step-by-step checklist (Mathematical):**
- [ ] Calculate total moves: m+n-2
- [ ] Calculate combinations: C(m+n-2, m-1) using iterative multiplication
- [ ] Handle potential integer overflow carefully

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Can you trace through a small 3×3 grid and verify all three approaches give the same answer?
2. **Complexity Analysis:** Compare time/space complexity of all three approaches. When would you use each?
3. **Trade-offs:** What are the advantages of the mathematical approach? When might DP be preferred?
4. **Pattern Recognition:** How does this grid-path pattern apply to problems with obstacles or weighted paths?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the problem: ___/5
- [ ] Implementing brute force: ___/5  
- [ ] Implementing optimal solution: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Consider trying "Unique Paths II" (with obstacles) to test understanding of grid DP patterns

**Problem Statement**: A robot on m×n grid starts at top-left and wants to reach bottom-right. Robot can only move right or down. Count unique paths.

**Example**:
- Input: m = 3, n = 7
- Output: 28

**Knowledge Prerequisites**:
- 2D grid traversal
- Combinatorics basics
- Path counting concepts

**First Principles**:
To reach any cell (i,j), robot must come from either:
- Cell (i-1,j) by moving down
- Cell (i,j-1) by moving right

**Problem-First Approach**:
1. **Identify pattern**: Grid path counting
2. **State definition**: `dp[i][j]` = number of paths to reach cell (i,j)
3. **Recurrence**: `dp[i][j] = dp[i-1][j] + dp[i][j-1]`
4. **Base cases**: `dp[0][j] = dp[i][0] = 1` (only one way along edges)

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: 2D DP
class UniquePaths {
    public int uniquePaths(int m, int n) {
        int[][] dp = new int[m][n];
        
        // Initialize first row and column
        for (int i = 0; i < m; i++) dp[i][0] = 1;
        for (int j = 0; j < n; j++) dp[0][j] = 1;
        
        // Fill the dp table
        for (int i = 1; i < m; i++) {
            for (int j = 1; j < n; j++) {
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1];
            }
        }
        
        return dp[m - 1][n - 1];
    }
}

// Approach 2: Space Optimized (1D DP)
class UniquePaths {
    public int uniquePaths(int m, int n) {
        int[] dp = new int[n];
        Arrays.fill(dp, 1);
        
        for (int i = 1; i < m; i++) {
            for (int j = 1; j < n; j++) {
                dp[j] += dp[j - 1];
            }
        }
        
        return dp[n - 1];
    }
}

// Approach 3: Mathematical Solution (Combinations)
class UniquePaths {
    public int uniquePaths(int m, int n) {
        // Total moves: (m-1) down + (n-1) right = m+n-2
        // Choose (m-1) positions for down moves: C(m+n-2, m-1)
        
        long result = 1;
        int moves = m + n - 2;
        int down = m - 1;
        
        for (int i = 1; i <= down; i++) {
            result = result * (moves - down + i) / i;
        }
        
        return (int) result;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: 2D DP
class UniquePaths:
    def uniquePaths(self, m: int, n: int) -> int:
        dp = [[1] * n for _ in range(m)]
        
        # First row and column are already initialized to 1
        # Fill the dp table
        for i in range(1, m):
            for j in range(1, n):
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
        
        return dp[m - 1][n - 1]

# Approach 2: Space Optimized (1D DP)
class UniquePaths:
    def uniquePaths(self, m: int, n: int) -> int:
        dp = [1] * n
        
        for i in range(1, m):
            for j in range(1, n):
                dp[j] += dp[j - 1]
        
        return dp[n - 1]

# Approach 3: Mathematical Solution (Combinations)
class UniquePaths:
    def uniquePaths(self, m: int, n: int) -> int:
        # Total moves: (m-1) down + (n-1) right = m+n-2
        # Choose (m-1) positions for down moves: C(m+n-2, m-1)
        
        from math import comb
        return comb(m + n - 2, m - 1)
        
    # Alternative without using comb function
    def uniquePathsManual(self, m: int, n: int) -> int:
        result = 1
        moves = m + n - 2
        down = m - 1
        
        for i in range(1, down + 1):
            result = result * (moves - down + i) // i
        
        return result
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: 2D DP
class UniquePaths {
    uniquePaths(m, n) {
        const dp = Array(m).fill().map(() => Array(n).fill(1));
        
        // First row and column are already initialized to 1
        // Fill the dp table
        for (let i = 1; i < m; i++) {
            for (let j = 1; j < n; j++) {
                dp[i][j] = dp[i - 1][j] + dp[i][j - 1];
            }
        }
        
        return dp[m - 1][n - 1];
    }
}

// Approach 2: Space Optimized (1D DP)
class UniquePaths {
    uniquePaths(m, n) {
        const dp = new Array(n).fill(1);
        
        for (let i = 1; i < m; i++) {
            for (let j = 1; j < n; j++) {
                dp[j] += dp[j - 1];
            }
        }
        
        return dp[n - 1];
    }
}

// Approach 3: Mathematical Solution (Combinations)
class UniquePaths {
    uniquePaths(m, n) {
        // Total moves: (m-1) down + (n-1) right = m+n-2
        // Choose (m-1) positions for down moves: C(m+n-2, m-1)
        
        let result = 1;
        const moves = m + n - 2;
        const down = m - 1;
        
        for (let i = 1; i <= down; i++) {
            result = Math.floor(result * (moves - down + i) / i);
        }
        
        return result;
    }
}
```
  </div>
</div>

<p><strong>Complexity Analysis</strong>:</p>
<ul>
<li><strong>2D DP</strong>: Time O(m×n), Space O(m×n)</li>
<li><strong>1D DP</strong>: Time O(m×n), Space O(n)</li>
<li><strong>Mathematical</strong>: Time O(min(m,n)), Space O(1)</li>
</ul>

**Key Insights & Patterns**:
- Foundation for obstacle-based path problems
- Mathematical insight: combinations formula
- Space optimization using rolling array

**State Transition Explanation**:
```
dp[i][j] = dp[i-1][j] + dp[i][j-1]
```
Paths to current cell = paths from above + paths from left.

---

### 11. Jump Game

**🔗 LeetCode Link:** [Jump Game - LeetCode #55](https://leetcode.com/problems/jump-game/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What does it mean for a position to be "reachable"? How does reachability at one position affect reachability at future positions?
2. Is this primarily an optimization problem (finding the minimum jumps) or a decision problem (yes/no reachability)?
3. Can you think of a greedy approach? What would you want to maximize or track as you iterate through the array?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Reachability Analysis
> **Guided Question:** What does it mean for the last index to be reachable? How would you define reachability in terms of simpler subproblems?

<details>
<summary>💭 Think about it, then click to reveal</summary>

A position i is reachable if:
- It's the starting position (position 0), OR
- There exists some reachable position j < i where j + nums[j] >= i

This creates a DP formulation: `dp[i] = true` if there exists any j < i where `dp[j] = true AND j + nums[j] >= i`

The insight: reachability propagates forward. If you can reach position j, you can reach any position within nums[j] steps from j.

This is a **boolean DP** problem - you're checking possibility, not optimizing a value.
</details>

#### Step 2: DP vs Greedy Approach Discovery
> **Guided Question:** The DP solution is O(n²). Can you think of a more efficient approach? What if you track the "farthest position reachable so far"?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**DP Approach (O(n²))**: For each position, check all previous positions to see if any can reach it.

**Greedy Approach (O(n))**: Track `maxReach` = farthest position reachable so far.
- At position i: if i > maxReach, it's unreachable → return false
- Otherwise: update maxReach = max(maxReach, i + nums[i])
- If maxReach >= lastIndex, we can reach the end → return true

**Key insight**: You don't need to track exactly how to reach each position, just whether it's reachable. The greedy approach works because if you can reach position i, and i can reach further than your current max, then i becomes your new "best option."

This demonstrates that **sometimes greedy algorithms are optimal even when DP seems natural**.
</details>

#### Step 3: Alternative Perspective - Backward Analysis
> **Guided Question:** Instead of asking "can I reach the end from the start?", what if you ask "can I reach the start from the end?" How might this change your approach?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Backward DP approach**:
- Start from the last position (which can trivially "reach" the end)
- For each position going backward, check if it can jump to any "good" position
- A position is "good" if it can eventually reach the end

**Algorithm**:
```
lastGoodIndex = n-1
for i from n-2 to 0:
    if i + nums[i] >= lastGoodIndex:
        lastGoodIndex = i
return lastGoodIndex == 0
```

This is another O(n) solution that's conceptually different from the greedy approach but equally efficient.

**Pattern recognition**: Many DP problems can be solved both forward and backward - sometimes one direction is more intuitive or efficient.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing multiple approaches from memory:

**Step-by-step checklist (Greedy Forward):**
- [ ] Initialize maxReach = 0
- [ ] For each position i, check if i > maxReach (unreachable)
- [ ] If reachable, update maxReach = max(maxReach, i + nums[i])
- [ ] Early return true if maxReach >= lastIndex
- [ ] Return true after loop completion

**Step-by-step checklist (DP Boolean):**
- [ ] Create boolean array dp, set dp[0] = true
- [ ] For each position i, check all previous positions j
- [ ] If dp[j] && j + nums[j] >= i, set dp[i] = true
- [ ] Return dp[lastIndex]

**Step-by-step checklist (Backward Greedy):**
- [ ] Start with lastGoodIndex = n-1
- [ ] Iterate backward from n-2 to 0
- [ ] If i + nums[i] >= lastGoodIndex, update lastGoodIndex = i
- [ ] Return whether lastGoodIndex == 0

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does the greedy approach work? Can you prove it doesn't miss any solutions?
2. **Complexity Analysis:** Compare the time complexity of DP vs greedy approaches. Why is greedy better here?
3. **Trade-offs:** When would you choose DP over greedy? What does DP give you that greedy doesn't?
4. **Pattern Recognition:** What's the difference between this problem and "Jump Game II" (minimum jumps)? Why does that need DP/BFS?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the problem: ___/5
- [ ] Implementing brute force: ___/5  
- [ ] Implementing optimal solution: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Consider trying "Jump Game II" (minimum jumps) to see how optimization changes the approach

**Problem Statement**: Given an array where each element represents maximum jump length from that position, determine if you can reach the last index.

**Example**:
- Input: [2,3,1,1,4]
- Output: true (jump 1 step from index 0 to 1, then 3 steps to last index)

**Knowledge Prerequisites**:
- Greedy vs DP approaches
- Reachability analysis
- Boolean DP concepts

**First Principles**:
We can reach the last index if we can reach any position from which the last index is reachable.

**Problem-First Approach**:
1. **Identify pattern**: Reachability problem
2. **State definition**: `dp[i]` = true if position i is reachable
3. **Recurrence**: `dp[i] = true` if there exists j < i where `dp[j] = true` and `j + nums[j] >= i`
4. **Base case**: `dp[0] = true`

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: DP Solution
class JumpGame {
    public boolean canJump(int[] nums) {
        boolean[] dp = new boolean[nums.length];
        dp[0] = true;
        
        for (int i = 1; i < nums.length; i++) {
            for (int j = 0; j < i; j++) {
                if (dp[j] && j + nums[j] >= i) {
                    dp[i] = true;
                    break;
                }
            }
        }
        
        return dp[nums.length - 1];
    }
}

// Approach 2: Greedy Solution (More Efficient)
class JumpGame {
    public boolean canJump(int[] nums) {
        int maxReach = 0;
        
        for (int i = 0; i < nums.length; i++) {
            if (i > maxReach) return false;
            maxReach = Math.max(maxReach, i + nums[i]);
            if (maxReach >= nums.length - 1) return true;
        }
        
        return true;
    }
}

// Approach 3: Backward DP
class JumpGame {
    public boolean canJump(int[] nums) {
        int lastGoodIndex = nums.length - 1;
        
        for (int i = nums.length - 2; i >= 0; i--) {
            if (i + nums[i] >= lastGoodIndex) {
                lastGoodIndex = i;
            }
        }
        
        return lastGoodIndex == 0;
    }
}

// Approach 4: Recursive with Memoization
class JumpGame {
    public boolean canJump(int[] nums) {
        Boolean[] memo = new Boolean[nums.length];
        return helper(nums, 0, memo);
    }
    
    private boolean helper(int[] nums, int pos, Boolean[] memo) {
        if (pos >= nums.length - 1) return true;
        
        if (memo[pos] != null) return memo[pos];
        
        int maxJump = Math.min(pos + nums[pos], nums.length - 1);
        for (int nextPos = pos + 1; nextPos <= maxJump; nextPos++) {
            if (helper(nums, nextPos, memo)) {
                memo[pos] = true;
                return true;
            }
        }
        
        memo[pos] = false;
        return false;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: DP Solution
class JumpGame:
    def canJump(self, nums):
        dp = [False] * len(nums)
        dp[0] = True
        
        for i in range(1, len(nums)):
            for j in range(i):
                if dp[j] and j + nums[j] >= i:
                    dp[i] = True
                    break
        
        return dp[-1]

# Approach 2: Greedy Solution (More Efficient)
class JumpGame:
    def canJump(self, nums):
        max_reach = 0
        
        for i in range(len(nums)):
            if i > max_reach:
                return False
            max_reach = max(max_reach, i + nums[i])
            if max_reach >= len(nums) - 1:
                return True
        
        return True

# Approach 3: Backward DP
class JumpGame:
    def canJump(self, nums):
        last_good_index = len(nums) - 1
        
        for i in range(len(nums) - 2, -1, -1):
            if i + nums[i] >= last_good_index:
                last_good_index = i
        
        return last_good_index == 0

# Approach 4: Recursive with Memoization
class JumpGame:
    def canJump(self, nums):
        memo = {}
        
        def helper(pos):
            if pos >= len(nums) - 1:
                return True
            
            if pos in memo:
                return memo[pos]
            
            max_jump = min(pos + nums[pos], len(nums) - 1)
            for next_pos in range(pos + 1, max_jump + 1):
                if helper(next_pos):
                    memo[pos] = True
                    return True
            
            memo[pos] = False
            return False
        
        return helper(0)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: DP Solution
class JumpGame {
    canJump(nums) {
        const dp = new Array(nums.length).fill(false);
        dp[0] = true;
        
        for (let i = 1; i < nums.length; i++) {
            for (let j = 0; j < i; j++) {
                if (dp[j] && j + nums[j] >= i) {
                    dp[i] = true;
                    break;
                }
            }
        }
        
        return dp[nums.length - 1];
    }
}

// Approach 2: Greedy Solution (More Efficient)
class JumpGame {
    canJump(nums) {
        let maxReach = 0;
        
        for (let i = 0; i < nums.length; i++) {
            if (i > maxReach) return false;
            maxReach = Math.max(maxReach, i + nums[i]);
            if (maxReach >= nums.length - 1) return true;
        }
        
        return true;
    }
}

// Approach 3: Backward DP
class JumpGame {
    canJump(nums) {
        let lastGoodIndex = nums.length - 1;
        
        for (let i = nums.length - 2; i >= 0; i--) {
            if (i + nums[i] >= lastGoodIndex) {
                lastGoodIndex = i;
            }
        }
        
        return lastGoodIndex === 0;
    }
}

// Approach 4: Recursive with Memoization
class JumpGame {
    canJump(nums) {
        const memo = new Map();
        
        const helper = (pos) => {
            if (pos >= nums.length - 1) return true;
            
            if (memo.has(pos)) return memo.get(pos);
            
            const maxJump = Math.min(pos + nums[pos], nums.length - 1);
            for (let nextPos = pos + 1; nextPos <= maxJump; nextPos++) {
                if (helper(nextPos)) {
                    memo.set(pos, true);
                    return true;
                }
            }
            
            memo.set(pos, false);
            return false;
        };
        
        return helper(0);
    }
}
```
  </div>
</div>

<p><strong>Complexity Analysis</strong>:</p>
<ul>
<li><strong>DP</strong>: Time O(n²), Space O(n)</li>
<li><strong>Greedy</strong>: Time O(n), Space O(1)</li>
<li><strong>Backward</strong>: Time O(n), Space O(1)</li>
</ul>

**Key Insights & Patterns**:
- Sometimes greedy is better than DP
- DP useful for understanding, greedy for optimization
- Pattern for reachability problems

**State Transition Explanation**:
```
dp[i] = OR over all j where dp[j] = true AND j + nums[j] >= i
```

---

## Common DP Patterns Summary

### 1. Linear DP
- **Examples**: Climbing Stairs, House Robber, Decode Ways
- **Pattern**: `dp[i]` depends on previous few states
- **Template**: `dp[i] = f(dp[i-1], dp[i-2], ...)`

### 2. 2D DP
- **Examples**: Unique Paths, Longest Common Subsequence
- **Pattern**: Two dimensions representing two sequences/constraints
- **Template**: `dp[i][j] = f(dp[i-1][j], dp[i][j-1], dp[i-1][j-1])`

### 3. Optimization DP
- **Examples**: Coin Change, House Robber
- **Pattern**: Find minimum/maximum value
- **Template**: `dp[i] = min/max(option1, option2, ...)`

### 4. Counting DP
- **Examples**: Climbing Stairs, Decode Ways, Unique Paths
- **Pattern**: Count number of ways
- **Template**: `dp[i] = sum of all valid ways`

### 5. Boolean DP
- **Examples**: Word Break, Jump Game
- **Pattern**: Yes/No decisions
- **Template**: `dp[i] = OR/AND of conditions`

### 6. Subsequence DP
- **Examples**: Longest Increasing Subsequence, Longest Common Subsequence
- **Pattern**: Finding optimal subsequences
- **Template**: Compare elements and build optimal solution

---

## Space Optimization Techniques

### 1. Rolling Array
When current state only depends on previous few states:
```java
// Instead of: dp[i] = dp[i-1] + dp[i-2]
int prev2 = dp[0], prev1 = dp[1];
for (int i = 2; i <= n; i++) {
    int current = prev1 + prev2;
    prev2 = prev1;
    prev1 = current;
}
```

### 2. 1D Array for 2D Problems
When 2D DP only needs previous row:
```java
// Instead of: dp[i][j] = dp[i-1][j] + dp[i][j-1]
int[] dp = new int[n];
for (int i = 0; i < m; i++) {
    for (int j = 1; j < n; j++) {
        dp[j] += dp[j-1];
    }
}
```

### 3. In-Place Modification
When input array can be modified:
```java
// Use original array as DP table if constraints allow
for (int i = 1; i < nums.length; i++) {
    nums[i] = Math.max(nums[i-1], nums[i-2] + nums[i]);
}
```

### 4. Variable Swapping
For problems requiring only 2-3 previous states:
```java
int a = 0, b = 1;
for (int i = 2; i <= n; i++) {
    int temp = a + b;
    a = b;
    b = temp;
}
```

---

## Final Tips for DP Mastery

### Recognition Patterns:
1. **Keywords**: "optimal", "maximum", "minimum", "count ways", "possible"
2. **Structure**: Choices at each step, overlapping subproblems
3. **Constraints**: Limited resources, adjacent restrictions

### Problem-Solving Strategy:
1. **Start with recursion** - understand the problem structure
2. **Identify overlapping subproblems** - where memoization helps
3. **Define state clearly** - what parameters uniquely identify a subproblem
4. **Write recurrence relation** - how states relate to each other
5. **Handle base cases** - boundary conditions
6. **Implement top-down** - recursive with memoization
7. **Convert to bottom-up** - iterative tabulation
8. **Optimize space** - reduce memory usage if possible

### Common Mistakes to Avoid:
1. Not handling base cases properly
2. Off-by-one errors in array indexing
3. Forgetting to initialize DP table
4. Incorrect state definition
5. Missing edge cases (empty input, single element)

This study guide provides a comprehensive foundation for mastering Dynamic Programming concepts through the Blind 75 problems. Practice implementing both top-down and bottom-up approaches for each problem to build strong DP intuition.