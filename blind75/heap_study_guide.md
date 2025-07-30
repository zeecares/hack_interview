---
render_with_liquid: false
---

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
<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// For node at index i:
int parent = (i - 1) / 2;
int leftChild = 2 * i + 1;
int rightChild = 2 * i + 2;
```
  </div>
  
  <div class="tab-content python">
```python
# For node at index i:
parent = (i - 1) // 2
left_child = 2 * i + 1
right_child = 2 * i + 2
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// For node at index i:
const parent = Math.floor((i - 1) / 2);
const leftChild = 2 * i + 1;
const rightChild = 2 * i + 2;
```
  </div>
</div>

### 4. Core Operations
- **Insert (Add)**: O(log n) - Add element and bubble up
- **Extract Min/Max**: O(log n) - Remove root and bubble down
- **Peek**: O(1) - View root element
- **Build Heap**: O(n) - Convert array to heap

### 5. Priority Queue/Heap Usage
<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
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
  </div>
  
  <div class="tab-content python">
```python
import heapq

# Min heap (heapq default)
min_heap = []
heapq.heappush(min_heap, value)
min_val = heapq.heappop(min_heap)

# Max heap (negate values)
max_heap = []
heapq.heappush(max_heap, -value)  # Negate when pushing
max_val = -heapq.heappop(max_heap)  # Negate when popping

# Custom comparator using class
class CustomItem:
    def __init__(self, value, priority):
        self.value = value
        self.priority = priority
    def __lt__(self, other):
        return self.priority < other.priority

heap = []
heapq.heappush(heap, CustomItem(value, priority))
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Min heap implementation
class MinHeap {
    constructor() {
        this.heap = [];
    }
    
    push(val) {
        this.heap.push(val);
        this._bubbleUp(this.heap.length - 1);
    }
    
    pop() {
        if (this.heap.length === 0) return null;
        if (this.heap.length === 1) return this.heap.pop();
        
        const root = this.heap[0];
        this.heap[0] = this.heap.pop();
        this._bubbleDown(0);
        return root;
    }
    
    peek() { return this.heap[0]; }
    size() { return this.heap.length; }
}

// Max heap (negate values or reverse comparator)
class MaxHeap extends MinHeap {
    _compare(i, j) {
        return this.heap[i] > this.heap[j];
    }
}
```
  </div>
</div>

---

## Heap Properties and Operations

### Heap Property Maintenance

**Bubble Up (Heapify Up)**:
<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
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
  </div>
  
  <div class="tab-content python">
```python
def _bubble_up(self, index):
    while index > 0:
        parent = (index - 1) // 2
        if self.heap[index] >= self.heap[parent]:
            break
        self._swap(index, parent)
        index = parent
```
  </div>
  
  <div class="tab-content javascript">
```javascript
_bubbleUp(index) {
    while (index > 0) {
        const parent = Math.floor((index - 1) / 2);
        if (this.heap[index] >= this.heap[parent]) break;
        this._swap(index, parent);
        index = parent;
    }
}
```
  </div>
</div>

**Bubble Down (Heapify Down)**:
<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
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
  </div>
  
  <div class="tab-content python">
```python
def _bubble_down(self, index):
    while 2 * index + 1 < self.size:
        left_child = 2 * index + 1
        right_child = 2 * index + 2
        smallest = left_child
        
        if (right_child < self.size and 
            self.heap[right_child] < self.heap[left_child]):
            smallest = right_child
        
        if self.heap[index] <= self.heap[smallest]:
            break
        self._swap(index, smallest)
        index = smallest
