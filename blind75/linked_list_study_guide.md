---
render_with_liquid: false
---

# Linked List Study Guide - Blind 75 LeetCode Problems

## Table of Contents
1. [Reverse a Linked List](#1-reverse-a-linked-list)
2. [Detect Cycle in a Linked List](#2-detect-cycle-in-a-linked-list)
3. [Merge Two Sorted Lists](#3-merge-two-sorted-lists)
4. [Merge K Sorted Lists](#4-merge-k-sorted-lists)
5. [Remove Nth Node From End Of List](#5-remove-nth-node-from-end-of-list)
6. [Reorder List](#6-reorder-list)

## Core Data Structure

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
/**
 * Definition for singly-linked list node
 */
public class ListNode {
    int val;
    ListNode next;
    
    ListNode() {}
    
    ListNode(int val) {
        this.val = val;
    }
    
    ListNode(int val, ListNode next) {
        this.val = val;
        this.next = next;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Definition for singly-linked list node
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
```
  </div>
  
  <div class="tab-content javascript">
```javascript
/**
 * Definition for singly-linked list node
 */
class ListNode {
    constructor(val = 0, next = null) {
        this.val = val;
        this.next = next;
    }
}

// Alternative function-based approach
function ListNode(val, next) {
    this.val = (val === undefined ? 0 : val);
    this.next = (next === undefined ? null : next);
}
```
  </div>
</div>

## Essential Linked List Patterns

### Core Pointer Manipulation Techniques
1. **Two Pointer Technique**: Fast/slow pointers for cycle detection, finding middle
2. **Dummy Node Pattern**: Simplifies edge cases when head might change
3. **Previous Pointer Tracking**: Essential for reversal and removal operations
4. **Runner Technique**: One pointer moves faster than another
5. **Recursive Backtracking**: Build solution on return from recursive calls

### Common Pitfalls Prevention
- Always check for null before dereferencing (`node.next`)
- Keep track of the previous node when modification is needed
- Use dummy nodes to handle head changes elegantly
- Be careful with pointer reassignment order to avoid losing references

---

## 1. Reverse a Linked List

**🔗 LeetCode Link:** [Reverse Linked List - LeetCode #206](https://leetcode.com/problems/reverse-linked-list/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What happens to the direction of each pointer when we reverse a linked list?
2. What information do we need to keep track of to avoid losing nodes during reversal?
3. What are the edge cases we need to handle (empty list, single node)?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding Pointer Reversal
> **Guided Question:** If you have a chain of nodes A → B → C, and you want A ← B ← C, what needs to change for each node?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Each node's `next` pointer needs to point to the previous node instead of the next node. However, once we change `node.next = prev`, we lose the reference to the rest of the list. This means we need to save the original `next` pointer before modifying it.

**Key insight:** We need three pointers to safely reverse each link:
- `prev`: The previous node (what current should point to)
- `curr`: The current node being processed  
- `next`: The next node (to avoid losing the rest of the list)
</details>

#### Step 2: Iterative Approach Development
> **Guided Question:** How can we systematically process each node while maintaining the three pointers?

<details>
<summary>💭 Think about it, then click to reveal</summary>

We can use a simple loop pattern:
1. Save `curr.next` in a temporary variable
2. Reverse the current link: `curr.next = prev`
3. Advance both pointers: `prev = curr`, `curr = nextTemp`
4. Repeat until `curr` becomes null

When the loop ends, `prev` will point to what was originally the last node, which is now our new head.

**Time:** O(n), **Space:** O(1) - optimal solution
</details>

#### Step 3: Alternative Recursive Approach
> **Guided Question:** How would you solve this recursively, building the solution on the return path?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Recursively, we can:
1. Recurse to the end of the list to find the new head
2. On the return path, reverse each link
3. For each node, make `head.next.next = head` and `head.next = null`

This is elegant but uses O(n) space due to the call stack. The recursive approach demonstrates the "build solution on return" pattern common in linked list problems.

**Time:** O(n), **Space:** O(n) - beautiful but less optimal
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Initialize three pointers: `prev = null`, `curr = head`, `next`
- [ ] Loop while `curr != null`
- [ ] Save next: `next = curr.next`
- [ ] Reverse link: `curr.next = prev`
- [ ] Advance pointers: `prev = curr`, `curr = next`
- [ ] Return `prev` as new head

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Can you trace through the algorithm with a 3-node list step by step?
2. **Complexity Analysis:** Why is this O(n) time and O(1) space optimal?
3. **Trade-offs:** When might you choose recursive over iterative (code clarity vs. efficiency)?
4. **Pattern Recognition:** What other problems use the "three-pointer sliding window" pattern?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the problem: ___/5
- [ ] Implementing brute force: ___/5  
- [ ] Implementing optimal solution: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Consider implementing the recursive version for deeper understanding

### Problem Statement
Given the head of a singly linked list, reverse the list and return the new head.

**Visual Example:**
```
Input:  1 -> 2 -> 3 -> 4 -> 5 -> NULL
Output: 5 -> 4 -> 3 -> 2 -> 1 -> NULL

Step-by-step reversal:
1 -> 2 -> 3 -> 4 -> 5 -> NULL
NULL <- 1    2 -> 3 -> 4 -> 5 -> NULL  (reverse first link)
NULL <- 1 <- 2    3 -> 4 -> 5 -> NULL  (reverse second link)
NULL <- 1 <- 2 <- 3    4 -> 5 -> NULL  (continue...)
NULL <- 1 <- 2 <- 3 <- 4    5 -> NULL
NULL <- 1 <- 2 <- 3 <- 4 <- 5          (complete)
```

### Knowledge Prerequisites
- Pointer manipulation and reassignment
- Understanding of singly linked list structure
- Basic iteration and recursion concepts
- Memory management awareness

### First Principles
**Core Concept**: To reverse a linked list, we need to reverse the direction of each `next` pointer. Each node that originally pointed forward must point backward.

**Key Insight**: We need three pointers:
- `prev`: Points to the previous node (starts as null)
- `curr`: Points to the current node being processed
- `next`: Temporarily stores the next node to avoid losing the rest of the list

### Problem-First Approach

**Visual Reasoning:**
1. Start with `prev = null`, `curr = head`
2. For each node: save next, reverse current link, advance pointers
3. When `curr` becomes null, `prev` points to the new head

**Pointer Movement Pattern:**
```
Before: prev -> curr -> next -> ...
After:  prev <- curr    next -> ...
```

### Multiple Java Solutions

#### Solution 1: Iterative Approach (Recommended)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public class Solution {
    /**
     * Iterative reversal using three pointers
     * Time: O(n), Space: O(1)
     */
    public ListNode reverseList(ListNode head) {
        ListNode prev = null;    // Previous node (new next pointer target)
        ListNode curr = head;    // Current node being processed
        
        while (curr != null) {
            // Step 1: Save the next node to avoid losing the rest of the list
            ListNode nextTemp = curr.next;
            
            // Step 2: Reverse the current link
            curr.next = prev;
            
            // Step 3: Advance pointers for next iteration
            prev = curr;         // Move prev forward
            curr = nextTemp;     // Move curr forward
        }
        
        // When curr is null, prev points to the new head
        return prev;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
class Solution:
    def reverseList(self, head: ListNode) -> ListNode:
        """
        Iterative reversal using three pointers
        Time: O(n), Space: O(1)
        """
        prev = None    # Previous node (new next pointer target)
        curr = head    # Current node being processed
        
        while curr is not None:
            # Step 1: Save the next node to avoid losing the rest of the list
            next_temp = curr.next
            
            # Step 2: Reverse the current link
            curr.next = prev
            
            # Step 3: Advance pointers for next iteration
            prev = curr         # Move prev forward
            curr = next_temp    # Move curr forward
        
        # When curr is None, prev points to the new head
        return prev
```
  </div>
  
  <div class="tab-content javascript">
```javascript
/**
 * Iterative reversal using three pointers
 * Time: O(n), Space: O(1)
 */
var reverseList = function(head) {
    let prev = null;    // Previous node (new next pointer target)
    let curr = head;    // Current node being processed
    
    while (curr !== null) {
        // Step 1: Save the next node to avoid losing the rest of the list
        let nextTemp = curr.next;
        
        // Step 2: Reverse the current link
        curr.next = prev;
        
        // Step 3: Advance pointers for next iteration
        prev = curr;         // Move prev forward
        curr = nextTemp;     // Move curr forward
    }
    
    // When curr is null, prev points to the new head
    return prev;
};
```
  </div>
</div>

#### Solution 2: Recursive Approach

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public class Solution {
    /**
     * Recursive reversal - builds solution on return path
     * Time: O(n), Space: O(n) due to call stack
     */
    public ListNode reverseList(ListNode head) {
        // Base case: empty list or single node
        if (head == null || head.next == null) {
            return head;
        }
        
        // Recursively reverse the rest of the list
        ListNode newHead = reverseList(head.next);
        
        // Reverse the current link
        // head.next currently points to the last node of reversed sublist
        head.next.next = head;  // Make the next node point back to current
        head.next = null;       // Break the forward link
        
        return newHead;         // Return the head of reversed list
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
class Solution:
    def reverseList(self, head: ListNode) -> ListNode:
        """
        Recursive reversal - builds solution on return path
        Time: O(n), Space: O(n) due to call stack
        """
        # Base case: empty list or single node
        if head is None or head.next is None:
            return head
        
        # Recursively reverse the rest of the list
        new_head = self.reverseList(head.next)
        
        # Reverse the current link
        # head.next currently points to the last node of reversed sublist
        head.next.next = head  # Make the next node point back to current
        head.next = None       # Break the forward link
        
        return new_head        # Return the head of reversed list
```
  </div>
  
  <div class="tab-content javascript">
```javascript
/**
 * Recursive reversal - builds solution on return path
 * Time: O(n), Space: O(n) due to call stack
 */
var reverseList = function(head) {
    // Base case: empty list or single node
    if (head === null || head.next === null) {
        return head;
    }
    
    // Recursively reverse the rest of the list
    let newHead = reverseList(head.next);
    
    // Reverse the current link
    // head.next currently points to the last node of reversed sublist
    head.next.next = head;  // Make the next node point back to current
    head.next = null;       // Break the forward link
    
    return newHead;         // Return the head of reversed list
};
```
  </div>
</div>

#### Solution 3: Stack-Based Approach (Educational)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public class Solution {
    /**
     * Stack-based reversal - demonstrates LIFO nature
     * Time: O(n), Space: O(n)
     */
    public ListNode reverseList(ListNode head) {
        if (head == null) return null;
        
        Stack<ListNode> stack = new Stack<>();
        ListNode curr = head;
        
        // Push all nodes onto stack
        while (curr != null) {
            stack.push(curr);
            curr = curr.next;
        }
        
        // Pop nodes and rebuild links
        ListNode newHead = stack.pop();
        curr = newHead;
        
        while (!stack.isEmpty()) {
            curr.next = stack.pop();
            curr = curr.next;
        }
        curr.next = null;  // Important: terminate the list
        
        return newHead;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
class Solution:
    def reverseList(self, head: ListNode) -> ListNode:
        """
        Stack-based reversal - demonstrates LIFO nature  
        Time: O(n), Space: O(n)
        """
        if head is None:
            return None
        
        stack = []
        curr = head
        
        # Push all nodes onto stack
        while curr is not None:
            stack.append(curr)
            curr = curr.next
        
        # Pop nodes and rebuild links
        new_head = stack.pop()
        curr = new_head
        
        while stack:
            curr.next = stack.pop()
            curr = curr.next
        curr.next = None  # Important: terminate the list
        
        return new_head
```
  </div>
  
  <div class="tab-content javascript">
```javascript
/**
 * Stack-based reversal - demonstrates LIFO nature
 * Time: O(n), Space: O(n)
 */
var reverseList = function(head) {
    if (head === null) return null;
    
    let stack = [];
    let curr = head;
    
    // Push all nodes onto stack
    while (curr !== null) {
        stack.push(curr);
        curr = curr.next;
    }
    
    // Pop nodes and rebuild links
    let newHead = stack.pop();
    curr = newHead;
    
    while (stack.length > 0) {
        curr.next = stack.pop();
        curr = curr.next;
    }
    curr.next = null;  // Important: terminate the list
    
    return newHead;
};
```
  </div>
</div>

### Complexity Analysis
- **Iterative**: Time O(n), Space O(1) - optimal solution
- **Recursive**: Time O(n), Space O(n) - elegant but uses call stack
- **Stack-based**: Time O(n), Space O(n) - demonstrates concept clearly

**Pointer Operations Count**: Exactly 3n pointer operations for n nodes (read next, write next, advance pointers)

### Key Insights & Patterns
1. **Three-Pointer Pattern**: Essential for any in-place linked list reversal
2. **Pointer Reassignment Order**: Always save next before breaking links
3. **Edge Case Handling**: Empty list and single node require no reversal
4. **In-Place vs Extra Space**: Iterative solution modifies original list structure

### Common Pitfalls
1. **Lost References**: Forgetting to save `curr.next` before reassignment
2. **Null Pointer Dereference**: Not checking if `curr` is null before accessing `curr.next`
3. **Infinite Loops**: Incorrect pointer advancement
4. **Return Value**: Returning `head` instead of `prev` in iterative solution

### Follow-up Questions
1. **Reverse Nodes in k-Group** (LeetCode 25): Reverse every k consecutive nodes
2. **Reverse Linked List II** (LeetCode 92): Reverse nodes from position m to n
3. **Palindrome Linked List** (LeetCode 234): Check if list is palindrome using reversal
4. Can you reverse without modifying the original list structure?
5. How would you reverse a doubly linked list?

---

## 2. Detect Cycle in a Linked List

**🔗 LeetCode Link:** [Linked List Cycle - LeetCode #141](https://leetcode.com/problems/linked-list-cycle/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. How would you detect if you're walking in a circle? What if you had a friend walking at a different speed?
2. If there's no cycle, what happens when you keep following the `next` pointers?
3. What data structure could you use to remember which nodes you've already visited?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: The Racing Insight
> **Guided Question:** Imagine two runners on a circular track - one slow, one fast. What will eventually happen if they keep running?

<details>
<summary>💭 Think about it, then click to reveal</summary>

The faster runner will eventually "lap" the slower runner - they'll meet at some point on the track! This is the key insight behind Floyd's Cycle Detection Algorithm.

**Applied to linked lists:**
- Slow pointer moves 1 step at a time
- Fast pointer moves 2 steps at a time  
- If there's a cycle, fast will eventually catch up to slow
- If there's no cycle, fast will reach null

**Why it works:** In a cycle of length k, the relative speed is 1 step per iteration, so they'll meet within k iterations.
</details>

#### Step 2: Handling the No-Cycle Case
> **Guided Question:** What happens to our two pointers if the linked list has no cycle?

<details>
<summary>💭 Think about it, then click to reveal</summary>

If there's no cycle, the linked list ends with a null pointer. The fast pointer (moving 2 steps) will reach null first, and we can immediately return false.

**Key checks needed:**
- `fast == null` (reached end)
- `fast.next == null` (next step would go past end)

This gives us our loop termination condition for the no-cycle case.

**Time:** O(n), **Space:** O(1) - optimal for cycle detection
</details>

#### Step 3: Alternative Approaches
> **Guided Question:** What other ways could you track visited nodes? What are the trade-offs?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**HashSet approach:** Store each visited node in a HashSet. If we see a node again, there's a cycle.
- **Pros:** Very intuitive and easy to implement
- **Cons:** Uses O(n) extra space

**Node modification:** Mark visited nodes by modifying them (e.g., point to themselves).
- **Pros:** O(1) space, O(n) time
- **Cons:** Destructive - modifies original list

**Floyd's algorithm** wins because it's both space-efficient O(1) and non-destructive.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Handle edge cases: empty list or single node
- [ ] Initialize slow and fast pointers (both start at head or head/head.next)
- [ ] Loop while fast and fast.next are not null
- [ ] Move slow one step, fast two steps
- [ ] Check if slow equals fast (cycle found)
- [ ] Return true if pointers meet, false if fast reaches null

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Can you explain why the two pointers will always meet in a cycle?
2. **Complexity Analysis:** Why is this more space-efficient than using a HashSet?
3. **Trade-offs:** When might you prefer the HashSet approach despite the space cost?
4. **Pattern Recognition:** What other problems use the "fast/slow pointer" technique?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the problem: ___/5
- [ ] Implementing brute force: ___/5  
- [ ] Implementing optimal solution: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Try the follow-up: Find where the cycle begins (LeetCode 142)

### Problem Statement
Given the head of a linked list, determine if the linked list has a cycle. A cycle exists if a node can be reached again by continuously following the `next` pointer.

**Visual Example:**
```
Cycle exists:
3 -> 2 -> 0 -> -4
     ^          |
     |__________|

No cycle:
1 -> 2 -> 3 -> 4 -> NULL
```

### Knowledge Prerequisites
- Two-pointer technique (fast/slow pointers)
- Understanding of pointer arithmetic and movement
- Cycle detection theory (tortoise and hare algorithm)
- Graph traversal concepts

### First Principles
**Core Concept**: If there's a cycle, a faster-moving pointer will eventually "lap" a slower-moving pointer within the cycle, just like runners on a circular track.

**Mathematical Proof**: If slow pointer moves 1 step and fast pointer moves 2 steps, the relative speed is 1 step per iteration. In a cycle of length k, they will meet within k iterations.

### Problem-First Approach

**Visual Reasoning:**
1. Use two pointers: slow (1 step) and fast (2 steps)
2. If there's no cycle, fast pointer reaches null
3. If there's a cycle, fast pointer will eventually catch up to slow pointer

**Movement Pattern:**
```
No Cycle: slow->fast will reach null
Cycle: slow and fast will meet inside the cycle
```

### Multiple Java Solutions

#### Solution 1: Floyd's Cycle Detection (Two Pointers) - Optimal

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public class Solution {
    /**
     * Floyd's Tortoise and Hare Algorithm
     * Time: O(n), Space: O(1)
     */
    public boolean hasCycle(ListNode head) {
        // Edge case: empty list or single node
        if (head == null || head.next == null) {
            return false;
        }
        
        ListNode slow = head;      // Tortoise: moves 1 step
        ListNode fast = head.next; // Hare: moves 2 steps
        
        // Continue until fast pointer reaches end or pointers meet
        while (slow != fast) {
            // If fast reaches null, no cycle exists
            if (fast == null || fast.next == null) {
                return false;
            }
            
            // Move pointers at different speeds
            slow = slow.next;           // Move 1 step
            fast = fast.next.next;      // Move 2 steps
        }
        
        // If we exit the loop, pointers met -> cycle exists
        return true;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
class Solution:
    def hasCycle(self, head: ListNode) -> bool:
        """
        Floyd's Tortoise and Hare Algorithm
        Time: O(n), Space: O(1)
        """
        # Edge case: empty list or single node
        if head is None or head.next is None:
            return False
        
        slow = head       # Tortoise: moves 1 step
        fast = head.next  # Hare: moves 2 steps
        
        # Continue until fast pointer reaches end or pointers meet
        while slow != fast:
            # If fast reaches None, no cycle exists
            if fast is None or fast.next is None:
                return False
            
            # Move pointers at different speeds
            slow = slow.next        # Move 1 step
            fast = fast.next.next   # Move 2 steps
        
        # If we exit the loop, pointers met -> cycle exists
        return True
```
  </div>
  
  <div class="tab-content javascript">
```javascript
/**
 * Floyd's Tortoise and Hare Algorithm
 * Time: O(n), Space: O(1)
 */
var hasCycle = function(head) {
    // Edge case: empty list or single node
    if (head === null || head.next === null) {
        return false;
    }
    
    let slow = head;      // Tortoise: moves 1 step
    let fast = head.next; // Hare: moves 2 steps
    
    // Continue until fast pointer reaches end or pointers meet
    while (slow !== fast) {
        // If fast reaches null, no cycle exists
        if (fast === null || fast.next === null) {
            return false;
        }
        
        // Move pointers at different speeds
        slow = slow.next;           // Move 1 step
        fast = fast.next.next;      // Move 2 steps
    }
    
    // If we exit the loop, pointers met -> cycle exists
    return true;
};
```
  </div>
</div>

#### Solution 2: HashSet Approach (Intuitive)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public class Solution {
    /**
     * Track visited nodes using HashSet
     * Time: O(n), Space: O(n)
     */
    public boolean hasCycle(ListNode head) {
        Set<ListNode> visited = new HashSet<>();
        ListNode curr = head;
        
        while (curr != null) {
            // If we've seen this node before, cycle exists
            if (visited.contains(curr)) {
                return true;
            }
            
            // Mark current node as visited
            visited.add(curr);
            curr = curr.next;
        }
        
        // Reached end without revisiting any node
        return false;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
class Solution:
    def hasCycle(self, head: ListNode) -> bool:
        """
        Track visited nodes using set
        Time: O(n), Space: O(n)
        """
        visited = set()
        curr = head
        
        while curr is not None:
            # If we've seen this node before, cycle exists
            if curr in visited:
                return True
            
            # Mark current node as visited
            visited.add(curr)
            curr = curr.next
        
        # Reached end without revisiting any node
        return False
```
  </div>
  
  <div class="tab-content javascript">
```javascript
/**
 * Track visited nodes using Set
 * Time: O(n), Space: O(n)
 */
var hasCycle = function(head) {
    let visited = new Set();
    let curr = head;
    
    while (curr !== null) {
        // If we've seen this node before, cycle exists
        if (visited.has(curr)) {
            return true;
        }
        
        // Mark current node as visited
        visited.add(curr);
        curr = curr.next;
    }
    
    // Reached end without revisiting any node
    return false;
};
```
  </div>
</div>

#### Solution 3: Node Modification Approach (Destructive)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public class Solution {
    /**
     * Modify nodes to mark as visited
     * Time: O(n), Space: O(1) - but modifies original list
     */
    public boolean hasCycle(ListNode head) {
        ListNode curr = head;
        
        while (curr != null && curr.next != null) {
            // Use a special marker to indicate visited
            if (curr.next == curr) {
                return true;  // Found our marker
            }
            
            ListNode next = curr.next;
            curr.next = curr;  // Point to self as marker
            curr = next;
        }
        
        return false;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
class Solution:
    def hasCycle(self, head: ListNode) -> bool:
        """
        Modify nodes to mark as visited
        Time: O(n), Space: O(1) - but modifies original list
        """
        curr = head
        
        while curr is not None and curr.next is not None:
            # Use a special marker to indicate visited
            if curr.next == curr:
                return True  # Found our marker
            
            next_node = curr.next
            curr.next = curr  # Point to self as marker
            curr = next_node
        
        return False
```
  </div>
  
  <div class="tab-content javascript">
```javascript
/**
 * Modify nodes to mark as visited
 * Time: O(n), Space: O(1) - but modifies original list
 */
var hasCycle = function(head) {
    let curr = head;
    
    while (curr !== null && curr.next !== null) {
        // Use a special marker to indicate visited
        if (curr.next === curr) {
            return true;  // Found our marker
        }
        
        let next = curr.next;
        curr.next = curr;  // Point to self as marker
        curr = next;
    }
    
    return false;
};
```
  </div>
</div>

### Advanced: Finding Cycle Start (LeetCode 142)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public class Solution {
    /**
     * Find the node where cycle begins
     * Uses Floyd's algorithm + mathematical property
     */
    public ListNode detectCycle(ListNode head) {
        if (head == null || head.next == null) return null;
        
        // Phase 1: Detect if cycle exists
        ListNode slow = head, fast = head;
        while (fast != null && fast.next != null) {
            slow = slow.next;
            fast = fast.next.next;
            if (slow == fast) break;  // Cycle detected
        }
        
        // No cycle found
        if (fast == null || fast.next == null) return null;
        
        // Phase 2: Find cycle start
        // Mathematical property: distance from head to cycle start
        // equals distance from meeting point to cycle start
        slow = head;
        while (slow != fast) {
            slow = slow.next;
            fast = fast.next;
        }
        
        return slow;  // Cycle start node
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
class Solution:
    def detectCycle(self, head: ListNode) -> ListNode:
        """
        Find the node where cycle begins
        Uses Floyd's algorithm + mathematical property
        """
        if head is None or head.next is None:
            return None
        
        # Phase 1: Detect if cycle exists
        slow = fast = head
        while fast is not None and fast.next is not None:
            slow = slow.next
            fast = fast.next.next
            if slow == fast:
                break  # Cycle detected
        
        # No cycle found
        if fast is None or fast.next is None:
            return None
        
        # Phase 2: Find cycle start
        # Mathematical property: distance from head to cycle start
        # equals distance from meeting point to cycle start
        slow = head
        while slow != fast:
            slow = slow.next
            fast = fast.next
        
        return slow  # Cycle start node
```
  </div>
  
  <div class="tab-content javascript">
```javascript
/**
 * Find the node where cycle begins
 * Uses Floyd's algorithm + mathematical property
 */
var detectCycle = function(head) {
    if (head === null || head.next === null) return null;
    
    // Phase 1: Detect if cycle exists
    let slow = head, fast = head;
    while (fast !== null && fast.next !== null) {
        slow = slow.next;
        fast = fast.next.next;
        if (slow === fast) break;  // Cycle detected
    }
    
    // No cycle found
    if (fast === null || fast.next === null) return null;
    
    // Phase 2: Find cycle start
    // Mathematical property: distance from head to cycle start
    // equals distance from meeting point to cycle start
    slow = head;
    while (slow !== fast) {
        slow = slow.next;
        fast = fast.next;
    }
    
    return slow;  // Cycle start node
};
```
  </div>
</div>

### Complexity Analysis
- **Floyd's Algorithm**: Time O(n), Space O(1) - optimal
- **HashSet**: Time O(n), Space O(n) - straightforward but uses extra memory
- **Node Modification**: Time O(n), Space O(1) - but destructive

**Cycle Detection Proof**: In worst case, slow pointer makes at most n steps, fast pointer makes at most 2n steps.

### Key Insights & Patterns
1. **Two-Speed Pointers**: Fundamental technique for cycle problems
2. **Meeting Point Mathematics**: Distance relationships in cycle detection
3. **Space vs Time Trade-offs**: Constant space vs linear space approaches
4. **Invariant Maintenance**: Fast pointer always ahead until they meet

### Common Pitfalls
1. **Null Pointer Checks**: Always verify `fast` and `fast.next` before advancing
2. **Initial Positioning**: Starting both pointers at head vs head and head.next
3. **Loop Termination**: Correctly handling the case when no cycle exists
4. **Off-by-One Errors**: Ensuring proper pointer advancement

### Follow-up Questions
1. **Find Cycle Start** (LeetCode 142): Return the node where cycle begins
2. **Happy Number** (LeetCode 202): Apply cycle detection to number sequences
3. **Find Duplicate Number** (LeetCode 287): Use cycle detection on array indices
4. What if the linked list has multiple cycles?
5. Can you detect cycles in a doubly linked list?

---

## 3. Merge Two Sorted Lists

**🔗 LeetCode Link:** [Merge Two Sorted Lists - LeetCode #21](https://leetcode.com/problems/merge-two-sorted-lists/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. How do you merge two sorted arrays? Can you apply similar logic to linked lists?
2. What happens when one list is much longer than the other?
3. How could you handle the case where the result list needs a new "head" node?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: The Comparison Strategy
> **Guided Question:** At each step, you have two candidate nodes (one from each list). How do you decide which one to add to your result?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Simply compare the values! Take the smaller one and add it to your result list. This maintains the sorted property because:
- Both input lists are already sorted
- We always pick the minimum of the two current options
- This gives us the next smallest element overall

**Key insight:** This is exactly like the merge step in merge sort - we're merging two sorted sequences into one sorted sequence.
</details>

#### Step 2: Building the Result List
> **Guided Question:** How can you efficiently build the result list without creating new nodes? What pointer management do you need?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Use the existing nodes! No need to create new nodes - just redirect the `next` pointers.

**Strategy:**
- Keep a "tail" pointer to track the end of your result list
- When you choose a node, append it to tail and advance tail
- Advance the pointer in the source list that you took from

**Dummy node trick:** Start with a dummy node to avoid special handling of the first real node. Return `dummy.next` as the actual result.

**Time:** O(m + n), **Space:** O(1) - optimal efficiency
</details>

#### Step 3: Handling Remaining Nodes
> **Guided Question:** What happens when you exhaust one list but the other still has nodes? How do you handle this efficiently?

<details>
<summary>💭 Think about it, then click to reveal</summary>

When one list is empty, all remaining nodes from the other list can be directly appended! Since both input lists are sorted, all remaining nodes are guaranteed to be larger than everything we've already processed.

**Simple approach:** `tail.next = (list1 != null) ? list1 : list2`

This is much more efficient than continuing the comparison loop one node at a time.

**Pattern recognition:** This "append remaining" technique appears in many merge-based algorithms.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Create dummy node and tail pointer
- [ ] Loop while both lists have nodes
- [ ] Compare values, choose smaller one
- [ ] Append chosen node to result, advance pointers
- [ ] Append remaining nodes from non-empty list
- [ ] Return dummy.next

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Can you trace through merging [1,2,4] and [1,3,4] step by step?
2. **Complexity Analysis:** Why is this linear time and constant space?
3. **Trade-offs:** How does the iterative approach compare to a recursive solution?
4. **Pattern Recognition:** How does this relate to merge sort? What other problems use merging?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the problem: ___/5
- [ ] Implementing brute force: ___/5  
- [ ] Implementing optimal solution: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Try implementing the recursive version for deeper understanding

### Problem Statement
Merge two sorted linked lists and return it as a sorted list. The list should be made by splicing together the nodes of the first two lists.

**Visual Example:**
```
Input: list1 = [1,2,4], list2 = [1,3,4]
Output: [1,1,2,3,4,4]

Merge process:
1->2->4    and    1->3->4
^                 ^
Compare 1 vs 1: take first 1

result: 1
remaining: 2->4    and    1->3->4
           ^               ^
Compare 2 vs 1: take 1

result: 1->1
remaining: 2->4    and    3->4
           ^               ^
Continue until one list is empty...
```

### Knowledge Prerequisites
- Merge operation from merge sort
- Dummy node technique for simplifying edge cases
- Pointer manipulation and list traversal
- Recursive thinking and base cases

### First Principles
**Core Concept**: Compare the heads of both lists, take the smaller one, and recursively merge the rest. This maintains the sorted property.

**Key Insight**: Use a dummy node to avoid special handling of the first node. This simplifies the code and reduces edge case complexity.

### Problem-First Approach

**Visual Reasoning:**
1. Create a dummy node to build the result list
2. Use two pointers to traverse both input lists
3. Always choose the smaller value and advance that pointer
4. Append remaining nodes when one list is exhausted

**Comparison Pattern:**
```
dummy -> result list
  ^
tail pointer for building result

list1: a -> b -> c
       ^
list2: x -> y -> z
       ^
Compare a vs x, take smaller, advance pointer
```

### Multiple Java Solutions

#### Solution 1: Iterative with Dummy Node (Recommended)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public class Solution {
    /**
     * Iterative merge using dummy node
     * Time: O(m + n), Space: O(1)
     */
    public ListNode mergeTwoLists(ListNode list1, ListNode list2) {
        // Create dummy node to simplify edge cases
        ListNode dummy = new ListNode(0);
        ListNode tail = dummy;  // Points to last node in result
        
        // Merge while both lists have nodes
        while (list1 != null && list2 != null) {
            if (list1.val <= list2.val) {
                tail.next = list1;  // Add list1 node to result
                list1 = list1.next; // Advance list1 pointer
            } else {
                tail.next = list2;  // Add list2 node to result
                list2 = list2.next; // Advance list2 pointer
            }
            tail = tail.next;       // Advance result tail
        }
        
        // Append remaining nodes (one list is empty, other might have nodes)
        tail.next = (list1 != null) ? list1 : list2;
        
        // Return actual head (skip dummy)
        return dummy.next;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
class Solution:
    def mergeTwoLists(self, list1: ListNode, list2: ListNode) -> ListNode:
        """
        Iterative merge using dummy node
        Time: O(m + n), Space: O(1)
        """
        # Create dummy node to simplify edge cases
        dummy = ListNode(0)
        tail = dummy  # Points to last node in result
        
        # Merge while both lists have nodes
        while list1 is not None and list2 is not None:
            if list1.val <= list2.val:
                tail.next = list1  # Add list1 node to result
                list1 = list1.next # Advance list1 pointer
            else:
                tail.next = list2  # Add list2 node to result
                list2 = list2.next # Advance list2 pointer
            tail = tail.next       # Advance result tail
        
        # Append remaining nodes (one list is empty, other might have nodes)
        tail.next = list1 if list1 is not None else list2
        
        # Return actual head (skip dummy)
        return dummy.next
```
  </div>
  
  <div class="tab-content javascript">
```javascript
/**
 * Iterative merge using dummy node
 * Time: O(m + n), Space: O(1)
 */
var mergeTwoLists = function(list1, list2) {
    // Create dummy node to simplify edge cases
    let dummy = new ListNode(0);
    let tail = dummy;  // Points to last node in result
    
    // Merge while both lists have nodes
    while (list1 !== null && list2 !== null) {
        if (list1.val <= list2.val) {
            tail.next = list1;  // Add list1 node to result
            list1 = list1.next; // Advance list1 pointer
        } else {
            tail.next = list2;  // Add list2 node to result
            list2 = list2.next; // Advance list2 pointer
        }
        tail = tail.next;       // Advance result tail
    }
    
    // Append remaining nodes (one list is empty, other might have nodes)
    tail.next = (list1 !== null) ? list1 : list2;
    
    // Return actual head (skip dummy)
    return dummy.next;
};
```
  </div>
</div>

#### Solution 2: Recursive Approach (Elegant)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public class Solution {
    /**
     * Recursive merge - clean and intuitive
     * Time: O(m + n), Space: O(m + n) due to call stack
     */
    public ListNode mergeTwoLists(ListNode list1, ListNode list2) {
        // Base cases: if one list is empty, return the other
        if (list1 == null) return list2;
        if (list2 == null) return list1;
        
        // Recursive case: choose smaller head and recurse
        if (list1.val <= list2.val) {
            // list1 head is smaller
            list1.next = mergeTwoLists(list1.next, list2);
            return list1;
        } else {
            // list2 head is smaller
            list2.next = mergeTwoLists(list1, list2.next);
            return list2;
        }
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
class Solution:
    def mergeTwoLists(self, list1: ListNode, list2: ListNode) -> ListNode:
        """
        Recursive merge - clean and intuitive
        Time: O(m + n), Space: O(m + n) due to call stack
        """
        # Base cases: if one list is empty, return the other
        if list1 is None:
            return list2
        if list2 is None:
            return list1
        
        # Recursive case: choose smaller head and recurse
        if list1.val <= list2.val:
            # list1 head is smaller
            list1.next = self.mergeTwoLists(list1.next, list2)
            return list1
        else:
            # list2 head is smaller
            list2.next = self.mergeTwoLists(list1, list2.next)
            return list2
```
  </div>
  
  <div class="tab-content javascript">
```javascript
/**
 * Recursive merge - clean and intuitive
 * Time: O(m + n), Space: O(m + n) due to call stack
 */
var mergeTwoLists = function(list1, list2) {
    // Base cases: if one list is empty, return the other
    if (list1 === null) return list2;
    if (list2 === null) return list1;
    
    // Recursive case: choose smaller head and recurse
    if (list1.val <= list2.val) {
        // list1 head is smaller
        list1.next = mergeTwoLists(list1.next, list2);
        return list1;
    } else {
        // list2 head is smaller
        list2.next = mergeTwoLists(list1, list2.next);
        return list2;
    }
};
```
  </div>
</div>

#### Solution 3: In-Place Merge Without Dummy (Educational)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public class Solution {
    /**
     * In-place merge handling head explicitly
     * Time: O(m + n), Space: O(1)
     */
    public ListNode mergeTwoLists(ListNode list1, ListNode list2) {
        // Handle empty lists
        if (list1 == null) return list2;
        if (list2 == null) return list1;
        
        // Determine the head of result list
        ListNode head, curr;
        if (list1.val <= list2.val) {
            head = curr = list1;
            list1 = list1.next;
        } else {
            head = curr = list2;
            list2 = list2.next;
        }
        
        // Merge remaining nodes
        while (list1 != null && list2 != null) {
            if (list1.val <= list2.val) {
                curr.next = list1;
                list1 = list1.next;
            } else {
                curr.next = list2;
                list2 = list2.next;
            }
            curr = curr.next;
        }
        
        // Append remaining nodes
        curr.next = (list1 != null) ? list1 : list2;
        
        return head;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
class Solution:
    def mergeTwoLists(self, list1: ListNode, list2: ListNode) -> ListNode:
        """
        In-place merge handling head explicitly
        Time: O(m + n), Space: O(1)
        """
        # Handle empty lists
        if list1 is None:
            return list2
        if list2 is None:
            return list1
        
        # Determine the head of result list
        if list1.val <= list2.val:
            head = curr = list1
            list1 = list1.next
        else:
            head = curr = list2
            list2 = list2.next
        
        # Merge remaining nodes
        while list1 is not None and list2 is not None:
            if list1.val <= list2.val:
                curr.next = list1
                list1 = list1.next
            else:
                curr.next = list2
                list2 = list2.next
            curr = curr.next
        
        # Append remaining nodes
        curr.next = list1 if list1 is not None else list2
        
        return head
```
  </div>
  
  <div class="tab-content javascript">
```javascript
/**
 * In-place merge handling head explicitly
 * Time: O(m + n), Space: O(1)
 */
var mergeTwoLists = function(list1, list2) {
    // Handle empty lists
    if (list1 === null) return list2;
    if (list2 === null) return list1;
    
    // Determine the head of result list
    let head, curr;
    if (list1.val <= list2.val) {
        head = curr = list1;
        list1 = list1.next;
    } else {
        head = curr = list2;
        list2 = list2.next;
    }
    
    // Merge remaining nodes
    while (list1 !== null && list2 !== null) {
        if (list1.val <= list2.val) {
            curr.next = list1;
            list1 = list1.next;
        } else {
            curr.next = list2;
            list2 = list2.next;
        }
        curr = curr.next;
    }
    
    // Append remaining nodes
    curr.next = (list1 !== null) ? list1 : list2;
    
    return head;
};
```
  </div>
</div>

### Complexity Analysis
- **Time Complexity**: O(m + n) where m, n are lengths of input lists
- **Space Complexity**: 
  - Iterative: O(1) - only uses constant extra space
  - Recursive: O(m + n) - due to call stack depth
- **Node Operations**: Each node is visited exactly once

### Key Insights & Patterns
1. **Dummy Node Pattern**: Eliminates special handling of first node
2. **Two-Pointer Technique**: Simultaneously traverse both lists
3. **Tail Pointer**: Efficiently build result list by maintaining tail reference
4. **Remaining Nodes**: One list might be longer - append the rest

### Common Pitfalls
1. **Null Checks**: Forgetting to handle empty input lists
2. **Pointer Advancement**: Not advancing pointers after selection
3. **Tail Update**: Forgetting to update tail pointer in result list
4. **Memory Leaks**: In languages with manual memory management

### Follow-up Questions
1. **Merge k Sorted Lists** (LeetCode 23): Extend to k lists
2. **Sort List** (LeetCode 148): Use merge operation for sorting
3. **Merge Sorted Array** (LeetCode 88): Similar problem with arrays
4. How would you merge lists in descending order?
5. Can you merge without using extra space for the result?

---

## 4. Merge K Sorted Lists

**🔗 LeetCode Link:** [Merge k Sorted Lists - LeetCode #23](https://leetcode.com/problems/merge-k-sorted-lists/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. If you can merge 2 sorted lists efficiently, how could you extend this to k lists?
2. What if you tried to merge all k lists sequentially vs. in pairs? Which would be faster?
3. How could a priority queue (min-heap) help you always find the smallest element across all lists?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Building on Two-List Merge
> **Guided Question:** You already know how to merge 2 sorted lists in O(m+n) time. What's the simplest way to extend this to k lists?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Sequential merging:** Start with the first list, merge it with the second, then merge that result with the third, and so on.

```
result = lists[0]
for i = 1 to k-1:
    result = merge(result, lists[i])
```

**Time complexity analysis:**
- Merge 1: O(n₁ + n₂)
- Merge 2: O(n₁ + n₂ + n₃) 
- Merge k-1: O(n₁ + n₂ + ... + nₖ)
- Total: O(k × N) where N is total nodes

This works but isn't optimal - we're repeatedly processing the same nodes.
</details>

#### Step 2: Divide and Conquer Optimization
> **Guided Question:** How could you merge the lists more efficiently by pairing them up? What would the time complexity be?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Divide and conquer:** Pair up lists and merge them simultaneously, then repeat on the results.

```
Round 1: [1,2,3] + [4,5,6] → [1,2,3,4,5,6]
         [7,8] + [9,10] → [7,8,9,10]
Round 2: [1,2,3,4,5,6] + [7,8,9,10] → [1,2,3,4,5,6,7,8,9,10]
```

**Key insight:** This reduces the number of merge levels from k to log k.

**Time complexity:** O(N log k) - each of the log k levels processes all N nodes once.

**Why it's better:** Instead of repeatedly reprocessing nodes, each node is processed exactly log k times.
</details>

#### Step 3: Priority Queue Alternative
> **Guided Question:** How could you use a min-heap to always extract the globally smallest element? What are the trade-offs?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Priority queue approach:**
1. Add the first node from each list to a min-heap
2. Extract the minimum (globally smallest unprocessed node)
3. Add that node's successor from the same list to the heap
4. Repeat until heap is empty

**Complexity analysis:**
- Each of N nodes is inserted and extracted once: O(N log k)
- Space: O(k) for the heap

**Trade-offs:**
- **Pros:** Intuitive, easy to understand
- **Cons:** Extra space for heap, slightly more overhead than divide-and-conquer

Both priority queue and divide-and-conquer achieve O(N log k) time!
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the divide-and-conquer solution from memory:

**Step-by-step checklist:**
- [ ] Handle base cases: empty array, single list
- [ ] Implement recursive helper with start/end bounds
- [ ] Split range in half, recurse on both halves
- [ ] Merge the two halves using merge-two-lists function
- [ ] Verify merge-two-lists handles null inputs correctly

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why is O(N log k) better than O(N × k)? Can you draw the recursion tree?
2. **Complexity Analysis:** How does the space complexity compare between divide-and-conquer vs. priority queue?
3. **Trade-offs:** When might you prefer the priority queue approach over divide-and-conquer?
4. **Pattern Recognition:** What other problems use divide-and-conquer with merge operations?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the problem: ___/5
- [ ] Implementing brute force: ___/5  
- [ ] Implementing optimal solution: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Try implementing both divide-and-conquer and priority queue approaches

### Problem Statement
Merge k sorted linked lists and return it as one sorted linked list.

**Visual Example:**
```
Input: lists = [[1,4,5],[1,3,4],[2,6]]
Output: [1,1,2,3,4,4,5,6]

Divide and Conquer approach:
Level 0: [1,4,5]  [1,3,4]  [2,6]
Level 1: [1,1,3,4,4,5]     [2,6]
Level 2: [1,1,2,3,4,4,5,6]
```

### Knowledge Prerequisites
- Merge two sorted lists (previous problem)
- Divide and conquer strategy
- Priority queue/heap data structure
- Time complexity analysis of recursive algorithms

### First Principles
**Core Concept**: This is an extension of merging two lists. We can use divide-and-conquer to pair up lists and merge them, reducing k lists to k/2, then k/4, etc.

**Alternative Approach**: Use a min-heap to always get the smallest element among all list heads.

### Problem-First Approach

**Divide and Conquer Reasoning:**
1. Pair up lists and merge each pair
2. Reduce k lists to k/2 merged lists
3. Repeat until only one list remains
4. This gives us O(log k) levels of merging

**Priority Queue Reasoning:**
1. Add first node of each list to min-heap
2. Extract minimum, add its next node to heap
3. Continue until heap is empty

### Multiple Java Solutions

#### Solution 1: Divide and Conquer (Optimal)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public class Solution {
    /**
     * Divide and conquer approach
     * Time: O(N log k), Space: O(log k)
     * where N = total number of nodes, k = number of lists
     */
    public ListNode mergeKLists(ListNode[] lists) {
        if (lists == null || lists.length == 0) return null;
        
        return mergeKListsHelper(lists, 0, lists.length - 1);
    }
    
    private ListNode mergeKListsHelper(ListNode[] lists, int start, int end) {
        // Base case: single list
        if (start == end) return lists[start];
        
        // Base case: two lists
        if (start + 1 == end) return mergeTwoLists(lists[start], lists[end]);
        
        // Divide: split the range in half
        int mid = start + (end - start) / 2;
        ListNode left = mergeKListsHelper(lists, start, mid);
        ListNode right = mergeKListsHelper(lists, mid + 1, end);
        
        // Conquer: merge the two halves
        return mergeTwoLists(left, right);
    }
    
    /**
     * Helper method: merge two sorted lists
     * Time: O(m + n), Space: O(1)
     */
    private ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        ListNode dummy = new ListNode(0);
        ListNode tail = dummy;
        
        while (l1 != null && l2 != null) {
            if (l1.val <= l2.val) {
                tail.next = l1;
                l1 = l1.next;
            } else {
                tail.next = l2;
                l2 = l2.next;
            }
            tail = tail.next;
        }
        
        tail.next = (l1 != null) ? l1 : l2;
        return dummy.next;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
class Solution:
    def mergeKLists(self, lists: List[ListNode]) -> ListNode:
        """
        Divide and conquer approach
        Time: O(N log k), Space: O(log k)
        where N = total number of nodes, k = number of lists
        """
        if not lists or len(lists) == 0:
            return None
        
        return self.merge_k_lists_helper(lists, 0, len(lists) - 1)
    
    def merge_k_lists_helper(self, lists: List[ListNode], start: int, end: int) -> ListNode:
        # Base case: single list
        if start == end:
            return lists[start]
        
        # Base case: two lists
        if start + 1 == end:
            return self.merge_two_lists(lists[start], lists[end])
        
        # Divide: split the range in half
        mid = start + (end - start) // 2
        left = self.merge_k_lists_helper(lists, start, mid)
        right = self.merge_k_lists_helper(lists, mid + 1, end)
        
        # Conquer: merge the two halves
        return self.merge_two_lists(left, right)
    
    def merge_two_lists(self, l1: ListNode, l2: ListNode) -> ListNode:
        """
        Helper method: merge two sorted lists
        Time: O(m + n), Space: O(1)
        """
        dummy = ListNode(0)
        tail = dummy
        
        while l1 is not None and l2 is not None:
            if l1.val <= l2.val:
                tail.next = l1
                l1 = l1.next
            else:
                tail.next = l2
                l2 = l2.next
            tail = tail.next
        
        tail.next = l1 if l1 is not None else l2
        return dummy.next
```
  </div>
  
  <div class="tab-content javascript">
```javascript
/**
 * Divide and conquer approach
 * Time: O(N log k), Space: O(log k)
 * where N = total number of nodes, k = number of lists
 */
var mergeKLists = function(lists) {
    if (!lists || lists.length === 0) return null;
    
    return mergeKListsHelper(lists, 0, lists.length - 1);
};

function mergeKListsHelper(lists, start, end) {
    // Base case: single list
    if (start === end) return lists[start];
    
    // Base case: two lists
    if (start + 1 === end) return mergeTwoLists(lists[start], lists[end]);
    
    // Divide: split the range in half
    let mid = start + Math.floor((end - start) / 2);
    let left = mergeKListsHelper(lists, start, mid);
    let right = mergeKListsHelper(lists, mid + 1, end);
    
    // Conquer: merge the two halves
    return mergeTwoLists(left, right);
}

/**
 * Helper function: merge two sorted lists
 * Time: O(m + n), Space: O(1)
 */
function mergeTwoLists(l1, l2) {
    let dummy = new ListNode(0);
    let tail = dummy;
    
    while (l1 !== null && l2 !== null) {
        if (l1.val <= l2.val) {
            tail.next = l1;
            l1 = l1.next;
        } else {
            tail.next = l2;
            l2 = l2.next;
        }
        tail = tail.next;
    }
    
    tail.next = (l1 !== null) ? l1 : l2;
    return dummy.next;
}
```
  </div>
</div>

#### Solution 2: Priority Queue (Min-Heap)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public class Solution {
    /**
     * Priority queue approach using min-heap
     * Time: O(N log k), Space: O(k)
     */
    public ListNode mergeKLists(ListNode[] lists) {
        if (lists == null || lists.length == 0) return null;
        
        // Create min-heap based on node values
        PriorityQueue<ListNode> pq = new PriorityQueue<>((a, b) -> a.val - b.val);
        
        // Add first node of each non-empty list to heap
        for (ListNode list : lists) {
            if (list != null) {
                pq.offer(list);
            }
        }
        
        ListNode dummy = new ListNode(0);
        ListNode tail = dummy;
        
        // Process nodes in sorted order
        while (!pq.isEmpty()) {
            // Get the smallest node
            ListNode smallest = pq.poll();
            tail.next = smallest;
            tail = tail.next;
            
            // Add next node from the same list if exists
            if (smallest.next != null) {
                pq.offer(smallest.next);
            }
        }
        
        return dummy.next;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
import heapq

class Solution:
    def mergeKLists(self, lists: List[ListNode]) -> ListNode:
        """
        Priority queue approach using min-heap
        Time: O(N log k), Space: O(k)
        """
        if not lists or len(lists) == 0:
            return None
        
        # Create min-heap with (value, index, node) tuples
        # Index prevents comparison between nodes with same values
        heap = []
        
        # Add first node of each non-empty list to heap
        for i, lst in enumerate(lists):
            if lst is not None:
                heapq.heappush(heap, (lst.val, i, lst))
        
        dummy = ListNode(0)
        tail = dummy
        
        # Process nodes in sorted order
        while heap:
            # Get the smallest node
            val, idx, smallest = heapq.heappop(heap)
            tail.next = smallest
            tail = tail.next
            
            # Add next node from the same list if exists
            if smallest.next is not None:
                heapq.heappush(heap, (smallest.next.val, idx, smallest.next))
        
        return dummy.next
```
  </div>
  
  <div class="tab-content javascript">
```javascript
/**
 * Priority queue approach using min-heap
 * Time: O(N log k), Space: O(k)
 */
var mergeKLists = function(lists) {
    if (!lists || lists.length === 0) return null;
    
    // MinPriorityQueue implementation using array
    class MinHeap {
        constructor() {
            this.heap = [];
        }
        
        push(node) {
            this.heap.push(node);
            this.bubbleUp();
        }
        
        pop() {
            if (this.heap.length === 0) return null;
            if (this.heap.length === 1) return this.heap.pop();
            
            const min = this.heap[0];
            this.heap[0] = this.heap.pop();
            this.bubbleDown();
            return min;
        }
        
        bubbleUp() {
            let idx = this.heap.length - 1;
            while (idx > 0) {
                const parentIdx = Math.floor((idx - 1) / 2);
                if (this.heap[parentIdx].val <= this.heap[idx].val) break;
                [this.heap[parentIdx], this.heap[idx]] = [this.heap[idx], this.heap[parentIdx]];
                idx = parentIdx;
            }
        }
        
        bubbleDown() {
            let idx = 0;
            while (2 * idx + 1 < this.heap.length) {
                const leftIdx = 2 * idx + 1;
                const rightIdx = 2 * idx + 2;
                let minIdx = leftIdx;
                
                if (rightIdx < this.heap.length && 
                    this.heap[rightIdx].val < this.heap[leftIdx].val) {
                    minIdx = rightIdx;
                }
                
                if (this.heap[idx].val <= this.heap[minIdx].val) break;
                [this.heap[idx], this.heap[minIdx]] = [this.heap[minIdx], this.heap[idx]];
                idx = minIdx;
            }
        }
        
        isEmpty() {
            return this.heap.length === 0;
        }
    }
    
    const pq = new MinHeap();
    
    // Add first node of each non-empty list to heap
    for (let list of lists) {
        if (list !== null) {
            pq.push(list);
        }
    }
    
    let dummy = new ListNode(0);
    let tail = dummy;
    
    // Process nodes in sorted order
    while (!pq.isEmpty()) {
        // Get the smallest node
        let smallest = pq.pop();
        tail.next = smallest;
        tail = tail.next;
        
        // Add next node from the same list if exists
        if (smallest.next !== null) {
            pq.push(smallest.next);
        }
    }
    
    return dummy.next;
};
```
  </div>
</div>

#### Solution 3: Sequential Merge (Brute Force)
```java
public class Solution {
    /**
     * Sequential merge - merge lists one by one
     * Time: O(N * k), Space: O(1)
     * Less efficient but conceptually simple
     */
    public ListNode mergeKLists(ListNode[] lists) {
        if (lists == null || lists.length == 0) return null;
        
        ListNode result = null;
        
        // Merge each list with the result
        for (ListNode list : lists) {
            result = mergeTwoLists(result, list);
        }
        
        return result;
    }
    
    private ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        ListNode dummy = new ListNode(0);
        ListNode tail = dummy;
        
        while (l1 != null && l2 != null) {
            if (l1.val <= l2.val) {
                tail.next = l1;
                l1 = l1.next;
            } else {
                tail.next = l2;
                l2 = l2.next;
            }
            tail = tail.next;
        }
        
        tail.next = (l1 != null) ? l1 : l2;
        return dummy.next;
    }
}
```

#### Solution 4: Iterative Divide and Conquer
```java
public class Solution {
    /**
     * Iterative divide and conquer
     * Time: O(N log k), Space: O(1)
     */
    public ListNode mergeKLists(ListNode[] lists) {
        if (lists == null || lists.length == 0) return null;
        
        // Keep merging until only one list remains
        while (lists.length > 1) {
            List<ListNode> mergedLists = new ArrayList<>();
            
            // Merge pairs of lists
            for (int i = 0; i < lists.length; i += 2) {
                ListNode l1 = lists[i];
                ListNode l2 = (i + 1 < lists.length) ? lists[i + 1] : null;
                mergedLists.add(mergeTwoLists(l1, l2));
            }
            
            // Update lists array
            lists = mergedLists.toArray(new ListNode[0]);
        }
        
        return lists[0];
    }
    
    private ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        ListNode dummy = new ListNode(0);
        ListNode tail = dummy;
        
        while (l1 != null && l2 != null) {
            if (l1.val <= l2.val) {
                tail.next = l1;
                l1 = l1.next;
            } else {
                tail.next = l2;
                l2 = l2.next;
            }
            tail = tail.next;
        }
        
        tail.next = (l1 != null) ? l1 : l2;
        return dummy.next;
    }
}
```

### Complexity Analysis
- **Divide and Conquer**: Time O(N log k), Space O(log k) for recursion
- **Priority Queue**: Time O(N log k), Space O(k) for heap
- **Sequential Merge**: Time O(N * k), Space O(1) but inefficient
- **Total Nodes N**: Sum of all nodes across all lists

**Why O(N log k)?** Each node is processed log k times (merge levels), and there are N total nodes.

### Key Insights & Patterns
1. **Divide and Conquer**: Reduces problem size logarithmically
2. **Priority Queue**: Maintains global minimum efficiently
3. **Merge Operation**: Reuse the two-list merge as building block
4. **Space-Time Tradeoffs**: Different approaches offer different tradeoffs

### Common Pitfalls
1. **Empty Lists**: Handle null entries in the input array
2. **Single List**: Don't over-complicate when k=1
3. **Memory Usage**: Priority queue can use significant space for large k
4. **Recursion Depth**: Stack overflow for very large k in recursive solution

### Follow-up Questions
1. **Merge Intervals** (LeetCode 56): Apply similar merging concepts
2. **Sort Characters by Frequency** (LeetCode 451): Use priority queue pattern
3. What if lists are not sorted?
4. How would you merge k sorted arrays?
5. Can you merge k lists using only O(1) extra space?

---

## 5. Remove Nth Node From End Of List

**🔗 LeetCode Link:** [Remove Nth Node From End of List - LeetCode #19](https://leetcode.com/problems/remove-nth-node-from-end-of-list/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. How would you find the nth node from the end if you could traverse the list twice?
2. Can you think of a way to find it in just one pass through the list?
3. What's tricky about removing a node? What pointer do you need access to?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Two-Pass Approach Understanding
> **Guided Question:** If you can count the total length, how do you convert "nth from end" to "mth from beginning"?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Simple conversion:** If the list has length L, then the nth node from the end is the (L-n+1)th node from the beginning.

**Two-pass algorithm:**
1. First pass: Count total length L
2. Calculate position from start: L - n + 1  
3. Second pass: Walk to position L - n (one before target) and remove

**Edge case:** If L - n = 0, we're removing the head node.

This works but requires two traversals. Can we do better?
</details>

#### Step 2: One-Pass with Gap Technique
> **Guided Question:** How can you maintain a "window" of exactly n nodes? What happens when the front of the window reaches the end?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Gap technique:** Use two pointers with a fixed gap of n+1 positions.

**Setup:**
- Both pointers start at dummy node
- Advance fast pointer n+1 steps  
- Now there's a gap of n+1 between slow and fast

**Key insight:** When fast reaches the end (null), slow will be exactly at the node BEFORE the target node.

**Why n+1 gap?** We need slow to stop at the node before the target so we can easily remove the target by setting `slow.next = slow.next.next`.

**Time:** O(L), **Space:** O(1) - optimal single-pass solution
</details>

#### Step 3: Edge Case Handling
> **Guided Question:** What makes removing the head node tricky? How does a dummy node help?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**The head problem:** When removing the head, there's no "previous" node to update. Normally you'd need special handling.

**Dummy node solution:** Create a dummy node that points to the real head. Now:
- The "head" becomes just another node with a predecessor (dummy)
- We can use the same removal logic for all nodes
- Return `dummy.next` as the new head

**Pattern recognition:** Dummy nodes are incredibly useful for simplifying edge cases in linked list problems, especially when the head might change.

**Bonus:** This technique works even if n equals the list length (removing the head).
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the one-pass solution from memory:

**Step-by-step checklist:**
- [ ] Create dummy node pointing to head
- [ ] Initialize slow = dummy, fast = dummy
- [ ] Advance fast pointer n+1 times
- [ ] Move both pointers until fast reaches null
- [ ] Remove target: slow.next = slow.next.next
- [ ] Return dummy.next

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Can you trace through removing the 2nd from end in [1,2,3,4,5]?
2. **Complexity Analysis:** Why is one-pass better than two-pass if both are O(n)?
3. **Trade-offs:** What are the benefits and drawbacks of the dummy node technique?
4. **Pattern Recognition:** What other problems benefit from the "gap between pointers" technique?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the problem: ___/5
- [ ] Implementing brute force: ___/5  
- [ ] Implementing optimal solution: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Practice with edge cases: removing head, single node list

### Problem Statement
Given the head of a linked list, remove the nth node from the end of the list and return its head.

**Visual Example:**
```
Input: head = [1,2,3,4,5], n = 2
Output: [1,2,3,5]

Visual process:
1 -> 2 -> 3 -> 4 -> 5
               ^
        nth from end (n=2)

Result: 1 -> 2 -> 3 -> 5
```

### Knowledge Prerequisites
- Two-pointer technique with gap maintenance
- Dummy node pattern for edge cases
- Linked list traversal and node removal
- Understanding of one-pass algorithms

### First Principles
**Core Concept**: To remove the nth node from the end without knowing the total length, use two pointers with a gap of n nodes. When the fast pointer reaches the end, the slow pointer will be at the node before the target.

**Key Insight**: Maintain a constant gap of n+1 positions between pointers so that when fast reaches null, slow points to the node before the target node.

### Problem-First Approach

**Visual Reasoning:**
1. Use dummy node to handle edge case where head is removed
2. Create two pointers with n+1 gap
3. Move both pointers until fast reaches end
4. Slow pointer will be at the node before target
5. Remove target by adjusting slow.next

**Gap Maintenance Pattern:**
```
dummy -> 1 -> 2 -> 3 -> 4 -> 5 -> null
slow              fast (gap = n+1 = 3)

Move both until fast reaches null:
dummy -> 1 -> 2 -> 3 -> 4 -> 5 -> null
              slow              fast

Now slow.next is the target node to remove
```

### Multiple Java Solutions

#### Solution 1: Two Pointers with Dummy Node (Optimal)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public class Solution {
    /**
     * Two pointers with n+1 gap for one-pass removal
     * Time: O(L), Space: O(1) where L is list length
     */
    public ListNode removeNthFromEnd(ListNode head, int n) {
        // Use dummy node to handle edge case where head is removed
        ListNode dummy = new ListNode(0);
        dummy.next = head;
        
        ListNode slow = dummy;  // Will point to node before target
        ListNode fast = dummy;  // Will reach end first
        
        // Create gap of n+1 between slow and fast
        // This ensures slow stops at node before target
        for (int i = 0; i <= n; i++) {
            fast = fast.next;
        }
        
        // Move both pointers until fast reaches end
        while (fast != null) {
            slow = slow.next;
            fast = fast.next;
        }
        
        // Remove the target node
        slow.next = slow.next.next;
        
        return dummy.next;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
class Solution:
    def removeNthFromEnd(self, head: ListNode, n: int) -> ListNode:
        """
        Two pointers with n+1 gap for one-pass removal
        Time: O(L), Space: O(1) where L is list length
        """
        # Use dummy node to handle edge case where head is removed
        dummy = ListNode(0)
        dummy.next = head
        
        slow = dummy  # Will point to node before target
        fast = dummy  # Will reach end first
        
        # Create gap of n+1 between slow and fast
        # This ensures slow stops at node before target
        for i in range(n + 1):
            fast = fast.next
        
        # Move both pointers until fast reaches end
        while fast is not None:
            slow = slow.next
            fast = fast.next
        
        # Remove the target node
        slow.next = slow.next.next
        
        return dummy.next
```
  </div>
  
  <div class="tab-content javascript">
```javascript
/**
 * Two pointers with n+1 gap for one-pass removal
 * Time: O(L), Space: O(1) where L is list length
 */
var removeNthFromEnd = function(head, n) {
    // Use dummy node to handle edge case where head is removed
    let dummy = new ListNode(0);
    dummy.next = head;
    
    let slow = dummy;  // Will point to node before target
    let fast = dummy;  // Will reach end first
    
    // Create gap of n+1 between slow and fast
    // This ensures slow stops at node before target
    for (let i = 0; i <= n; i++) {
        fast = fast.next;
    }
    
    // Move both pointers until fast reaches end
    while (fast !== null) {
        slow = slow.next;
        fast = fast.next;
    }
    
    // Remove the target node
    slow.next = slow.next.next;
    
    return dummy.next;
};
```
  </div>
</div>

#### Solution 2: Two-Pass Solution (Straightforward)
```java
public class Solution {
    /**
     * Two-pass solution: count length, then remove
     * Time: O(L), Space: O(1)
     */
    public ListNode removeNthFromEnd(ListNode head, int n) {
        // First pass: count total length
        int length = 0;
        ListNode curr = head;
        while (curr != null) {
            length++;
            curr = curr.next;
        }
        
        // Calculate position from beginning
        int positionFromStart = length - n;
        
        // Handle edge case: removing head
        if (positionFromStart == 0) {
            return head.next;
        }
        
        // Second pass: find node before target
        curr = head;
        for (int i = 0; i < positionFromStart - 1; i++) {
            curr = curr.next;
        }
        
        // Remove target node
        curr.next = curr.next.next;
        
        return head;
    }
}
```

#### Solution 3: Recursive Approach (Elegant)
```java
public class Solution {
    /**
     * Recursive solution using return path counting
     * Time: O(L), Space: O(L) due to call stack
     */
    public ListNode removeNthFromEnd(ListNode head, int n) {
        return removeHelper(head, n).node;
    }
    
    private Result removeHelper(ListNode node, int n) {
        if (node == null) {
            return new Result(null, 0);
        }
        
        Result result = removeHelper(node.next, n);
        int currentPosition = result.position + 1;
        
        if (currentPosition == n) {
            // This is the node to remove, skip it
            return new Result(result.node, currentPosition);
        } else {
            // Keep this node, link to processed rest
            node.next = result.node;
            return new Result(node, currentPosition);
        }
    }
    
    // Helper class to return both node and position
    private class Result {
        ListNode node;
        int position;
        
        Result(ListNode node, int position) {
            this.node = node;
            this.position = position;
        }
    }
}
```

#### Solution 4: Stack-Based Approach
```java
public class Solution {
    /**
     * Stack-based solution for educational purposes
     * Time: O(L), Space: O(L)
     */
    public ListNode removeNthFromEnd(ListNode head, int n) {
        Stack<ListNode> stack = new Stack<>();
        ListNode dummy = new ListNode(0);
        dummy.next = head;
        
        // Push all nodes including dummy onto stack
        ListNode curr = dummy;
        while (curr != null) {
            stack.push(curr);
            curr = curr.next;
        }
        
        // Pop n nodes to reach the node before target
        for (int i = 0; i < n; i++) {
            stack.pop();
        }
        
        // Remove target node
        ListNode nodeBeforeTarget = stack.peek();
        nodeBeforeTarget.next = nodeBeforeTarget.next.next;
        
        return dummy.next;
    }
}
```

### Complexity Analysis
- **Two Pointers**: Time O(L), Space O(1) - optimal solution
- **Two Pass**: Time O(L), Space O(1) - simple but makes two passes
- **Recursive**: Time O(L), Space O(L) - elegant but uses call stack
- **Stack**: Time O(L), Space O(L) - demonstrates alternative approach

**Why One Pass is Better**: Single traversal is more efficient and demonstrates mastery of two-pointer technique.

### Key Insights & Patterns
1. **Gap Maintenance**: Key insight for nth-from-end problems
2. **Dummy Node Usage**: Simplifies edge case where head is removed
3. **Off-by-One Prevention**: Gap of n+1 ensures correct positioning
4. **One-Pass Efficiency**: Avoid multiple traversals when possible

### Common Pitfalls
1. **Incorrect Gap**: Using gap of n instead of n+1
2. **Null Pointer**: Not handling case where n equals list length
3. **Edge Cases**: Empty list, single node, removing head
4. **Pointer Initialization**: Starting fast pointer at wrong position

### Follow-up Questions
1. **Rotate List** (LeetCode 61): Similar nth-from-end calculation
2. **Remove Duplicates from Sorted List** (LeetCode 83): Node removal patterns
3. What if n is larger than the list length?
4. How would you remove multiple nodes from the end?
5. Can you solve this with only one pointer?

---

## 6. Reorder List

**🔗 LeetCode Link:** [Reorder List - LeetCode #143](https://leetcode.com/problems/reorder-list/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. Looking at the pattern L₀→Lₙ→L₁→Lₙ₋₁→L₂→Lₙ₋₂, what do you notice about where elements come from?
2. How could you get easy access to both the beginning and end of the list simultaneously?
3. What fundamental linked list operations might you need to combine to solve this?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Pattern Recognition
> **Guided Question:** The result alternates between taking from the start and the end. How could you set up two "streams" to merge from?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Key insight:** We need to alternate between:
- First half: L₀, L₁, L₂, ... (forward order)
- Second half: Lₙ, Lₙ₋₁, Lₙ₋₂, ... (reverse order)

**Strategy breakdown:**
1. Split the list into two halves
2. Reverse the second half so we can access elements in the right order
3. Merge the two halves by alternating elements

This transforms a complex reordering into well-understood subproblems!
</details>

#### Step 2: Finding the Split Point
> **Guided Question:** How can you find the middle of the linked list to split it properly? What should you do for odd vs even length lists?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Fast/slow pointer technique:** Use the classic "tortoise and hare" approach.
- Slow pointer moves 1 step, fast pointer moves 2 steps
- When fast reaches the end, slow is at the middle

**Splitting strategy:**
- For odd length (5 nodes): first half gets 3 nodes, second gets 2
- For even length (6 nodes): first half gets 3 nodes, second gets 3  
- Always split so first half has same or one more node than second half

**Implementation:** `middle.next = null` to properly terminate the first half.

**Pattern recognition:** This is the same middle-finding technique used in many linked list problems.
</details>

#### Step 3: Merging with Alternation
> **Guided Question:** Once you have a forward list and a reversed list, how do you interleave them while being careful with pointer management?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Alternating merge pattern:**
```
first:  1 → 2 → 3
second: 6 → 5 → 4

Result: 1 → 6 → 2 → 5 → 3 → 4
```

**Safe pointer management:**
1. Save the next pointers before modifying links
2. Connect first to second, second to first's next
3. Advance both pointers to their saved next positions

**Key insight:** Since we're reusing existing nodes, this is O(1) space despite the complex reordering.

**Time:** O(n), **Space:** O(1) - optimal solution combining multiple techniques
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the three-phase solution from memory:

**Step-by-step checklist:**
- [ ] Find middle using slow/fast pointers
- [ ] Split list at middle (set middle.next = null)
- [ ] Reverse the second half
- [ ] Merge first and reversed second alternately
- [ ] Handle the termination correctly

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Can you trace through [1,2,3,4,5,6] step by step through all three phases?
2. **Complexity Analysis:** Why is this O(n) time and O(1) space despite the complex transformation?
3. **Trade-offs:** How does this approach compare to using an array for random access?
4. **Pattern Recognition:** What other problems combine finding middle, reversing, and merging?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the problem: ___/5
- [ ] Implementing brute force: ___/5  
- [ ] Implementing optimal solution: ___/5
- [ ] Explaining the approach: ___/5

#### Next Steps
- If confidence is 3+ on all: Congratulations! You've mastered linked list fundamentals
- If confidence is <3: Review the guided discovery section again
- Try solving without looking at the implementation details

### Problem Statement
Given a singly linked list L: L₀ → L₁ → ... → Lₙ₋₁ → Lₙ, reorder it to: L₀ → Lₙ → L₁ → Lₙ₋₁ → L₂ → Lₙ₋₂ → ...

**Visual Example:**
```
Input:  1 -> 2 -> 3 -> 4 -> 5
Output: 1 -> 5 -> 2 -> 4 -> 3

Step breakdown:
1. Find middle: 1 -> 2 -> 3 | 4 -> 5
2. Reverse second half: 1 -> 2 -> 3 | 5 -> 4
3. Merge alternating: 1 -> 5 -> 2 -> 4 -> 3
```

### Knowledge Prerequisites
- Finding middle of linked list (slow/fast pointers)
- Reversing linked list
- Merging two lists with custom pattern
- Multi-step algorithm composition

### First Principles
**Core Concept**: This problem combines three fundamental linked list operations:
1. Find the middle point to split the list
2. Reverse the second half
3. Merge the two halves in alternating fashion

**Key Insight**: Break complex problem into well-understood subproblems, then compose the solutions.

### Problem-First Approach

**Three-Phase Strategy:**
1. **Split**: Use slow/fast pointers to find middle and split list
2. **Reverse**: Reverse the second half of the list
3. **Merge**: Interleave nodes from both halves alternately

**Visual Phase Breakdown:**
```
Original: 1->2->3->4->5->6

Phase 1 (Split):
first:  1->2->3
second: 4->5->6

Phase 2 (Reverse second):
first:  1->2->3
second: 6->5->4

Phase 3 (Merge alternating):
result: 1->6->2->5->3->4
```

### Multiple Java Solutions

#### Solution 1: Three-Phase Approach (Optimal)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public class Solution {
    /**
     * Three-phase solution: split, reverse, merge
     * Time: O(n), Space: O(1)
     */
    public void reorderList(ListNode head) {
        if (head == null || head.next == null) return;
        
        // Phase 1: Find middle and split list
        ListNode middle = findMiddle(head);
        ListNode secondHalf = middle.next;
        middle.next = null;  // Split the list
        
        // Phase 2: Reverse second half
        ListNode reversedSecond = reverseList(secondHalf);
        
        // Phase 3: Merge alternating
        mergeLists(head, reversedSecond);
    }
    
    /**
     * Find middle using slow/fast pointers
     * For even length, returns first middle
     */
    private ListNode findMiddle(ListNode head) {
        ListNode slow = head;
        ListNode fast = head;
        
        // Move fast 2 steps, slow 1 step
        while (fast.next != null && fast.next.next != null) {
            slow = slow.next;
            fast = fast.next.next;
        }
        
        return slow;
    }
    
    /**
     * Reverse linked list iteratively
     */
    private ListNode reverseList(ListNode head) {
        ListNode prev = null;
        ListNode curr = head;
        
        while (curr != null) {
            ListNode nextTemp = curr.next;
            curr.next = prev;
            prev = curr;
            curr = nextTemp;
        }
        
        return prev;
    }
    
    /**
     * Merge two lists alternating between first and second
     */
    private void mergeLists(ListNode first, ListNode second) {
        while (second != null) {
            ListNode firstNext = first.next;
            ListNode secondNext = second.next;
            
            // Insert second node after first
            first.next = second;
            second.next = firstNext;
            
            // Move to next pair
            first = firstNext;
            second = secondNext;
        }
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
class Solution:
    def reorderList(self, head: ListNode) -> None:
        """
        Three-phase solution: split, reverse, merge
        Time: O(n), Space: O(1)
        Do not return anything, modify head in-place instead.
        """
        if head is None or head.next is None:
            return
        
        # Phase 1: Find middle and split list
        middle = self.find_middle(head)
        second_half = middle.next
        middle.next = None  # Split the list
        
        # Phase 2: Reverse second half
        reversed_second = self.reverse_list(second_half)
        
        # Phase 3: Merge alternating
        self.merge_lists(head, reversed_second)
    
    def find_middle(self, head: ListNode) -> ListNode:
        """
        Find middle using slow/fast pointers
        For even length, returns first middle
        """
        slow = head
        fast = head
        
        # Move fast 2 steps, slow 1 step
        while fast.next is not None and fast.next.next is not None:
            slow = slow.next
            fast = fast.next.next
        
        return slow
    
    def reverse_list(self, head: ListNode) -> ListNode:
        """
        Reverse linked list iteratively
        """
        prev = None
        curr = head
        
        while curr is not None:
            next_temp = curr.next
            curr.next = prev
            prev = curr
            curr = next_temp
        
        return prev
    
    def merge_lists(self, first: ListNode, second: ListNode) -> None:
        """
        Merge two lists alternating between first and second
        """
        while second is not None:
            first_next = first.next
            second_next = second.next
            
            # Insert second node after first
            first.next = second
            second.next = first_next
            
            # Move to next pair
            first = first_next
            second = second_next
```
  </div>
  
  <div class="tab-content javascript">
```javascript
/**
 * Three-phase solution: split, reverse, merge
 * Time: O(n), Space: O(1)
 */
var reorderList = function(head) {
    if (head === null || head.next === null) return;
    
    // Phase 1: Find middle and split list
    let middle = findMiddle(head);
    let secondHalf = middle.next;
    middle.next = null;  // Split the list
    
    // Phase 2: Reverse second half
    let reversedSecond = reverseList(secondHalf);
    
    // Phase 3: Merge alternating
    mergeLists(head, reversedSecond);
};

/**
 * Find middle using slow/fast pointers
 * For even length, returns first middle
 */
function findMiddle(head) {
    let slow = head;
    let fast = head;
    
    // Move fast 2 steps, slow 1 step
    while (fast.next !== null && fast.next.next !== null) {
        slow = slow.next;
        fast = fast.next.next;
    }
    
    return slow;
}

/**
 * Reverse linked list iteratively
 */
function reverseList(head) {
    let prev = null;
    let curr = head;
    
    while (curr !== null) {
        let nextTemp = curr.next;
        curr.next = prev;
        prev = curr;
        curr = nextTemp;
    }
    
    return prev;
}

/**
 * Merge two lists alternating between first and second
 */
function mergeLists(first, second) {
    while (second !== null) {
        let firstNext = first.next;
        let secondNext = second.next;
        
        // Insert second node after first
        first.next = second;
        second.next = firstNext;
        
        // Move to next pair
        first = firstNext;
        second = secondNext;
    }
}
```
  </div>
</div>

#### Solution 2: Inline Implementation (Compact)
```java
public class Solution {
    /**
     * All operations inline for compactness
     * Time: O(n), Space: O(1)
     */
    public void reorderList(ListNode head) {
        if (head == null || head.next == null) return;
        
        // Step 1: Find middle
        ListNode slow = head, fast = head;
        while (fast.next != null && fast.next.next != null) {
            slow = slow.next;
            fast = fast.next.next;
        }
        
        // Step 2: Split and reverse second half
        ListNode secondHalf = slow.next;
        slow.next = null;
        
        ListNode prev = null, curr = secondHalf;
        while (curr != null) {
            ListNode next = curr.next;
            curr.next = prev;
            prev = curr;
            curr = next;
        }
        secondHalf = prev;
        
        // Step 3: Merge alternating
        ListNode first = head;
        while (secondHalf != null) {
            ListNode firstNext = first.next;
            ListNode secondNext = secondHalf.next;
            
            first.next = secondHalf;
            secondHalf.next = firstNext;
            
            first = firstNext;
            secondHalf = secondNext;
        }
    }
}
```

#### Solution 3: Using Array (Alternative Approach)
```java
public class Solution {
    /**
     * Convert to array, then reconstruct
     * Time: O(n), Space: O(n)
     */
    public void reorderList(ListNode head) {
        if (head == null || head.next == null) return;
        
        // Store all nodes in array
        List<ListNode> nodes = new ArrayList<>();
        ListNode curr = head;
        while (curr != null) {
            nodes.add(curr);
            curr = curr.next;
        }
        
        // Reorder using two pointers on array
        int left = 0, right = nodes.size() - 1;
        while (left < right) {
            nodes.get(left).next = nodes.get(right);
            left++;
            if (left == right) break;
            
            nodes.get(right).next = nodes.get(left);
            right--;
        }
        
        // Terminate the list
        nodes.get(left).next = null;
    }
}
```

#### Solution 4: Recursive Approach (Advanced)
```java
public class Solution {
    /**
     * Recursive solution with global pointer
     * Time: O(n), Space: O(n) due to call stack
     */
    private ListNode frontPointer;
    
    public void reorderList(ListNode head) {
        frontPointer = head;
        reorderHelper(head);
    }
    
    private boolean reorderHelper(ListNode backPointer) {
        if (backPointer == null) return true;
        
        // Recurse to the end
        if (!reorderHelper(backPointer.next)) return false;
        
        // Base case: pointers meet or cross
        if (frontPointer == backPointer || frontPointer.next == backPointer) {
            backPointer.next = null;
            return false;
        }
        
        // Perform reordering
        ListNode frontNext = frontPointer.next;
        frontPointer.next = backPointer;
        backPointer.next = frontNext;
        frontPointer = frontNext;
        
        return true;
    }
}
```

### Complexity Analysis
- **Three-Phase**: Time O(n), Space O(1) - optimal solution
- **Array-Based**: Time O(n), Space O(n) - simpler but uses extra space
- **Recursive**: Time O(n), Space O(n) - elegant but deep recursion
- **Operations Count**: Each node is touched exactly 3 times (find middle, reverse, merge)

### Key Insights & Patterns
1. **Problem Decomposition**: Break complex problems into known subproblems
2. **Algorithm Composition**: Combine multiple techniques effectively
3. **In-Place Manipulation**: Avoid extra space by reusing existing nodes
4. **Pointer Management**: Careful handling of next pointers during reconstruction

### Common Pitfalls
1. **List Splitting**: Forgetting to set middle.next = null
2. **Odd/Even Length**: Different behavior for odd vs even length lists
3. **Pointer Tracking**: Losing track of next pointers during merge
4. **Termination**: Not properly terminating the reordered list

### Advanced Optimizations
```java
/**
 * Optimized version with single pass middle finding
 * Handles odd/even cases elegantly
 */
public void reorderListOptimized(ListNode head) {
    if (head == null || head.next == null) return;
    
    // Find middle with preference for first middle in even-length lists
    ListNode prev = null, slow = head, fast = head;
    
    while (fast != null && fast.next != null) {
        prev = slow;
        slow = slow.next;
        fast = fast.next.next;
    }
    
    // Split list
    prev.next = null;
    
    // Reverse second half starting from slow
    ListNode secondHalf = reverseList(slow);
    
    // Merge
    mergeLists(head, secondHalf);
}
```

### Follow-up Questions
1. **Palindrome Linked List** (LeetCode 234): Uses similar split and reverse
2. **Swap Nodes in Pairs** (LeetCode 24): Pattern-based reordering
3. **Odd Even Linked List** (LeetCode 328): Alternative reordering pattern
4. How would you reorder with a different pattern (e.g., groups of 3)?
5. Can you reorder without modifying the original list structure?

---

## Summary: Linked List Mastery Patterns

### Core Techniques Mastered
1. **Two Pointers**: Fast/slow for cycles, gaps for nth-from-end
2. **Dummy Nodes**: Simplify edge cases involving head changes
3. **Reversal**: Three-pointer technique for in-place reversal
4. **Merging**: Fundamental operation for sorted list combination
5. **Divide and Conquer**: Efficient approach for k-way operations
6. **Problem Decomposition**: Breaking complex problems into known subproblems

### Universal Patterns
- **Null Safety**: Always check pointers before dereferencing
- **Edge Cases**: Empty lists, single nodes, and head modifications
- **Memory Efficiency**: Reuse existing nodes rather than creating new ones
- **Algorithm Composition**: Combine simple operations for complex solutions

### Time Complexity Patterns
- **Single Pass**: O(n) for most basic operations
- **Two Pass**: O(n) but less efficient than single pass solutions
- **Divide and Conquer**: O(n log k) for k-way operations
- **Priority Queue**: O(n log k) with additional space overhead

### Space Complexity Considerations
- **In-Place**: O(1) space using pointer manipulation
- **Recursive**: O(n) space due to call stack depth
- **Auxiliary Data Structures**: O(n) or O(k) for heaps, stacks, etc.

These 6 problems form the foundation for advanced linked list manipulations and demonstrate essential patterns that appear throughout computer science algorithms.