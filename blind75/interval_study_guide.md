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
int[][] intervals = {{1,3}, {2,6}, {8,10}};
```

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

**Java Solutions**:

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

**Complexity Analysis**:
- **Time**: O(n) for linear scan, O(log n) for binary search optimization
- **Space**: O(n) for result array (can't avoid since we need to return new array)

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

**Java Solutions**:

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

**Complexity Analysis**:
- **Time**: O(n log n) due to sorting
- **Space**: O(n) for result array (O(log n) if in-place sorting)

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

**Java Solutions**:

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

**Complexity Analysis**:
- **Greedy**: Time O(n log n), Space O(1)
- **DP**: Time O(n²), Space O(n)

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

**Java Solutions**:

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

**Complexity Analysis**:
- **Sorting approach**: Time O(n log n), Space O(1)
- **Brute force**: Time O(n²), Space O(1)
- **Sweep line**: Time O(n log n), Space O(n)

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

**Java Solutions**:

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

**Complexity Analysis**:
- **Min-heap**: Time O(n log n), Space O(n)
- **Sweep line**: Time O(n log n), Space O(n)
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

### Activity Selection Template
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

### Resource Allocation Template
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

### Sweep Line Template
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

### Overlap Detection Template
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