```
  </div>
  
  <div class="tab-content javascript">
```javascript
_bubbleDown(index) {
    while (2 * index + 1 < this.heap.length) {
        const leftChild = 2 * index + 1;
        const rightChild = 2 * index + 2;
        let smallest = leftChild;
        
        if (rightChild < this.heap.length && 
            this.heap[rightChild] < this.heap[leftChild]) {
            smallest = rightChild;
        }
        
        if (this.heap[index] <= this.heap[smallest]) break;
        this._swap(index, smallest);
        index = smallest;
    }
}
```
  </div>
</div>

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

**🔗 LeetCode Link:** [Merge k Sorted Lists - LeetCode #23](https://leetcode.com/problems/merge-k-sorted-lists/)

#### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. If you were merging K sorted lists manually, what would be your strategy to always pick the smallest next element?
2. How could a data structure help you efficiently find the minimum among K current candidates?
3. What's the trade-off between using a heap versus a divide-and-conquer approach for this problem?

*Take a moment to think through these questions before continuing...*

#### 💡 Discovery Process (Guided Learning)

**Step 1: Understanding the K-Way Merge Challenge**
> **Guided Question:** What makes merging K sorted lists different from merging just 2 sorted lists, and why can't you simply extend the two-pointer technique?

<details>
<summary>💭 Think about it, then click to reveal</summary>

With 2 lists, you have 2 pointers and pick the smaller element. With K lists, you have K pointers and need to find the minimum among K candidates at each step.

A naive approach would check all K positions each time (O(K) per element), leading to O(NK) complexity. We need a more efficient way to track and extract the minimum from K candidates.

This is where heaps shine - they maintain the minimum at the top while allowing O(log K) insertions and extractions.
</details>

**Step 2: Heap-Based Solution Strategy**
> **Guided Question:** How can a min-heap help you efficiently select the next smallest element when merging K sorted lists?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Min-heap approach:
1. Initially add the first node from each non-empty list to a min-heap
2. Repeatedly extract the minimum node from the heap
3. Add the extracted node to your result list
4. If the extracted node has a next node, add that next node to the heap
5. Continue until heap is empty

The heap always contains at most K nodes (one from each list), giving us O(log K) operations while processing all N total nodes.
</details>

**Step 3: Alternative Divide-and-Conquer Approach**
> **Guided Question:** How could you use the "merge two sorted lists" algorithm recursively to solve this problem, and what are the complexity implications?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Divide-and-conquer strategy:
1. Pair up the K lists and merge each pair using the standard two-list merge
2. This reduces K lists to K/2 lists
3. Repeat until only one list remains
4. Each level processes all N nodes, and there are log K levels

This approach has the same O(N log K) time complexity but uses O(log K) space for recursion instead of O(K) space for the heap. It's often preferred when you want to minimize extra space usage.
</details>

#### 🎯 Practice & Self-Assessment

**Implementation Challenge**
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Create a min-heap that compares ListNode values
- [ ] Add the first node from each non-empty list to the heap
- [ ] Set up a dummy node and current pointer for building result
- [ ] Extract minimum from heap, add to result, and add its next node to heap
- [ ] Continue until heap is empty

**Reflection Questions**
After solving, think about:

1. **Understanding Check:** Can you trace through merging [[1,4,5],[1,3,4],[2,6]] using the heap approach?
2. **Complexity Analysis:** Why is the heap approach O(N log K) and not O(N K)?
3. **Trade-offs:** When would you choose divide-and-conquer over the heap approach?
4. **Pattern Recognition:** What other problems involve K-way merging or selecting minimums from multiple sources?

**Confidence Rating**
Rate your confidence (1-5) on:
- [ ] Understanding the K-way merge problem: ___/5
- [ ] Implementing the heap-based solution: ___/5  
- [ ] Explaining the divide-and-conquer alternative: ___/5
- [ ] Recognizing when to apply K-way merge patterns: ___/5

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

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
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
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: Min Heap with ListNode Objects
import heapq

class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
    
    def __lt__(self, other):
        return self.val < other.val

class MergeKSortedLists:
    def mergeKLists(self, lists):
        if not lists or len(lists) == 0:
            return None
        
        # Min heap with ListNode objects
        min_heap = []
        
        # Add first node from each non-empty list
        for i, list_head in enumerate(lists):
            if list_head:
                heapq.heappush(min_heap, list_head)
        
        dummy = ListNode(0)
        current = dummy
        
        while min_heap:
            # Extract minimum node
            min_node = heapq.heappop(min_heap)
            current.next = min_node
            current = current.next
            
            # Add next node from the same list
            if min_node.next:
                heapq.heappush(min_heap, min_node.next)
        
        return dummy.next

# Approach 2: Divide and Conquer (More Space Efficient)
class MergeKSortedLists:
    def mergeKLists(self, lists):
        if not lists or len(lists) == 0:
            return None
        if len(lists) == 1:
            return lists[0]
        
        return self._merge_k_lists_helper(lists, 0, len(lists) - 1)
    
    def _merge_k_lists_helper(self, lists, start, end):
        if start == end:
            return lists[start]
        if start + 1 == end:
            return self._merge_two_lists(lists[start], lists[end])
        
        mid = start + (end - start) // 2
        left = self._merge_k_lists_helper(lists, start, mid)
        right = self._merge_k_lists_helper(lists, mid + 1, end)
        
        return self._merge_two_lists(left, right)
    
    def _merge_two_lists(self, l1, l2):
        dummy = ListNode(0)
        current = dummy
        
        while l1 and l2:
            if l1.val <= l2.val:
                current.next = l1
                l1 = l1.next
            else:
                current.next = l2
                l2 = l2.next
            current = current.next
        
        current.next = l1 if l1 else l2
        return dummy.next
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: Min Heap with ListNode Objects
class ListNode {
    constructor(val = 0, next = null) {
        this.val = val;
        this.next = next;
    }
}

class MinHeap {
    constructor() {
        this.heap = [];
    }
    
    push(node) {
        this.heap.push(node);
        this._bubbleUp(this.heap.length - 1);
    }
    
    pop() {
        if (this.heap.length === 0) return null;
        if (this.heap.length === 1) return this.heap.pop();
        
        const root = this.heap[0];
        this.heap[0] = this.heap.pop();
        this._bubbleDown(0);
        return root;
    }
    
    isEmpty() { return this.heap.length === 0; }
    
    _bubbleUp(index) {
        while (index > 0) {
            const parent = Math.floor((index - 1) / 2);
            if (this.heap[index].val >= this.heap[parent].val) break;
            [this.heap[index], this.heap[parent]] = [this.heap[parent], this.heap[index]];
            index = parent;
        }
    }
    
    _bubbleDown(index) {
        while (2 * index + 1 < this.heap.length) {
            const leftChild = 2 * index + 1;
            const rightChild = 2 * index + 2;
            let smallest = leftChild;
            
            if (rightChild < this.heap.length && 
                this.heap[rightChild].val < this.heap[leftChild].val) {
                smallest = rightChild;
            }
            
            if (this.heap[index].val <= this.heap[smallest].val) break;
            [this.heap[index], this.heap[smallest]] = [this.heap[smallest], this.heap[index]];
            index = smallest;
        }
    }
}

class MergeKSortedLists {
    mergeKLists(lists) {
        if (!lists || lists.length === 0) return null;
        
        // Min heap ordered by node values
        const minHeap = new MinHeap();
        
        // Add first node from each non-empty list
        for (const list of lists) {
            if (list !== null) {
                minHeap.push(list);
            }
        }
        
        const dummy = new ListNode(0);
        let current = dummy;
        
        while (!minHeap.isEmpty()) {
            // Extract minimum node
            const minNode = minHeap.pop();
            current.next = minNode;
            current = current.next;
            
            // Add next node from the same list
            if (minNode.next !== null) {
                minHeap.push(minNode.next);
            }
        }
        
        return dummy.next;
    }

    // Approach 2: Divide and Conquer (More Space Efficient)
    mergeKListsDivideConquer(lists) {
        if (!lists || lists.length === 0) return null;
        if (lists.length === 1) return lists[0];
        
        return this._mergeKListsHelper(lists, 0, lists.length - 1);
    }
    
    _mergeKListsHelper(lists, start, end) {
        if (start === end) return lists[start];
        if (start + 1 === end) return this._mergeTwoLists(lists[start], lists[end]);
        
        const mid = Math.floor(start + (end - start) / 2);
        const left = this._mergeKListsHelper(lists, start, mid);
        const right = this._mergeKListsHelper(lists, mid + 1, end);
        
        return this._mergeTwoLists(left, right);
    }
    
    _mergeTwoLists(l1, l2) {
        const dummy = new ListNode(0);
        let current = dummy;
        
        while (l1 !== null && l2 !== null) {
            if (l1.val <= l2.val) {
                current.next = l1;
                l1 = l1.next;
            } else {
                current.next = l2;
                l2 = l2.next;
            }
            current = current.next;
        }
        
        current.next = l1 !== null ? l1 : l2;
        return dummy.next;
    }
}
```
  </div>
