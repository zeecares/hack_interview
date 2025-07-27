# Blind 75 LeetCode Study Guide - Java Edition

## Overview

This study guide covers all 75 essential LeetCode problems for technical interview preparation. Each problem includes:
- **Knowledge Prerequisites**: Core concepts needed
- **First Principles**: Fundamental approach to problem-solving
- **Problem-First Approach**: Step-by-step thinking process
- **Java Solution**: Complete implementation with analysis
- **Time/Space Complexity**: Performance analysis
- **Key Insights**: Patterns and techniques for similar problems

---

## Problem 1: Two Sum (Array Category)

### Problem Statement
Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to target.

**Example:**
```
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: nums[0] + nums[1] = 2 + 7 = 9
```

### Knowledge Prerequisites
1. **Hash Tables/HashMap**: Key-value storage for O(1) lookup
2. **Array Traversal**: Iterating through arrays efficiently
3. **Complement Thinking**: For target sum, if we have `x`, we need `target - x`

### First Principles
- **Brute Force Insight**: Check every pair → O(n²) time
- **Optimization Insight**: Instead of checking all pairs, store what we've seen and check if complement exists
- **Trade-off**: Use extra space (HashMap) to reduce time complexity

### Problem-First Approach

1. **Understand the constraint**: Exactly one solution exists
2. **Think about what we need**: For each number, we need its complement
3. **Data structure choice**: HashMap to store number → index mapping
4. **Algorithm flow**:
   - For each number, check if its complement exists in our map
   - If yes, return indices
   - If no, add current number to map

### Java Solution

```java
import java.util.HashMap;
import java.util.Map;

public class Solution {
    public int[] twoSum(int[] nums, int target) {
        // HashMap to store number -> index mapping
        Map<Integer, Integer> numToIndex = new HashMap<>();
        
        for (int i = 0; i < nums.length; i++) {
            int complement = target - nums[i];
            
            // Check if complement exists in our map
            if (numToIndex.containsKey(complement)) {
                return new int[]{numToIndex.get(complement), i};
            }
            
            // Store current number and its index
            numToIndex.put(nums[i], i);
        }
        
        // Should never reach here given problem constraints
        throw new IllegalArgumentException("No solution found");
    }
}
```

### Complexity Analysis
- **Time Complexity**: O(n) - Single pass through array
- **Space Complexity**: O(n) - HashMap can store up to n elements

### Key Insights & Patterns
1. **Hash Table Pattern**: When you need to find pairs/complements, consider using HashMap
2. **One-Pass Technique**: Don't always need to preprocess - can check and store simultaneously
3. **Space-Time Tradeoff**: Classic example of using extra space to reduce time complexity

---

## Problem 2: Climbing Stairs (Dynamic Programming Category)

### Problem Statement
You are climbing a staircase. It takes `n` steps to reach the top. Each time you can either climb 1 or 2 steps. In how many distinct ways can you climb to the top?

**Example:**
```
Input: n = 3
Output: 3
Explanation: Three ways to climb to the top:
1. 1 step + 1 step + 1 step
2. 1 step + 2 steps
3. 2 steps + 1 step
```

### Knowledge Prerequisites
1. **Recursion**: Breaking problems into smaller subproblems
2. **Dynamic Programming**: Avoiding redundant calculations by storing results
3. **Fibonacci Sequence**: This problem follows Fibonacci pattern
4. **Base Cases**: Understanding when recursion should stop

### First Principles
- **Recursive Insight**: To reach step n, you must come from step (n-1) or step (n-2)
- **Mathematical Relation**: ways(n) = ways(n-1) + ways(n-2)
- **Optimization Need**: Naive recursion recalculates same values multiple times

### Problem-First Approach

1. **Identify the pattern**: 
   - n=1: 1 way (1)
   - n=2: 2 ways (1+1, 2)
   - n=3: 3 ways (1+1+1, 1+2, 2+1)
   - n=4: 5 ways...
2. **Recognize relationship**: Each step builds on previous two steps
3. **Choose approach**: Bottom-up DP for efficiency
4. **Optimize space**: Only need last two values, not entire array

### Java Solution

```java
public class Solution {
    // Approach 1: Bottom-up Dynamic Programming (Space Optimized)
    public int climbStairs(int n) {
        if (n <= 2) {
            return n;
        }
        
        // Only need to track previous two values
        int prev2 = 1; // ways to reach step 1
        int prev1 = 2; // ways to reach step 2
        
        for (int i = 3; i <= n; i++) {
            int current = prev1 + prev2;
            prev2 = prev1;
            prev1 = current;
        }
        
        return prev1;
    }
    
    // Approach 2: Top-down with Memoization (for learning)
    public int climbStairsMemo(int n) {
        int[] memo = new int[n + 1];
        return helper(n, memo);
    }
    
    private int helper(int n, int[] memo) {
        if (n <= 2) {
            return n;
        }
        
        if (memo[n] != 0) {
            return memo[n];
        }
        
        memo[n] = helper(n - 1, memo) + helper(n - 2, memo);
        return memo[n];
    }
}
```

### Complexity Analysis
- **Time Complexity**: O(n) - Process each step once
- **Space Complexity**: O(1) - Only use constant extra space (optimized version)
- **Memoization version**: O(n) space for memo array

### Key Insights & Patterns
1. **Fibonacci Pattern**: Many DP problems follow this f(n) = f(n-1) + f(n-2) pattern
2. **Space Optimization**: When DP only depends on previous few states, optimize space
3. **Bottom-up vs Top-down**: Bottom-up often more space efficient, top-down more intuitive
4. **Base Case Identification**: Critical for both recursive and iterative solutions

---

## Study Plan Structure

### Phase 1: Foundation (Problems 1-15)
Focus on basic patterns and data structures

### Phase 2: Intermediate (Problems 16-45) 
Complex algorithms and multiple pattern combinations

### Phase 3: Advanced (Problems 46-75)
Challenging problems requiring multiple techniques

### Practice Methodology
1. **Read problem** without looking at solution
2. **Identify category** and required knowledge
3. **Apply first principles** thinking
4. **Implement solution** in Java
5. **Analyze complexity** and optimize if possible
6. **Review patterns** and note for similar problems

---

## Next Steps
Once comfortable with these two examples, we'll generate similar detailed guides for all 75 problems, organized by category and difficulty progression.