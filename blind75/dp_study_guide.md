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

**Java Solutions**:

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

**Complexity Analysis**:
- **Memoization**: Time O(n), Space O(n)
- **Tabulation**: Time O(n), Space O(n)
- **Space Optimized**: Time O(n), Space O(1)

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

**Java Solutions**:

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

**Complexity Analysis**:
- **Time**: O(amount × coins.length)
- **Space**: O(amount)

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

**Java Solutions**:

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

**Complexity Analysis**:
- **DP Approach**: Time O(n²), Space O(n)
- **Binary Search**: Time O(n log n), Space O(n)

**Key Insights & Patterns**:
- Classic subsequence optimization
- Binary search optimization technique
- Pattern for "longest/shortest subsequence" problems

**State Transition Explanation**:
```
dp[i] = max(dp[j] + 1) for all j < i where nums[j] < nums[i]
```
Each position considers extending all valid previous subsequences.

---

### 4. Longest Common Subsequence

**🔗 LeetCode Link:** [Longest Common Subsequence - LeetCode #1143](https://leetcode.com/problems/longest-common-subsequence/)

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

**Java Solutions**:

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

**Complexity Analysis**:
- **2D DP**: Time O(m×n), Space O(m×n)
- **Space Optimized**: Time O(m×n), Space O(min(m,n))

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

**Java Solutions**:

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

**Complexity Analysis**:
- **Time**: O(n² × m) where n = string length, m = average word length
- **Space**: O(n + W) where W = total characters in dictionary
- **Optimized**: O(n × maxWordLength × m)

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

**Java Solutions**:

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

**Complexity Analysis**:
- **Backtracking**: O(2^target) in worst case
- **DP Counting**: Time O(target × nums.length), Space O(target)

**Key Insights & Patterns**:
- Difference between listing solutions vs counting solutions
- DP for optimization, backtracking for enumeration
- Unbounded knapsack pattern for counting

---

### 7. House Robber

**🔗 LeetCode Link:** [House Robber - LeetCode #198](https://leetcode.com/problems/house-robber/)

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

**Java Solutions**:

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

**Complexity Analysis**:
- **Time**: O(n)
- **Space**: O(n) for DP array, O(1) for optimized version

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

**Java Solutions**:

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

**Complexity Analysis**:
- **Time**: O(n)
- **Space**: O(1)

**Key Insights & Patterns**:
- Circular constraints → multiple linear subproblems
- Pattern for breaking down complex constraints
- Reusing linear solutions for circular problems

**State Transition Explanation**:
Same as House Robber I, but applied to two different ranges to handle circular constraint.

---

### 9. Decode Ways

**🔗 LeetCode Link:** [Decode Ways - LeetCode #91](https://leetcode.com/problems/decode-ways/)

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

**Java Solutions**:

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

**Complexity Analysis**:
- **Time**: O(n)
- **Space**: O(n) for DP, O(1) for optimized

**Key Insights & Patterns**:
- Similar to Fibonacci but with validity constraints
- Pattern for string parsing with multiple interpretations
- Handling edge cases with invalid characters

**State Transition Explanation**:
```
dp[i] = (valid single digit ? dp[i-1] : 0) + (valid two digits ? dp[i-2] : 0)
```

---

### 10. Unique Paths

**🔗 LeetCode Link:** [Unique Paths - LeetCode #62](https://leetcode.com/problems/unique-paths/)

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

**Java Solutions**:

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

**Complexity Analysis**:
- **2D DP**: Time O(m×n), Space O(m×n)
- **1D DP**: Time O(m×n), Space O(n)
- **Mathematical**: Time O(min(m,n)), Space O(1)

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

**Java Solutions**:

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

**Complexity Analysis**:
- **DP**: Time O(n²), Space O(n)
- **Greedy**: Time O(n), Space O(1)
- **Backward**: Time O(n), Space O(1)

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