</div>

{::options parse_block_html="true" /}

**Complexity Analysis**:
- **Heap Approach**: Time O(N log k), Space O(k) where N = total nodes, k = number of lists
- **Divide & Conquer**: Time O(N log k), Space O(log k) for recursion
- **Iterative Merging**: Time O(N log k), Space O(1)

{::options parse_block_html="false" /}

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

**🔗 LeetCode Link:** [Top K Frequent Elements - LeetCode #347](https://leetcode.com/problems/top-k-frequent-elements/)

#### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. How would you approach finding the most frequent elements - do you need to sort all frequencies or just find the top K?
2. What's the difference between using a min-heap versus a max-heap for this "top K" problem?
3. Could you solve this problem in linear time, and what data structure would make that possible?

*Take a moment to think through these questions before continuing...*

#### 💡 Discovery Process (Guided Learning)

**Step 1: Frequency Counting Strategy**
> **Guided Question:** What's the first step needed before you can find the most frequent elements, and what data structure is ideal for this task?

<details>
<summary>💭 Think about it, then click to reveal</summary>

You need to count how many times each element appears. A HashMap (or frequency counter) is perfect for this:
- Key: the element value
- Value: count of occurrences

After one pass through the array, you'll have all frequencies. But now you have a new problem: among all these frequency counts, how do you efficiently find the K highest ones?

This transforms the problem from "count frequencies" to "find top K from frequencies."
</details>

**Step 2: Min-Heap vs Max-Heap Strategy**
> **Guided Question:** For finding top K frequent elements, would you use a min-heap or max-heap, and what's the key insight about heap size?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Min-heap approach (optimal for space):**
- Maintain a min-heap of size K
- For each frequency, add to heap
- If heap size exceeds K, remove the minimum (least frequent among current K)
- Final heap contains exactly the K most frequent elements

**Max-heap approach (intuitive):**
- Add all frequencies to a max-heap
- Extract the top K elements

The min-heap is more space-efficient: O(K) vs O(N) space, especially important when K << N.
</details>

**Step 3: Linear Time Optimization**
> **Guided Question:** Can you achieve O(N) time complexity instead of O(N log K), and what insight about frequency ranges makes this possible?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Bucket Sort approach:**
Since frequencies are bounded (0 to N), you can use bucket sort:
1. Create buckets indexed by frequency (0 to N)
2. Place each element in the bucket corresponding to its frequency
3. Traverse buckets from high to low frequency, collecting elements until you have K

This achieves O(N) time because:
- Frequency counting: O(N)
- Bucket placement: O(N) 
- Bucket traversal: O(N)

Trade-off: Uses O(N) space but achieves optimal time complexity.
</details>

#### 🎯 Practice & Self-Assessment

**Implementation Challenge**
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Count frequencies using a HashMap
- [ ] Create a min-heap of size K to track top frequencies
- [ ] Iterate through frequency map, maintaining heap size ≤ K
- [ ] Extract final results from the heap
- [ ] Handle edge cases (K equals array length, single element)

**Reflection Questions**
After solving, think about:

1. **Understanding Check:** Can you trace through finding top 2 frequent elements in [1,1,1,2,2,3] using the min-heap approach?
2. **Complexity Analysis:** Why does the min-heap approach use O(N log K) time instead of O(N log N)?
3. **Trade-offs:** When would you choose bucket sort over the heap approach despite higher space usage?
4. **Pattern Recognition:** What other "top K" problems can use similar heap-based selection techniques?

**Confidence Rating**
Rate your confidence (1-5) on:
- [ ] Understanding frequency counting fundamentals: ___/5
- [ ] Implementing the min-heap optimization: ___/5  
- [ ] Explaining the bucket sort linear-time approach: ___/5
- [ ] Recognizing top-K pattern applications: ___/5

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

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
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

// Approach 2: Bucket Sort (Optimal O(n) Time)
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
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: Min Heap of Size K (Space Efficient)
import heapq
from collections import Counter

class TopKFrequentElements:
    def topKFrequent(self, nums, k):
        # Count frequencies
        frequency_map = Counter(nums)
        
        # Min heap to keep top k frequent elements
        min_heap = []
        
        for num, freq in frequency_map.items():
            heapq.heappush(min_heap, (freq, num))
            
            # Keep only k elements in heap
            if len(min_heap) > k:
                heapq.heappop(min_heap)
        
        # Extract results
        result = []
        while min_heap:
            freq, num = heapq.heappop(min_heap)
            result.append(num)
        
        return result[::-1]  # Reverse to get highest freq first
    
    # Approach 2: Bucket Sort (Optimal O(n) Time)
    def topKFrequentBucket(self, nums, k):
        frequency_map = Counter(nums)
        
        # Create buckets for each possible frequency
        buckets = [[] for _ in range(len(nums) + 1)]
        
        # Place numbers in buckets based on frequency
        for num, freq in frequency_map.items():
            buckets[freq].append(num)
        
        # Collect top k elements from highest frequency buckets
        result = []
        for i in range(len(buckets) - 1, -1, -1):
            for num in buckets[i]:
                if len(result) < k:
                    result.append(num)
                else:
                    break
            if len(result) == k:
                break
        
        return result
    
    # Approach 3: Max Heap (Intuitive)
    def topKFrequentMaxHeap(self, nums, k):
        frequency_map = Counter(nums)
        
        # Max heap ordered by frequency (negate for max heap)
        max_heap = []
        for num, freq in frequency_map.items():
            heapq.heappush(max_heap, (-freq, num))
        
        result = []
        for _ in range(k):
            freq, num = heapq.heappop(max_heap)
            result.append(num)
        
        return result
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: Min Heap of Size K (Space Efficient)
class MinHeap {
    constructor() {
        this.heap = [];
    }
    
    push(item) {
        this.heap.push(item);
        this._bubbleUp(this.heap.length - 1);
    }
    
    pop() {
        if (this.heap.length === 0) return null;
        if (this.heap.length === 1) return this.heap.pop();
        
        const root = this.heap[0];
        this.heap[0] = this.heap.pop();
        this._bubbleDown(0);
        return root;
    }
    
    size() { return this.heap.length; }
    
    _bubbleUp(index) {
        while (index > 0) {
            const parent = Math.floor((index - 1) / 2);
            if (this.heap[index][1] >= this.heap[parent][1]) break;
            [this.heap[index], this.heap[parent]] = [this.heap[parent], this.heap[index]];
            index = parent;
        }
    }
    
    _bubbleDown(index) {
        while (2 * index + 1 < this.heap.length) {
            const leftChild = 2 * index + 1;
            const rightChild = 2 * index + 2;
            let smallest = leftChild;
            
            if (rightChild < this.heap.length && 
                this.heap[rightChild][1] < this.heap[leftChild][1]) {
                smallest = rightChild;
            }
            
            if (this.heap[index][1] <= this.heap[smallest][1]) break;
            [this.heap[index], this.heap[smallest]] = [this.heap[smallest], this.heap[index]];
            index = smallest;
        }
    }
}

class TopKFrequentElements {
    topKFrequent(nums, k) {
        // Count frequencies
        const frequencyMap = new Map();
        for (const num of nums) {
            frequencyMap.set(num, (frequencyMap.get(num) || 0) + 1);
        }
        
        // Min heap to keep top k frequent elements
        const minHeap = new MinHeap();
        
        for (const [num, freq] of frequencyMap) {
            minHeap.push([num, freq]);
            
            // Keep only k elements in heap
            if (minHeap.size() > k) {
                minHeap.pop();
            }
        }
        
        // Extract results
        const result = [];
        while (minHeap.size() > 0) {
            const [num, freq] = minHeap.pop();
            result.unshift(num); // Add to front for correct order
        }
        
        return result;
    }
    
    // Approach 2: Bucket Sort (Optimal O(n) Time)
    topKFrequentBucket(nums, k) {
        const frequencyMap = new Map();
        for (const num of nums) {
            frequencyMap.set(num, (frequencyMap.get(num) || 0) + 1);
        }
        
        // Create buckets for each possible frequency
        const buckets = Array(nums.length + 1).fill(null).map(() => []);
        
        // Place numbers in buckets based on frequency
        for (const [num, freq] of frequencyMap) {
            buckets[freq].push(num);
        }
        
        // Collect top k elements from highest frequency buckets
        const result = [];
        for (let i = buckets.length - 1; i >= 0 && result.length < k; i--) {
            for (const num of buckets[i]) {
                if (result.length < k) {
                    result.push(num);
                }
            }
        }
        
        return result;
    }
}
```
  </div>
</div>

{::options parse_block_html="true" /}

**Complexity Analysis**:
- **Min Heap**: Time O(N log k), Space O(N + k)
- **Max Heap**: Time O(N log N), Space O(N)
- **Bucket Sort**: Time O(N), Space O(N)
- **Quick Select**: Time O(N) average, Space O(N)

{::options parse_block_html="false" /}

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

**🔗 LeetCode Link:** [Find Median from Data Stream - LeetCode #295](https://leetcode.com/problems/find-median-from-data-stream/)

#### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. How would you efficiently find the median if you could only access the middle element(s) without sorting the entire dataset?
2. What's the relationship between the median and splitting data into two equal halves?
3. How could two heaps work together to maintain access to the middle elements of a growing dataset?

*Take a moment to think through these questions before continuing...*

#### 💡 Discovery Process (Guided Learning)

**Step 1: Understanding the Median Challenge**
> **Guided Question:** What makes finding the median in a streaming context different from finding it in a static array, and why is sorting not practical here?

<details>
<summary>💭 Think about it, then click to reveal</summary>

In a static array, you sort once and access the middle element(s). But in a data stream:
- Elements arrive one by one
- You need the median after each insertion
- Re-sorting after each insertion would be O(N log N) per operation
- You need O(log N) insertion and O(1) median access

The key insight: you don't need the entire array sorted, just efficient access to the "middle" elements. This suggests maintaining a data structure that keeps track of the boundary between smaller and larger halves.
</details>

**Step 2: Two Heaps Strategy**
> **Guided Question:** How can you use a max-heap and min-heap together to always know the median without sorting all elements?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Two-heap approach:**
- **Max-heap (left half):** Stores the smaller half of numbers
- **Min-heap (right half):** Stores the larger half of numbers
- **Balance constraint:** Size difference ≤ 1

The median is always:
- If total count is odd: top of the larger heap
- If total count is even: average of both heap tops

This gives you O(log N) insertion and O(1) median access, with the heaps maintaining the "split point" automatically.
</details>

**Step 3: Balance Maintenance Strategy**
> **Guided Question:** How do you decide which heap to add a new number to, and how do you maintain the balance between heap sizes?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Insertion and balancing strategy:**
1. **Smart insertion:** Always add to max-heap first, then transfer top to min-heap
2. **Size balancing:** If min-heap becomes larger, move its top back to max-heap
3. **Alternative:** Compare with heap tops to decide direct placement, then rebalance

**Why this works:**
- Ensures proper ordering: max-heap.top ≤ min-heap.top
- Maintains size constraint: |size1 - size2| ≤ 1
- Automatically positions the median at heap tops

The balancing step is crucial - without it, you could end up with incorrect ordering or unbalanced sizes.
</details>

#### 🎯 Practice & Self-Assessment

**Implementation Challenge**
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Initialize max-heap for left half and min-heap for right half
- [ ] Implement addNum with proper insertion and balancing logic
- [ ] Implement findMedian based on heap sizes and tops
- [ ] Handle edge cases (empty heaps, single element)
- [ ] Ensure heap ordering constraint is maintained

**Reflection Questions**
After solving, think about:

1. **Understanding Check:** Can you trace through adding [1,2,3,4,5] and finding medians at each step?
2. **Complexity Analysis:** Why is addNum O(log N) and findMedian O(1) with this approach?
3. **Trade-offs:** What are the space and time trade-offs compared to keeping a sorted array?
4. **Pattern Recognition:** What other problems involve maintaining access to "middle" or "extreme" elements in dynamic data?

**Confidence Rating**
Rate your confidence (1-5) on:
- [ ] Understanding the two-heap strategy: ___/5
- [ ] Implementing the balancing logic correctly: ___/5  
- [ ] Explaining why this approach is optimal: ___/5
- [ ] Recognizing applications to sliding window median problems: ___/5

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

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
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
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: Two Heaps (Optimal)
import heapq

class MedianFinder:
    def __init__(self):
        self.max_heap = []  # Left half (smaller elements) - negate for max heap
        self.min_heap = []  # Right half (larger elements)
    
    def addNum(self, num):
        # Add to max heap first (negate for max heap behavior)
        heapq.heappush(self.max_heap, -num)
        
        # Move largest from max heap to min heap
        heapq.heappush(self.min_heap, -heapq.heappop(self.max_heap))
        
        # Balance heaps if min heap becomes larger
        if len(self.min_heap) > len(self.max_heap):
            heapq.heappush(self.max_heap, -heapq.heappop(self.min_heap))
    
    def findMedian(self):
        if len(self.max_heap) > len(self.min_heap):
            return -self.max_heap[0]
        else:
            return (-self.max_heap[0] + self.min_heap[0]) / 2.0

# Approach 2: Alternative Balancing Strategy
class MedianFinder:
    def __init__(self):
        self.max_heap = []  # Left half (negate for max heap)
        self.min_heap = []  # Right half
    
    def addNum(self, num):
        if not self.max_heap or num <= -self.max_heap[0]:
            heapq.heappush(self.max_heap, -num)
        else:
            heapq.heappush(self.min_heap, num)
        
        # Rebalance heaps
        if len(self.max_heap) > len(self.min_heap) + 1:
            heapq.heappush(self.min_heap, -heapq.heappop(self.max_heap))
        elif len(self.min_heap) > len(self.max_heap) + 1:
            heapq.heappush(self.max_heap, -heapq.heappop(self.min_heap))
    
    def findMedian(self):
        if len(self.max_heap) == len(self.min_heap):
            return (-self.max_heap[0] + self.min_heap[0]) / 2.0
        elif len(self.max_heap) > len(self.min_heap):
            return -self.max_heap[0]
        else:
            return self.min_heap[0]

# Approach 3: Using Custom Heap Classes
class MaxHeap:
    def __init__(self):
        self.heap = []
    
    def push(self, val):
        heapq.heappush(self.heap, -val)
    
    def pop(self):
        return -heapq.heappop(self.heap)
    
    def peek(self):
        return -self.heap[0] if self.heap else None
    
    def size(self):
        return len(self.heap)

class MinHeap:
    def __init__(self):
        self.heap = []
    
    def push(self, val):
        heapq.heappush(self.heap, val)
    
    def pop(self):
        return heapq.heappop(self.heap)
    
    def peek(self):
        return self.heap[0] if self.heap else None
    
    def size(self):
        return len(self.heap)

class MedianFinder:
    def __init__(self):
        self.max_heap = MaxHeap()  # Left half
        self.min_heap = MinHeap()  # Right half
    
    def addNum(self, num):
        self.max_heap.push(num)
        self.min_heap.push(self.max_heap.pop())
        
        if self.min_heap.size() > self.max_heap.size():
            self.max_heap.push(self.min_heap.pop())
    
    def findMedian(self):
        if self.max_heap.size() > self.min_heap.size():
            return float(self.max_heap.peek())
        else:
            return (self.max_heap.peek() + self.min_heap.peek()) / 2.0
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: Two Heaps (Optimal)
class MaxHeap {
    constructor() {
        this.heap = [];
    }
    
    push(val) {
        this.heap.push(val);
        this._bubbleUp(this.heap.length - 1);
    }
    
    pop() {
        if (this.heap.length === 0) return null;
        if (this.heap.length === 1) return this.heap.pop();
        
        const root = this.heap[0];
        this.heap[0] = this.heap.pop();
        this._bubbleDown(0);
        return root;
    }
    
    peek() { return this.heap[0]; }
    size() { return this.heap.length; }
    isEmpty() { return this.heap.length === 0; }
    
    _bubbleUp(index) {
        while (index > 0) {
            const parent = Math.floor((index - 1) / 2);
            if (this.heap[index] <= this.heap[parent]) break;
            [this.heap[index], this.heap[parent]] = [this.heap[parent], this.heap[index]];
            index = parent;
        }
    }
    
    _bubbleDown(index) {
        while (2 * index + 1 < this.heap.length) {
            const leftChild = 2 * index + 1;
            const rightChild = 2 * index + 2;
            let largest = leftChild;
            
            if (rightChild < this.heap.length && 
                this.heap[rightChild] > this.heap[leftChild]) {
                largest = rightChild;
            }
            
            if (this.heap[index] >= this.heap[largest]) break;
            [this.heap[index], this.heap[largest]] = [this.heap[largest], this.heap[index]];
            index = largest;
        }
    }
}

class MinHeap {
    constructor() {
        this.heap = [];
    }
    
    push(val) {
        this.heap.push(val);
        this._bubbleUp(this.heap.length - 1);
    }
    
    pop() {
        if (this.heap.length === 0) return null;
        if (this.heap.length === 1) return this.heap.pop();
        
        const root = this.heap[0];
        this.heap[0] = this.heap.pop();
        this._bubbleDown(0);
        return root;
    }
    
    peek() { return this.heap[0]; }
    size() { return this.heap.length; }
    isEmpty() { return this.heap.length === 0; }
    
    _bubbleUp(index) {
        while (index > 0) {
            const parent = Math.floor((index - 1) / 2);
            if (this.heap[index] >= this.heap[parent]) break;
            [this.heap[index], this.heap[parent]] = [this.heap[parent], this.heap[index]];
            index = parent;
        }
    }
    
    _bubbleDown(index) {
        while (2 * index + 1 < this.heap.length) {
            const leftChild = 2 * index + 1;
            const rightChild = 2 * index + 2;
            let smallest = leftChild;
            
            if (rightChild < this.heap.length && 
                this.heap[rightChild] < this.heap[leftChild]) {
                smallest = rightChild;
            }
            
            if (this.heap[index] <= this.heap[smallest]) break;
            [this.heap[index], this.heap[smallest]] = [this.heap[smallest], this.heap[index]];
            index = smallest;
        }
    }
}

class MedianFinder {
    constructor() {
        this.maxHeap = new MaxHeap(); // Left half (smaller elements)
        this.minHeap = new MinHeap(); // Right half (larger elements)
    }
    
    addNum(num) {
        // Add to max heap first
        this.maxHeap.push(num);
        
        // Move largest from max heap to min heap
        this.minHeap.push(this.maxHeap.pop());
        
        // Balance heaps if min heap becomes larger
        if (this.minHeap.size() > this.maxHeap.size()) {
            this.maxHeap.push(this.minHeap.pop());
        }
    }
    
    findMedian() {
        if (this.maxHeap.size() > this.minHeap.size()) {
            return this.maxHeap.peek();
        } else {
            return (this.maxHeap.peek() + this.minHeap.peek()) / 2.0;
        }
    }
}

// Approach 2: Alternative Balancing Strategy
class MedianFinder2 {
    constructor() {
        this.maxHeap = new MaxHeap();
        this.minHeap = new MinHeap();
    }
    
    addNum(num) {
        if (this.maxHeap.isEmpty() || num <= this.maxHeap.peek()) {
            this.maxHeap.push(num);
        } else {
            this.minHeap.push(num);
        }
        
        // Rebalance heaps
        if (this.maxHeap.size() > this.minHeap.size() + 1) {
            this.minHeap.push(this.maxHeap.pop());
        } else if (this.minHeap.size() > this.maxHeap.size() + 1) {
            this.maxHeap.push(this.minHeap.pop());
        }
    }
    
    findMedian() {
        if (this.maxHeap.size() === this.minHeap.size()) {
            return (this.maxHeap.peek() + this.minHeap.peek()) / 2.0;
        } else if (this.maxHeap.size() > this.minHeap.size()) {
            return this.maxHeap.peek();
        } else {
            return this.minHeap.peek();
        }
    }
}
```
  </div>
</div>

{::options parse_block_html="true" /}

**Complexity Analysis**:
- **Two Heaps**: addNum O(log n), findMedian O(1)
- **ArrayList**: addNum O(n), findMedian O(1)
- **BST**: addNum O(log n), findMedian O(log n)
- **TreeMap**: addNum O(log n), findMedian O(log n)

{::options parse_block_html="false" /}

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
<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
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
  </div>
  
  <div class="tab-content python">
```python
# Template for Top K problems
import heapq

min_heap = []
for element in elements:
    heapq.heappush(min_heap, element)
    if len(min_heap) > k:
        heapq.heappop(min_heap)  # Remove smallest
# min_heap now contains top K largest elements
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Template for Top K problems
const minHeap = new MinHeap();

for (const element of elements) {
    minHeap.push(element);
    if (minHeap.size() > k) {
        minHeap.pop(); // Remove smallest
    }
}
// minHeap now contains top K largest elements
```
  </div>
</div>

### 2. K-way Merge Pattern
<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
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
  </div>
  
  <div class="tab-content python">
```python
# Template for merging K sorted arrays/lists
import heapq

min_heap = []

# Initialize with first element from each array
for i in range(k):
    if len(arrays[i]) > 0:
        heapq.heappush(min_heap, (arrays[i][0], i, 0))

result = []
while min_heap:
    value, array_id, index = heapq.heappop(min_heap)
    result.append(value)
    
    # Add next element from same array
    if index + 1 < len(arrays[array_id]):
        heapq.heappush(min_heap, (
            arrays[array_id][index + 1], 
            array_id, 
            index + 1
        ))
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Template for merging K sorted arrays/lists
const minHeap = new MinHeap();

// Initialize with first element from each array
for (let i = 0; i < k; i++) {
    if (arrays[i].length > 0) {
        minHeap.push({
            value: arrays[i][0],
            arrayId: i,
            index: 0
        });
    }
}

const result = [];
while (!minHeap.isEmpty()) {
    const min = minHeap.pop();
    result.push(min.value);
    
    // Add next element from same array
    if (min.index + 1 < arrays[min.arrayId].length) {
        minHeap.push({
            value: arrays[min.arrayId][min.index + 1],
            arrayId: min.arrayId,
            index: min.index + 1
        });
    }
}
```
  </div>
</div>

### 3. Two Heaps Pattern
<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
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
  </div>
  
  <div class="tab-content python">
```python
# Template for median/balance problems
import heapq

max_heap = []  # Negate values for max heap
min_heap = []

def add_element(element):
    if not max_heap or element <= -max_heap[0]:
        heapq.heappush(max_heap, -element)
    else:
        heapq.heappush(min_heap, element)
    
    # Rebalance
    if len(max_heap) > len(min_heap) + 1:
        heapq.heappush(min_heap, -heapq.heappop(max_heap))
    elif len(min_heap) > len(max_heap) + 1:
        heapq.heappush(max_heap, -heapq.heappop(min_heap))
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Template for median/balance problems
const maxHeap = new MaxHeap();
const minHeap = new MinHeap();

function addElement(element) {
    if (maxHeap.isEmpty() || element <= maxHeap.peek()) {
        maxHeap.push(element);
    } else {
        minHeap.push(element);
    }
    
    // Rebalance
    if (maxHeap.size() > minHeap.size() + 1) {
        minHeap.push(maxHeap.pop());
    } else if (minHeap.size() > maxHeap.size() + 1) {
        maxHeap.push(minHeap.pop());
    }
}
```
  </div>
</div>

### 4. Sliding Window with Heap
<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
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
  </div>
  
  <div class="tab-content python">
```python
# Template for sliding window extremes
import heapq

max_heap = []  # Use negative values for max heap

for i, num in enumerate(nums):
    # Add current element with its index (negate for max heap)
    heapq.heappush(max_heap, (-num, i))
    
    # Remove elements outside window
    while max_heap and max_heap[0][1] <= i - k:
        heapq.heappop(max_heap)
    
    # Current window maximum
    if i >= k - 1:
        result.append(-max_heap[0][0])
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Template for sliding window extremes
const maxHeap = new MaxHeap();

for (let i = 0; i < nums.length; i++) {
    // Add current element with its index
    maxHeap.push({value: nums[i], index: i});
    
    // Remove elements outside window
    while (!maxHeap.isEmpty() && maxHeap.peek().index <= i - k) {
        maxHeap.pop();
    }
    
    // Current window maximum
    if (i >= k - 1) {
        result.push(maxHeap.peek().value);
    }
}
```
  </div>
</div>

### 5. Custom Priority Objects
<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
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
  </div>
  
  <div class="tab-content python">
```python
# Template for complex priority comparisons
import heapq
from dataclasses import dataclass, field
from typing import Any

@dataclass
class Task:
    priority: int
    timestamp: int
    name: str = field(compare=False)
    
    def __lt__(self, other):
        if self.priority != other.priority:
            return self.priority > other.priority  # Higher priority first
        return self.timestamp < other.timestamp  # Earlier timestamp first

task_queue = []
heapq.heappush(task_queue, Task(priority=5, timestamp=100, name="High priority task"))
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Template for complex priority comparisons
class Task {
    constructor(priority, timestamp, name) {
        this.priority = priority;
        this.timestamp = timestamp;
        this.name = name;
    }
}

// Custom comparison heap
class TaskHeap {
    constructor() {
        this.heap = [];
    }
    
    push(task) {
        this.heap.push(task);
        this._bubbleUp(this.heap.length - 1);
    }
    
    _compare(i, j) {
        const taskA = this.heap[i];
        const taskB = this.heap[j];
        
        if (taskA.priority !== taskB.priority) {
            return taskA.priority > taskB.priority; // Higher priority first
        }
        return taskA.timestamp < taskB.timestamp; // Earlier timestamp first
    }
    
    _bubbleUp(index) {
        while (index > 0) {
            const parent = Math.floor((index - 1) / 2);
            if (!this._compare(index, parent)) break;
            [this.heap[index], this.heap[parent]] = [this.heap[parent], this.heap[index]];
            index = parent;
        }
    }
}
```
  </div>
</div>

---

## Implementation Details and Tips

### Priority Queue/Heap Features
<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
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
  </div>
  
  <div class="tab-content python">
```python
import heapq

# Construction and operations
min_heap = []
heapq.heappush(min_heap, element)    # Add element - O(log n)
min_val = heapq.heappop(min_heap)    # Remove and return min - O(log n)
min_val = min_heap[0]                # View min without removing - O(1)
size = len(min_heap)                 # Get size - O(1)
is_empty = len(min_heap) == 0        # Check if empty - O(1)

# Max heap using negation
max_heap = []
heapq.heappush(max_heap, -element)
max_val = -heapq.heappop(max_heap)

# Convert list to heap in-place
nums = [3, 1, 4, 1, 5]
heapq.heapify(nums)  # O(n)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Custom heap implementation required
class Heap {
    constructor(compareFn = (a, b) => a < b) {
        this.heap = [];
        this.compare = compareFn;
    }
    
    push(val) {           // Add element - O(log n)
        this.heap.push(val);
        this._bubbleUp(this.heap.length - 1);
    }
    
    pop() {              // Remove and return root - O(log n)
        if (this.heap.length === 0) return null;
        if (this.heap.length === 1) return this.heap.pop();
        
        const root = this.heap[0];
        this.heap[0] = this.heap.pop();
        this._bubbleDown(0);
        return root;
    }
    
    peek() {             // View root without removing - O(1)
        return this.heap[0];
    }
    
    size() {             // Get size - O(1)
        return this.heap.length;
    }
    
    isEmpty() {          // Check if empty - O(1)
        return this.heap.length === 0;
    }
}

// Usage
const minHeap = new Heap((a, b) => a < b);
const maxHeap = new Heap((a, b) => a > b);
```
  </div>
</div>

### Common Pitfalls
1. **Wrong Comparator**: Ensure correct ordering (min vs max heap)
2. **Null Handling**: PriorityQueue doesn't allow null elements
3. **Equals vs Comparator**: compareTo should be consistent with equals
4. **Size Management**: Remember to limit heap size for "top K" problems
5. **Index Tracking**: When elements can be duplicated, track indices separately

### Performance Considerations
<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
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
  </div>
  
  <div class="tab-content python">
```python
# Space optimization for top K problems
import heapq

heap = []
# Limit heap size manually in loop

# Batch operations - heapify existing list
elements = [1, 2, 3, 4, 5]
heapq.heapify(elements)  # O(n) - faster than repeated heappush

# Extract multiple results efficiently
results = []
while heap:
    results.append(heapq.heappop(heap))

# For large datasets, consider using heapq.nlargest/nsmallest
top_k = heapq.nlargest(k, elements)  # More efficient for small k
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Space optimization for top K problems
const heap = new Heap();
// Manually manage size in application logic

// Batch operations - build heap from array
const elements = [1, 2, 3, 4, 5];
const heap = new Heap();
for (const element of elements) {
    heap.push(element);
}

// Extract multiple results efficiently
const results = [];
while (!heap.isEmpty()) {
    results.push(heap.pop());
}

// Consider specialized data structures for specific use cases
// e.g., binary indexed tree for range queries
```
  </div>
</div>

### Custom Heap Implementation (When Needed)
<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
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
  </div>
  
  <div class="tab-content python">
```python
class MinHeap:
    def __init__(self, capacity=100):
        self.heap = [0] * capacity
        self.size = 0
        self.capacity = capacity
    
    def _parent(self, i):
        return (i - 1) // 2
    
    def _left_child(self, i):
        return 2 * i + 1
    
    def _right_child(self, i):
        return 2 * i + 2
    
    def insert(self, value):
        if self.size >= self.capacity:
            raise Exception("Heap overflow")
        
        self.heap[self.size] = value
        current = self.size
        self.size += 1
        
        # Bubble up
        while (current > 0 and 
               self.heap[current] < self.heap[self._parent(current)]):
            self._swap(current, self._parent(current))
            current = self._parent(current)
    
    def extract_min(self):
        if self.size <= 0:
            raise Exception("Heap underflow")
        
        root = self.heap[0]
        self.size -= 1
        self.heap[0] = self.heap[self.size]
        self._heapify(0)
        
        return root
    
    def _heapify(self, i):
        left = self._left_child(i)
        right = self._right_child(i)
        smallest = i
        
        if left < self.size and self.heap[left] < self.heap[smallest]:
            smallest = left
        if right < self.size and self.heap[right] < self.heap[smallest]:
            smallest = right
        
        if smallest != i:
            self._swap(i, smallest)
            self._heapify(smallest)
    
    def _swap(self, i, j):
        self.heap[i], self.heap[j] = self.heap[j], self.heap[i]
    
    def peek(self):
        if self.size <= 0:
            raise Exception("Heap is empty")
        return self.heap[0]
    
    def get_size(self):
        return self.size
    
    def is_empty(self):
        return self.size == 0
```
  </div>
  
  <div class="tab-content javascript">
```javascript
class MinHeap {
    constructor(capacity = 100) {
        this.heap = new Array(capacity);
        this.size = 0;
        this.capacity = capacity;
    }
    
    _parent(i) { return Math.floor((i - 1) / 2); }
    _leftChild(i) { return 2 * i + 1; }
    _rightChild(i) { return 2 * i + 2; }
    
    insert(value) {
        if (this.size >= this.capacity) {
            throw new Error("Heap overflow");
        }
        
        this.heap[this.size] = value;
        let current = this.size++;
        
        // Bubble up
        while (current > 0 && 
               this.heap[current] < this.heap[this._parent(current)]) {
            this._swap(current, this._parent(current));
            current = this._parent(current);
        }
    }
    
    extractMin() {
        if (this.size <= 0) {
            throw new Error("Heap underflow");
        }
        
        const root = this.heap[0];
        this.heap[0] = this.heap[--this.size];
        this._heapify(0);
        
        return root;
    }
    
    _heapify(i) {
        const left = this._leftChild(i);
        const right = this._rightChild(i);
        let smallest = i;
        
        if (left < this.size && this.heap[left] < this.heap[smallest]) {
            smallest = left;
        }
        if (right < this.size && this.heap[right] < this.heap[smallest]) {
            smallest = right;
        }
        
        if (smallest !== i) {
            this._swap(i, smallest);
            this._heapify(smallest);
        }
    }
    
    _swap(i, j) {
        [this.heap[i], this.heap[j]] = [this.heap[j], this.heap[i]];
    }
    
    peek() {
        if (this.size <= 0) {
            throw new Error("Heap is empty");
        }
        return this.heap[0];
    }
    
    getSize() { return this.size; }
    isEmpty() { return this.size === 0; }
}
```
  </div>
</div>

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