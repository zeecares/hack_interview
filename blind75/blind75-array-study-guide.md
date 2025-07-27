# Blind 75 Array Problems - Comprehensive Study Guide

## Table of Contents
1. [Two Sum](#1-two-sum)
2. [Best Time to Buy and Sell Stock](#2-best-time-to-buy-and-sell-stock)
3. [Contains Duplicate](#3-contains-duplicate)
4. [Product of Array Except Self](#4-product-of-array-except-self)
5. [Maximum Subarray](#5-maximum-subarray)
6. [Maximum Product Subarray](#6-maximum-product-subarray)
7. [Find Minimum in Rotated Sorted Array](#7-find-minimum-in-rotated-sorted-array)
8. [Search in Rotated Sorted Array](#8-search-in-rotated-sorted-array)
9. [3Sum](#9-3sum)
10. [Container With Most Water](#10-container-with-most-water)

---

## 1. Two Sum

### Problem Statement
Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to target. You may assume that each input would have exactly one solution, and you may not use the same element twice.

**Example:**
```
Input: nums = [2,7,11,15], target = 9
Output: [0,1]
Explanation: nums[0] + nums[1] = 2 + 7 = 9
```

### Knowledge Prerequisites
- Arrays and array indexing
- HashMap/HashTable operations (put, get, containsKey)
- Time/space complexity analysis
- Nested loops and early termination

### First Principles
The core insight is the **complement relationship**: if we need two numbers that sum to a target, and we know one number, we can calculate what the other number must be. Instead of checking all pairs, we can store seen numbers and check if their complement exists.

### Problem-First Approach

**Step 1: Understand the constraint**
- We need exactly two numbers that sum to target
- Cannot use same element twice
- Guaranteed to have exactly one solution

**Step 2: Naive approach reasoning**
- Check every pair: for each element, check if any later element sums to target
- This requires nested loops: O(n²) time

**Step 3: Optimization insight**
- Instead of checking all future elements, what if we remember past elements?
- For current number `x`, we need complement `target - x`
- If we've seen the complement before, we found our answer

**Step 4: Data structure choice**
- Need fast lookup: HashMap provides O(1) average lookup
- Store: value → index mapping

### Multiple Java Solutions

#### Solution 1: Brute Force (Intuitive)
```java
public int[] twoSum(int[] nums, int target) {
    // Check every possible pair
    for (int i = 0; i < nums.length; i++) {
        for (int j = i + 1; j < nums.length; j++) {
            // If current pair sums to target, return their indices
            if (nums[i] + nums[j] == target) {
                return new int[]{i, j};
            }
        }
    }
    // Should never reach here given problem constraints
    return new int[0];
}
```

#### Solution 2: HashMap - One Pass (Optimal)
```java
public int[] twoSum(int[] nums, int target) {
    // Map to store: value -> index
    Map<Integer, Integer> numToIndex = new HashMap<>();
    
    for (int i = 0; i < nums.length; i++) {
        int currentNum = nums[i];
        int complement = target - currentNum;
        
        // Check if complement exists in our seen numbers
        if (numToIndex.containsKey(complement)) {
            // Found the pair! Return indices
            return new int[]{numToIndex.get(complement), i};
        }
        
        // Store current number and its index for future lookups
        numToIndex.put(currentNum, i);
    }
    
    // Should never reach here given problem constraints
    return new int[0];
}
```

#### Solution 3: HashMap - Two Pass (Alternative)
```java
public int[] twoSum(int[] nums, int target) {
    Map<Integer, Integer> numToIndex = new HashMap<>();
    
    // First pass: populate the map
    for (int i = 0; i < nums.length; i++) {
        numToIndex.put(nums[i], i);
    }
    
    // Second pass: find complement
    for (int i = 0; i < nums.length; i++) {
        int complement = target - nums[i];
        // Make sure we don't use the same element twice
        if (numToIndex.containsKey(complement) && numToIndex.get(complement) != i) {
            return new int[]{i, numToIndex.get(complement)};
        }
    }
    
    return new int[0];
}
```

### Complexity Analysis

**Brute Force:**
- Time: O(n²) - for each element, we check all remaining elements
- Space: O(1) - only using constant extra space

**HashMap One Pass:**
- Time: O(n) - single pass through array, O(1) HashMap operations
- Space: O(n) - worst case, we store all elements in HashMap

**HashMap Two Pass:**
- Time: O(n) - two separate O(n) passes
- Space: O(n) - store all elements in HashMap

### Key Insights & Patterns

1. **Complement Pattern**: When looking for pairs with specific sum, think about storing one element and checking for its complement
2. **Trade Space for Time**: HashMap trades O(n) space for O(n) time improvement
3. **Single vs Multiple Pass**: One pass is more efficient but requires careful handling of same-element edge case
4. **Index Tracking**: When problem asks for indices (not values), store value→index mapping

### Common Pitfalls

1. **Using same element twice**: In one-pass solution, checking complement before storing current element prevents this
2. **Returning values instead of indices**: Problem specifically asks for indices
3. **Assuming sorted input**: Array is not necessarily sorted
4. **Off-by-one errors**: Ensure inner loop starts at `i+1` in brute force
5. **HashMap collision handling**: Java's HashMap handles this, but be aware of worst-case O(n) lookup time

### Follow-up Questions

1. **What if multiple solutions exist?** Modify to return all pairs or just the first found
2. **What if no solution exists?** Current implementation assumes solution exists
3. **What if array is sorted?** Two-pointer technique becomes viable: O(n) time, O(1) space
4. **What if we want three numbers that sum to target?** Extends to 3Sum problem
5. **Memory optimization?** Could we solve with O(1) space if array is sorted?

**Sorted Array Two-Pointer Solution:**
```java
// Only works if array is sorted and we can modify return format
public int[] twoSumSorted(int[] nums, int target) {
    int left = 0, right = nums.length - 1;
    
    while (left < right) {
        int sum = nums[left] + nums[right];
        if (sum == target) {
            return new int[]{left, right}; // or the actual values
        } else if (sum < target) {
            left++;
        } else {
            right--;
        }
    }
    return new int[0];
}
```

---

## 2. Best Time to Buy and Sell Stock

### Problem Statement
You are given an array `prices` where `prices[i]` is the price of a given stock on the ith day. You want to maximize your profit by choosing a single day to buy the stock and a different day in the future to sell it. Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

**Example:**
```
Input: prices = [7,1,5,3,6,4]
Output: 5
Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
```

### Knowledge Prerequisites
- Array traversal and indexing
- Min/max tracking variables
- Understanding of profit calculation
- Single-pass algorithm design
- Kadane's algorithm concepts (for advanced understanding)

### First Principles
The key insight is that to maximize profit, we want to **buy at the lowest price and sell at the highest price after that**. We must buy before we sell (can't time travel), so we need to track the minimum price seen so far and calculate profit at each potential selling day.

### Problem-First Approach

**Step 1: Understand the constraints**
- Must buy before selling (buy day < sell day)
- Only one transaction allowed
- If no profit possible, return 0

**Step 2: Naive approach**
- Try every possible buy-sell pair
- For each buy day, check all future sell days
- Track maximum profit found

**Step 3: Key insight**
- For any selling day, the best buying day is the cheapest day before it
- We can track the minimum price seen so far
- At each day, calculate profit if we sell today vs best possible buy day

**Step 4: Algorithm design**
- Single pass through array
- Track minimum price seen so far
- Track maximum profit seen so far
- Update both as we process each day

### Multiple Java Solutions

#### Solution 1: Brute Force (Intuitive)
```java
public int maxProfit(int[] prices) {
    int maxProfit = 0;
    
    // Try every possible buy day
    for (int buyDay = 0; buyDay < prices.length; buyDay++) {
        // For each buy day, try every possible sell day after it
        for (int sellDay = buyDay + 1; sellDay < prices.length; sellDay++) {
            int profit = prices[sellDay] - prices[buyDay];
            maxProfit = Math.max(maxProfit, profit);
        }
    }
    
    return maxProfit;
}
```

#### Solution 2: Single Pass with Min Tracking (Optimal)
```java
public int maxProfit(int[] prices) {
    if (prices == null || prices.length < 2) {
        return 0; // Need at least 2 days to make a transaction
    }
    
    int minPrice = prices[0];  // Cheapest price seen so far
    int maxProfit = 0;         // Best profit achieved so far
    
    for (int i = 1; i < prices.length; i++) {
        int currentPrice = prices[i];
        
        // Calculate profit if we sell today (bought at minPrice)
        int profitIfSellToday = currentPrice - minPrice;
        
        // Update maximum profit if today's sale would be better
        maxProfit = Math.max(maxProfit, profitIfSellToday);
        
        // Update minimum price if today's price is cheaper
        minPrice = Math.min(minPrice, currentPrice);
    }
    
    return maxProfit;
}
```

#### Solution 3: Kadane's Algorithm Perspective
```java
public int maxProfit(int[] prices) {
    if (prices == null || prices.length < 2) {
        return 0;
    }
    
    // Think of this as finding maximum subarray sum in price differences
    int maxProfit = 0;
    int maxEndingHere = 0;
    
    for (int i = 1; i < prices.length; i++) {
        // Daily price change (could be profit or loss)
        int dailyChange = prices[i] - prices[i - 1];
        
        // Either extend previous sequence or start new sequence
        maxEndingHere = Math.max(dailyChange, maxEndingHere + dailyChange);
        
        // Track overall maximum
        maxProfit = Math.max(maxProfit, maxEndingHere);
    }
    
    return maxProfit;
}
```

#### Solution 4: Explicit Buy/Sell State Tracking
```java
public int maxProfit(int[] prices) {
    if (prices == null || prices.length < 2) {
        return 0;
    }
    
    // hold: maximum profit when holding stock
    // sold: maximum profit when not holding stock (after selling)
    int hold = -prices[0];  // Bought stock on day 0
    int sold = 0;           // Haven't sold anything yet
    
    for (int i = 1; i < prices.length; i++) {
        int currentPrice = prices[i];
        
        // Update in specific order to avoid using updated values
        int newSold = Math.max(sold, hold + currentPrice);  // Sell today or keep previous
        int newHold = Math.max(hold, -currentPrice);        // Keep holding or buy today
        
        sold = newSold;
        hold = newHold;
    }
    
    return sold; // We should end up having sold the stock
}
```

### Complexity Analysis

**Brute Force:**
- Time: O(n²) - nested loops checking all buy-sell pairs
- Space: O(1) - only using constant variables

**Single Pass with Min Tracking:**
- Time: O(n) - single pass through array
- Space: O(1) - only using two variables

**Kadane's Algorithm:**
- Time: O(n) - single pass through array
- Space: O(1) - only using two variables

**State Tracking:**
- Time: O(n) - single pass through array
- Space: O(1) - only using two state variables

### Key Insights & Patterns

1. **Greedy Choice**: At each step, we make the locally optimal choice (buy at lowest price seen so far)
2. **State Compression**: We only need to remember the minimum price, not all previous prices
3. **Maximum Subarray Connection**: Can be viewed as finding maximum sum of contiguous price differences
4. **Dynamic Programming**: State tracking solution demonstrates DP principles with O(1) space
5. **Single Pass Efficiency**: Many optimization problems can be solved in one pass with proper state tracking

### Common Pitfalls

1. **Selling before buying**: Ensure sell day > buy day
2. **Negative profit handling**: Problem asks for 0 if no profit possible, not negative values
3. **Empty or single-element arrays**: Need at least 2 days for a transaction
4. **Integer overflow**: Generally not an issue with typical constraints, but be aware
5. **Updating order in state tracking**: Update derived values before base values to avoid corruption

### Follow-up Questions

1. **Multiple transactions allowed?** Leads to "Best Time to Buy and Sell Stock II"
2. **At most k transactions?** Leads to "Best Time to Buy and Sell Stock IV"
3. **With transaction fee?** Leads to "Best Time to Buy and Sell Stock with Transaction Fee"
4. **With cooldown period?** Leads to "Best Time to Buy and Sell Stock with Cooldown"
5. **What if we can predict future prices?** Changes the algorithm entirely

**Multiple Transactions Solution (Buy and Sell Stock II):**
```java
public int maxProfitMultiple(int[] prices) {
    int totalProfit = 0;
    
    // Capture every profitable opportunity
    for (int i = 1; i < prices.length; i++) {
        if (prices[i] > prices[i - 1]) {
            totalProfit += prices[i] - prices[i - 1];
        }
    }
    
    return totalProfit;
}
```

---

## 3. Contains Duplicate

### Problem Statement
Given an integer array `nums`, return `true` if any value appears at least twice in the array, and return `false` if every element is distinct.

**Example:**
```
Input: nums = [1,2,3,1]
Output: true

Input: nums = [1,2,3,4]
Output: false
```

### Knowledge Prerequisites
- HashSet operations (add, contains)
- Set data structure properties
- Array iteration
- Early termination in loops
- Understanding of duplicate detection algorithms

### First Principles
To detect duplicates, we need to remember what elements we've seen before. As we encounter each element, we check if we've seen it previously. If yes, we found a duplicate. If we finish checking all elements without finding duplicates, the array contains only distinct elements.

### Problem-First Approach

**Step 1: Understand what constitutes a duplicate**
- Same value appearing more than once
- Position doesn't matter, only the value
- We need to return as soon as we find any duplicate

**Step 2: Consider different approaches**
- Compare every element with every other element: O(n²)
- Sort first, then check adjacent elements: O(n log n)
- Use additional data structure to track seen elements: O(n)

**Step 3: Optimize for early detection**
- We can return `true` immediately upon finding first duplicate
- No need to count duplicates, just detect existence

**Step 4: Choose appropriate data structure**
- Need fast lookup to check if element was seen before
- HashSet provides O(1) average time for add and contains operations

### Multiple Java Solutions

#### Solution 1: Brute Force (Intuitive)
```java
public boolean containsDuplicate(int[] nums) {
    // Check every element against every other element
    for (int i = 0; i < nums.length; i++) {
        for (int j = i + 1; j < nums.length; j++) {
            // If we find two identical elements, we have a duplicate
            if (nums[i] == nums[j]) {
                return true;
            }
        }
    }
    
    // No duplicates found after checking all pairs
    return false;
}
```

#### Solution 2: HashSet (Optimal)
```java
public boolean containsDuplicate(int[] nums) {
    Set<Integer> seen = new HashSet<>();
    
    for (int num : nums) {
        // If we've seen this number before, it's a duplicate
        if (seen.contains(num)) {
            return true;
        }
        // Remember this number for future comparisons
        seen.add(num);
    }
    
    // Processed all elements without finding duplicates
    return false;
}
```

#### Solution 3: HashSet with Size Check (Alternative)
```java
public boolean containsDuplicate(int[] nums) {
    Set<Integer> uniqueElements = new HashSet<>();
    
    // Add all elements to set
    for (int num : nums) {
        uniqueElements.add(num);
    }
    
    // If set size < array length, there were duplicates
    return uniqueElements.size() < nums.length;
}
```

#### Solution 4: Sorting Approach
```java
public boolean containsDuplicate(int[] nums) {
    // Sort the array first
    Arrays.sort(nums);
    
    // Check adjacent elements for duplicates
    for (int i = 1; i < nums.length; i++) {
        if (nums[i] == nums[i - 1]) {
            return true;
        }
    }
    
    return false;
}
```

#### Solution 5: Stream API (Functional Style)
```java
public boolean containsDuplicate(int[] nums) {
    // Convert to stream, collect to set, compare sizes
    return Arrays.stream(nums)
                 .boxed()
                 .collect(Collectors.toSet())
                 .size() < nums.length;
}
```

### Complexity Analysis

**Brute Force:**
- Time: O(n²) - for each element, check all remaining elements
- Space: O(1) - no additional data structures

**HashSet (Early Termination):**
- Time: O(n) average, O(n²) worst case (hash collisions)
- Space: O(n) - worst case, store all elements in set

**HashSet (Size Check):**
- Time: O(n) average - must process all elements
- Space: O(n) - store all unique elements

**Sorting:**
- Time: O(n log n) - dominated by sorting
- Space: O(1) or O(log n) depending on sorting algorithm

**Stream API:**
- Time: O(n) average - similar to HashSet size check
- Space: O(n) - creates set of all elements

### Key Insights & Patterns

1. **Early Termination**: When looking for existence of condition, return immediately upon finding it
2. **Space-Time Tradeoff**: HashSet uses O(n) space to achieve O(n) time vs O(1) space with O(n²) time
3. **Preprocessing Strategy**: Sorting allows O(n log n) solution with O(1) extra space
4. **Set Properties**: Sets automatically handle uniqueness, making size comparison a valid approach
5. **Hash-based Detection**: Fundamental pattern for duplicate detection in arrays

### Common Pitfalls

1. **Hash collision considerations**: While rare, be aware of worst-case O(n²) time for HashSet
2. **Memory usage**: HashSet approach uses additional memory proportional to input size
3. **Modifying input**: Sorting approach modifies the original array
4. **Null handling**: Consider how to handle null values if they're allowed
5. **Integer overflow**: Generally not relevant for this problem, but consider in variations

### Follow-up Questions

1. **What if array contains duplicates of specific elements?** Count frequency of each element
2. **Find the duplicate element instead of just detecting?** Modify to return the duplicate value
3. **What if memory is extremely limited?** Sorting approach uses O(1) extra space
4. **What if we need to find all duplicates?** Collect all elements that appear more than once
5. **What if duplicates must be within k distance?** Use sliding window with HashSet

**Find All Duplicates:**
```java
public List<Integer> findDuplicates(int[] nums) {
    Map<Integer, Integer> frequency = new HashMap<>();
    List<Integer> duplicates = new ArrayList<>();
    
    // Count frequencies
    for (int num : nums) {
        frequency.put(num, frequency.getOrDefault(num, 0) + 1);
    }
    
    // Collect elements that appear more than once
    for (Map.Entry<Integer, Integer> entry : frequency.entrySet()) {
        if (entry.getValue() > 1) {
            duplicates.add(entry.getKey());
        }
    }
    
    return duplicates;
}
```

**Contains Duplicate Within K Distance:**
```java
public boolean containsNearbyDuplicate(int[] nums, int k) {
    Set<Integer> window = new HashSet<>();
    
    for (int i = 0; i < nums.length; i++) {
        // Remove element that's now outside the window
        if (i > k) {
            window.remove(nums[i - k - 1]);
        }
        
        // Check if current element is in window
        if (window.contains(nums[i])) {
            return true;
        }
        
        // Add current element to window
        window.add(nums[i]);
    }
    
    return false;
}
```

---

## 4. Product of Array Except Self

### Problem Statement
Given an integer array `nums`, return an array `answer` such that `answer[i]` is equal to the product of all the elements of `nums` except `nums[i]`. The algorithm must run in O(n) time and without using the division operation.

**Example:**
```
Input: nums = [1,2,3,4]
Output: [24,12,8,6]
Explanation: 
answer[0] = 2*3*4 = 24
answer[1] = 1*3*4 = 12
answer[2] = 1*2*4 = 8
answer[3] = 1*2*3 = 6
```

### Knowledge Prerequisites
- Array manipulation and indexing
- Understanding of mathematical products
- Prefix and suffix computations
- Space optimization techniques
- Handling edge cases (zeros in array)

### First Principles
For each position `i`, we need the product of all elements except `nums[i]`. This can be decomposed into: `product of all elements to the left of i` × `product of all elements to the right of i`. We can compute these left and right products efficiently using prefix and suffix product arrays.

### Problem-First Approach

**Step 1: Understand the mathematical relationship**
- For index `i`: result[i] = (product of nums[0]...nums[i-1]) × (product of nums[i+1]...nums[n-1])
- This is left_product[i] × right_product[i]

**Step 2: Consider naive approach**
- For each index, calculate product of all other elements: O(n²)
- Use division: calculate total product, divide by current element (but division not allowed)

**Step 3: Optimize with preprocessing**
- Pre-compute left products: left[i] = product of all elements to left of i
- Pre-compute right products: right[i] = product of all elements to right of i
- Result: result[i] = left[i] × right[i]

**Step 4: Space optimization**
- Can we compute left and right products in the result array itself?
- Use result array for left products first, then multiply by right products in second pass

### Multiple Java Solutions

#### Solution 1: Separate Left and Right Arrays (Intuitive)
```java
public int[] productExceptSelf(int[] nums) {
    int n = nums.length;
    
    // Arrays to store left and right products
    int[] leftProducts = new int[n];
    int[] rightProducts = new int[n];
    int[] result = new int[n];
    
    // Calculate left products
    // leftProducts[i] = product of all elements to the left of i
    leftProducts[0] = 1; // No elements to the left of first element
    for (int i = 1; i < n; i++) {
        leftProducts[i] = leftProducts[i - 1] * nums[i - 1];
    }
    
    // Calculate right products
    // rightProducts[i] = product of all elements to the right of i
    rightProducts[n - 1] = 1; // No elements to the right of last element
    for (int i = n - 2; i >= 0; i--) {
        rightProducts[i] = rightProducts[i + 1] * nums[i + 1];
    }
    
    // Combine left and right products
    for (int i = 0; i < n; i++) {
        result[i] = leftProducts[i] * rightProducts[i];
    }
    
    return result;
}
```

#### Solution 2: Space Optimized - Single Result Array (Optimal)
```java
public int[] productExceptSelf(int[] nums) {
    int n = nums.length;
    int[] result = new int[n];
    
    // First pass: Calculate left products and store in result
    result[0] = 1;
    for (int i = 1; i < n; i++) {
        result[i] = result[i - 1] * nums[i - 1];
    }
    
    // Second pass: Calculate right products on the fly and multiply
    int rightProduct = 1;
    for (int i = n - 1; i >= 0; i--) {
        result[i] = result[i] * rightProduct; // result[i] contains left product
        rightProduct *= nums[i]; // Update rightProduct for next iteration
    }
    
    return result;
}
```

#### Solution 3: Division Approach (Not Allowed but Educational)
```java
// This approach is NOT allowed by problem constraints but shows the intuition
public int[] productExceptSelfWithDivision(int[] nums) {
    int n = nums.length;
    int[] result = new int[n];
    
    // Calculate total product
    int totalProduct = 1;
    int zeroCount = 0;
    for (int num : nums) {
        if (num == 0) {
            zeroCount++;
        } else {
            totalProduct *= num;
        }
    }
    
    // Handle different cases based on zero count
    for (int i = 0; i < n; i++) {
        if (zeroCount > 1) {
            result[i] = 0; // Multiple zeros mean all results are 0
        } else if (zeroCount == 1) {
            result[i] = (nums[i] == 0) ? totalProduct : 0;
        } else {
            result[i] = totalProduct / nums[i]; // No zeros
        }
    }
    
    return result;
}
```

#### Solution 4: Recursive Approach (Educational)
```java
public int[] productExceptSelf(int[] nums) {
    int[] result = new int[nums.length];
    calculateProducts(nums, 0, 1, 1, result);
    return result;
}

private void calculateProducts(int[] nums, int index, int leftProduct, int rightProduct, int[] result) {
    if (index == nums.length) {
        return;
    }
    
    // Calculate product of everything to the right
    int totalRightProduct = 1;
    for (int i = index + 1; i < nums.length; i++) {
        totalRightProduct *= nums[i];
    }
    
    result[index] = leftProduct * totalRightProduct;
    
    // Recurse for next index
    calculateProducts(nums, index + 1, leftProduct * nums[index], rightProduct, result);
}
```

### Complexity Analysis

**Separate Arrays:**
- Time: O(n) - three separate O(n) passes
- Space: O(n) - additional arrays for left and right products (excluding result array)

**Space Optimized:**
- Time: O(n) - two passes through the array
- Space: O(1) - only using constant extra variables (excluding result array)

**Division Approach:**
- Time: O(n) - two passes (calculate product, then fill result)
- Space: O(1) - only using constant extra variables

**Recursive:**
- Time: O(n²) - for each position, calculates right product from scratch
- Space: O(n) - recursion call stack

### Key Insights & Patterns

1. **Decomposition**: Break complex computation into simpler parts (left × right)
2. **Prefix/Suffix Pattern**: Many array problems benefit from preprocessing cumulative values
3. **Space Optimization**: Reuse result array to store intermediate computations
4. **Two-Pass Technique**: First pass for one direction, second pass for the other
5. **In-Place Computation**: Modify result during second pass while computing on-the-fly

### Common Pitfalls

1. **Index boundaries**: Careful with first and last elements having no left/right neighbors
2. **Integer overflow**: Products can become very large very quickly
3. **Zero handling**: Special cases when array contains zeros (see division approach)
4. **Space complexity counting**: Result array typically doesn't count toward space complexity
5. **Modifying input**: Don't modify the original nums array

### Follow-up Questions

1. **What if division was allowed?** Calculate total product, divide by each element
2. **What if array contains zeros?** Need special handling based on number of zeros
3. **What about negative numbers?** Algorithm works the same, just track sign changes
4. **Memory constraints for very large arrays?** Could process in chunks if needed
5. **What if we need products of subarrays?** Extends to range product queries

**Handling Zeros with Division:**
```java
public int[] productExceptSelfWithZeros(int[] nums) {
    int n = nums.length;
    int[] result = new int[n];
    
    int product = 1;
    int zeroCount = 0;
    int zeroIndex = -1;
    
    // Calculate product of non-zero elements and count zeros
    for (int i = 0; i < n; i++) {
        if (nums[i] == 0) {
            zeroCount++;
            zeroIndex = i;
        } else {
            product *= nums[i];
        }
    }
    
    if (zeroCount > 1) {
        // Multiple zeros: all results are 0
        Arrays.fill(result, 0);
    } else if (zeroCount == 1) {
        // Exactly one zero: only that position gets the product
        Arrays.fill(result, 0);
        result[zeroIndex] = product;
    } else {
        // No zeros: normal division approach
        for (int i = 0; i < n; i++) {
            result[i] = product / nums[i];
        }
    }
    
    return result;
}
```

**Range Product Queries:**
```java
class ProductRangeQuery {
    private int[] prefixProducts;
    
    public ProductRangeQuery(int[] nums) {
        int n = nums.length;
        prefixProducts = new int[n + 1];
        prefixProducts[0] = 1;
        
        for (int i = 0; i < n; i++) {
            prefixProducts[i + 1] = prefixProducts[i] * nums[i];
        }
    }
    
    public int queryProduct(int left, int right) {
        // Product of elements from index left to right (inclusive)
        return prefixProducts[right + 1] / prefixProducts[left];
    }
}
```

---

## 5. Maximum Subarray

### Problem Statement
Given an integer array `nums`, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

**Example:**
```
Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
Output: 6
Explanation: [4,-1,2,1] has the largest sum = 6.
```

### Knowledge Prerequisites
- Array traversal and manipulation
- Understanding of subarray vs subsequence
- Dynamic programming concepts
- Kadane's algorithm
- Divide and conquer approach
- Handling negative numbers

### First Principles
The key insight is that at each position, we have a choice: either extend the previous subarray by including the current element, or start a new subarray from the current element. We choose whichever gives us a larger sum. This greedy choice leads to the globally optimal solution.

### Problem-First Approach

**Step 1: Understand subarray definition**
- Contiguous elements (no gaps allowed)
- Must contain at least one element
- Can be the entire array or just one element

**Step 2: Brute force reasoning**
- Check every possible subarray: start from each index, extend to every possible end
- Track the maximum sum found

**Step 3: Key optimization insight**
- At any position `i`, if the sum up to `i-1` is negative, it's better to start fresh from `i`
- If the sum up to `i-1` is positive, it's beneficial to include it with `nums[i]`

**Step 4: Kadane's algorithm**
- Track: current subarray sum ending at current position
- Track: global maximum sum seen so far
- At each step: decide whether to extend or restart

### Multiple Java Solutions

#### Solution 1: Brute Force (Intuitive)
```java
public int maxSubArray(int[] nums) {
    int maxSum = Integer.MIN_VALUE;
    
    // Try every possible starting position
    for (int start = 0; start < nums.length; start++) {
        int currentSum = 0;
        
        // Try every possible ending position from current start
        for (int end = start; end < nums.length; end++) {
            currentSum += nums[end]; // Extend subarray to include nums[end]
            maxSum = Math.max(maxSum, currentSum);
        }
    }
    
    return maxSum;
}
```

#### Solution 2: Kadane's Algorithm (Optimal)
```java
public int maxSubArray(int[] nums) {
    // maxEndingHere: maximum sum of subarray ending at current position
    // maxSoFar: maximum sum found so far (global maximum)
    int maxEndingHere = nums[0];
    int maxSoFar = nums[0];
    
    for (int i = 1; i < nums.length; i++) {
        // Choice: extend previous subarray or start new one
        maxEndingHere = Math.max(nums[i], maxEndingHere + nums[i]);
        
        // Update global maximum if current subarray is better
        maxSoFar = Math.max(maxSoFar, maxEndingHere);
    }
    
    return maxSoFar;
}
```

#### Solution 3: Kadane's with Clearer Logic
```java
public int maxSubArray(int[] nums) {
    int currentSum = 0;    // Sum of current subarray
    int maxSum = Integer.MIN_VALUE; // Best sum found so far
    
    for (int num : nums) {
        // Add current element to existing subarray
        currentSum += num;
        
        // Update maximum if current subarray is better
        maxSum = Math.max(maxSum, currentSum);
        
        // If current sum becomes negative, start fresh
        if (currentSum < 0) {
            currentSum = 0;
        }
    }
    
    return maxSum;
}
```

#### Solution 4: Divide and Conquer
```java
public int maxSubArray(int[] nums) {
    return maxSubArrayHelper(nums, 0, nums.length - 1);
}

private int maxSubArrayHelper(int[] nums, int left, int right) {
    // Base case: single element
    if (left == right) {
        return nums[left];
    }
    
    int mid = left + (right - left) / 2;
    
    // Maximum subarray is either:
    // 1. Entirely in left half
    int leftMax = maxSubArrayHelper(nums, left, mid);
    
    // 2. Entirely in right half
    int rightMax = maxSubArrayHelper(nums, mid + 1, right);
    
    // 3. Crosses the middle point
    int crossMax = maxCrossingSubarray(nums, left, mid, right);
    
    return Math.max(Math.max(leftMax, rightMax), crossMax);
}

private int maxCrossingSubarray(int[] nums, int left, int mid, int right) {
    // Find maximum subarray that includes mid and extends left
    int leftSum = Integer.MIN_VALUE;
    int sum = 0;
    for (int i = mid; i >= left; i--) {
        sum += nums[i];
        leftSum = Math.max(leftSum, sum);
    }
    
    // Find maximum subarray that starts from mid+1 and extends right
    int rightSum = Integer.MIN_VALUE;
    sum = 0;
    for (int i = mid + 1; i <= right; i++) {
        sum += nums[i];
        rightSum = Math.max(rightSum, sum);
    }
    
    // Combine both halves
    return leftSum + rightSum;
}
```

#### Solution 5: Dynamic Programming (Explicit)
```java
public int maxSubArray(int[] nums) {
    int n = nums.length;
    
    // dp[i] = maximum sum of subarray ending at index i
    int[] dp = new int[n];
    dp[0] = nums[0];
    
    int maxSum = dp[0];
    
    for (int i = 1; i < n; i++) {
        // Either extend previous subarray or start new one
        dp[i] = Math.max(nums[i], dp[i - 1] + nums[i]);
        maxSum = Math.max(maxSum, dp[i]);
    }
    
    return maxSum;
}
```

### Complexity Analysis

**Brute Force:**
- Time: O(n²) - nested loops to check all subarrays
- Space: O(1) - only using constant variables

**Kadane's Algorithm:**
- Time: O(n) - single pass through array
- Space: O(1) - only using constant variables

**Divide and Conquer:**
- Time: O(n log n) - divide array log n times, O(n) work at each level
- Space: O(log n) - recursion stack depth

**Dynamic Programming:**
- Time: O(n) - single pass through array
- Space: O(n) - DP array (can be optimized to O(1))

### Key Insights & Patterns

1. **Greedy Choice Property**: Local optimal choices lead to global optimum
2. **Negative Sum Reset**: When cumulative sum becomes negative, starting fresh is optimal
3. **Dynamic Programming State**: "Maximum subarray ending at position i"
4. **Divide and Conquer**: Problem can be split, but crossing case requires special handling
5. **Space Optimization**: DP solution can be optimized to use O(1) space

### Common Pitfalls

1. **Empty subarray**: Problem states "at least one number" must be included
2. **All negative numbers**: Must return the least negative number, not zero
3. **Integer overflow**: Be careful with very large arrays or values
4. **Reset timing**: In clearer Kadane's, reset after updating maximum, not before
5. **Initialization**: Proper initialization of max values is crucial

### Follow-up Questions

1. **Return the actual subarray, not just the sum?** Track start and end indices
2. **Find k largest subarray sums?** Use modified approach with priority queue
3. **2D version (maximum rectangle)?** Extend using Kadane's for each row combination
4. **Circular array?** Handle wrap-around case separately
5. **With at most one deletion allowed?** Use two-state DP

**Return Actual Subarray:**
```java
public int[] maxSubArrayWithIndices(int[] nums) {
    int maxSum = nums[0];
    int currentSum = nums[0];
    int start = 0, end = 0, tempStart = 0;
    
    for (int i = 1; i < nums.length; i++) {
        if (currentSum < 0) {
            currentSum = nums[i];
            tempStart = i; // Potential new start
        } else {
            currentSum += nums[i];
        }
        
        if (currentSum > maxSum) {
            maxSum = currentSum;
            start = tempStart;
            end = i;
        }
    }
    
    // Return the actual subarray
    return Arrays.copyOfRange(nums, start, end + 1);
}
```

**Circular Array Maximum Subarray:**
```java
public int maxSubarraySumCircular(int[] nums) {
    // Case 1: Maximum subarray is non-circular (normal Kadane's)
    int normalMax = kadane(nums);
    
    // Case 2: Maximum subarray is circular
    // This equals total sum - minimum subarray
    int totalSum = Arrays.stream(nums).sum();
    
    // Find minimum subarray (invert signs and find maximum)
    int[] inverted = Arrays.stream(nums).map(x -> -x).toArray();
    int maxInverted = kadane(inverted);
    int minSubarray = -maxInverted;
    
    int circularMax = totalSum - minSubarray;
    
    // Handle edge case: all numbers are negative
    if (circularMax == 0) {
        return normalMax;
    }
    
    return Math.max(normalMax, circularMax);
}

private int kadane(int[] nums) {
    int maxSum = nums[0];
    int currentSum = nums[0];
    
    for (int i = 1; i < nums.length; i++) {
        currentSum = Math.max(nums[i], currentSum + nums[i]);
        maxSum = Math.max(maxSum, currentSum);
    }
    
    return maxSum;
}
```

---

## 6. Maximum Product Subarray

### Problem Statement
Given an integer array `nums`, find a contiguous non-empty subarray within the array that has the largest product, and return the product.

**Example:**
```
Input: nums = [2,3,-2,4]
Output: 6
Explanation: [2,3] has the largest product 6.

Input: nums = [-2,0,-1]
Output: 0
Explanation: The result cannot be 2, because [-2,-1] is not a subarray.
```

### Knowledge Prerequisites
- Understanding of subarray concept
- Handling positive and negative number products
- Dynamic programming principles
- Kadane's algorithm adaptation
- Integer overflow considerations
- Zero handling in products

### First Principles
Unlike sum (Maximum Subarray), product has unique challenges: negative numbers can become positive when multiplied by another negative, and zeros reset the product. We need to track both maximum and minimum products ending at each position, because a minimum (negative) product might become maximum when multiplied by a negative number.

### Problem-First Approach

**Step 1: Understand product behavior**
- Positive × Positive = Positive (larger)
- Negative × Negative = Positive (might be larger)
- Anything × Zero = Zero (resets product)
- Negative × Positive = Negative (might be smallest so far)

**Step 2: Why Kadane's algorithm needs modification**
- In maximum sum subarray, negative prefixes are always discarded
- In maximum product, negative values might become positive later
- We need to track both maximum and minimum products

**Step 3: Key insight**
- At each position, maintain both max and min product ending here
- Current element can be: standalone, extend max product, or extend min product
- When current element is negative, max and min might swap

**Step 4: Handle edge cases**
- Zero resets both max and min products
- Need at least one element in subarray
- Consider integer overflow for large products

### Multiple Java Solutions

#### Solution 1: Brute Force (Intuitive)
```java
public int maxProduct(int[] nums) {
    int maxProduct = Integer.MIN_VALUE;
    
    // Try every possible subarray
    for (int start = 0; start < nums.length; start++) {
        int currentProduct = 1;
        
        for (int end = start; end < nums.length; end++) {
            currentProduct *= nums[end];
            maxProduct = Math.max(maxProduct, currentProduct);
        }
    }
    
    return maxProduct;
}
```

#### Solution 2: Dynamic Programming - Track Max and Min (Optimal)
```java
public int maxProduct(int[] nums) {
    if (nums == null || nums.length == 0) {
        return 0;
    }
    
    // Track maximum and minimum product ending at current position
    int maxEndingHere = nums[0];
    int minEndingHere = nums[0];
    int globalMax = nums[0];
    
    for (int i = 1; i < nums.length; i++) {
        int current = nums[i];
        
        // If current number is negative, max and min will swap
        // So we consider all three possibilities
        int tempMax = Math.max(current, Math.max(maxEndingHere * current, minEndingHere * current));
        int tempMin = Math.min(current, Math.min(maxEndingHere * current, minEndingHere * current));
        
        maxEndingHere = tempMax;
        minEndingHere = tempMin;
        
        globalMax = Math.max(globalMax, maxEndingHere);
    }
    
    return globalMax;
}
```

#### Solution 3: Cleaner DP with Swap Logic
```java
public int maxProduct(int[] nums) {
    int maxSoFar = nums[0];
    int maxEndingHere = nums[0];
    int minEndingHere = nums[0];
    
    for (int i = 1; i < nums.length; i++) {
        // When current number is negative, swap max and min
        if (nums[i] < 0) {
            int temp = maxEndingHere;
            maxEndingHere = minEndingHere;
            minEndingHere = temp;
        }
        
        // Update max and min ending here
        maxEndingHere = Math.max(nums[i], maxEndingHere * nums[i]);
        minEndingHere = Math.min(nums[i], minEndingHere * nums[i]);
        
        // Update global maximum
        maxSoFar = Math.max(maxSoFar, maxEndingHere);
    }
    
    return maxSoFar;
}
```

#### Solution 4: Forward and Backward Pass
```java
public int maxProduct(int[] nums) {
    int n = nums.length;
    int maxProduct = nums[0];
    
    // Forward pass: left to right
    int product = 1;
    for (int i = 0; i < n; i++) {
        product *= nums[i];
        maxProduct = Math.max(maxProduct, product);
        
        // Reset if we hit zero
        if (product == 0) {
            product = 1;
        }
    }
    
    // Backward pass: right to left
    product = 1;
    for (int i = n - 1; i >= 0; i--) {
        product *= nums[i];
        maxProduct = Math.max(maxProduct, product);
        
        // Reset if we hit zero
        if (product == 0) {
            product = 1;
        }
    }
    
    return maxProduct;
}
```

#### Solution 5: Divide by Zero Strategy
```java
public int maxProduct(int[] nums) {
    // Split array by zeros and find max product in each segment
    List<List<Integer>> segments = new ArrayList<>();
    List<Integer> currentSegment = new ArrayList<>();
    
    for (int num : nums) {
        if (num == 0) {
            if (!currentSegment.isEmpty()) {
                segments.add(new ArrayList<>(currentSegment));
                currentSegment.clear();
            }
        } else {
            currentSegment.add(num);
        }
    }
    
    if (!currentSegment.isEmpty()) {
        segments.add(currentSegment);
    }
    
    int maxProduct = Integer.MIN_VALUE;
    
    // Consider zero as a potential answer
    for (int num : nums) {
        if (num == 0) {
            maxProduct = Math.max(maxProduct, 0);
            break;
        }
    }
    
    // Find max product in each non-zero segment
    for (List<Integer> segment : segments) {
        maxProduct = Math.max(maxProduct, maxProductInSegment(segment));
    }
    
    return maxProduct;
}

private int maxProductInSegment(List<Integer> nums) {
    if (nums.isEmpty()) return 0;
    
    int maxProduct = nums.get(0);
    int maxEndingHere = nums.get(0);
    int minEndingHere = nums.get(0);
    
    for (int i = 1; i < nums.size(); i++) {
        int current = nums.get(i);
        
        int tempMax = Math.max(current, Math.max(maxEndingHere * current, minEndingHere * current));
        int tempMin = Math.min(current, Math.min(maxEndingHere * current, minEndingHere * current));
        
        maxEndingHere = tempMax;
        minEndingHere = tempMin;
        
        maxProduct = Math.max(maxProduct, maxEndingHere);
    }
    
    return maxProduct;
}
```

### Complexity Analysis

**Brute Force:**
- Time: O(n²) - check all possible subarrays
- Space: O(1) - constant extra space

**DP with Max/Min Tracking:**
- Time: O(n) - single pass through array
- Space: O(1) - only tracking a few variables

**Forward/Backward Pass:**
- Time: O(n) - two passes through array
- Space: O(1) - constant extra space

**Divide by Zero:**
- Time: O(n) - linear scan plus processing segments
- Space: O(n) - storing segments (worst case: no zeros)

### Key Insights & Patterns

1. **Dual State Tracking**: Need both maximum and minimum due to negative number behavior
2. **Sign Consideration**: Negative numbers can flip max/min relationships
3. **Zero as Reset Point**: Zero breaks product continuity, creating natural segments
4. **Bidirectional Approach**: Forward and backward passes can capture different patterns
5. **Segment Processing**: Zeros naturally divide the problem into independent subproblems

### Common Pitfalls

1. **Forgetting minimum tracking**: Missing the case where two negatives make a positive
2. **Zero handling**: Not properly resetting or considering zero as a valid answer
3. **Integer overflow**: Products can become very large very quickly
4. **Sign flip logic**: Incorrectly handling when max and min should swap
5. **Empty array handling**: Edge case when array is empty or has no valid subarrays

### Follow-up Questions

1. **What if we allow empty subarrays?** Return max of 0 and computed result
2. **What if we need the actual subarray?** Track start and end indices along with products
3. **What about floating-point numbers?** Similar logic but different overflow considerations
4. **Maximum product with at most k negatives?** More complex DP with additional state
5. **Circular array version?** Similar to circular maximum subarray

**Track Actual Subarray:**
```java
public int[] maxProductSubarray(int[] nums) {
    int maxProduct = nums[0];
    int maxStart = 0, maxEnd = 0;
    
    for (int start = 0; start < nums.length; start++) {
        int product = 1;
        for (int end = start; end < nums.length; end++) {
            product *= nums[end];
            if (product > maxProduct) {
                maxProduct = product;
                maxStart = start;
                maxEnd = end;
            }
        }
    }
    
    return Arrays.copyOfRange(nums, maxStart, maxEnd + 1);
}
```

**Handle Floating Point:**
```java
public double maxProductDouble(double[] nums) {
    if (nums == null || nums.length == 0) {
        return 0.0;
    }
    
    double maxEndingHere = nums[0];
    double minEndingHere = nums[0];
    double maxSoFar = nums[0];
    
    for (int i = 1; i < nums.length; i++) {
        double current = nums[i];
        
        double tempMax = Math.max(current, Math.max(maxEndingHere * current, minEndingHere * current));
        double tempMin = Math.min(current, Math.min(maxEndingHere * current, minEndingHere * current));
        
        maxEndingHere = tempMax;
        minEndingHere = tempMin;
        
        maxSoFar = Math.max(maxSoFar, maxEndingHere);
    }
    
    return maxSoFar;
}
```

---

## 7. Find Minimum in Rotated Sorted Array

### Problem Statement
Suppose an array of length `n` sorted in ascending order is rotated between `1` and `n` times. Given the sorted rotated array `nums` of unique elements, return the minimum element of this array. You must write an algorithm that runs in O(log n) time.

**Example:**
```
Input: nums = [3,4,5,1,2]
Output: 1
Explanation: The original array was [1,2,3,4,5] rotated 3 times.

Input: nums = [4,5,6,7,0,1,2]
Output: 0
```

### Knowledge Prerequisites
- Binary search algorithm and its variations
- Understanding of rotated sorted arrays
- Array indexing and boundary conditions
- Sorted array properties
- Invariant maintenance in binary search

### First Principles
A rotated sorted array has a unique property: it consists of two sorted subarrays. The minimum element is always at the start of the second sorted subarray (or the first element if no rotation occurred). We can use binary search by determining which half contains the rotation point based on comparing middle element with boundary elements.

### Problem-First Approach

**Step 1: Understand rotation properties**
- Original: [1,2,3,4,5] → Rotated: [3,4,5,1,2]
- The array has at most one "break point" where large value is followed by small value
- Minimum element is at the rotation point

**Step 2: Identify the pattern**
- If no rotation: array is normally sorted, minimum is first element
- If rotated: there are two sorted segments, minimum is start of second segment
- The rotation point is where nums[i] > nums[i+1]

**Step 3: Binary search adaptation**
- Cannot use normal binary search because we're not searching for a specific value
- Need to determine which half contains the rotation point
- Use comparison with boundary elements to decide direction

**Step 4: Decision criteria**
- Compare middle with right boundary to determine which side has rotation
- If nums[mid] > nums[right], rotation is in right half
- If nums[mid] < nums[right], rotation is in left half or no rotation

### Multiple Java Solutions

#### Solution 1: Linear Search (Not Optimal but Intuitive)
```java
public int findMin(int[] nums) {
    int min = nums[0];
    
    // Simply find the minimum element
    for (int i = 1; i < nums.length; i++) {
        min = Math.min(min, nums[i]);
    }
    
    return min;
}
```

#### Solution 2: Find Rotation Point
```java
public int findMin(int[] nums) {
    int n = nums.length;
    
    // If array is not rotated or single element
    if (nums[0] <= nums[n - 1]) {
        return nums[0];
    }
    
    // Find the rotation point
    for (int i = 0; i < n - 1; i++) {
        if (nums[i] > nums[i + 1]) {
            return nums[i + 1]; // This is the minimum
        }
    }
    
    return nums[0]; // Should not reach here
}
```

#### Solution 3: Binary Search (Optimal)
```java
public int findMin(int[] nums) {
    int left = 0;
    int right = nums.length - 1;
    
    while (left < right) {
        int mid = left + (right - left) / 2;
        
        // If middle element is greater than rightmost element,
        // the minimum must be in the right half
        if (nums[mid] > nums[right]) {
            left = mid + 1;
        } 
        // If middle element is less than rightmost element,
        // the minimum could be the middle element or in the left half
        else {
            right = mid;
        }
    }
    
    // When left == right, we found the minimum
    return nums[left];
}
```

#### Solution 4: Binary Search with Detailed Logic
```java
public int findMin(int[] nums) {
    int left = 0;
    int right = nums.length - 1;
    
    // If array is not rotated
    if (nums[left] <= nums[right]) {
        return nums[left];
    }
    
    while (left <= right) {
        int mid = left + (right - left) / 2;
        
        // Check if mid is the minimum element
        if (mid > 0 && nums[mid] < nums[mid - 1]) {
            return nums[mid];
        }
        
        // Check if mid + 1 is the minimum element
        if (mid < nums.length - 1 && nums[mid] > nums[mid + 1]) {
            return nums[mid + 1];
        }
        
        // Decide which half to search
        if (nums[mid] >= nums[left]) {
            // Left half is sorted, minimum is in right half
            left = mid + 1;
        } else {
            // Right half is sorted, minimum is in left half
            right = mid - 1;
        }
    }
    
    return nums[0]; // Should not reach here
}
```

#### Solution 5: Recursive Binary Search
```java
public int findMin(int[] nums) {
    return findMinHelper(nums, 0, nums.length - 1);
}

private int findMinHelper(int[] nums, int left, int right) {
    // Base case: single element or two elements
    if (left == right) {
        return nums[left];
    }
    
    if (right - left == 1) {
        return Math.min(nums[left], nums[right]);
    }
    
    // If array is not rotated in this range
    if (nums[left] < nums[right]) {
        return nums[left];
    }
    
    int mid = left + (right - left) / 2;
    
    // Minimum is in the half that contains the rotation
    if (nums[mid] > nums[right]) {
        return findMinHelper(nums, mid + 1, right);
    } else {
        return findMinHelper(nums, left, mid);
    }
}
```

### Complexity Analysis

**Linear Search:**
- Time: O(n) - scan entire array
- Space: O(1) - constant space

**Find Rotation Point:**
- Time: O(n) - worst case scan entire array
- Space: O(1) - constant space

**Binary Search (Iterative):**
- Time: O(log n) - binary search reduces space by half each iteration
- Space: O(1) - constant space

**Binary Search (Recursive):**
- Time: O(log n) - binary search reduces space by half each call
- Space: O(log n) - recursion call stack

### Key Insights & Patterns

1. **Rotation Point Detection**: The minimum is always at the rotation point
2. **Binary Search Adaptation**: Modified binary search based on comparing with boundaries
3. **Invariant Maintenance**: One half always contains the rotation point
4. **Boundary Comparison**: Compare middle with right (not left) to avoid confusion
5. **Early Termination**: Can detect non-rotated arrays early

### Common Pitfalls

1. **Comparing with left boundary**: Can lead to incorrect decisions in edge cases
2. **Off-by-one errors**: Incorrect boundary updates in binary search
3. **Equal elements**: This problem assumes unique elements, but variations exist
4. **Single element arrays**: Edge case that needs special handling
5. **Infinite loops**: Incorrect boundary update can cause infinite loops

### Follow-up Questions

1. **What if array contains duplicates?** Requires handling equals case differently
2. **Find the rotation count?** Count how many positions array was rotated
3. **Search for target in rotated array?** Combine with binary search for target
4. **Multiple rotations allowed?** Changes the problem structure significantly
5. **What if rotation direction is clockwise vs counterclockwise?** Affects the algorithm logic

**With Duplicates:**
```java
public int findMinWithDuplicates(int[] nums) {
    int left = 0;
    int right = nums.length - 1;
    
    while (left < right) {
        int mid = left + (right - left) / 2;
        
        if (nums[mid] > nums[right]) {
            left = mid + 1;
        } else if (nums[mid] < nums[right]) {
            right = mid;
        } else {
            // nums[mid] == nums[right], can't determine which side
            // Reduce right boundary by 1
            right--;
        }
    }
    
    return nums[left];
}
```

**Find Rotation Count:**
```java
public int findRotationCount(int[] nums) {
    int left = 0;
    int right = nums.length - 1;
    
    while (left < right) {
        // If array is not rotated in current range
        if (nums[left] <= nums[right]) {
            return left;
        }
        
        int mid = left + (right - left) / 2;
        
        if (nums[mid] > nums[right]) {
            left = mid + 1;
        } else {
            right = mid;
        }
    }
    
    return left; // Index of minimum element = rotation count
}
```

---

## 8. Search in Rotated Sorted Array

### Problem Statement
There is an integer array `nums` sorted in ascending order (with distinct values). Prior to being passed to your function, `nums` is possibly rotated at an unknown pivot index `k` such that the resulting array is `[nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]]`. Given the array `nums` after the possible rotation and an integer `target`, return the index of `target` if it is in `nums`, or `-1` if it is not in `nums`. You must write an algorithm with O(log n) runtime complexity.

**Example:**
```
Input: nums = [4,5,6,7,0,1,2], target = 0
Output: 4

Input: nums = [4,5,6,7,0,1,2], target = 3
Output: -1
```

### Knowledge Prerequisites
- Binary search algorithm and variations
- Understanding of rotated sorted arrays
- Sorted array properties and search strategies
- Invariant maintenance in modified binary search
- Handling edge cases in search algorithms

### First Principles
A rotated sorted array consists of two sorted subarrays. At any midpoint, at least one half is guaranteed to be properly sorted. We can determine which half is sorted by comparing the middle element with boundary elements, then decide whether the target could be in the sorted half or must be in the other half.

### Problem-First Approach

**Step 1: Understand the structure**
- Rotated array: [4,5,6,7,0,1,2] has two sorted parts: [4,5,6,7] and [0,1,2]
- At any midpoint, one side will be completely sorted
- The other side contains the rotation point

**Step 2: Key insight**
- Normal binary search works on sorted arrays
- In rotated array, we can still use binary search if we can determine which side is sorted
- Check if target lies in the sorted side; if yes, search there; otherwise, search the other side

**Step 3: Decision process**
- Find middle element
- Determine which half is sorted (left or right)
- Check if target is in the sorted half's range
- If yes, search in sorted half; if no, search in other half

**Step 4: Implementation strategy**
- Compare nums[left] with nums[mid] to determine if left half is sorted
- Compare nums[mid] with nums[right] to determine if right half is sorted
- Use range checks to see if target could be in the sorted portion

### Multiple Java Solutions

#### Solution 1: Find Rotation Point First
```java
public int search(int[] nums, int target) {
    int n = nums.length;
    
    // Find the rotation point (index of minimum element)
    int rotationIndex = findRotationIndex(nums);
    
    // Determine which part to search
    if (target >= nums[0] && target <= nums[rotationIndex - 1]) {
        // Target is in the left part
        return binarySearch(nums, 0, rotationIndex - 1, target);
    } else {
        // Target is in the right part
        return binarySearch(nums, rotationIndex, n - 1, target);
    }
}

private int findRotationIndex(int[] nums) {
    int left = 0, right = nums.length - 1;
    
    while (left < right) {
        int mid = left + (right - left) / 2;
        
        if (nums[mid] > nums[right]) {
            left = mid + 1;
        } else {
            right = mid;
        }
    }
    
    return left;
}

private int binarySearch(int[] nums, int left, int right, int target) {
    while (left <= right) {
        int mid = left + (right - left) / 2;
        
        if (nums[mid] == target) {
            return mid;
        } else if (nums[mid] < target) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    
    return -1;
}
```

#### Solution 2: One-Pass Binary Search (Optimal)
```java
public int search(int[] nums, int target) {
    int left = 0;
    int right = nums.length - 1;
    
    while (left <= right) {
        int mid = left + (right - left) / 2;
        
        if (nums[mid] == target) {
            return mid;
        }
        
        // Determine which side is sorted
        if (nums[left] <= nums[mid]) {
            // Left side is sorted
            if (target >= nums[left] && target < nums[mid]) {
                // Target is in the sorted left side
                right = mid - 1;
            } else {
                // Target is in the right side
                left = mid + 1;
            }
        } else {
            // Right side is sorted
            if (target > nums[mid] && target <= nums[right]) {
                // Target is in the sorted right side
                left = mid + 1;
            } else {
                // Target is in the left side
                right = mid - 1;
            }
        }
    }
    
    return -1;
}
```

#### Solution 3: Detailed Logic with Comments
```java
public int search(int[] nums, int target) {
    if (nums == null || nums.length == 0) {
        return -1;
    }
    
    int left = 0;
    int right = nums.length - 1;
    
    while (left <= right) {
        int mid = left + (right - left) / 2;
        
        // Found target
        if (nums[mid] == target) {
            return mid;
        }
        
        // Check if left half is sorted
        if (nums[left] <= nums[mid]) {
            // Left half is sorted from left to mid
            
            // Check if target lies in this sorted range
            if (nums[left] <= target && target < nums[mid]) {
                // Target is definitely in left half
                right = mid - 1;
            } else {
                // Target must be in right half (if it exists)
                left = mid + 1;
            }
        } else {
            // Right half is sorted from mid to right
            // (since left half is not sorted, rotation is in left half)
            
            // Check if target lies in this sorted range
            if (nums[mid] < target && target <= nums[right]) {
                // Target is definitely in right half
                left = mid + 1;
            } else {
                // Target must be in left half (if it exists)
                right = mid - 1;
            }
        }
    }
    
    return -1; // Target not found
}
```

#### Solution 4: Recursive Approach
```java
public int search(int[] nums, int target) {
    return searchHelper(nums, target, 0, nums.length - 1);
}

private int searchHelper(int[] nums, int target, int left, int right) {
    if (left > right) {
        return -1;
    }
    
    int mid = left + (right - left) / 2;
    
    if (nums[mid] == target) {
        return mid;
    }
    
    // Check which side is sorted
    if (nums[left] <= nums[mid]) {
        // Left side is sorted
        if (target >= nums[left] && target < nums[mid]) {
            return searchHelper(nums, target, left, mid - 1);
        } else {
            return searchHelper(nums, target, mid + 1, right);
        }
    } else {
        // Right side is sorted
        if (target > nums[mid] && target <= nums[right]) {
            return searchHelper(nums, target, mid + 1, right);
        } else {
            return searchHelper(nums, target, left, mid - 1);
        }
    }
}
```

#### Solution 5: Handle Edge Cases Explicitly
```java
public int search(int[] nums, int target) {
    if (nums == null || nums.length == 0) {
        return -1;
    }
    
    if (nums.length == 1) {
        return nums[0] == target ? 0 : -1;
    }
    
    int left = 0;
    int right = nums.length - 1;
    
    while (left <= right) {
        int mid = left + (right - left) / 2;
        
        if (nums[mid] == target) {
            return mid;
        }
        
        // Handle the case where left, mid, and right are all equal
        // (shouldn't happen with distinct values, but good practice)
        if (nums[left] == nums[mid] && nums[mid] == nums[right]) {
            left++;
            right--;
            continue;
        }
        
        // Determine sorted half
        if (nums[left] <= nums[mid]) {
            // Left half is sorted
            if (nums[left] <= target && target < nums[mid]) {
                right = mid - 1;
            } else {
                left = mid + 1;
            }
        } else {
            // Right half is sorted
            if (nums[mid] < target && target <= nums[right]) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
    }
    
    return -1;
}
```

### Complexity Analysis

**Find Rotation Point First:**
- Time: O(log n) + O(log n) = O(log n) - two binary searches
- Space: O(1) - constant extra space

**One-Pass Binary Search:**
- Time: O(log n) - single binary search with modified logic
- Space: O(1) - constant extra space

**Recursive Approach:**
- Time: O(log n) - binary search with recursion
- Space: O(log n) - recursion call stack

### Key Insights & Patterns

1. **Invariant Property**: At least one half is always sorted in a rotated array
2. **Range Checking**: Use sorted half properties to determine if target could be there
3. **Binary Search Adaptation**: Modify decision criteria based on which half is sorted
4. **Boundary Conditions**: Careful handling of equal cases and edge conditions
5. **One-Pass Efficiency**: Can solve without finding rotation point first

### Common Pitfalls

1. **Boundary comparisons**: Using `<` vs `<=` in range checks
2. **Equal element handling**: Edge case when nums[left] == nums[mid]
3. **Off-by-one errors**: Incorrect boundary updates
4. **Missing edge cases**: Empty arrays, single elements, no rotation
5. **Infinite loops**: Incorrect boundary updates causing loops

### Follow-up Questions

1. **What if array contains duplicates?** Need to handle equals case differently
2. **Find if target exists without returning index?** Simplified version of same logic
3. **Find insertion position for target?** Modify to return insertion index
4. **Search for range (start and end indices)?** Find leftmost and rightmost occurrences
5. **What if we need to find all rotated positions where target exists?** Different problem entirely

**With Duplicates (Search in Rotated Sorted Array II):**
```java
public boolean searchWithDuplicates(int[] nums, int target) {
    int left = 0;
    int right = nums.length - 1;
    
    while (left <= right) {
        int mid = left + (right - left) / 2;
        
        if (nums[mid] == target) {
            return true;
        }
        
        // Handle duplicates: when left, mid, right are equal
        if (nums[left] == nums[mid] && nums[mid] == nums[right]) {
            left++;
            right--;
        } else if (nums[left] <= nums[mid]) {
            // Left half is sorted
            if (nums[left] <= target && target < nums[mid]) {
                right = mid - 1;
            } else {
                left = mid + 1;
            }
        } else {
            // Right half is sorted
            if (nums[mid] < target && target <= nums[right]) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
    }
    
    return false;
}
```

**Find Insertion Position:**
```java
public int searchInsert(int[] nums, int target) {
    int left = 0;
    int right = nums.length - 1;
    
    while (left <= right) {
        int mid = left + (right - left) / 2;
        
        if (nums[mid] == target) {
            return mid;
        }
        
        // Determine which half is sorted and if target should be there
        if (nums[left] <= nums[mid]) {
            if (nums[left] <= target && target < nums[mid]) {
                right = mid - 1;
            } else {
                left = mid + 1;
            }
        } else {
            if (nums[mid] < target && target <= nums[right]) {
                left = mid + 1;
            } else {
                right = mid - 1;
            }
        }
    }
    
    return left; // Insertion position
}
```

---

## 9. 3Sum

### Problem Statement
Given an integer array `nums`, return all the triplets `[nums[i], nums[j], nums[k]]` such that `i != j`, `i != k`, and `j != k`, and `nums[i] + nums[j] + nums[k] == 0`. The solution set must not contain duplicate triplets.

**Example:**
```
Input: nums = [-1,0,1,2,-1,-4]
Output: [[-1,-1,2],[-1,0,1]]
Explanation: 
nums[0] + nums[1] + nums[2] = (-1) + 0 + 1 = 0.
nums[1] + nums[2] + nums[4] = 0 + 1 + (-1) = 0.
The distinct triplets are [-1,0,1] and [-1,-1,2].
```

### Knowledge Prerequisites
- Two-pointer technique
- Array sorting and its properties
- Handling duplicates in sorted arrays
- Set data structures for deduplication
- Three-nested-loop optimization strategies
- Understanding of complement relationships

### First Principles
The key insight is to reduce 3Sum to multiple 2Sum problems. Fix one element, then find pairs in the remaining array that sum to the negative of the fixed element. Sorting the array enables the two-pointer technique for efficient pair finding and easy duplicate handling.

### Problem-First Approach

**Step 1: Understand the constraints**
- Find triplets that sum to zero
- No duplicate triplets in result
- Different indices required (can't use same element multiple times)

**Step 2: Brute force approach**
- Check every possible triplet: O(n³)
- Use set to avoid duplicates
- This works but is inefficient

**Step 3: Optimization insight**
- Sort the array to enable two-pointer technique
- Fix first element, find pairs that sum to its negative
- Use two pointers to find pairs in O(n) time
- Skip duplicates while iterating

**Step 4: Duplicate handling**
- After sorting, duplicate values are adjacent
- Skip over duplicate values for first element and two-pointer search
- This ensures no duplicate triplets

### Multiple Java Solutions

#### Solution 1: Brute Force with Set (Intuitive)
```java
public List<List<Integer>> threeSum(int[] nums) {
    Set<List<Integer>> result = new HashSet<>();
    int n = nums.length;
    
    // Check every possible triplet
    for (int i = 0; i < n - 2; i++) {
        for (int j = i + 1; j < n - 1; j++) {
            for (int k = j + 1; k < n; k++) {
                if (nums[i] + nums[j] + nums[k] == 0) {
                    // Create sorted triplet to avoid duplicates
                    List<Integer> triplet = Arrays.asList(nums[i], nums[j], nums[k]);
                    Collections.sort(triplet);
                    result.add(triplet);
                }
            }
        }
    }
    
    return new ArrayList<>(result);
}
```

#### Solution 2: Sort + Two Pointers (Optimal)
```java
public List<List<Integer>> threeSum(int[] nums) {
    List<List<Integer>> result = new ArrayList<>();
    
    // Sort array to enable two-pointer technique
    Arrays.sort(nums);
    
    for (int i = 0; i < nums.length - 2; i++) {
        // Skip duplicates for the first element
        if (i > 0 && nums[i] == nums[i - 1]) {
            continue;
        }
        
        // Find pairs that sum to -nums[i]
        int target = -nums[i];
        int left = i + 1;
        int right = nums.length - 1;
        
        while (left < right) {
            int sum = nums[left] + nums[right];
            
            if (sum == target) {
                // Found a valid triplet
                result.add(Arrays.asList(nums[i], nums[left], nums[right]));
                
                // Skip duplicates for left and right pointers
                while (left < right && nums[left] == nums[left + 1]) {
                    left++;
                }
                while (left < right && nums[right] == nums[right - 1]) {
                    right--;
                }
                
                left++;
                right--;
            } else if (sum < target) {
                left++; // Need larger sum
            } else {
                right--; // Need smaller sum
            }
        }
    }
    
    return result;
}
```

#### Solution 3: HashMap Approach (Alternative)
```java
public List<List<Integer>> threeSum(int[] nums) {
    List<List<Integer>> result = new ArrayList<>();
    Arrays.sort(nums);
    
    for (int i = 0; i < nums.length - 2; i++) {
        // Skip duplicates for first element
        if (i > 0 && nums[i] == nums[i - 1]) {
            continue;
        }
        
        // Use HashMap for two-sum on remaining array
        Set<Integer> seen = new HashSet<>();
        int target = -nums[i];
        
        for (int j = i + 1; j < nums.length; j++) {
            int complement = target - nums[j];
            
            if (seen.contains(complement)) {
                result.add(Arrays.asList(nums[i], complement, nums[j]));
                
                // Skip duplicates for second element
                while (j + 1 < nums.length && nums[j] == nums[j + 1]) {
                    j++;
                }
            }
            seen.add(nums[j]);
        }
    }
    
    return result;
}
```

#### Solution 4: No Sort with Set Deduplication
```java
public List<List<Integer>> threeSum(int[] nums) {
    Set<List<Integer>> result = new HashSet<>();
    Set<Integer> duplicates = new HashSet<>();
    Map<Integer, Integer> seen = new HashMap<>();
    
    for (int i = 0; i < nums.length; i++) {
        if (duplicates.add(nums[i])) { // First time seeing this value
            for (int j = i + 1; j < nums.length; j++) {
                int complement = -nums[i] - nums[j];
                
                if (seen.containsKey(complement) && seen.get(complement) == i) {
                    List<Integer> triplet = Arrays.asList(nums[i], nums[j], complement);
                    Collections.sort(triplet);
                    result.add(triplet);
                }
                seen.put(nums[j], i);
            }
        }
    }
    
    return new ArrayList<>(result);
}
```

#### Solution 5: Optimized with Early Termination
```java
public List<List<Integer>> threeSum(int[] nums) {
    List<List<Integer>> result = new ArrayList<>();
    
    if (nums == null || nums.length < 3) {
        return result;
    }
    
    Arrays.sort(nums);
    
    for (int i = 0; i < nums.length - 2; i++) {
        // Early termination: if smallest element is positive, no solution possible
        if (nums[i] > 0) {
            break;
        }
        
        // Skip duplicates
        if (i > 0 && nums[i] == nums[i - 1]) {
            continue;
        }
        
        int target = -nums[i];
        int left = i + 1;
        int right = nums.length - 1;
        
        while (left < right) {
            int sum = nums[left] + nums[right];
            
            if (sum == target) {
                result.add(Arrays.asList(nums[i], nums[left], nums[right]));
                
                // Skip all duplicates for left
                while (left < right && nums[left] == nums[left + 1]) {
                    left++;
                }
                // Skip all duplicates for right
                while (left < right && nums[right] == nums[right - 1]) {
                    right--;
                }
                
                left++;
                right--;
            } else if (sum < target) {
                left++;
            } else {
                right--;
            }
        }
    }
    
    return result;
}
```

### Complexity Analysis

**Brute Force with Set:**
- Time: O(n³) - three nested loops
- Space: O(n) - for the result set (could be larger due to duplicates)

**Sort + Two Pointers:**
- Time: O(n²) - O(n log n) for sorting + O(n) for outer loop × O(n) for two pointers
- Space: O(1) - excluding space for result

**HashMap Approach:**
- Time: O(n²) - O(n log n) for sorting + O(n) for outer loop × O(n) for inner loop
- Space: O(n) - for the HashMap

**No Sort with Set:**
- Time: O(n²) - no sorting needed, but duplicate handling is more complex
- Space: O(n) - for various sets and maps

### Key Insights & Patterns

1. **Reduction to 2Sum**: Fix one element, solve 2Sum for the rest
2. **Sorting Benefits**: Enables two-pointer technique and easy duplicate handling
3. **Duplicate Skipping**: Skip adjacent duplicates to avoid duplicate triplets
4. **Two-Pointer Efficiency**: O(n) search for pairs in sorted array
5. **Early Termination**: Can stop early when patterns make solutions impossible

### Common Pitfalls

1. **Duplicate handling**: Missing duplicate skips leads to duplicate triplets
2. **Index management**: Ensuring i, j, k are different indices
3. **Off-by-one errors**: Incorrect loop bounds or pointer updates
4. **Integer overflow**: Sum of three integers might overflow
5. **Empty result handling**: Not handling cases where no triplets exist

### Follow-up Questions

1. **3Sum Closest**: Find triplet with sum closest to target
2. **4Sum**: Extend to find quadruplets that sum to target
3. **3Sum with multiplicity**: Count triplets considering duplicates
4. **3Sum smaller**: Count triplets with sum less than target
5. **k-Sum**: Generalize to k numbers that sum to target

**3Sum Closest:**
```java
public int threeSumClosest(int[] nums, int target) {
    Arrays.sort(nums);
    int closestSum = nums[0] + nums[1] + nums[2];
    
    for (int i = 0; i < nums.length - 2; i++) {
        int left = i + 1;
        int right = nums.length - 1;
        
        while (left < right) {
            int currentSum = nums[i] + nums[left] + nums[right];
            
            if (Math.abs(currentSum - target) < Math.abs(closestSum - target)) {
                closestSum = currentSum;
            }
            
            if (currentSum < target) {
                left++;
            } else if (currentSum > target) {
                right--;
            } else {
                return currentSum; // Exact match
            }
        }
    }
    
    return closestSum;
}
```

**4Sum:**
```java
public List<List<Integer>> fourSum(int[] nums, int target) {
    List<List<Integer>> result = new ArrayList<>();
    Arrays.sort(nums);
    
    for (int i = 0; i < nums.length - 3; i++) {
        if (i > 0 && nums[i] == nums[i - 1]) continue;
        
        for (int j = i + 1; j < nums.length - 2; j++) {
            if (j > i + 1 && nums[j] == nums[j - 1]) continue;
            
            int left = j + 1;
            int right = nums.length - 1;
            
            while (left < right) {
                long sum = (long)nums[i] + nums[j] + nums[left] + nums[right];
                
                if (sum == target) {
                    result.add(Arrays.asList(nums[i], nums[j], nums[left], nums[right]));
                    
                    while (left < right && nums[left] == nums[left + 1]) left++;
                    while (left < right && nums[right] == nums[right - 1]) right--;
                    
                    left++;
                    right--;
                } else if (sum < target) {
                    left++;
                } else {
                    right--;
                }
            }
        }
    }
    
    return result;
}
```

---

## 10. Container With Most Water

### Problem Statement
You are given an integer array `height` of length `n`. There are `n` vertical lines drawn such that the two endpoints of the `ith` line are `(i, 0)` and `(i, height[i])`. Find two lines that together with the x-axis form a container that can hold the most water. Return the maximum amount of water a container can store.

**Example:**
```
Input: height = [1,8,6,2,5,4,8,3,7]
Output: 49
Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. 
In this case, the max area of water (blue section) that the container can contain is 49.
```

### Knowledge Prerequisites
- Two-pointer technique
- Area calculation (width × height)
- Greedy algorithm principles
- Understanding of optimization problems
- Array traversal strategies

### First Principles
The area of water between two lines is determined by the shorter line (bottleneck) and the distance between them. The key insight is that moving the pointer at the taller line will never increase the area (since height is still limited by the shorter line, but width decreases). Therefore, we should always move the pointer at the shorter line to potentially find a taller line.

### Problem-First Approach

**Step 1: Understand the problem**
- Two lines form a container with the x-axis
- Water level is limited by the shorter of the two lines
- Area = min(height[i], height[j]) × (j - i)
- We want to maximize this area

**Step 2: Brute force reasoning**
- Try every possible pair of lines
- Calculate area for each pair
- Track maximum area found

**Step 3: Optimization insight**
- Start with widest possible container (leftmost and rightmost lines)
- The area is limited by the shorter line
- Moving the taller line inward will always decrease area (width decreases, height stays same)
- Moving the shorter line inward might increase area (height might increase)

**Step 4: Two-pointer strategy**
- Start with left = 0, right = n-1
- Always move the pointer at the shorter line
- This greedy approach guarantees we find the optimal solution

### Multiple Java Solutions

#### Solution 1: Brute Force (Intuitive)
```java
public int maxArea(int[] height) {
    int maxWater = 0;
    
    // Try every possible pair of lines
    for (int i = 0; i < height.length; i++) {
        for (int j = i + 1; j < height.length; j++) {
            // Calculate area between lines i and j
            int width = j - i;
            int minHeight = Math.min(height[i], height[j]);
            int area = width * minHeight;
            
            maxWater = Math.max(maxWater, area);
        }
    }
    
    return maxWater;
}
```

#### Solution 2: Two Pointers (Optimal)
```java
public int maxArea(int[] height) {
    int left = 0;
    int right = height.length - 1;
    int maxWater = 0;
    
    while (left < right) {
        // Calculate current area
        int width = right - left;
        int minHeight = Math.min(height[left], height[right]);
        int currentArea = width * minHeight;
        
        maxWater = Math.max(maxWater, currentArea);
        
        // Move pointer at shorter line
        if (height[left] < height[right]) {
            left++;
        } else {
            right--;
        }
    }
    
    return maxWater;
}
```

#### Solution 3: Two Pointers with Detailed Logic
```java
public int maxArea(int[] height) {
    if (height == null || height.length < 2) {
        return 0;
    }
    
    int left = 0;
    int right = height.length - 1;
    int maxWater = 0;
    
    while (left < right) {
        int leftHeight = height[left];
        int rightHeight = height[right];
        
        // Calculate area with current pair
        int width = right - left;
        int containerHeight = Math.min(leftHeight, rightHeight);
        int currentArea = width * containerHeight;
        
        // Update maximum area
        maxWater = Math.max(maxWater, currentArea);
        
        // Move the pointer at the shorter line
        // This is key: moving the taller line will never improve the result
        if (leftHeight <= rightHeight) {
            left++;
        } else {
            right--;
        }
    }
    
    return maxWater;
}
```

#### Solution 4: Two Pointers with Optimization
```java
public int maxArea(int[] height) {
    int left = 0;
    int right = height.length - 1;
    int maxWater = 0;
    
    while (left < right) {
        int leftHeight = height[left];
        int rightHeight = height[right];
        int width = right - left;
        
        // Calculate area and update maximum
        if (leftHeight < rightHeight) {
            maxWater = Math.max(maxWater, leftHeight * width);
            
            // Skip all lines shorter than or equal to current left line
            do {
                left++;
            } while (left < right && height[left] <= leftHeight);
        } else {
            maxWater = Math.max(maxWater, rightHeight * width);
            
            // Skip all lines shorter than or equal to current right line
            do {
                right--;
            } while (left < right && height[right] <= rightHeight);
        }
    }
    
    return maxWater;
}
```

#### Solution 5: Recursive Approach (Educational)
```java
public int maxArea(int[] height) {
    return maxAreaHelper(height, 0, height.length - 1);
}

private int maxAreaHelper(int[] height, int left, int right) {
    if (left >= right) {
        return 0;
    }
    
    // Calculate area with current bounds
    int width = right - left;
    int currentArea = Math.min(height[left], height[right]) * width;
    
    // Recursively explore by moving the shorter line
    int maxFromMovingLeft = 0;
    int maxFromMovingRight = 0;
    
    if (height[left] <= height[right]) {
        maxFromMovingLeft = maxAreaHelper(height, left + 1, right);
    }
    if (height[right] <= height[left]) {
        maxFromMovingRight = maxAreaHelper(height, left, right - 1);
    }
    
    return Math.max(currentArea, Math.max(maxFromMovingLeft, maxFromMovingRight));
}
```

### Complexity Analysis

**Brute Force:**
- Time: O(n²) - check all possible pairs
- Space: O(1) - constant extra space

**Two Pointers:**
- Time: O(n) - each element visited at most once
- Space: O(1) - constant extra space

**Two Pointers with Skipping:**
- Time: O(n) - still linear, but with fewer comparisons
- Space: O(1) - constant extra space

**Recursive:**
- Time: O(n) - each position visited once, but with overhead
- Space: O(n) - recursion call stack

### Key Insights & Patterns

1. **Greedy Strategy**: Always move the pointer at the shorter line
2. **Two-Pointer Technique**: Start wide and narrow down based on optimization criteria
3. **Bottleneck Principle**: Area is always limited by the shorter line
4. **Width vs Height Tradeoff**: As width decreases, height must increase to improve area
5. **Optimal Substructure**: Local optimal choices lead to global optimum

### Common Pitfalls

1. **Moving wrong pointer**: Moving the taller line pointer will never improve the result
2. **Off-by-one errors**: Incorrect loop termination conditions
3. **Integer overflow**: Width × height might overflow for large inputs
4. **Equal height handling**: When heights are equal, can move either pointer
5. **Empty array**: Not handling edge case of insufficient lines

### Follow-up Questions

1. **What if we want the actual indices of the optimal container?** Track indices along with maximum area
2. **What if we want k containers that don't overlap?** More complex dynamic programming problem
3. **What if lines have different widths?** Changes the area calculation
4. **3D version with depth?** Becomes a volume maximization problem
5. **What if we can remove at most one line?** Try removing each line and find maximum

**Track Optimal Indices:**
```java
public int[] maxAreaWithIndices(int[] height) {
    int left = 0;
    int right = height.length - 1;
    int maxWater = 0;
    int bestLeft = 0, bestRight = height.length - 1;
    
    while (left < right) {
        int width = right - left;
        int minHeight = Math.min(height[left], height[right]);
        int currentArea = width * minHeight;
        
        if (currentArea > maxWater) {
            maxWater = currentArea;
            bestLeft = left;
            bestRight = right;
        }
        
        if (height[left] < height[right]) {
            left++;
        } else {
            right--;
        }
    }
    
    return new int[]{bestLeft, bestRight, maxWater};
}
```

**Container with At Most One Removal:**
```java
public int maxAreaWithOneRemoval(int[] height) {
    int maxWithoutRemoval = maxArea(height);
    int maxWithRemoval = 0;
    
    // Try removing each line
    for (int i = 0; i < height.length; i++) {
        // Create array without element at index i
        int[] modified = new int[height.length - 1];
        int index = 0;
        for (int j = 0; j < height.length; j++) {
            if (j != i) {
                modified[index++] = height[j];
            }
        }
        
        maxWithRemoval = Math.max(maxWithRemoval, maxArea(modified));
    }
    
    return Math.max(maxWithoutRemoval, maxWithRemoval);
}
```

**Proof of Correctness for Two-Pointer Approach:**

The two-pointer approach works because of this key insight: if we have pointers at positions `i` and `j` where `height[i] <= height[j]`, then moving `j` inward will never produce a better result than we could get by moving `i` inward.

**Proof:** 
- Current area = `height[i] * (j - i)` (limited by shorter line at `i`)
- If we move `j` to `j-1`: area = `height[i] * (j-1-i)` (still limited by line at `i`)
- Since `(j-1-i) < (j-i)`, the new area is strictly smaller
- Therefore, we can safely move pointer `i` without missing any optimal solutions

This greedy choice property ensures that the two-pointer approach explores all potentially optimal solutions while maintaining O(n) time complexity.

---

## Summary and Key Takeaways

This comprehensive study guide covers all 10 Array problems from the Blind 75 list, providing multiple solution approaches, complexity analyses, and deep insights into problem-solving patterns. Here are the overarching themes and patterns:

### Universal Problem-Solving Patterns

1. **Two-Pointer Technique**: Used in Two Sum (sorted), 3Sum, Container With Most Water
2. **Hash-based Lookup**: Used in Two Sum, Contains Duplicate, Product of Array Except Self
3. **Dynamic Programming**: Used in Maximum Subarray, Maximum Product Subarray, Best Time to Buy and Sell Stock
4. **Binary Search Variations**: Used in Find Minimum and Search in Rotated Sorted Array
5. **Prefix/Suffix Processing**: Used in Product of Array Except Self, Maximum Subarray

### Key Optimization Strategies

1. **Space-Time Tradeoffs**: Trading O(n) space for O(n) time improvements
2. **Preprocessing**: Sorting arrays to enable efficient algorithms
3. **Single vs Multiple Pass**: Choosing between one-pass and multi-pass solutions
4. **Early Termination**: Stopping computation when result is determined
5. **Greedy Choices**: Making locally optimal decisions that lead to global optimum

### Common Implementation Considerations

1. **Edge Case Handling**: Empty arrays, single elements, all negative/positive numbers
2. **Duplicate Management**: Skipping duplicates in sorted arrays, using sets for deduplication
3. **Overflow Prevention**: Being aware of integer overflow in products and sums
4. **Boundary Conditions**: Careful index management in loops and binary search
5. **Invariant Maintenance**: Preserving important properties throughout algorithm execution

Each problem in this guide builds upon fundamental concepts while introducing unique challenges and optimization opportunities. Master these patterns, and you'll be well-prepared for a wide range of array-based interview questions and real-world programming challenges.