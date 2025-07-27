# Heap Problems Study Guide - Blind 75 LeetCode Problems

## Table of Contents
1. [Introduction to Heaps](#introduction-to-heaps)
2. [Core Concepts and Prerequisites](#core-concepts-and-prerequisites)
3. [Heap Properties and Operations](#heap-properties-and-operations)
4. [Problem-First Approach to Heap Problems](#problem-first-approach-to-heap-problems)
5. [The 3 Heap Problems](#the-3-heap-problems)
   - [1. Merge K Sorted Lists](#1-merge-k-sorted-lists)
   - [2. Top K Frequent Elements](#2-top-k-frequent-elements)
   - [3. Find Median from Data Stream](#3-find-median-from-data-stream)
6. [Common Heap Patterns](#common-heap-patterns)
7. [Implementation Details and Tips](#implementation-details-and-tips)

---

## Introduction to Heaps

A heap is a specialized tree-based data structure that satisfies the heap property. Heaps are most commonly implemented as priority queues and are fundamental for solving problems involving "top K elements," "finding extremes," and "maintaining sorted order."

### Key Characteristics of Heap Problems:
1. **Priority-based Selection**: Need to repeatedly access minimum or maximum elements
2. **Dynamic Data**: Elements are added/removed during processing
3. **Partial Sorting**: Don't need full sorting, just maintaining order of extremes
4. **Efficiency**: Need better than O(n log n) sorting for specific use cases

### Why Learn Heaps?
- **Efficient Priority Access**: O(log n) insertion/deletion with O(1) peek
- **Space Efficient**: Can maintain top K elements without storing all data
- **Real-world Applications**: Task scheduling, graph algorithms, streaming data
- **Interview Frequency**: Very common in technical interviews for optimization problems

---

## Core Concepts and Prerequisites

### 1. Heap Properties
**Min Heap**: Parent node ≤ all children (root is minimum)
**Max Heap**: Parent node ≥ all children (root is maximum)

```
Min Heap Example:       Max Heap Example:
      1                       9
     / \                     / \
    2   3                   7   8
   / \ / \                 / \ / \
  4  5 6  7               3  4 5  6
```

### 2. Complete Binary Tree Structure
- All levels filled except possibly the last
- Last level filled from left to right
- Can be efficiently stored in an array

### 3. Array Representation
```java
// For node at index i:
int parent = (i - 1) / 2;
int leftChild = 2 * i + 1;
int rightChild = 2 * i + 2;
```

### 4. Core Operations
- **Insert (Add)**: O(log n) - Add element and bubble up
- **Extract Min/Max**: O(log n) - Remove root and bubble down
- **Peek**: O(1) - View root element
- **Build Heap**: O(n) - Convert array to heap

### 5. Java Priority Queue
```java
// Min heap (default)
PriorityQueue<Integer> minHeap = new PriorityQueue<>();

// Max heap
PriorityQueue<Integer> maxHeap = new PriorityQueue<>(Collections.reverseOrder());
// OR
PriorityQueue<Integer> maxHeap = new PriorityQueue<>((a, b) -> b - a);

// Custom comparator
PriorityQueue<int[]> heap = new PriorityQueue<>((a, b) -> a[0] - b[0]);
```

---

## Heap Properties and Operations

### Heap Property Maintenance

**Bubble Up (Heapify Up)**:
```java
private void bubbleUp(int index) {
    while (index > 0) {
        int parent = (index - 1) / 2;
        if (heap[index] >= heap[parent]) break;
        swap(index, parent);
        index = parent;
    }
}
```

**Bubble Down (Heapify Down)**:
```java
private void bubbleDown(int index) {
    while (2 * index + 1 < size) {
        int leftChild = 2 * index + 1;
        int rightChild = 2 * index + 2;
        int smallest = leftChild;
        
        if (rightChild < size && heap[rightChild] < heap[leftChild]) {
            smallest = rightChild;
        }
        
        if (heap[index] <= heap[smallest]) break;
        swap(index, smallest);
        index = smallest;
    }
}
```

### Common Heap Patterns
1. **Top K Elements**: Use heap of size K
2. **Sliding Window**: Add/remove elements maintaining heap property
3. **Two Heaps**: Use both min and max heap for median finding
4. **K-way Merge**: Merge multiple sorted sequences

---

## Problem-First Approach to Heap Problems

### How to Identify Heap Problems:
1. **Keywords**: "top K", "largest", "smallest", "median", "priority"
2. **Dynamic Extremes**: Need to track min/max as data changes
3. **Partial Sorting**: Don't need full sort, just ordered access to extremes
4. **K-way Operations**: Merging multiple sorted structures
5. **Streaming Data**: Processing data as it arrives

### Steps to Solve Heap Problems:
1. **Identify what needs ordering** - min, max, or custom priority
2. **Choose heap type** - min heap, max heap, or both
3. **Determine heap size** - fixed K or variable size
4. **Handle heap maintenance** - when to add/remove elements
5. **Extract results** - how to get final answer from heap state
6. **Optimize space/time** - consider heap size constraints

---

## The 3 Heap Problems

### 1. Merge K Sorted Lists

**Problem Statement**: You are given an array of k linked-lists lists, each linked-list is sorted in ascending order. Merge all the linked-lists into one sorted linked-list and return it.

**Example**:
- Input: lists = [[1,4,5],[1,3,4],[2,6]]
- Output: [1,1,2,3,4,4,5,6]

**Knowledge Prerequisites**:
- Linked list manipulation
- Priority queues/heaps
- K-way merging algorithms
- Understanding of merge sort concept

**First Principles**:
At each step, we need to find the minimum among K current elements (one from each list). A min-heap naturally maintains this minimum at the root, allowing us to efficiently extract the next smallest element.

**Problem-First Approach**:
1. **Identify pattern**: K-way merge problem
2. **Use min-heap**: Store list nodes, ordered by their values
3. **Process iteratively**: Extract minimum, add its next node to heap
4. **Build result**: Link extracted nodes to form final sorted list

**Java Solutions**:

```java
// Approach 1: Min Heap with ListNode Objects
class MergeKSortedLists {
    public ListNode mergeKLists(ListNode[] lists) {
        if (lists == null || lists.length == 0) return null;
        
        // Min heap ordered by node values
        PriorityQueue<ListNode> minHeap = new PriorityQueue<>((a, b) -> a.val - b.val);
        
        // Add first node from each non-empty list
        for (ListNode list : lists) {
            if (list != null) {
                minHeap.offer(list);
            }
        }
        
        ListNode dummy = new ListNode(0);
        ListNode current = dummy;
        
        while (!minHeap.isEmpty()) {
            // Extract minimum node
            ListNode minNode = minHeap.poll();
            current.next = minNode;
            current = current.next;
            
            // Add next node from the same list
            if (minNode.next != null) {
                minHeap.offer(minNode.next);
            }
        }
        
        return dummy.next;
    }
}

// Approach 2: Divide and Conquer (More Space Efficient)
class MergeKSortedLists {
    public ListNode mergeKLists(ListNode[] lists) {
        if (lists == null || lists.length == 0) return null;
        if (lists.length == 1) return lists[0];
        
        return mergeKListsHelper(lists, 0, lists.length - 1);
    }
    
    private ListNode mergeKListsHelper(ListNode[] lists, int start, int end) {
        if (start == end) return lists[start];
        if (start + 1 == end) return mergeTwoLists(lists[start], lists[end]);
        
        int mid = start + (end - start) / 2;
        ListNode left = mergeKListsHelper(lists, start, mid);
        ListNode right = mergeKListsHelper(lists, mid + 1, end);
        
        return mergeTwoLists(left, right);
    }
    
    private ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        ListNode dummy = new ListNode(0);
        ListNode current = dummy;
        
        while (l1 != null && l2 != null) {
            if (l1.val <= l2.val) {
                current.next = l1;
                l1 = l1.next;
            } else {
                current.next = l2;
                l2 = l2.next;
            }
            current = current.next;
        }
        
        current.next = (l1 != null) ? l1 : l2;
        return dummy.next;
    }
}

// Approach 3: Iterative Pair Merging
class MergeKSortedLists {
    public ListNode mergeKLists(ListNode[] lists) {
        if (lists == null || lists.length == 0) return null;
        
        while (lists.length > 1) {
            List<ListNode> mergedLists = new ArrayList<>();
            
            // Merge pairs of lists
            for (int i = 0; i < lists.length; i += 2) {
                ListNode list1 = lists[i];
                ListNode list2 = (i + 1 < lists.length) ? lists[i + 1] : null;
                mergedLists.add(mergeTwoLists(list1, list2));
            }
            
            lists = mergedLists.toArray(new ListNode[0]);
        }
        
        return lists[0];
    }
    
    private ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        ListNode dummy = new ListNode(0);
        ListNode current = dummy;
        
        while (l1 != null && l2 != null) {
            if (l1.val <= l2.val) {
                current.next = l1;
                l1 = l1.next;
            } else {
                current.next = l2;
                l2 = l2.next;
            }
            current = current.next;
        }
        
        current.next = (l1 != null) ? l1 : l2;
        return dummy.next;
    }
}

// Approach 4: Using Custom Heap Node (Alternative)
class MergeKSortedLists {
    static class HeapNode {
        ListNode node;
        int listIndex;
        
        HeapNode(ListNode node, int listIndex) {
            this.node = node;
            this.listIndex = listIndex;
        }
    }
    
    public ListNode mergeKLists(ListNode[] lists) {
        if (lists == null || lists.length == 0) return null;
        
        PriorityQueue<HeapNode> minHeap = new PriorityQueue<>((a, b) -> a.node.val - b.node.val);
        
        // Initialize heap with first node from each list
        for (int i = 0; i < lists.length; i++) {
            if (lists[i] != null) {
                minHeap.offer(new HeapNode(lists[i], i));
                lists[i] = lists[i].next;
            }
        }
        
        ListNode dummy = new ListNode(0);
        ListNode current = dummy;
        
        while (!minHeap.isEmpty()) {
            HeapNode minHeapNode = minHeap.poll();
            current.next = minHeapNode.node;
            current = current.next;
            
            // Add next node from the same list
            if (lists[minHeapNode.listIndex] != null) {
                minHeap.offer(new HeapNode(lists[minHeapNode.listIndex], minHeapNode.listIndex));
                lists[minHeapNode.listIndex] = lists[minHeapNode.listIndex].next;
            }
        }
        
        return dummy.next;
    }
}
```

**Complexity Analysis**:
- **Heap Approach**: Time O(N log k), Space O(k) where N = total nodes, k = number of lists
- **Divide & Conquer**: Time O(N log k), Space O(log k) for recursion
- **Iterative Merging**: Time O(N log k), Space O(1)

**Key Insights & Patterns**:
- Min-heap naturally handles K-way minimum selection
- Divide and conquer reduces space complexity
- Pattern applicable to any K-way merging problem
- Heap size stays constant at most K elements

**Heap Solution Walkthrough**:
```
Lists: [1→4→5], [1→3→4], [2→6]
Heap: [1(list0), 1(list1), 2(list2)]

Step 1: Extract 1(list0), add 4(list0)
Result: 1→
Heap: [1(list1), 2(list2), 4(list0)]

Step 2: Extract 1(list1), add 3(list1)
Result: 1→1→
Heap: [2(list2), 4(list0), 3(list1)]

Continue until heap empty...
```

---

### 2. Top K Frequent Elements

**Problem Statement**: Given an integer array nums and an integer k, return the k most frequent elements. You may return the answer in any order.

**Example**:
- Input: nums = [1,1,1,2,2,3], k = 2
- Output: [1,2]

**Knowledge Prerequisites**:
- Hash map for frequency counting
- Priority queues/heaps
- Understanding of top-K problems
- Bucket sort concepts (for optimal solution)

**First Principles**:
We need to find elements with highest frequencies. A max-heap of frequencies would work, but we can optimize by using a min-heap of size K to track only the top K elements, or use bucket sort for linear time.

**Problem-First Approach**:
1. **Count frequencies**: Use hash map to count occurrences
2. **Use heap for selection**: Min-heap of size K for space efficiency
3. **Alternative approaches**: Max-heap or bucket sort for different trade-offs
4. **Extract results**: Convert heap contents to final answer

**Java Solutions**:

```java
// Approach 1: Min Heap of Size K (Space Efficient)
class TopKFrequentElements {
    public int[] topKFrequent(int[] nums, int k) {
        // Count frequencies
        Map<Integer, Integer> frequencyMap = new HashMap<>();
        for (int num : nums) {
            frequencyMap.put(num, frequencyMap.getOrDefault(num, 0) + 1);
        }
        
        // Min heap to keep top k frequent elements
        PriorityQueue<int[]> minHeap = new PriorityQueue<>((a, b) -> a[1] - b[1]);
        
        for (Map.Entry<Integer, Integer> entry : frequencyMap.entrySet()) {
            minHeap.offer(new int[]{entry.getKey(), entry.getValue()});
            
            // Keep only k elements in heap
            if (minHeap.size() > k) {
                minHeap.poll();
            }
        }
        
        // Extract results
        int[] result = new int[k];
        for (int i = k - 1; i >= 0; i--) {
            result[i] = minHeap.poll()[0];
        }
        
        return result;
    }
}

// Approach 2: Max Heap (Intuitive)
class TopKFrequentElements {
    public int[] topKFrequent(int[] nums, int k) {
        Map<Integer, Integer> frequencyMap = new HashMap<>();
        for (int num : nums) {
            frequencyMap.put(num, frequencyMap.getOrDefault(num, 0) + 1);
        }
        
        // Max heap ordered by frequency
        PriorityQueue<Map.Entry<Integer, Integer>> maxHeap = 
            new PriorityQueue<>((a, b) -> b.getValue() - a.getValue());
        
        maxHeap.addAll(frequencyMap.entrySet());
        
        int[] result = new int[k];
        for (int i = 0; i < k; i++) {
            result[i] = maxHeap.poll().getKey();
        }
        
        return result;
    }
}

// Approach 3: Bucket Sort (Optimal O(n) Time)
class TopKFrequentElements {
    public int[] topKFrequent(int[] nums, int k) {
        Map<Integer, Integer> frequencyMap = new HashMap<>();
        for (int num : nums) {
            frequencyMap.put(num, frequencyMap.getOrDefault(num, 0) + 1);
        }
        
        // Create buckets for each possible frequency
        List<Integer>[] buckets = new List[nums.length + 1];
        for (int i = 0; i <= nums.length; i++) {
            buckets[i] = new ArrayList<>();
        }
        
        // Place numbers in buckets based on frequency
        for (Map.Entry<Integer, Integer> entry : frequencyMap.entrySet()) {
            buckets[entry.getValue()].add(entry.getKey());
        }
        
        // Collect top k elements from highest frequency buckets
        List<Integer> result = new ArrayList<>();
        for (int i = buckets.length - 1; i >= 0 && result.size() < k; i--) {
            for (int num : buckets[i]) {
                if (result.size() < k) {
                    result.add(num);
                }
            }
        }
        
        return result.stream().mapToInt(i -> i).toArray();
    }
}

// Approach 4: Using Custom Frequency Class
class TopKFrequentElements {
    static class FrequencyPair {
        int number;
        int frequency;
        
        FrequencyPair(int number, int frequency) {
            this.number = number;
            this.frequency = frequency;
        }
    }
    
    public int[] topKFrequent(int[] nums, int k) {
        Map<Integer, Integer> frequencyMap = new HashMap<>();
        for (int num : nums) {
            frequencyMap.put(num, frequencyMap.getOrDefault(num, 0) + 1);
        }
        
        PriorityQueue<FrequencyPair> minHeap = 
            new PriorityQueue<>((a, b) -> a.frequency - b.frequency);
        
        for (Map.Entry<Integer, Integer> entry : frequencyMap.entrySet()) {
            minHeap.offer(new FrequencyPair(entry.getKey(), entry.getValue()));
            
            if (minHeap.size() > k) {
                minHeap.poll();
            }
        }
        
        int[] result = new int[k];
        for (int i = k - 1; i >= 0; i--) {
            result[i] = minHeap.poll().number;
        }
        
        return result;
    }
}

// Approach 5: Quick Select (Average O(n))
class TopKFrequentElements {
    private Random random = new Random();
    
    public int[] topKFrequent(int[] nums, int k) {
        Map<Integer, Integer> frequencyMap = new HashMap<>();
        for (int num : nums) {
            frequencyMap.put(num, frequencyMap.getOrDefault(num, 0) + 1);
        }
        
        int[] unique = new int[frequencyMap.size()];
        int i = 0;
        for (int num : frequencyMap.keySet()) {
            unique[i++] = num;
        }
        
        quickSelect(unique, 0, unique.length - 1, unique.length - k, frequencyMap);
        
        return Arrays.copyOfRange(unique, unique.length - k, unique.length);
    }
    
    private void quickSelect(int[] nums, int left, int right, int kSmallest, Map<Integer, Integer> frequencyMap) {
        if (left == right) return;
        
        int pivotIndex = left + random.nextInt(right - left + 1);
        pivotIndex = partition(nums, left, right, pivotIndex, frequencyMap);
        
        if (kSmallest == pivotIndex) {
            return;
        } else if (kSmallest < pivotIndex) {
            quickSelect(nums, left, pivotIndex - 1, kSmallest, frequencyMap);
        } else {
            quickSelect(nums, pivotIndex + 1, right, kSmallest, frequencyMap);
        }
    }
    
    private int partition(int[] nums, int left, int right, int pivotIndex, Map<Integer, Integer> frequencyMap) {
        int pivotFreq = frequencyMap.get(nums[pivotIndex]);
        swap(nums, pivotIndex, right);
        
        int storeIndex = left;
        for (int i = left; i <= right; i++) {
            if (frequencyMap.get(nums[i]) < pivotFreq) {
                swap(nums, storeIndex, i);
                storeIndex++;
            }
        }
        
        swap(nums, storeIndex, right);
        return storeIndex;
    }
    
    private void swap(int[] nums, int a, int b) {
        int temp = nums[a];
        nums[a] = nums[b];
        nums[b] = temp;
    }
}
```

**Complexity Analysis**:
- **Min Heap**: Time O(N log k), Space O(N + k)
- **Max Heap**: Time O(N log N), Space O(N)
- **Bucket Sort**: Time O(N), Space O(N)
- **Quick Select**: Time O(N) average, Space O(N)

**Key Insights & Patterns**:
- Min-heap of size K saves space when K << N
- Bucket sort achieves optimal O(N) time for frequency problems
- Pattern applicable to any "top K" selection problem
- Trade-off between time and space complexity

**Min Heap Approach Explanation**:
```
nums = [1,1,1,2,2,3], k = 2
Frequencies: {1:3, 2:2, 3:1}

Min Heap (size ≤ 2):
Add (1,3): heap = [(1,3)]
Add (2,2): heap = [(2,2), (1,3)]
Add (3,1): heap = [(1,1), (1,3)], remove (3,1)

Final heap: [(2,2), (1,3)]
Result: [2, 1] (or [1, 2])
```

---

### 3. Find Median from Data Stream

**Problem Statement**: Design a data structure that supports the following operations: addNum(int num) - Add an integer to the data structure, findMedian() - Return the median of all elements.

**Example**:
```
addNum(1)
addNum(2)
findMedian() → 1.5
addNum(3) 
findMedian() → 2
```

**Knowledge Prerequisites**:
- Understanding of median concept
- Two heaps technique
- Balancing data structures
- Stream processing concepts

**First Principles**:
To find median efficiently, we need quick access to middle element(s). Using two heaps - a max-heap for smaller half and min-heap for larger half - allows us to maintain this access in O(log n) time per insertion.

**Problem-First Approach**:
1. **Two heaps strategy**: Max-heap for left half, min-heap for right half
2. **Balance constraint**: Size difference at most 1
3. **Median calculation**: From heap tops based on total count
4. **Insertion strategy**: Add to appropriate heap, then rebalance

**Java Solutions**:

```java
// Approach 1: Two Heaps (Optimal)
class MedianFinder {
    private PriorityQueue<Integer> maxHeap; // Left half (smaller elements)
    private PriorityQueue<Integer> minHeap; // Right half (larger elements)
    
    public MedianFinder() {
        maxHeap = new PriorityQueue<>(Collections.reverseOrder()); // Max heap
        minHeap = new PriorityQueue<>(); // Min heap (default)
    }
    
    public void addNum(int num) {
        // Add to max heap first
        maxHeap.offer(num);
        
        // Move largest from max heap to min heap
        minHeap.offer(maxHeap.poll());
        
        // Balance heaps if min heap becomes larger
        if (minHeap.size() > maxHeap.size()) {
            maxHeap.offer(minHeap.poll());
        }
    }
    
    public double findMedian() {
        if (maxHeap.size() > minHeap.size()) {
            return maxHeap.peek();
        } else {
            return (maxHeap.peek() + minHeap.peek()) / 2.0;
        }
    }
}

// Approach 2: Alternative Balancing Strategy
class MedianFinder {
    private PriorityQueue<Integer> maxHeap;
    private PriorityQueue<Integer> minHeap;
    
    public MedianFinder() {
        maxHeap = new PriorityQueue<>((a, b) -> b - a); // Max heap
        minHeap = new PriorityQueue<>(); // Min heap
    }
    
    public void addNum(int num) {
        if (maxHeap.isEmpty() || num <= maxHeap.peek()) {
            maxHeap.offer(num);
        } else {
            minHeap.offer(num);
        }
        
        // Rebalance heaps
        if (maxHeap.size() > minHeap.size() + 1) {
            minHeap.offer(maxHeap.poll());
        } else if (minHeap.size() > maxHeap.size() + 1) {
            maxHeap.offer(minHeap.poll());
        }
    }
    
    public double findMedian() {
        if (maxHeap.size() == minHeap.size()) {
            return (maxHeap.peek() + minHeap.peek()) / 2.0;
        } else if (maxHeap.size() > minHeap.size()) {
            return maxHeap.peek();
        } else {
            return minHeap.peek();
        }
    }
}

// Approach 3: Using ArrayList with Binary Search (Less Efficient)
class MedianFinder {
    private List<Integer> data;
    
    public MedianFinder() {
        data = new ArrayList<>();
    }
    
    public void addNum(int num) {
        // Binary search insertion to maintain sorted order
        int pos = Collections.binarySearch(data, num);
        if (pos < 0) {
            pos = -pos - 1;
        }
        data.add(pos, num);
    }
    
    public double findMedian() {
        int n = data.size();
        if (n % 2 == 1) {
            return data.get(n / 2);
        } else {
            return (data.get(n / 2 - 1) + data.get(n / 2)) / 2.0;
        }
    }
}

// Approach 4: Custom Balanced Binary Search Tree
class MedianFinder {
    private TreeNode root;
    private int totalCount;
    
    class TreeNode {
        int val;
        int count;
        int leftSubtreeSize;
        TreeNode left, right;
        
        TreeNode(int val) {
            this.val = val;
            this.count = 1;
            this.leftSubtreeSize = 0;
        }
    }
    
    public MedianFinder() {
        root = null;
        totalCount = 0;
    }
    
    public void addNum(int num) {
        root = insert(root, num);
        totalCount++;
    }
    
    private TreeNode insert(TreeNode node, int val) {
        if (node == null) {
            return new TreeNode(val);
        }
        
        if (val == node.val) {
            node.count++;
        } else if (val < node.val) {
            node.leftSubtreeSize++;
            node.left = insert(node.left, val);
        } else {
            node.right = insert(node.right, val);
        }
        
        return node;
    }
    
    public double findMedian() {
        if (totalCount % 2 == 1) {
            return findKthElement(root, totalCount / 2 + 1);
        } else {
            int k1 = totalCount / 2;
            int k2 = totalCount / 2 + 1;
            return (findKthElement(root, k1) + findKthElement(root, k2)) / 2.0;
        }
    }
    
    private double findKthElement(TreeNode node, int k) {
        if (node == null) return 0;
        
        if (k <= node.leftSubtreeSize) {
            return findKthElement(node.left, k);
        } else if (k <= node.leftSubtreeSize + node.count) {
            return node.val;
        } else {
            return findKthElement(node.right, k - node.leftSubtreeSize - node.count);
        }
    }
}

// Approach 5: Using Multiset (TreeMap simulation)
class MedianFinder {
    private TreeMap<Integer, Integer> treeMap;
    private int totalCount;
    
    public MedianFinder() {
        treeMap = new TreeMap<>();
        totalCount = 0;
    }
    
    public void addNum(int num) {
        treeMap.put(num, treeMap.getOrDefault(num, 0) + 1);
        totalCount++;
    }
    
    public double findMedian() {
        int target1 = (totalCount + 1) / 2;
        int target2 = (totalCount + 2) / 2;
        
        int count = 0;
        Integer median1 = null, median2 = null;
        
        for (Map.Entry<Integer, Integer> entry : treeMap.entrySet()) {
            count += entry.getValue();
            
            if (median1 == null && count >= target1) {
                median1 = entry.getKey();
            }
            if (median2 == null && count >= target2) {
                median2 = entry.getKey();
                break;
            }
        }
        
        return (median1 + median2) / 2.0;
    }
}
```

**Complexity Analysis**:
- **Two Heaps**: addNum O(log n), findMedian O(1)
- **ArrayList**: addNum O(n), findMedian O(1)
- **BST**: addNum O(log n), findMedian O(log n)
- **TreeMap**: addNum O(log n), findMedian O(log n)

**Key Insights & Patterns**:
- Two heaps maintain balance while providing O(log n) operations
- Max-heap stores smaller half, min-heap stores larger half
- Pattern applicable to sliding window median problems
- Balance constraint: |size1 - size2| ≤ 1

**Two Heaps Approach Visualization**:
```
Stream: [1, 2, 3, 4, 5]

After adding 1:
maxHeap: [1]    minHeap: []
Median: 1

After adding 2:
maxHeap: [1]    minHeap: [2]
Median: (1+2)/2 = 1.5

After adding 3:
maxHeap: [2, 1]    minHeap: [3]
Median: 2

After adding 4:
maxHeap: [2, 1]    minHeap: [3, 4]
Median: (2+3)/2 = 2.5

After adding 5:
maxHeap: [3, 2, 1]    minHeap: [4, 5]
Median: 3
```

**Heap Balancing Rules**:
1. Always maintain |maxHeap.size() - minHeap.size()| ≤ 1
2. maxHeap.peek() ≤ minHeap.peek() (when both non-empty)
3. If total elements is odd, larger heap contains median
4. If total elements is even, median is average of both heap tops

---

## Common Heap Patterns

### 1. Top K Elements Pattern
```java
// Template for Top K problems
PriorityQueue<Integer> minHeap = new PriorityQueue<>();

for (int element : elements) {
    minHeap.offer(element);
    if (minHeap.size() > k) {
        minHeap.poll(); // Remove smallest
    }
}
// minHeap now contains top K largest elements
```

### 2. K-way Merge Pattern
```java
// Template for merging K sorted arrays/lists
PriorityQueue<Element> minHeap = new PriorityQueue<>((a, b) -> a.value - b.value);

// Initialize with first element from each array
for (int i = 0; i < k; i++) {
    if (arrays[i].length > 0) {
        minHeap.offer(new Element(arrays[i][0], i, 0));
    }
}

while (!minHeap.isEmpty()) {
    Element min = minHeap.poll();
    result.add(min.value);
    
    // Add next element from same array
    if (min.index + 1 < arrays[min.arrayId].length) {
        minHeap.offer(new Element(
            arrays[min.arrayId][min.index + 1], 
            min.arrayId, 
            min.index + 1
        ));
    }
}
```

### 3. Two Heaps Pattern
```java
// Template for median/balance problems
PriorityQueue<Integer> maxHeap = new PriorityQueue<>(Collections.reverseOrder());
PriorityQueue<Integer> minHeap = new PriorityQueue<>();

public void addElement(int element) {
    if (maxHeap.isEmpty() || element <= maxHeap.peek()) {
        maxHeap.offer(element);
    } else {
        minHeap.offer(element);
    }
    
    // Rebalance
    if (maxHeap.size() > minHeap.size() + 1) {
        minHeap.offer(maxHeap.poll());
    } else if (minHeap.size() > maxHeap.size() + 1) {
        maxHeap.offer(minHeap.poll());
    }
}
```

### 4. Sliding Window with Heap
```java
// Template for sliding window extremes
PriorityQueue<int[]> maxHeap = new PriorityQueue<>((a, b) -> b[0] - a[0]);

for (int i = 0; i < nums.length; i++) {
    // Add current element with its index
    maxHeap.offer(new int[]{nums[i], i});
    
    // Remove elements outside window
    while (!maxHeap.isEmpty() && maxHeap.peek()[1] <= i - k) {
        maxHeap.poll();
    }
    
    // Current window maximum
    if (i >= k - 1) {
        result.add(maxHeap.peek()[0]);
    }
}
```

### 5. Custom Priority Objects
```java
// Template for complex priority comparisons
class Task {
    int priority;
    int timestamp;
    String name;
    
    Task(int priority, int timestamp, String name) {
        this.priority = priority;
        this.timestamp = timestamp;
        this.name = name;
    }
}

PriorityQueue<Task> taskQueue = new PriorityQueue<>((a, b) -> {
    if (a.priority != b.priority) {
        return b.priority - a.priority; // Higher priority first
    }
    return a.timestamp - b.timestamp; // Earlier timestamp first
});
```

---

## Implementation Details and Tips

### Java PriorityQueue Features
```java
// Construction options
PriorityQueue<Integer> minHeap = new PriorityQueue<>();
PriorityQueue<Integer> maxHeap = new PriorityQueue<>(Collections.reverseOrder());
PriorityQueue<Integer> customHeap = new PriorityQueue<>((a, b) -> a - b);

// Key operations
heap.offer(element);    // Add element - O(log n)
heap.poll();           // Remove and return min/max - O(log n)
heap.peek();           // View min/max without removing - O(1)
heap.size();           // Get size - O(1)
heap.isEmpty();        // Check if empty - O(1)
```

### Common Pitfalls
1. **Wrong Comparator**: Ensure correct ordering (min vs max heap)
2. **Null Handling**: PriorityQueue doesn't allow null elements
3. **Equals vs Comparator**: compareTo should be consistent with equals
4. **Size Management**: Remember to limit heap size for "top K" problems
5. **Index Tracking**: When elements can be duplicated, track indices separately

### Performance Considerations
```java
// Space optimization for top K problems
PriorityQueue<Integer> heap = new PriorityQueue<>(k + 1);

// Batch operations
List<Integer> elements = Arrays.asList(1, 2, 3, 4, 5);
PriorityQueue<Integer> heap = new PriorityQueue<>(elements);

// Avoid repeated polling for multiple results
List<Integer> results = new ArrayList<>();
while (!heap.isEmpty()) {
    results.add(heap.poll());
}
```

### Custom Heap Implementation (When Needed)
```java
class MinHeap {
    private int[] heap;
    private int size;
    private int capacity;
    
    public MinHeap(int capacity) {
        this.capacity = capacity;
        this.heap = new int[capacity];
        this.size = 0;
    }
    
    private int parent(int i) { return (i - 1) / 2; }
    private int leftChild(int i) { return 2 * i + 1; }
    private int rightChild(int i) { return 2 * i + 2; }
    
    public void insert(int value) {
        if (size >= capacity) throw new RuntimeException("Heap overflow");
        
        heap[size] = value;
        int current = size++;
        
        // Bubble up
        while (current > 0 && heap[current] < heap[parent(current)]) {
            swap(current, parent(current));
            current = parent(current);
        }
    }
    
    public int extractMin() {
        if (size <= 0) throw new RuntimeException("Heap underflow");
        
        int root = heap[0];
        heap[0] = heap[--size];
        heapify(0);
        
        return root;
    }
    
    private void heapify(int i) {
        int left = leftChild(i);
        int right = rightChild(i);
        int smallest = i;
        
        if (left < size && heap[left] < heap[smallest]) {
            smallest = left;
        }
        if (right < size && heap[right] < heap[smallest]) {
            smallest = right;
        }
        
        if (smallest != i) {
            swap(i, smallest);
            heapify(smallest);
        }
    }
    
    private void swap(int i, int j) {
        int temp = heap[i];
        heap[i] = heap[j];
        heap[j] = temp;
    }
    
    public int peek() {
        if (size <= 0) throw new RuntimeException("Heap is empty");
        return heap[0];
    }
    
    public int size() { return size; }
    public boolean isEmpty() { return size == 0; }
}
```

---

## Final Tips for Heap Mastery

### Recognition Patterns:
1. **Keywords**: "top K", "largest", "smallest", "median", "priority", "kth element"
2. **Stream Processing**: Data arrives continuously, need efficient updates
3. **Partial Sorting**: Don't need full sort, just access to extremes
4. **K-way Problems**: Merging or selecting from multiple sources

### Problem-Solving Strategy:
1. **Identify heap type needed** - min heap, max heap, or both
2. **Determine heap size** - fixed K, growing, or balanced pair
3. **Choose insertion strategy** - when and how to add elements
4. **Plan extraction method** - how to get final results
5. **Consider space optimization** - can you limit heap size?

### When to Use Each Approach:
- **Single Heap**: Top K problems, priority scheduling
- **Two Heaps**: Median finding, balanced partitioning
- **Multiple Heaps**: Complex priority systems, multi-criteria sorting
- **Heap with HashMap**: Frequency-based problems, duplicate handling

### Common Mistakes to Avoid:
1. Using wrong heap type (min vs max)
2. Not maintaining heap size constraints
3. Incorrect comparator implementation
4. Forgetting to handle empty heap cases
5. Not considering duplicate elements properly

### Optimization Techniques:
- Use heap size limit for space efficiency
- Consider bucket sort for small range problems
- Use lazy deletion for complex removal patterns
- Combine with other data structures (HashMap, etc.)

This comprehensive guide provides the foundation for mastering heap-based solutions in the Blind 75 problems. Focus on understanding when heaps provide optimal solutions and practice implementing the core patterns until they become intuitive.