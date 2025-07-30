---
render_with_liquid: false
---

# Interval Problems Study Guide - Blind 75 LeetCode Problems

## Table of Contents
1. [Introduction to Interval Problems](#introduction-to-interval-problems)
2. [Core Concepts and Prerequisites](#core-concepts-and-prerequisites)
3. [Problem-First Approach to Intervals](#problem-first-approach-to-intervals)
4. [The 5 Interval Problems](#the-5-interval-problems)
   - [1. Insert Interval](#1-insert-interval)
   - [2. Merge Intervals](#2-merge-intervals)
   - [3. Non-overlapping Intervals](#3-non-overlapping-intervals)
   - [4. Meeting Rooms](#4-meeting-rooms)
   - [5. Meeting Rooms II](#5-meeting-rooms-ii)
5. [Common Interval Patterns Summary](#common-interval-patterns-summary)
6. [Implementation Templates](#implementation-templates)

---

## Introduction to Interval Problems

Interval problems involve working with ranges of values, typically represented as `[start, end]` pairs. These problems are fundamental in scheduling, resource allocation, and time management algorithms. They frequently appear in system design contexts and real-world applications.

### Key Characteristics of Interval Problems:
1. **Range Representation**: Intervals typically represented as `[start, end]` or `(start, end)`
2. **Overlap Detection**: Determining when two intervals intersect
3. **Merging Strategy**: Combining overlapping or adjacent intervals
4. **Sorting Importance**: Most solutions require sorting by start or end times
5. **Greedy Approaches**: Many problems have optimal greedy solutions

### Common Applications:
- **Scheduling Systems**: Meeting rooms, calendar management
- **Resource Allocation**: CPU scheduling, memory management
- **Time Series Analysis**: Data processing, event handling
- **Computational Geometry**: Line segment intersection
- **Database Systems**: Range queries, index optimization

---

## Core Concepts and Prerequisites

### 1. Interval Representation

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
class Interval {
    int start;
    int end;
    Interval(int start, int end) {
        this.start = start;
        this.end = end;
    }
}

// Often represented as int[][] or List<int[]>
int[][] intervals = { {1,3}, {2,6}, {8,10} };
```
  </div>
  
  <div class="tab-content python">
```python
class Interval:
    def __init__(self, start, end):
        self.start = start
        self.end = end

# Often represented as list of lists or list of tuples
intervals = [[1,3], [2,6], [8,10]]
# Or as tuples: intervals = [(1,3), (2,6), (8,10)]
```
  </div>
  
  <div class="tab-content javascript">
```javascript
class Interval {
    constructor(start, end) {
        this.start = start;
        this.end = end;
    }
}

// Often represented as array of arrays
const intervals = [[1,3], [2,6], [8,10]];
```
  </div>
</div>

### 2. Overlap Detection
Two intervals `[a, b]` and `[c, d]` overlap if:
- `a <= d` and `c <= b`
- Equivalent: `Math.max(a, c) <= Math.min(b, d)`

### 3. Merging Intervals
To merge overlapping intervals `[a, b]` and `[c, d]`:
- New interval: `[Math.min(a, c), Math.max(b, d)]`

### 4. Sorting Strategies
- **By Start Time**: Most common, enables left-to-right processing
- **By End Time**: Useful for activity selection problems
- **Custom Comparators**: Sometimes need complex sorting logic

### 5. Greedy Algorithm Principles
- **Activity Selection**: Choose activities that finish earliest
- **Interval Scheduling**: Select maximum non-overlapping intervals
- **Sweep Line**: Process events in chronological order

---

## Problem-First Approach to Intervals

### How to Identify Interval Problems:
1. **Keywords**: "intervals", "ranges", "schedule", "meetings", "overlap"
2. **Input Format**: Arrays of pairs representing start/end times
3. **Operations**: Merging, inserting, counting overlaps
4. **Constraints**: Non-overlapping requirements, resource limitations

### Steps to Solve Interval Problems:
1. **Understand the interval format** - closed/open, inclusive/exclusive
2. **Identify the operation** - merge, insert, count, minimize
3. **Choose sorting strategy** - by start time, end time, or custom
4. **Apply appropriate algorithm** - greedy, sweep line, or merge
5. **Handle edge cases** - empty intervals, single interval, identical intervals
6. **Optimize if needed** - in-place operations, space efficiency

### Common Patterns:
1. **Merge Pattern**: Sort by start, merge overlapping intervals
2. **Insert Pattern**: Find position, handle overlaps on both sides
3. **Count Pattern**: Sort by end time, greedily select non-overlapping
4. **Resource Pattern**: Track resource usage over time using events

---

## The 5 Interval Problems

### 1. Insert Interval

**🔗 LeetCode Link:** [Insert Interval - LeetCode #57](https://leetcode.com/problems/insert-interval/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What are the different scenarios when inserting a new interval into a sorted array?
2. How would you identify which existing intervals need to be merged with the new one?
3. What information do you need to track while processing the intervals?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding the Core Challenge
> **Guided Question:** If you have a sorted array of non-overlapping intervals and need to insert a new interval, what are the three possible relationships between the new interval and any existing interval?

<details>
<summary>💭 Think about it, then click to reveal</summary>

There are exactly three relationships:
1. **No overlap (before)**: Existing interval ends before new interval starts
2. **Overlap**: Intervals intersect and need to be merged
3. **No overlap (after)**: Existing interval starts after new interval ends

This insight leads to a natural three-phase processing approach: handle intervals before, merge overlapping intervals, then handle intervals after.
</details>

#### Step 2: Naive Approach
> **Guided Question:** What would be a straightforward way to solve this without worrying about optimization?

<details>
<summary>💭 Think about it, then click to reveal</summary>

A naive approach:
1. Add the new interval to the array
2. Sort the entire array by start time
3. Apply the standard merge intervals algorithm

This works but is inefficient (O(n log n)) because we're not leveraging the fact that the input is already sorted.
</details>

#### Step 3: Optimized Three-Phase Strategy
> **Guided Question:** How can you leverage the sorted property to solve this in linear time?

<details>
<summary>💭 Think about it, then click to reveal</summary>

The key insight is to process intervals in three phases:
1. **Copy non-overlapping intervals that end before the new interval starts**
2. **Merge all overlapping intervals with the new interval** by expanding the new interval's boundaries
3. **Copy remaining intervals that start after the merged interval ends**

This maintains the sorted order and runs in O(n) time.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Initialize result list and index pointer
- [ ] Phase 1: Add intervals that end before newInterval starts
- [ ] Phase 2: Merge overlapping intervals by updating newInterval boundaries
- [ ] Phase 3: Add the merged interval and remaining intervals
- [ ] Convert result to array format

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Can you explain why the three-phase approach maintains sorted order?
2. **Complexity Analysis:** Why is this O(n) time instead of O(n log n)?
3. **Trade-offs:** What are the space complexity considerations for this problem?
4. **Pattern Recognition:** How does this approach generalize to other interval insertion problems?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the problem: ___/5
- [ ] Implementing brute force: ___/5  
- [ ] Implementing optimal solution: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Consider trying the follow-up questions for deeper understanding

**Problem Statement**: You are given an array of non-overlapping intervals sorted by start time. Insert a new interval and merge if necessary to maintain the non-overlapping property.

**Example**:
- Input: intervals = [[1,3],[6,9]], newInterval = [2,5]
- Output: [[1,5],[6,9]]

**Knowledge Prerequisites**:
- Interval merging concepts
- Binary search for optimization
- In-place array manipulation

**First Principles**:
To insert an interval into a sorted non-overlapping array:
1. Find intervals that don't overlap with new interval (before and after)
2. Merge all overlapping intervals with the new interval
3. Reconstruct the result array

**Problem-First Approach**:
1. **Identify non-overlapping regions**: Find intervals that end before new interval starts
2. **Merge overlapping region**: Combine all intervals that overlap with new interval
3. **Add remaining intervals**: Include intervals that start after new interval ends
4. **Handle edge cases**: Empty array, new interval at boundaries

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: Three-Phase Processing
class Solution {
    public int[][] insert(int[][] intervals, int[] newInterval) {
        List<int[]> result = new ArrayList<>();
        int i = 0;
        int n = intervals.length;
        
        // Phase 1: Add all intervals that end before newInterval starts
        while (i < n && intervals[i][1] < newInterval[0]) {
            result.add(intervals[i]);
            i++;
        }
        
        // Phase 2: Merge all overlapping intervals with newInterval
        while (i < n && intervals[i][0] <= newInterval[1]) {
            newInterval[0] = Math.min(newInterval[0], intervals[i][0]);
            newInterval[1] = Math.max(newInterval[1], intervals[i][1]);
            i++;
        }
        result.add(newInterval);
        
        // Phase 3: Add all remaining intervals
        while (i < n) {
            result.add(intervals[i]);
            i++;
        }
        
        return result.toArray(new int[result.size()][]);
    }
}

// Approach 2: Binary Search Optimization
class Solution {
    public int[][] insert(int[][] intervals, int[] newInterval) {
        if (intervals.length == 0) {
            return new int[][]{newInterval};
        }
        
        List<int[]> result = new ArrayList<>();
        
        // Binary search for insertion point
        int start = findInsertPosition(intervals, newInterval[0]);
        int end = findMergeEnd(intervals, newInterval[1]);
        
        // Add intervals before merge region
        for (int i = 0; i < start; i++) {
            result.add(intervals[i]);
        }
        
        // Create merged interval
        int mergeStart = Math.min(newInterval[0], 
                                 start < intervals.length ? intervals[start][0] : newInterval[0]);
        int mergeEnd = Math.max(newInterval[1],
                               end >= 0 ? intervals[end][1] : newInterval[1]);
        result.add(new int[]{mergeStart, mergeEnd});
        
        // Add intervals after merge region
        for (int i = end + 1; i < intervals.length; i++) {
            result.add(intervals[i]);
        }
        
        return result.toArray(new int[result.size()][]);
    }
    
    private int findInsertPosition(int[][] intervals, int target) {
        int left = 0, right = intervals.length;
        while (left < right) {
            int mid = left + (right - left) / 2;
            if (intervals[mid][0] < target) {
                left = mid + 1;
            } else {
                right = mid;
            }
        }
        return left;
    }
    
    private int findMergeEnd(int[][] intervals, int target) {
        int result = -1;
        for (int i = 0; i < intervals.length; i++) {
            if (intervals[i][0] <= target) {
                result = i;
            } else {
                break;
            }
        }
        return result;
    }
}

// Approach 3: In-Place with ArrayList Conversion
class Solution {
    public int[][] insert(int[][] intervals, int[] newInterval) {
        List<int[]> merged = new ArrayList<>();
        boolean inserted = false;
        
        for (int[] current : intervals) {
            if (newInterval[1] < current[0]) {
                // New interval ends before current starts
                if (!inserted) {
                    merged.add(newInterval);
                    inserted = true;
                }
                merged.add(current);
            } else if (newInterval[0] > current[1]) {
                // New interval starts after current ends
                merged.add(current);
            } else {
                // Overlap detected - merge intervals
                newInterval[0] = Math.min(newInterval[0], current[0]);
                newInterval[1] = Math.max(newInterval[1], current[1]);
            }
        }
        
        // Add newInterval if not yet inserted
        if (!inserted) {
            merged.add(newInterval);
        }
        
        return merged.toArray(new int[merged.size()][]);
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: Three-Phase Processing
class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        result = []
        i = 0
        n = len(intervals)
        
        # Phase 1: Add all intervals that end before newInterval starts
        while i < n and intervals[i][1] < newInterval[0]:
            result.append(intervals[i])
            i += 1
        
        # Phase 2: Merge all overlapping intervals with newInterval
        while i < n and intervals[i][0] <= newInterval[1]:
            newInterval[0] = min(newInterval[0], intervals[i][0])
            newInterval[1] = max(newInterval[1], intervals[i][1])
            i += 1
        result.append(newInterval)
        
        # Phase 3: Add all remaining intervals
        while i < n:
            result.append(intervals[i])
            i += 1
        
        return result

# Approach 2: Binary Search Optimization
class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        if not intervals:
            return [newInterval]
        
        result = []
        
        # Binary search for insertion point
        start = self.findInsertPosition(intervals, newInterval[0])
        end = self.findMergeEnd(intervals, newInterval[1])
        
        # Add intervals before merge region
        for i in range(start):
            result.append(intervals[i])
        
        # Create merged interval
        merge_start = min(newInterval[0], 
                         intervals[start][0] if start < len(intervals) else newInterval[0])
        merge_end = max(newInterval[1],
                       intervals[end][1] if end >= 0 else newInterval[1])
        result.append([merge_start, merge_end])
        
        # Add intervals after merge region
        for i in range(end + 1, len(intervals)):
            result.append(intervals[i])
        
        return result
    
    def findInsertPosition(self, intervals, target):
        left, right = 0, len(intervals)
        while left < right:
            mid = left + (right - left) // 2
            if intervals[mid][0] < target:
                left = mid + 1
            else:
                right = mid
        return left
    
    def findMergeEnd(self, intervals, target):
        result = -1
        for i in range(len(intervals)):
            if intervals[i][0] <= target:
                result = i
            else:
                break
        return result

# Approach 3: In-Place with List Processing
class Solution:
    def insert(self, intervals: List[List[int]], newInterval: List[int]) -> List[List[int]]:
        merged = []
        inserted = False
        
        for current in intervals:
            if newInterval[1] < current[0]:
                # New interval ends before current starts
                if not inserted:
                    merged.append(newInterval)
                    inserted = True
                merged.append(current)
            elif newInterval[0] > current[1]:
                # New interval starts after current ends
                merged.append(current)
            else:
                # Overlap detected - merge intervals
                newInterval[0] = min(newInterval[0], current[0])
                newInterval[1] = max(newInterval[1], current[1])
        
        # Add newInterval if not yet inserted
        if not inserted:
            merged.append(newInterval)
        
        return merged
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: Three-Phase Processing
var insert = function(intervals, newInterval) {
    const result = [];
    let i = 0;
    const n = intervals.length;
    
    // Phase 1: Add all intervals that end before newInterval starts
    while (i < n && intervals[i][1] < newInterval[0]) {
        result.push(intervals[i]);
        i++;
    }
    
    // Phase 2: Merge all overlapping intervals with newInterval
    while (i < n && intervals[i][0] <= newInterval[1]) {
        newInterval[0] = Math.min(newInterval[0], intervals[i][0]);
        newInterval[1] = Math.max(newInterval[1], intervals[i][1]);
        i++;
    }
    result.push(newInterval);
    
    // Phase 3: Add all remaining intervals
    while (i < n) {
        result.push(intervals[i]);
        i++;
    }
    
    return result;
};

// Approach 2: Binary Search Optimization
var insert = function(intervals, newInterval) {
    if (intervals.length === 0) {
        return [newInterval];
    }
    
    const result = [];
    
    // Binary search for insertion point
    const start = findInsertPosition(intervals, newInterval[0]);
    const end = findMergeEnd(intervals, newInterval[1]);
    
    // Add intervals before merge region
    for (let i = 0; i < start; i++) {
        result.push(intervals[i]);
    }
    
    // Create merged interval
    const mergeStart = Math.min(newInterval[0], 
                               start < intervals.length ? intervals[start][0] : newInterval[0]);
    const mergeEnd = Math.max(newInterval[1],
                             end >= 0 ? intervals[end][1] : newInterval[1]);
    result.push([mergeStart, mergeEnd]);
    
    // Add intervals after merge region
    for (let i = end + 1; i < intervals.length; i++) {
        result.push(intervals[i]);
    }
    
    return result;
};

function findInsertPosition(intervals, target) {
    let left = 0, right = intervals.length;
    while (left < right) {
        const mid = Math.floor(left + (right - left) / 2);
        if (intervals[mid][0] < target) {
            left = mid + 1;
        } else {
            right = mid;
        }
    }
    return left;
}

function findMergeEnd(intervals, target) {
    let result = -1;
    for (let i = 0; i < intervals.length; i++) {
        if (intervals[i][0] <= target) {
            result = i;
        } else {
            break;
        }
    }
    return result;
}

// Approach 3: In-Place with Array Processing
var insert = function(intervals, newInterval) {
    const merged = [];
    let inserted = false;
    
    for (const current of intervals) {
        if (newInterval[1] < current[0]) {
            // New interval ends before current starts
            if (!inserted) {
                merged.push(newInterval);
                inserted = true;
            }
            merged.push(current);
        } else if (newInterval[0] > current[1]) {
            // New interval starts after current ends
            merged.push(current);
        } else {
            // Overlap detected - merge intervals
            newInterval[0] = Math.min(newInterval[0], current[0]);
            newInterval[1] = Math.max(newInterval[1], current[1]);
        }
    }
    
    // Add newInterval if not yet inserted
    if (!inserted) {
        merged.push(newInterval);
    }
    
    return merged;
};
```
  </div>
</div>

{::options parse_block_html="true" /}

**Complexity Analysis**:
- **Time**: O(n) for linear scan, O(log n) for binary search optimization
- **Space**: O(n) for result array (can't avoid since we need to return new array)

{::options parse_block_html="false" /}

**Key Insights & Patterns**:
- Three-phase processing: before, merge, after
- Binary search can optimize finding merge boundaries
- Always maintain sorted order in result
- Merge by updating boundaries of new interval

**State Transition Explanation**:
```
For each interval in array:
  if interval.end < newInterval.start: add to result (no overlap)
  if interval.start > newInterval.end: add newInterval + remaining intervals
  else: merge interval with newInterval (update boundaries)
```

---

### 2. Merge Intervals

**🔗 LeetCode Link:** [Merge Intervals - LeetCode #56](https://leetcode.com/problems/merge-intervals/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. If intervals are given in random order, what preprocessing step would help solve this efficiently?
2. How can you determine if two intervals overlap, and how would you merge them?
3. What's the minimum information you need to track while processing intervals sequentially?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: The Sorting Insight
> **Guided Question:** Why would sorting the intervals by start time make this problem much easier to solve?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Sorting by start time ensures that:
1. **Sequential processing**: You only need to compare each interval with the previous merged interval
2. **No look-ahead required**: You never need to check intervals that come later
3. **Greedy approach works**: You can make locally optimal decisions that lead to the global optimum

Without sorting, you'd need to compare every interval with every other interval (O(n²)).
</details>

#### Step 2: Overlap Detection Strategy
> **Guided Question:** Once intervals are sorted by start time, how can you efficiently detect and handle overlaps?

<details>
<summary>💭 Think about it, then click to reveal</summary>

The key insight: if `currentInterval.end >= nextInterval.start`, they overlap.

When overlap is detected:
- **Merge**: Update the end time to `max(current.end, next.end)`
- **Keep**: Maintain the earlier start time (already guaranteed by sorting)

If no overlap: simply add the next interval to results.
</details>

#### Step 3: Implementation Approach
> **Guided Question:** What's the most efficient way to implement the merging process?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Efficient approach:
1. Sort intervals by start time
2. Initialize result with first interval
3. For each subsequent interval:
   - If it overlaps with the last merged interval: extend the end time
   - If no overlap: add it as a new interval

This maintains a single "current merge" interval and avoids complex state management.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Sort intervals by start time using comparator
- [ ] Initialize result list with first interval
- [ ] Iterate through remaining intervals
- [ ] Check overlap condition with last merged interval
- [ ] Either extend last interval or add new interval
- [ ] Convert result to array format

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why is the greedy approach optimal for this problem?
2. **Complexity Analysis:** What dominates the time complexity: sorting or merging?
3. **Trade-offs:** Could you solve this with less space? What would be the trade-offs?
4. **Pattern Recognition:** What other problems use this "sort then process sequentially" pattern?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the problem: ___/5
- [ ] Implementing brute force: ___/5  
- [ ] Implementing optimal solution: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Consider trying the follow-up questions for deeper understanding

**Problem Statement**: Given an array of intervals, merge all overlapping intervals and return an array of non-overlapping intervals.

**Example**:
- Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
- Output: [[1,6],[8,10],[15,18]]

**Knowledge Prerequisites**:
- Sorting algorithms and custom comparators
- Interval overlap detection
- Array/list manipulation

**First Principles**:
To merge overlapping intervals:
1. Sort intervals by start time to process in order
2. Initialize result with first interval
3. For each subsequent interval, either merge with last result or add as new interval

**Problem-First Approach**:
1. **Sort intervals**: Order by start time for left-to-right processing
2. **Initialize result**: Start with first interval in sorted array
3. **Process remaining**: For each interval, check overlap with last merged interval
4. **Merge or add**: Update end time if overlap, otherwise add new interval

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: Sort and Merge
class Solution {
    public int[][] merge(int[][] intervals) {
        if (intervals.length <= 1) {
            return intervals;
        }
        
        // Sort by start time
        Arrays.sort(intervals, (a, b) -> Integer.compare(a[0], b[0]));
        
        List<int[]> merged = new ArrayList<>();
        int[] currentInterval = intervals[0];
        merged.add(currentInterval);
        
        for (int i = 1; i < intervals.length; i++) {
            int[] nextInterval = intervals[i];
            
            if (currentInterval[1] >= nextInterval[0]) {
                // Overlapping intervals - merge them
                currentInterval[1] = Math.max(currentInterval[1], nextInterval[1]);
            } else {
                // Non-overlapping - add new interval
                currentInterval = nextInterval;
                merged.add(currentInterval);
            }
        }
        
        return merged.toArray(new int[merged.size()][]);
    }
}

// Approach 2: Stack-based Approach
class Solution {
    public int[][] merge(int[][] intervals) {
        if (intervals.length <= 1) return intervals;
        
        Arrays.sort(intervals, (a, b) -> a[0] - b[0]);
        
        Stack<int[]> stack = new Stack<>();
        stack.push(intervals[0]);
        
        for (int i = 1; i < intervals.length; i++) {
            int[] top = stack.peek();
            int[] current = intervals[i];
            
            if (top[1] >= current[0]) {
                // Merge intervals
                top[1] = Math.max(top[1], current[1]);
            } else {
                // No overlap
                stack.push(current);
            }
        }
        
        return stack.toArray(new int[stack.size()][]);
    }
}

// Approach 3: In-Place Modification (when modification allowed)
class Solution {
    public int[][] merge(int[][] intervals) {
        if (intervals.length <= 1) return intervals;
        
        Arrays.sort(intervals, (a, b) -> a[0] - b[0]);
        
        int writeIndex = 0;
        
        for (int i = 1; i < intervals.length; i++) {
            if (intervals[writeIndex][1] >= intervals[i][0]) {
                // Merge with previous interval
                intervals[writeIndex][1] = Math.max(intervals[writeIndex][1], intervals[i][1]);
            } else {
                // Move to next position
                writeIndex++;
                intervals[writeIndex] = intervals[i];
            }
        }
        
        // Return only the merged intervals
        return Arrays.copyOfRange(intervals, 0, writeIndex + 1);
    }
}

// Approach 4: Custom Interval Class
class Solution {
    class Interval {
        int start, end;
        Interval(int start, int end) {
            this.start = start;
            this.end = end;
        }
    }
    
    public int[][] merge(int[][] intervals) {
        if (intervals.length <= 1) return intervals;
        
        List<Interval> intervalList = new ArrayList<>();
        for (int[] interval : intervals) {
            intervalList.add(new Interval(interval[0], interval[1]));
        }
        
        intervalList.sort((a, b) -> a.start - b.start);
        
        List<Interval> merged = new ArrayList<>();
        merged.add(intervalList.get(0));
        
        for (int i = 1; i < intervalList.size(); i++) {
            Interval current = intervalList.get(i);
            Interval last = merged.get(merged.size() - 1);
            
            if (last.end >= current.start) {
                last.end = Math.max(last.end, current.end);
            } else {
                merged.add(current);
            }
        }
        
        int[][] result = new int[merged.size()][2];
        for (int i = 0; i < merged.size(); i++) {
            result[i][0] = merged.get(i).start;
            result[i][1] = merged.get(i).end;
        }
        
        return result;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: Sort and Merge
class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        if len(intervals) <= 1:
            return intervals
        
        # Sort by start time
        intervals.sort(key=lambda x: x[0])
        
        merged = [intervals[0]]
        
        for i in range(1, len(intervals)):
            current_interval = merged[-1]
            next_interval = intervals[i]
            
            if current_interval[1] >= next_interval[0]:
                # Overlapping intervals - merge them
                current_interval[1] = max(current_interval[1], next_interval[1])
            else:
                # Non-overlapping - add new interval
                merged.append(next_interval)
        
        return merged

# Approach 2: Stack-based Approach
class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        if len(intervals) <= 1:
            return intervals
        
        intervals.sort(key=lambda x: x[0])
        
        stack = [intervals[0]]
        
        for i in range(1, len(intervals)):
            top = stack[-1]
            current = intervals[i]
            
            if top[1] >= current[0]:
                # Merge intervals
                top[1] = max(top[1], current[1])
            else:
                # No overlap
                stack.append(current)
        
        return stack

# Approach 3: In-Place Modification (when modification allowed)
class Solution:
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        if len(intervals) <= 1:
            return intervals
        
        intervals.sort(key=lambda x: x[0])
        
        write_index = 0
        
        for i in range(1, len(intervals)):
            if intervals[write_index][1] >= intervals[i][0]:
                # Merge with previous interval
                intervals[write_index][1] = max(intervals[write_index][1], intervals[i][1])
            else:
                # Move to next position
                write_index += 1
                intervals[write_index] = intervals[i]
        
        # Return only the merged intervals
        return intervals[:write_index + 1]

# Approach 4: Custom Interval Class
class Solution:
    class Interval:
        def __init__(self, start, end):
            self.start = start
            self.end = end
    
    def merge(self, intervals: List[List[int]]) -> List[List[int]]:
        if len(intervals) <= 1:
            return intervals
        
        interval_list = []
        for interval in intervals:
            interval_list.append(self.Interval(interval[0], interval[1]))
        
        interval_list.sort(key=lambda x: x.start)
        
        merged = [interval_list[0]]
        
        for i in range(1, len(interval_list)):
            current = interval_list[i]
            last = merged[-1]
            
            if last.end >= current.start:
                last.end = max(last.end, current.end)
            else:
                merged.append(current)
        
        result = []
        for interval in merged:
            result.append([interval.start, interval.end])
        
        return result
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: Sort and Merge
var merge = function(intervals) {
    if (intervals.length <= 1) {
        return intervals;
    }
    
    // Sort by start time
    intervals.sort((a, b) => a[0] - b[0]);
    
    const merged = [intervals[0]];
    
    for (let i = 1; i < intervals.length; i++) {
        const currentInterval = merged[merged.length - 1];
        const nextInterval = intervals[i];
        
        if (currentInterval[1] >= nextInterval[0]) {
            // Overlapping intervals - merge them
            currentInterval[1] = Math.max(currentInterval[1], nextInterval[1]);
        } else {
            // Non-overlapping - add new interval
            merged.push(nextInterval);
        }
    }
    
    return merged;
};

// Approach 2: Stack-based Approach
var merge = function(intervals) {
    if (intervals.length <= 1) return intervals;
    
    intervals.sort((a, b) => a[0] - b[0]);
    
    const stack = [intervals[0]];
    
    for (let i = 1; i < intervals.length; i++) {
        const top = stack[stack.length - 1];
        const current = intervals[i];
        
        if (top[1] >= current[0]) {
            // Merge intervals
            top[1] = Math.max(top[1], current[1]);
        } else {
            // No overlap
            stack.push(current);
        }
    }
    
    return stack;
};

// Approach 3: In-Place Modification (when modification allowed)
var merge = function(intervals) {
    if (intervals.length <= 1) return intervals;
    
    intervals.sort((a, b) => a[0] - b[0]);
    
    let writeIndex = 0;
    
    for (let i = 1; i < intervals.length; i++) {
        if (intervals[writeIndex][1] >= intervals[i][0]) {
            // Merge with previous interval
            intervals[writeIndex][1] = Math.max(intervals[writeIndex][1], intervals[i][1]);
        } else {
            // Move to next position
            writeIndex++;
            intervals[writeIndex] = intervals[i];
        }
    }
    
    // Return only the merged intervals
    return intervals.slice(0, writeIndex + 1);
};

// Approach 4: Custom Interval Class
var merge = function(intervals) {
    if (intervals.length <= 1) return intervals;
    
    class Interval {
        constructor(start, end) {
            this.start = start;
            this.end = end;
        }
    }
    
    const intervalList = intervals.map(interval => new Interval(interval[0], interval[1]));
    
    intervalList.sort((a, b) => a.start - b.start);
    
    const merged = [intervalList[0]];
    
    for (let i = 1; i < intervalList.length; i++) {
        const current = intervalList[i];
        const last = merged[merged.length - 1];
        
        if (last.end >= current.start) {
            last.end = Math.max(last.end, current.end);
        } else {
            merged.push(current);
        }
    }
    
    return merged.map(interval => [interval.start, interval.end]);
};
```
  </div>
</div>

{::options parse_block_html="true" /}

**Complexity Analysis**:
- **Time**: O(n log n) due to sorting
- **Space**: O(n) for result array (O(log n) if in-place sorting)

{::options parse_block_html="false" /}

**Key Insights & Patterns**:
- Sorting is crucial for efficient merging
- Greedy approach works: process left to right
- Key insight: `currentEnd >= nextStart` indicates overlap
- Template for many interval merging problems

**State Transition Explanation**:
```
For each interval after first:
  if lastInterval.end >= currentInterval.start:
    merge: lastInterval.end = max(lastInterval.end, currentInterval.end)
  else:
    add currentInterval to result
```

---

### 3. Non-overlapping Intervals

**🔗 LeetCode Link:** [Non-overlapping Intervals - LeetCode #435](https://leetcode.com/problems/non-overlapping-intervals/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. How can you rephrase "minimum removals" in terms of "maximum selections"?
2. If you must choose between two overlapping intervals, what criteria would help you make the optimal choice?
3. What classic algorithmic problem does this remind you of?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Reframe the Problem
> **Guided Question:** Instead of thinking about "minimum intervals to remove," how can you reframe this as a maximization problem?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Key insight: **Minimum removals = Total intervals - Maximum non-overlapping intervals**

This transforms the problem into: "Find the maximum number of non-overlapping intervals you can select."

This reframing reveals that it's actually the classic **Activity Selection Problem** - a well-known greedy algorithm problem!
</details>

#### Step 2: The Greedy Choice
> **Guided Question:** When you have multiple overlapping intervals and can only choose one, what property should guide your selection?

<details>
<summary>💭 Think about it, then click to reveal</summary>

The optimal greedy choice: **Always select the interval that ends earliest**.

Why this works:
- An interval that ends earlier leaves more "room" for future intervals
- This maximizes the number of intervals you can select
- This is the "earliest deadline first" principle

Crucial insight: Sort by END time, not start time!
</details>

#### Step 3: Algorithm Implementation
> **Guided Question:** How do you implement the "earliest deadline first" strategy efficiently?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Efficient implementation:
1. **Sort intervals by end time**
2. **Greedily select intervals**: Choose first interval, then any interval that starts after the previous selection ends
3. **Count selections**: Track how many intervals you can keep
4. **Calculate answer**: `total - selected = minimum removals`

Time complexity: O(n log n) for sorting, O(n) for selection.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Sort intervals by END time (not start time!)
- [ ] Initialize count and track last selected end time
- [ ] Iterate through sorted intervals
- [ ] Select interval if it starts after last selected ends
- [ ] Update last selected end time
- [ ] Return total intervals minus selected count

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does sorting by end time work better than sorting by start time?
2. **Complexity Analysis:** Could you solve this faster than O(n log n)? Why or why not?
3. **Trade-offs:** What's the difference between the greedy approach and a dynamic programming solution?
4. **Pattern Recognition:** What other scheduling problems use the "earliest deadline first" principle?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the problem: ___/5
- [ ] Implementing brute force: ___/5  
- [ ] Implementing optimal solution: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Consider trying the follow-up questions for deeper understanding

**Problem Statement**: Given an array of intervals, find the minimum number of intervals you need to remove to make the rest of the intervals non-overlapping.

**Example**:
- Input: intervals = [[1,2],[2,3],[3,4],[1,3]]
- Output: 1 (remove [1,3])

**Knowledge Prerequisites**:
- Activity selection problem (classic greedy)
- Interval scheduling algorithms
- Greedy algorithm correctness proofs

**First Principles**:
This is the classic "Activity Selection Problem":
- We want to select maximum number of non-overlapping intervals
- Greedy strategy: always pick interval that ends earliest
- Minimum removals = Total intervals - Maximum non-overlapping intervals

**Problem-First Approach**:
1. **Recognize pattern**: Maximum non-overlapping intervals selection
2. **Apply greedy strategy**: Sort by end time, pick earliest-ending intervals
3. **Count selections**: Track how many intervals we can keep
4. **Calculate removals**: Total - Selected = Minimum removals

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: Classic Activity Selection (Sort by End Time)
class Solution {
    public int eraseOverlapIntervals(int[][] intervals) {
        if (intervals.length <= 1) return 0;
        
        // Sort by end time (key insight for activity selection)
        Arrays.sort(intervals, (a, b) -> a[1] - b[1]);
        
        int count = 1; // First interval is always selected
        int lastEnd = intervals[0][1];
        
        for (int i = 1; i < intervals.length; i++) {
            // If current interval starts after last selected interval ends
            if (intervals[i][0] >= lastEnd) {
                count++;
                lastEnd = intervals[i][1];
            }
            // If overlap, we skip current interval (implicitly remove it)
        }
        
        return intervals.length - count;
    }
}

// Approach 2: Sort by Start Time (Alternative Approach)
class Solution {
    public int eraseOverlapIntervals(int[][] intervals) {
        if (intervals.length <= 1) return 0;
        
        Arrays.sort(intervals, (a, b) -> a[0] - b[0]);
        
        int removals = 0;
        int lastEnd = intervals[0][1];
        
        for (int i = 1; i < intervals.length; i++) {
            if (intervals[i][0] < lastEnd) {
                // Overlap detected - remove interval with later end time
                removals++;
                lastEnd = Math.min(lastEnd, intervals[i][1]);
            } else {
                // No overlap
                lastEnd = intervals[i][1];
            }
        }
        
        return removals;
    }
}

// Approach 3: Greedy with Detailed Tracking
class Solution {
    public int eraseOverlapIntervals(int[][] intervals) {
        if (intervals.length <= 1) return 0;
        
        // Sort by end time for optimal greedy selection
        Arrays.sort(intervals, (a, b) -> {
            if (a[1] != b[1]) return a[1] - b[1];
            return a[0] - b[0]; // Break ties by start time
        });
        
        List<int[]> selected = new ArrayList<>();
        selected.add(intervals[0]);
        
        for (int i = 1; i < intervals.length; i++) {
            int[] lastSelected = selected.get(selected.size() - 1);
            
            // No overlap: start >= end of last selected
            if (intervals[i][0] >= lastSelected[1]) {
                selected.add(intervals[i]);
            }
            // Overlap: skip current interval (count as removal)
        }
        
        return intervals.length - selected.size();
    }
}

// Approach 4: Dynamic Programming (Less Efficient but Educational)
class Solution {
    public int eraseOverlapIntervals(int[][] intervals) {
        if (intervals.length <= 1) return 0;
        
        Arrays.sort(intervals, (a, b) -> a[0] - b[0]);
        
        // dp[i] = maximum non-overlapping intervals ending at or before i
        int[] dp = new int[intervals.length];
        dp[0] = 1;
        
        for (int i = 1; i < intervals.length; i++) {
            dp[i] = 1; // At least current interval
            
            for (int j = 0; j < i; j++) {
                // If intervals[j] doesn't overlap with intervals[i]
                if (intervals[j][1] <= intervals[i][0]) {
                    dp[i] = Math.max(dp[i], dp[j] + 1);
                }
            }
        }
        
        int maxNonOverlapping = 0;
        for (int count : dp) {
            maxNonOverlapping = Math.max(maxNonOverlapping, count);
        }
        
        return intervals.length - maxNonOverlapping;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: Classic Activity Selection (Sort by End Time)
class Solution:
    def eraseOverlapIntervals(self, intervals: List[List[int]]) -> int:
        if len(intervals) <= 1:
            return 0
        
        # Sort by end time (key insight for activity selection)
        intervals.sort(key=lambda x: x[1])
        
        count = 1  # First interval is always selected
        last_end = intervals[0][1]
        
        for i in range(1, len(intervals)):
            # If current interval starts after last selected interval ends
            if intervals[i][0] >= last_end:
                count += 1
                last_end = intervals[i][1]
            # If overlap, we skip current interval (implicitly remove it)
        
        return len(intervals) - count

# Approach 2: Sort by Start Time (Alternative Approach)
class Solution:
    def eraseOverlapIntervals(self, intervals: List[List[int]]) -> int:
        if len(intervals) <= 1:
            return 0
        
        intervals.sort(key=lambda x: x[0])
        
        removals = 0
        last_end = intervals[0][1]
        
        for i in range(1, len(intervals)):
            if intervals[i][0] < last_end:
                # Overlap detected - remove interval with later end time
                removals += 1
                last_end = min(last_end, intervals[i][1])
            else:
                # No overlap
                last_end = intervals[i][1]
        
        return removals

# Approach 3: Greedy with Detailed Tracking
class Solution:
    def eraseOverlapIntervals(self, intervals: List[List[int]]) -> int:
        if len(intervals) <= 1:
            return 0
        
        # Sort by end time for optimal greedy selection
        intervals.sort(key=lambda x: (x[1], x[0]))  # Break ties by start time
        
        selected = [intervals[0]]
        
        for i in range(1, len(intervals)):
            last_selected = selected[-1]
            
            # No overlap: start >= end of last selected
            if intervals[i][0] >= last_selected[1]:
                selected.append(intervals[i])
            # Overlap: skip current interval (count as removal)
        
        return len(intervals) - len(selected)

# Approach 4: Dynamic Programming (Less Efficient but Educational)
class Solution:
    def eraseOverlapIntervals(self, intervals: List[List[int]]) -> int:
        if len(intervals) <= 1:
            return 0
        
        intervals.sort(key=lambda x: x[0])
        
        # dp[i] = maximum non-overlapping intervals ending at or before i
        dp = [1] * len(intervals)
        
        for i in range(1, len(intervals)):
            for j in range(i):
                # If intervals[j] doesn't overlap with intervals[i]
                if intervals[j][1] <= intervals[i][0]:
                    dp[i] = max(dp[i], dp[j] + 1)
        
        max_non_overlapping = max(dp)
        
        return len(intervals) - max_non_overlapping
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: Classic Activity Selection (Sort by End Time)
var eraseOverlapIntervals = function(intervals) {
    if (intervals.length <= 1) return 0;
    
    // Sort by end time (key insight for activity selection)
    intervals.sort((a, b) => a[1] - b[1]);
    
    let count = 1; // First interval is always selected
    let lastEnd = intervals[0][1];
    
    for (let i = 1; i < intervals.length; i++) {
        // If current interval starts after last selected interval ends
        if (intervals[i][0] >= lastEnd) {
            count++;
            lastEnd = intervals[i][1];
        }
        // If overlap, we skip current interval (implicitly remove it)
    }
    
    return intervals.length - count;
};

// Approach 2: Sort by Start Time (Alternative Approach)
var eraseOverlapIntervals = function(intervals) {
    if (intervals.length <= 1) return 0;
    
    intervals.sort((a, b) => a[0] - b[0]);
    
    let removals = 0;
    let lastEnd = intervals[0][1];
    
    for (let i = 1; i < intervals.length; i++) {
        if (intervals[i][0] < lastEnd) {
            // Overlap detected - remove interval with later end time
            removals++;
            lastEnd = Math.min(lastEnd, intervals[i][1]);
        } else {
            // No overlap
            lastEnd = intervals[i][1];
        }
    }
    
    return removals;
};

// Approach 3: Greedy with Detailed Tracking
var eraseOverlapIntervals = function(intervals) {
    if (intervals.length <= 1) return 0;
    
    // Sort by end time for optimal greedy selection
    intervals.sort((a, b) => {
        if (a[1] !== b[1]) return a[1] - b[1];
        return a[0] - b[0]; // Break ties by start time
    });
    
    const selected = [intervals[0]];
    
    for (let i = 1; i < intervals.length; i++) {
        const lastSelected = selected[selected.length - 1];
        
        // No overlap: start >= end of last selected
        if (intervals[i][0] >= lastSelected[1]) {
            selected.push(intervals[i]);
        }
        // Overlap: skip current interval (count as removal)
    }
    
    return intervals.length - selected.length;
};

// Approach 4: Dynamic Programming (Less Efficient but Educational)
var eraseOverlapIntervals = function(intervals) {
    if (intervals.length <= 1) return 0;
    
    intervals.sort((a, b) => a[0] - b[0]);
    
    // dp[i] = maximum non-overlapping intervals ending at or before i
    const dp = new Array(intervals.length).fill(1);
    
    for (let i = 1; i < intervals.length; i++) {
        for (let j = 0; j < i; j++) {
            // If intervals[j] doesn't overlap with intervals[i]
            if (intervals[j][1] <= intervals[i][0]) {
                dp[i] = Math.max(dp[i], dp[j] + 1);
            }
        }
    }
    
    const maxNonOverlapping = Math.max(...dp);
    
    return intervals.length - maxNonOverlapping;
};
```
  </div>
</div>

{::options parse_block_html="true" /}

**Complexity Analysis**:
- **Greedy**: Time O(n log n), Space O(1)
- **DP**: Time O(n²), Space O(n)

{::options parse_block_html="false" /}

**Key Insights & Patterns**:
- Classic activity selection problem in disguise
- Greedy by end time is optimal (earliest deadline first)
- Alternative: greedy by start time with conflict resolution
- Pattern applies to scheduling, resource allocation problems

**State Transition Explanation**:
```
Sort by end time, then:
For each interval:
  if interval.start >= lastSelectedEnd:
    select this interval (increment count)
    update lastSelectedEnd
  else:
    skip this interval (will be removed)
```

---

### 4. Meeting Rooms

**🔗 LeetCode Link:** [Meeting Rooms - LeetCode #252](https://leetcode.com/problems/meeting-rooms/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What does it mean for a person to "attend all meetings" in terms of interval relationships?
2. If meetings are given in random order, how can you efficiently check for conflicts?
3. What's the most efficient way to detect if any two intervals in an array overlap?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding the Constraint
> **Guided Question:** What exactly does "no two meetings overlap" mean in terms of time intervals?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Two meetings overlap if they have any time in common:
- Meeting A: [start1, end1] and Meeting B: [start2, end2] overlap if:
- `max(start1, start2) < min(end1, end2)`

Key insight: A person can attend all meetings if and only if NO pair of meetings overlap.

This is a fundamental **conflict detection** problem.
</details>

#### Step 2: Brute Force vs Optimized Approach
> **Guided Question:** What's the difference between checking all pairs versus using a smarter approach?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Brute Force**: Check every pair of meetings → O(n²) time
- For each meeting, compare with every other meeting
- Works but inefficient for large inputs

**Optimized**: Sort then check consecutive pairs → O(n log n) time
- Sort meetings by start time
- Only check adjacent meetings (if A doesn't overlap with B, and B starts after A, then A won't overlap with any meeting after B)
</details>

#### Step 3: Why Sorting Works
> **Guided Question:** After sorting by start time, why is it sufficient to only check consecutive meetings?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Sorting by start time creates a crucial property:
- If meeting[i] doesn't overlap with meeting[i+1], it won't overlap with meeting[i+2], meeting[i+3], etc.
- This is because meeting[i+2] starts even later than meeting[i+1]

Therefore: **If any conflict exists, it must be between consecutive meetings in the sorted array.**

This reduces the problem from O(n²) comparisons to O(n) comparisons!
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Handle edge case: 0 or 1 meetings
- [ ] Sort meetings by start time
- [ ] Iterate through consecutive pairs
- [ ] Check overlap condition: `meetings[i].end > meetings[i+1].start`
- [ ] Return false immediately if overlap found
- [ ] Return true if no overlaps detected

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does sorting by start time enable the consecutive-pairs optimization?
2. **Complexity Analysis:** What's the trade-off between time and space complexity in different approaches?
3. **Trade-offs:** When might the brute force approach actually be better?
4. **Pattern Recognition:** How does this pattern apply to other conflict detection problems?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the problem: ___/5
- [ ] Implementing brute force: ___/5  
- [ ] Implementing optimal solution: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Consider trying the follow-up questions for deeper understanding

**Problem Statement**: Given an array of meeting time intervals, determine if a person could attend all meetings (i.e., no two meetings overlap).

**Example**:
- Input: intervals = [[0,30],[5,10],[15,20]]
- Output: false (overlap between [0,30] and [5,10])

**Knowledge Prerequisites**:
- Basic interval overlap detection
- Sorting algorithms
- Boolean logic for conflict detection

**First Principles**:
For a person to attend all meetings, no two meetings can overlap:
- Sort meetings by start time
- Check each consecutive pair for overlap
- Return false if any overlap found

**Problem-First Approach**:
1. **Sort meetings**: Order by start time for sequential checking
2. **Check consecutive pairs**: Only need to check adjacent meetings after sorting
3. **Detect overlap**: If meeting[i].end > meeting[i+1].start, there's conflict
4. **Early termination**: Return false immediately when overlap found

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: Sort and Check Consecutive Pairs
class Solution {
    public boolean canAttendMeetings(int[][] intervals) {
        if (intervals.length <= 1) return true;
        
        // Sort by start time
        Arrays.sort(intervals, (a, b) -> a[0] - b[0]);
        
        // Check consecutive meetings for overlap
        for (int i = 0; i < intervals.length - 1; i++) {
            if (intervals[i][1] > intervals[i + 1][0]) {
                return false; // Overlap detected
            }
        }
        
        return true;
    }
}

// Approach 2: Sort by End Time (Alternative)
class Solution {
    public boolean canAttendMeetings(int[][] intervals) {
        if (intervals.length <= 1) return true;
        
        Arrays.sort(intervals, (a, b) -> a[1] - b[1]);
        
        for (int i = 0; i < intervals.length - 1; i++) {
            if (intervals[i][1] > intervals[i + 1][0]) {
                return false;
            }
        }
        
        return true;
    }
}

// Approach 3: Sweep Line Algorithm
class Solution {
    public boolean canAttendMeetings(int[][] intervals) {
        if (intervals.length <= 1) return true;
        
        // Create events: +1 for start, -1 for end
        List<int[]> events = new ArrayList<>();
        for (int[] interval : intervals) {
            events.add(new int[]{interval[0], 1});  // Meeting starts
            events.add(new int[]{interval[1], -1}); // Meeting ends
        }
        
        // Sort events by time, with ends before starts at same time
        events.sort((a, b) -> {
            if (a[0] != b[0]) return a[0] - b[0];
            return a[1] - b[1]; // End events (-1) before start events (1)
        });
        
        int activeCount = 0;
        for (int[] event : events) {
            activeCount += event[1];
            if (activeCount > 1) {
                return false; // More than one meeting active
            }
        }
        
        return true;
    }
}

// Approach 4: Brute Force (For Comparison)
class Solution {
    public boolean canAttendMeetings(int[][] intervals) {
        for (int i = 0; i < intervals.length; i++) {
            for (int j = i + 1; j < intervals.length; j++) {
                if (isOverlapping(intervals[i], intervals[j])) {
                    return false;
                }
            }
        }
        return true;
    }
    
    private boolean isOverlapping(int[] interval1, int[] interval2) {
        return Math.max(interval1[0], interval2[0]) < Math.min(interval1[1], interval2[1]);
    }
}

// Approach 5: Custom Interval Class with Validation
class Solution {
    class Meeting implements Comparable<Meeting> {
        int start, end;
        
        Meeting(int start, int end) {
            this.start = start;
            this.end = end;
        }
        
        @Override
        public int compareTo(Meeting other) {
            return Integer.compare(this.start, other.start);
        }
        
        public boolean overlapsWith(Meeting other) {
            return this.end > other.start && other.end > this.start;
        }
    }
    
    public boolean canAttendMeetings(int[][] intervals) {
        List<Meeting> meetings = new ArrayList<>();
        for (int[] interval : intervals) {
            meetings.add(new Meeting(interval[0], interval[1]));
        }
        
        Collections.sort(meetings);
        
        for (int i = 0; i < meetings.size() - 1; i++) {
            if (meetings.get(i).overlapsWith(meetings.get(i + 1))) {
                return false;
            }
        }
        
        return true;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: Sort and Check Consecutive Pairs
class Solution:
    def canAttendMeetings(self, intervals: List[List[int]]) -> bool:
        if len(intervals) <= 1:
            return True
        
        # Sort by start time
        intervals.sort(key=lambda x: x[0])
        
        # Check consecutive meetings for overlap
        for i in range(len(intervals) - 1):
            if intervals[i][1] > intervals[i + 1][0]:
                return False  # Overlap detected
        
        return True

# Approach 2: Sort by End Time (Alternative)
class Solution:
    def canAttendMeetings(self, intervals: List[List[int]]) -> bool:
        if len(intervals) <= 1:
            return True
        
        intervals.sort(key=lambda x: x[1])
        
        for i in range(len(intervals) - 1):
            if intervals[i][1] > intervals[i + 1][0]:
                return False
        
        return True

# Approach 3: Sweep Line Algorithm
class Solution:
    def canAttendMeetings(self, intervals: List[List[int]]) -> bool:
        if len(intervals) <= 1:
            return True
        
        # Create events: +1 for start, -1 for end
        events = []
        for interval in intervals:
            events.append((interval[0], 1))   # Meeting starts
            events.append((interval[1], -1))  # Meeting ends
        
        # Sort events by time, with ends before starts at same time
        events.sort(key=lambda x: (x[0], x[1]))  # -1 (end) comes before 1 (start)
        
        active_count = 0
        for time, event_type in events:
            active_count += event_type
            if active_count > 1:
                return False  # More than one meeting active
        
        return True

# Approach 4: Brute Force (For Comparison)
class Solution:
    def canAttendMeetings(self, intervals: List[List[int]]) -> bool:
        for i in range(len(intervals)):
            for j in range(i + 1, len(intervals)):
                if self.isOverlapping(intervals[i], intervals[j]):
                    return False
        return True
    
    def isOverlapping(self, interval1, interval2):
        return max(interval1[0], interval2[0]) < min(interval1[1], interval2[1])

# Approach 5: Custom Interval Class with Validation
class Solution:
    class Meeting:
        def __init__(self, start, end):
            self.start = start
            self.end = end
        
        def __lt__(self, other):
            return self.start < other.start
        
        def overlapsWith(self, other):
            return self.end > other.start and other.end > self.start
    
    def canAttendMeetings(self, intervals: List[List[int]]) -> bool:
        meetings = []
        for interval in intervals:
            meetings.append(self.Meeting(interval[0], interval[1]))
        
        meetings.sort()
        
        for i in range(len(meetings) - 1):
            if meetings[i].overlapsWith(meetings[i + 1]):
                return False
        
        return True
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: Sort and Check Consecutive Pairs
var canAttendMeetings = function(intervals) {
    if (intervals.length <= 1) return true;
    
    // Sort by start time
    intervals.sort((a, b) => a[0] - b[0]);
    
    // Check consecutive meetings for overlap
    for (let i = 0; i < intervals.length - 1; i++) {
        if (intervals[i][1] > intervals[i + 1][0]) {
            return false; // Overlap detected
        }
    }
    
    return true;
};

// Approach 2: Sort by End Time (Alternative)
var canAttendMeetings = function(intervals) {
    if (intervals.length <= 1) return true;
    
    intervals.sort((a, b) => a[1] - b[1]);
    
    for (let i = 0; i < intervals.length - 1; i++) {
        if (intervals[i][1] > intervals[i + 1][0]) {
            return false;
        }
    }
    
    return true;
};

// Approach 3: Sweep Line Algorithm
var canAttendMeetings = function(intervals) {
    if (intervals.length <= 1) return true;
    
    // Create events: +1 for start, -1 for end
    const events = [];
    for (const interval of intervals) {
        events.push([interval[0], 1]);   // Meeting starts
        events.push([interval[1], -1]);  // Meeting ends
    }
    
    // Sort events by time, with ends before starts at same time
    events.sort((a, b) => {
        if (a[0] !== b[0]) return a[0] - b[0];
        return a[1] - b[1]; // -1 (end) comes before 1 (start)
    });
    
    let activeCount = 0;
    for (const [time, eventType] of events) {
        activeCount += eventType;
        if (activeCount > 1) {
            return false; // More than one meeting active
        }
    }
    
    return true;
};

// Approach 4: Brute Force (For Comparison)
var canAttendMeetings = function(intervals) {
    for (let i = 0; i < intervals.length; i++) {
        for (let j = i + 1; j < intervals.length; j++) {
            if (isOverlapping(intervals[i], intervals[j])) {
                return false;
            }
        }
    }
    return true;
};

function isOverlapping(interval1, interval2) {
    return Math.max(interval1[0], interval2[0]) < Math.min(interval1[1], interval2[1]);
}

// Approach 5: Custom Interval Class with Validation
var canAttendMeetings = function(intervals) {
    class Meeting {
        constructor(start, end) {
            this.start = start;
            this.end = end;
        }
        
        overlapsWith(other) {
            return this.end > other.start && other.end > this.start;
        }
    }
    
    const meetings = intervals.map(interval => new Meeting(interval[0], interval[1]));
    
    meetings.sort((a, b) => a.start - b.start);
    
    for (let i = 0; i < meetings.length - 1; i++) {
        if (meetings[i].overlapsWith(meetings[i + 1])) {
            return false;
        }
    }
    
    return true;
};
```
  </div>
</div>

{::options parse_block_html="true" /}

**Complexity Analysis**:
- **Sorting approach**: Time O(n log n), Space O(1)
- **Brute force**: Time O(n²), Space O(1)
- **Sweep line**: Time O(n log n), Space O(n)

{::options parse_block_html="false" /}

**Key Insights & Patterns**:
- Fundamental interval conflict detection pattern
- Sorting reduces problem from O(n²) to O(n log n)
- Foundation for more complex scheduling problems
- Sweep line provides framework for multi-resource problems

**State Transition Explanation**:
```
After sorting by start time:
For each consecutive pair (i, i+1):
  if meeting[i].end > meeting[i+1].start:
    return false (overlap detected)
return true (no conflicts)
```

---

### 5. Meeting Rooms II

**🔗 LeetCode Link:** [Meeting Rooms II - LeetCode #253](https://leetcode.com/problems/meeting-rooms-ii/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What does "minimum number of conference rooms" really mean in terms of overlapping meetings?
2. At any given time, how many rooms do you need, and how can you track this efficiently?
3. What information do you need to track as meetings start and end?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding Resource Allocation
> **Guided Question:** What determines the minimum number of rooms needed at any point in time?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Key insight: **The minimum number of rooms equals the maximum number of meetings happening simultaneously.**

Example: If at time T, there are 3 meetings in progress, you need at least 3 rooms at that moment.

The answer is the **maximum overlap** across all time points.

This transforms the problem into: "Find the maximum number of intervals that overlap at any point in time."
</details>

#### Step 2: Tracking Room Usage
> **Guided Question:** How can you efficiently track when rooms become available for reuse?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Efficient approach using **Min-Heap**:
1. **Sort meetings by start time** (process chronologically)
2. **Use min-heap to track room end times** (earliest available room at top)
3. **For each meeting**:
   - If heap is not empty and earliest room ends before current meeting starts: reuse that room
   - Otherwise: allocate a new room
   - Add current meeting's end time to heap

The heap size represents active meetings (rooms needed).
</details>

#### Step 3: Alternative Sweep Line Approach
> **Guided Question:** How could you solve this by treating meetings as "events" in a timeline?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Sweep Line Algorithm**:
1. **Create events**: For each meeting [start, end], create a "start" event (+1) and "end" event (-1)
2. **Sort events by time**: Process chronologically
3. **Track active count**: As you process events, maintain count of active meetings
4. **Find maximum**: The peak active count is your answer

Crucial detail: End events should come before start events at the same time (room becomes available before new meeting starts).
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Sort meetings by start time
- [ ] Initialize min-heap to track room end times
- [ ] For each meeting, check if earliest room is available
- [ ] Either reuse available room or allocate new room
- [ ] Add current meeting's end time to heap
- [ ] Return final heap size (max rooms used)

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does the min-heap approach correctly minimize room allocation?
2. **Complexity Analysis:** What are the time and space complexities of the heap vs sweep line approaches?
3. **Trade-offs:** When might you prefer the sweep line approach over the heap approach?
4. **Pattern Recognition:** What other resource allocation problems use similar techniques?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the problem: ___/5
- [ ] Implementing brute force: ___/5  
- [ ] Implementing optimal solution: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Consider trying the follow-up questions for deeper understanding

**Problem Statement**: Given an array of meeting time intervals, find the minimum number of conference rooms required to schedule all meetings.

**Example**:
- Input: intervals = [[0,30],[5,10],[15,20]]
- Output: 2 (need 2 rooms: [0,30] in room 1, [5,10] and [15,20] in room 2)

**Knowledge Prerequisites**:
- Priority queues (min-heap) for tracking earliest events
- Sweep line algorithm concepts
- Greedy scheduling algorithms
- Event processing patterns

**First Principles**:
This is a resource allocation problem:
- At any time, we need as many rooms as there are simultaneous meetings
- Track when meetings start and end to find maximum overlap
- Use min-heap to efficiently track when rooms become available

**Problem-First Approach**:
1. **Sort meetings**: Order by start time for chronological processing
2. **Track room usage**: Use min-heap to track when each room becomes free
3. **Allocate rooms**: For each meeting, reuse room if available, else allocate new room
4. **Count maximum**: The heap size represents concurrent meetings (rooms needed)

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: Min-Heap for Room End Times
class Solution {
    public int minMeetingRooms(int[][] intervals) {
        if (intervals.length == 0) return 0;
        
        // Sort meetings by start time
        Arrays.sort(intervals, (a, b) -> a[0] - b[0]);
        
        // Min-heap to track end times of ongoing meetings
        PriorityQueue<Integer> heap = new PriorityQueue<>();
        
        for (int[] meeting : intervals) {
            // If earliest meeting ends before current starts, reuse that room
            if (!heap.isEmpty() && heap.peek() <= meeting[0]) {
                heap.poll(); // Remove the ended meeting
            }
            
            // Add current meeting's end time
            heap.offer(meeting[1]);
        }
        
        return heap.size(); // Number of rooms needed
    }
}

// Approach 2: Sweep Line Algorithm
class Solution {
    public int minMeetingRooms(int[][] intervals) {
        if (intervals.length == 0) return 0;
        
        List<int[]> events = new ArrayList<>();
        
        // Create start and end events
        for (int[] interval : intervals) {
            events.add(new int[]{interval[0], 1});  // Meeting starts (+1)
            events.add(new int[]{interval[1], -1}); // Meeting ends (-1)
        }
        
        // Sort events: by time, then end events before start events at same time
        events.sort((a, b) -> {
            if (a[0] != b[0]) return a[0] - b[0];
            return a[1] - b[1]; // -1 (end) comes before +1 (start)
        });
        
        int activeRooms = 0;
        int maxRooms = 0;
        
        for (int[] event : events) {
            activeRooms += event[1];
            maxRooms = Math.max(maxRooms, activeRooms);
        }
        
        return maxRooms;
    }
}

// Approach 3: Two Pointers with Separate Arrays
class Solution {
    public int minMeetingRooms(int[][] intervals) {
        if (intervals.length == 0) return 0;
        
        int n = intervals.length;
        int[] starts = new int[n];
        int[] ends = new int[n];
        
        // Extract start and end times
        for (int i = 0; i < n; i++) {
            starts[i] = intervals[i][0];
            ends[i] = intervals[i][1];
        }
        
        // Sort both arrays
        Arrays.sort(starts);
        Arrays.sort(ends);
        
        int startPtr = 0, endPtr = 0;
        int activeRooms = 0, maxRooms = 0;
        
        while (startPtr < n) {
            if (starts[startPtr] < ends[endPtr]) {
                // A meeting starts before any ends
                activeRooms++;
                startPtr++;
            } else {
                // A meeting ends before or at the same time as one starts
                activeRooms--;
                endPtr++;
            }
            maxRooms = Math.max(maxRooms, activeRooms);
        }
        
        return maxRooms;
    }
}

// Approach 4: TreeMap for Time Tracking
class Solution {
    public int minMeetingRooms(int[][] intervals) {
        TreeMap<Integer, Integer> timeMap = new TreeMap<>();
        
        // Count events at each time point
        for (int[] interval : intervals) {
            timeMap.put(interval[0], timeMap.getOrDefault(interval[0], 0) + 1); // Start
            timeMap.put(interval[1], timeMap.getOrDefault(interval[1], 0) - 1); // End
        }
        
        int activeRooms = 0;
        int maxRooms = 0;
        
        for (int change : timeMap.values()) {
            activeRooms += change;
            maxRooms = Math.max(maxRooms, activeRooms);
        }
        
        return maxRooms;
    }
}

// Approach 5: Custom Event Class
class Solution {
    class Event {
        int time;
        int type; // 1 for start, -1 for end
        
        Event(int time, int type) {
            this.time = time;
            this.type = type;
        }
    }
    
    public int minMeetingRooms(int[][] intervals) {
        List<Event> events = new ArrayList<>();
        
        for (int[] interval : intervals) {
            events.add(new Event(interval[0], 1));  // Start event
            events.add(new Event(interval[1], -1)); // End event
        }
        
        // Sort by time, with end events before start events at same time
        events.sort((a, b) -> {
            if (a.time != b.time) return a.time - b.time;
            return a.type - b.type; // -1 before 1
        });
        
        int concurrent = 0;
        int maxConcurrent = 0;
        
        for (Event event : events) {
            concurrent += event.type;
            maxConcurrent = Math.max(maxConcurrent, concurrent);
        }
        
        return maxConcurrent;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: Min-Heap for Room End Times
import heapq

class Solution:
    def minMeetingRooms(self, intervals: List[List[int]]) -> int:
        if not intervals:
            return 0
        
        # Sort meetings by start time
        intervals.sort(key=lambda x: x[0])
        
        # Min-heap to track end times of ongoing meetings
        heap = []
        
        for meeting in intervals:
            # If earliest meeting ends before current starts, reuse that room
            if heap and heap[0] <= meeting[0]:
                heapq.heappop(heap)
            
            # Add current meeting's end time
            heapq.heappush(heap, meeting[1])
        
        return len(heap)  # Number of rooms needed

# Approach 2: Sweep Line Algorithm
class Solution:
    def minMeetingRooms(self, intervals: List[List[int]]) -> int:
        if not intervals:
            return 0
        
        events = []
        
        # Create start and end events
        for interval in intervals:
            events.append((interval[0], 1))   # Meeting starts (+1)
            events.append((interval[1], -1))  # Meeting ends (-1)
        
        # Sort events: by time, then end events before start events at same time
        events.sort(key=lambda x: (x[0], x[1]))  # -1 (end) comes before 1 (start)
        
        active_rooms = 0
        max_rooms = 0
        
        for time, event_type in events:
            active_rooms += event_type
            max_rooms = max(max_rooms, active_rooms)
        
        return max_rooms

# Approach 3: Two Pointers with Separate Arrays
class Solution:
    def minMeetingRooms(self, intervals: List[List[int]]) -> int:
        if not intervals:
            return 0
        
        n = len(intervals)
        starts = [interval[0] for interval in intervals]
        ends = [interval[1] for interval in intervals]
        
        # Sort both arrays
        starts.sort()
        ends.sort()
        
        start_ptr = 0
        end_ptr = 0
        active_rooms = 0
        max_rooms = 0
        
        while start_ptr < n:
            if starts[start_ptr] < ends[end_ptr]:
                # A meeting starts before any ends
                active_rooms += 1
                start_ptr += 1
            else:
                # A meeting ends before or at the same time as one starts
                active_rooms -= 1
                end_ptr += 1
            max_rooms = max(max_rooms, active_rooms)
        
        return max_rooms

# Approach 4: TreeMap equivalent using Counter
from collections import Counter

class Solution:
    def minMeetingRooms(self, intervals: List[List[int]]) -> int:
        time_map = Counter()
        
        # Count events at each time point
        for interval in intervals:
            time_map[interval[0]] += 1  # Start
            time_map[interval[1]] -= 1  # End
        
        active_rooms = 0
        max_rooms = 0
        
        # Process in sorted order of time
        for time in sorted(time_map.keys()):
            active_rooms += time_map[time]
            max_rooms = max(max_rooms, active_rooms)
        
        return max_rooms

# Approach 5: Custom Event Class
class Solution:
    class Event:
        def __init__(self, time, event_type):
            self.time = time
            self.type = event_type  # 1 for start, -1 for end
    
    def minMeetingRooms(self, intervals: List[List[int]]) -> int:
        events = []
        
        for interval in intervals:
            events.append(self.Event(interval[0], 1))   # Start event
            events.append(self.Event(interval[1], -1))  # End event
        
        # Sort by time, with end events before start events at same time
        events.sort(key=lambda x: (x.time, x.type))  # -1 before 1
        
        concurrent = 0
        max_concurrent = 0
        
        for event in events:
            concurrent += event.type
            max_concurrent = max(max_concurrent, concurrent)
        
        return max_concurrent
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: Min-Heap for Room End Times
class MinHeap {
    constructor() {
        this.heap = [];
    }
    
    push(value) {
        this.heap.push(value);
        this.heapifyUp(this.heap.length - 1);
    }
    
    pop() {
        if (this.heap.length === 0) return null;
        if (this.heap.length === 1) return this.heap.pop();
        
        const root = this.heap[0];
        this.heap[0] = this.heap.pop();
        this.heapifyDown(0);
        return root;
    }
    
    peek() {
        return this.heap.length > 0 ? this.heap[0] : null;
    }
    
    size() {
        return this.heap.length;
    }
    
    heapifyUp(index) {
        if (index === 0) return;
        const parentIndex = Math.floor((index - 1) / 2);
        if (this.heap[parentIndex] > this.heap[index]) {
            [this.heap[parentIndex], this.heap[index]] = [this.heap[index], this.heap[parentIndex]];
            this.heapifyUp(parentIndex);
        }
    }
    
    heapifyDown(index) {
        const leftChild = 2 * index + 1;
        const rightChild = 2 * index + 2;
        let smallest = index;
        
        if (leftChild < this.heap.length && this.heap[leftChild] < this.heap[smallest]) {
            smallest = leftChild;
        }
        
        if (rightChild < this.heap.length && this.heap[rightChild] < this.heap[smallest]) {
            smallest = rightChild;
        }
        
        if (smallest !== index) {
            [this.heap[index], this.heap[smallest]] = [this.heap[smallest], this.heap[index]];
            this.heapifyDown(smallest);
        }
    }
}

var minMeetingRooms = function(intervals) {
    if (intervals.length === 0) return 0;
    
    // Sort meetings by start time
    intervals.sort((a, b) => a[0] - b[0]);
    
    // Min-heap to track end times of ongoing meetings
    const heap = new MinHeap();
    
    for (const meeting of intervals) {
        // If earliest meeting ends before current starts, reuse that room
        if (heap.size() > 0 && heap.peek() <= meeting[0]) {
            heap.pop();
        }
        
        // Add current meeting's end time
        heap.push(meeting[1]);
    }
    
    return heap.size();
};

// Approach 2: Sweep Line Algorithm
var minMeetingRooms = function(intervals) {
    if (intervals.length === 0) return 0;
    
    const events = [];
    
    // Create start and end events
    for (const interval of intervals) {
        events.push([interval[0], 1]);   // Meeting starts (+1)
        events.push([interval[1], -1]);  // Meeting ends (-1)
    }
    
    // Sort events: by time, then end events before start events at same time
    events.sort((a, b) => {
        if (a[0] !== b[0]) return a[0] - b[0];
        return a[1] - b[1]; // -1 (end) comes before 1 (start)
    });
    
    let activeRooms = 0;
    let maxRooms = 0;
    
    for (const [time, eventType] of events) {
        activeRooms += eventType;
        maxRooms = Math.max(maxRooms, activeRooms);
    }
    
    return maxRooms;
};

// Approach 3: Two Pointers with Separate Arrays
var minMeetingRooms = function(intervals) {
    if (intervals.length === 0) return 0;
    
    const n = intervals.length;
    const starts = intervals.map(interval => interval[0]);
    const ends = intervals.map(interval => interval[1]);
    
    // Sort both arrays
    starts.sort((a, b) => a - b);
    ends.sort((a, b) => a - b);
    
    let startPtr = 0, endPtr = 0;
    let activeRooms = 0, maxRooms = 0;
    
    while (startPtr < n) {
        if (starts[startPtr] < ends[endPtr]) {
            // A meeting starts before any ends
            activeRooms++;
            startPtr++;
        } else {
            // A meeting ends before or at the same time as one starts
            activeRooms--;
            endPtr++;
        }
        maxRooms = Math.max(maxRooms, activeRooms);
    }
    
    return maxRooms;
};

// Approach 4: Map for Time Tracking
var minMeetingRooms = function(intervals) {
    const timeMap = new Map();
    
    // Count events at each time point
    for (const interval of intervals) {
        timeMap.set(interval[0], (timeMap.get(interval[0]) || 0) + 1); // Start
        timeMap.set(interval[1], (timeMap.get(interval[1]) || 0) - 1); // End
    }
    
    let activeRooms = 0;
    let maxRooms = 0;
    
    // Process in sorted order of time
    const sortedTimes = Array.from(timeMap.keys()).sort((a, b) => a - b);
    for (const time of sortedTimes) {
        activeRooms += timeMap.get(time);
        maxRooms = Math.max(maxRooms, activeRooms);
    }
    
    return maxRooms;
};

// Approach 5: Custom Event Class
var minMeetingRooms = function(intervals) {
    class Event {
        constructor(time, type) {
            this.time = time;
            this.type = type; // 1 for start, -1 for end
        }
    }
    
    const events = [];
    
    for (const interval of intervals) {
        events.push(new Event(interval[0], 1));   // Start event
        events.push(new Event(interval[1], -1));  // End event
    }
    
    // Sort by time, with end events before start events at same time
    events.sort((a, b) => {
        if (a.time !== b.time) return a.time - b.time;
        return a.type - b.type; // -1 before 1
    });
    
    let concurrent = 0;
    let maxConcurrent = 0;
    
    for (const event of events) {
        concurrent += event.type;
        maxConcurrent = Math.max(maxConcurrent, concurrent);
    }
    
    return maxConcurrent;
};
```
  </div>
</div>

{::options parse_block_html="true" /}

**Complexity Analysis**:
- **Min-heap**: Time O(n log n), Space O(n)
- **Sweep line**: Time O(n log n), Space O(n)

{::options parse_block_html="false" /}
- **Two pointers**: Time O(n log n), Space O(n)

**Key Insights & Patterns**:
- Classic resource allocation using min-heap
- Sweep line algorithm for maximum overlap detection
- Priority queue tracks earliest available resource
- Pattern applies to CPU scheduling, bandwidth allocation

**State Transition Explanation**:
```
For each meeting (sorted by start time):
  if heap.peek() <= meeting.start:
    remove ended meeting from heap (reuse room)
  add meeting.end to heap (allocate room)
  
Maximum heap size = minimum rooms needed
```

---

## Common Interval Patterns Summary

### 1. Interval Merging Pattern
- **Examples**: Merge Intervals, Insert Interval
- **Approach**: Sort by start time, merge overlapping intervals
- **Template**: `if (lastEnd >= currentStart) merge else add`

### 2. Activity Selection Pattern
- **Examples**: Non-overlapping Intervals, Meeting Rooms
- **Approach**: Sort by end time, greedily select earliest-ending activities
- **Template**: Select activities that finish earliest and don't conflict

### 3. Resource Allocation Pattern
- **Examples**: Meeting Rooms II
- **Approach**: Use min-heap to track resource availability
- **Template**: Allocate minimum resources by tracking usage over time

### 4. Sweep Line Pattern
- **Examples**: Meeting Rooms II, Maximum Overlap Problems
- **Approach**: Process events chronologically, track state changes
- **Template**: Create events, sort by time, process state changes

### 5. Conflict Detection Pattern
- **Examples**: Meeting Rooms, Interval Validation
- **Approach**: Sort intervals, check consecutive pairs for overlap
- **Template**: `if (interval[i].end > interval[i+1].start) conflict detected`

---

## Implementation Templates

### Basic Interval Merging Template

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public int[][] mergeIntervals(int[][] intervals) {
    if (intervals.length <= 1) return intervals;
    
    Arrays.sort(intervals, (a, b) -> a[0] - b[0]);
    List<int[]> merged = new ArrayList<>();
    merged.add(intervals[0]);
    
    for (int i = 1; i < intervals.length; i++) {
        int[] last = merged.get(merged.size() - 1);
        int[] current = intervals[i];
        
        if (last[1] >= current[0]) {
            // Merge overlapping intervals
            last[1] = Math.max(last[1], current[1]);
        } else {
            // Add non-overlapping interval
            merged.add(current);
        }
    }
    
    return merged.toArray(new int[merged.size()][]);
}
```
  </div>
  
  <div class="tab-content python">
```python
def merge_intervals(intervals):
    if len(intervals) <= 1:
        return intervals
    
    intervals.sort(key=lambda x: x[0])
    merged = [intervals[0]]
    
    for i in range(1, len(intervals)):
        last = merged[-1]
        current = intervals[i]
        
        if last[1] >= current[0]:
            # Merge overlapping intervals
            last[1] = max(last[1], current[1])
        else:
            # Add non-overlapping interval
            merged.append(current)
    
    return merged
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function mergeIntervals(intervals) {
    if (intervals.length <= 1) return intervals;
    
    intervals.sort((a, b) => a[0] - b[0]);
    const merged = [intervals[0]];
    
    for (let i = 1; i < intervals.length; i++) {
        const last = merged[merged.length - 1];
        const current = intervals[i];
        
        if (last[1] >= current[0]) {
            // Merge overlapping intervals
            last[1] = Math.max(last[1], current[1]);
        } else {
            // Add non-overlapping interval
            merged.push(current);
        }
    }
    
    return merged;
}
```
  </div>
</div>

### Activity Selection Template

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public int maxNonOverlapping(int[][] intervals) {
    if (intervals.length == 0) return 0;
    
    // Sort by end time for greedy selection
    Arrays.sort(intervals, (a, b) -> a[1] - b[1]);
    
    int count = 1;
    int lastEnd = intervals[0][1];
    
    for (int i = 1; i < intervals.length; i++) {
        if (intervals[i][0] >= lastEnd) {
            count++;
            lastEnd = intervals[i][1];
        }
    }
    
    return count;
}
```
  </div>
  
  <div class="tab-content python">
```python
def max_non_overlapping(intervals):
    if not intervals:
        return 0
    
    # Sort by end time for greedy selection
    intervals.sort(key=lambda x: x[1])
    
    count = 1
    last_end = intervals[0][1]
    
    for i in range(1, len(intervals)):
        if intervals[i][0] >= last_end:
            count += 1
            last_end = intervals[i][1]
    
    return count
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function maxNonOverlapping(intervals) {
    if (intervals.length === 0) return 0;
    
    // Sort by end time for greedy selection
    intervals.sort((a, b) => a[1] - b[1]);
    
    let count = 1;
    let lastEnd = intervals[0][1];
    
    for (let i = 1; i < intervals.length; i++) {
        if (intervals[i][0] >= lastEnd) {
            count++;
            lastEnd = intervals[i][1];
        }
    }
    
    return count;
}
```
  </div>
</div>

### Resource Allocation Template

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public int minResources(int[][] intervals) {
    if (intervals.length == 0) return 0;
    
    Arrays.sort(intervals, (a, b) -> a[0] - b[0]);
    PriorityQueue<Integer> heap = new PriorityQueue<>();
    
    for (int[] interval : intervals) {
        if (!heap.isEmpty() && heap.peek() <= interval[0]) {
            heap.poll(); // Reuse resource
        }
        heap.offer(interval[1]); // Allocate resource
    }
    
    return heap.size();
}
```
  </div>
  
  <div class="tab-content python">
```python
import heapq

def min_resources(intervals):
    if not intervals:
        return 0
    
    intervals.sort(key=lambda x: x[0])
    heap = []
    
    for interval in intervals:
        if heap and heap[0] <= interval[0]:
            heapq.heappop(heap)  # Reuse resource
        heapq.heappush(heap, interval[1])  # Allocate resource
    
    return len(heap)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
class MinHeap {
    constructor() {
        this.heap = [];
    }
    
    push(value) {
        this.heap.push(value);
        this.heapifyUp(this.heap.length - 1);
    }
    
    pop() {
        if (this.heap.length === 0) return null;
        if (this.heap.length === 1) return this.heap.pop();
        
        const root = this.heap[0];
        this.heap[0] = this.heap.pop();
        this.heapifyDown(0);
        return root;
    }
    
    peek() {
        return this.heap.length > 0 ? this.heap[0] : null;
    }
    
    size() {
        return this.heap.length;
    }
    
    heapifyUp(index) {
        if (index === 0) return;
        const parentIndex = Math.floor((index - 1) / 2);
        if (this.heap[parentIndex] > this.heap[index]) {
            [this.heap[parentIndex], this.heap[index]] = [this.heap[index], this.heap[parentIndex]];
            this.heapifyUp(parentIndex);
        }
    }
    
    heapifyDown(index) {
        const leftChild = 2 * index + 1;
        const rightChild = 2 * index + 2;
        let smallest = index;
        
        if (leftChild < this.heap.length && this.heap[leftChild] < this.heap[smallest]) {
            smallest = leftChild;
        }
        
        if (rightChild < this.heap.length && this.heap[rightChild] < this.heap[smallest]) {
            smallest = rightChild;
        }
        
        if (smallest !== index) {
            [this.heap[index], this.heap[smallest]] = [this.heap[smallest], this.heap[index]];
            this.heapifyDown(smallest);
        }
    }
}

function minResources(intervals) {
    if (intervals.length === 0) return 0;
    
    intervals.sort((a, b) => a[0] - b[0]);
    const heap = new MinHeap();
    
    for (const interval of intervals) {
        if (heap.size() > 0 && heap.peek() <= interval[0]) {
            heap.pop(); // Reuse resource
        }
        heap.push(interval[1]); // Allocate resource
    }
    
    return heap.size();
}
```
  </div>
</div>

### Sweep Line Template

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public int maxOverlap(int[][] intervals) {
    List<int[]> events = new ArrayList<>();
    
    for (int[] interval : intervals) {
        events.add(new int[]{interval[0], 1});  // Start event
        events.add(new int[]{interval[1], -1}); // End event
    }
    
    events.sort((a, b) -> {
        if (a[0] != b[0]) return a[0] - b[0];
        return a[1] - b[1]; // End before start at same time
    });
    
    int active = 0, maxActive = 0;
    for (int[] event : events) {
        active += event[1];
        maxActive = Math.max(maxActive, active);
    }
    
    return maxActive;
}
```
  </div>
  
  <div class="tab-content python">
```python
def max_overlap(intervals):
    events = []
    
    for interval in intervals:
        events.append((interval[0], 1))   # Start event
        events.append((interval[1], -1))  # End event
    
    events.sort(key=lambda x: (x[0], x[1]))  # End before start at same time
    
    active = 0
    max_active = 0
    for time, event_type in events:
        active += event_type
        max_active = max(max_active, active)
    
    return max_active
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function maxOverlap(intervals) {
    const events = [];
    
    for (const interval of intervals) {
        events.push([interval[0], 1]);   // Start event
        events.push([interval[1], -1]);  // End event
    }
    
    events.sort((a, b) => {
        if (a[0] !== b[0]) return a[0] - b[0];
        return a[1] - b[1]; // End before start at same time
    });
    
    let active = 0;
    let maxActive = 0;
    for (const [time, eventType] of events) {
        active += eventType;
        maxActive = Math.max(maxActive, active);
    }
    
    return maxActive;
}
```
  </div>
</div>

### Overlap Detection Template

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public boolean hasOverlap(int[] interval1, int[] interval2) {
    return Math.max(interval1[0], interval2[0]) < Math.min(interval1[1], interval2[1]);
}

public boolean canScheduleAll(int[][] intervals) {
    Arrays.sort(intervals, (a, b) -> a[0] - b[0]);
    
    for (int i = 0; i < intervals.length - 1; i++) {
        if (intervals[i][1] > intervals[i + 1][0]) {
            return false; // Overlap detected
        }
    }
    
    return true;
}
```
  </div>
  
  <div class="tab-content python">
```python
def has_overlap(interval1, interval2):
    return max(interval1[0], interval2[0]) < min(interval1[1], interval2[1])

def can_schedule_all(intervals):
    intervals.sort(key=lambda x: x[0])
    
    for i in range(len(intervals) - 1):
        if intervals[i][1] > intervals[i + 1][0]:
            return False  # Overlap detected
    
    return True
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function hasOverlap(interval1, interval2) {
    return Math.max(interval1[0], interval2[0]) < Math.min(interval1[1], interval2[1]);
}

function canScheduleAll(intervals) {
    intervals.sort((a, b) => a[0] - b[0]);
    
    for (let i = 0; i < intervals.length - 1; i++) {
        if (intervals[i][1] > intervals[i + 1][0]) {
            return false; // Overlap detected
        }
    }
    
    return true;
}
```
  </div>
</div>

## Final Tips for Interval Problems

### Recognition Patterns:
1. **Keywords**: "intervals", "meetings", "schedule", "overlap", "merge"
2. **Input Format**: Array of `[start, end]` pairs
3. **Operations**: Merge, count, minimize, schedule

### Problem-Solving Strategy:
1. **Identify interval type** - open/closed, inclusive/exclusive boundaries
2. **Choose sorting strategy** - by start time (merging) or end time (selection)
3. **Select algorithm pattern** - merge, sweep line, greedy selection, resource allocation
4. **Handle edge cases** - empty array, single interval, identical intervals
5. **Optimize if needed** - in-place operations, early termination

### Common Mistakes to Avoid:
1. **Wrong sorting strategy** - using start time when end time is optimal
2. **Boundary conditions** - inclusive vs exclusive interval endpoints
3. **Overlap detection** - off-by-one errors in comparison logic
4. **Edge cases** - not handling empty input or single interval
5. **Space complexity** - unnecessary space when in-place modification possible

### Optimization Techniques:
1. **Early termination** - return immediately when answer found
2. **In-place modification** - modify input array when allowed
3. **Binary search** - for insertion point finding in sorted arrays
4. **Two pointers** - alternative to heap for some resource allocation problems

This comprehensive guide provides the foundation for mastering interval problems through the Blind 75 collection. The patterns and templates shown here apply broadly to scheduling, resource allocation, and time management algorithms in both interviews and real-world systems.