---
render_with_liquid: false
---

# Tree Problems - Blind 75 Study Guide

## Table of Contents
1. [Tree Fundamentals](#tree-fundamentals)
2. [Core Tree Concepts](#core-tree-concepts)
3. [Tree Traversal Patterns](#tree-traversal-patterns)
4. [The 14 Tree Problems](#the-14-tree-problems)
   - [1. Maximum Depth of Binary Tree](#1-maximum-depth-of-binary-tree)
   - [2. Same Tree](#2-same-tree)
   - [3. Invert Binary Tree](#3-invert-binary-tree)
   - [4. Binary Tree Maximum Path Sum](#4-binary-tree-maximum-path-sum)
   - [5. Binary Tree Level Order Traversal](#5-binary-tree-level-order-traversal)
   - [6. Serialize and Deserialize Binary Tree](#6-serialize-and-deserialize-binary-tree)
   - [7. Subtree of Another Tree](#7-subtree-of-another-tree)
   - [8. Construct Binary Tree from Preorder and Inorder](#8-construct-binary-tree-from-preorder-and-inorder)
   - [9. Validate Binary Search Tree](#9-validate-binary-search-tree)
   - [10. Kth Smallest Element in a BST](#10-kth-smallest-element-in-a-bst)
   - [11. Lowest Common Ancestor of a BST](#11-lowest-common-ancestor-of-a-bst)
   - [12. Implement Trie (Prefix Tree)](#12-implement-trie-prefix-tree)
   - [13. Add and Search Word - Data Structure Design](#13-add-and-search-word---data-structure-design)
   - [14. Word Search II](#14-word-search-ii)
5. [Tree Problem Patterns Summary](#tree-problem-patterns-summary)

---

## Tree Fundamentals

Trees are hierarchical data structures consisting of nodes connected by edges. In computer science, trees are used to represent hierarchical relationships and enable efficient searching, insertion, and deletion operations.

### Essential Tree Concepts
- **Node**: Basic unit containing data and references to child nodes
- **Root**: Top node of the tree (no parent)
- **Leaf**: Node with no children
- **Edge**: Connection between parent and child nodes
- **Height**: Longest path from node to leaf
- **Depth**: Distance from root to node
- **Binary Tree**: Each node has at most two children (left and right)
- **Binary Search Tree (BST)**: Binary tree where left child < parent < right child

### Tree Properties
- **Complete**: All levels filled except possibly the last, filled left to right
- **Full**: Every node has either 0 or 2 children
- **Perfect**: All internal nodes have two children, all leaves at same level
- **Balanced**: Height difference between left and right subtrees ≤ 1

---

## Core Tree Concepts

### Tree Node Definition

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;
    
    TreeNode() {
    }
    
    TreeNode(int val) {
        this.val = val;
    }
    
    TreeNode(
        int val,
        TreeNode left,
        TreeNode right
    ) {
        this.val = val;
        this.left = left;
        this.right = right;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
class TreeNode:
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
```
  </div>
  
  <div class="tab-content javascript">
```javascript
class TreeNode {
    constructor(val = 0, left = null, right = null) {
        this.val = val;
        this.left = left;
        this.right = right;
    }
}

// Alternative function constructor approach
function TreeNode(val, left, right) {
    this.val = (val === undefined ? 0 : val);
    this.left = (left === undefined ? null : left);
    this.right = (right === undefined ? null : right);
}
```
  </div>
</div>

### Trie Node Definition

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
class TrieNode {
    TrieNode[] children;
    boolean isEnd;
    
    TrieNode() {
        children = new TrieNode[26]; // for lowercase letters
        isEnd = false;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
class TrieNode:
    def __init__(self):
        self.children = [None] * 26  # for lowercase letters
        self.is_end = False

# Alternative using dictionary
class TrieNode:
    def __init__(self):
        self.children = {}  # character -> TrieNode
        self.is_end = False
```
  </div>
  
  <div class="tab-content javascript">
```javascript
class TrieNode {
    constructor() {
        this.children = new Array(26).fill(null); // for lowercase letters
        this.isEnd = false;
    }
}

// Alternative using Map
class TrieNode {
    constructor() {
        this.children = new Map(); // character -> TrieNode
        this.isEnd = false;
    }
}
```
  </div>
</div>

---

## Tree Traversal Patterns

### 1. Depth-First Search (DFS) Recursion

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
void dfs(TreeNode node) {
    if (node == null) return;
    
    // Pre-order: process node before children
    process(node);
    dfs(node.left);
    dfs(node.right);
}
```
  </div>
  
  <div class="tab-content python">
```python
def dfs(node):
    if node is None:
        return
    
    # Pre-order: process node before children
    process(node)
    dfs(node.left)
    dfs(node.right)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function dfs(node) {
    if (node === null) return;
    
    // Pre-order: process node before children
    process(node);
    dfs(node.left);
    dfs(node.right);
}
```
  </div>
</div>

### 2. Breadth-First Search (BFS) Level Order

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
import java.util.LinkedList;
import java.util.Queue;

void bfs(TreeNode root) {
    if (root == null) return;
    
    Queue<TreeNode> queue = new LinkedList<>();
    queue.offer(root);
    
    while (!queue.isEmpty()) {
        TreeNode node = queue.poll();
        process(node);
        
        if (node.left != null) queue.offer(node.left);
        if (node.right != null) queue.offer(node.right);
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
from collections import deque

def bfs(root):
    if root is None:
        return
    
    queue = deque([root])
    
    while queue:
        node = queue.popleft()
        process(node)
        
        if node.left:
            queue.append(node.left)
        if node.right:
            queue.append(node.right)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function bfs(root) {
    if (root === null) return;
    
    const queue = [root];
    
    while (queue.length > 0) {
        const node = queue.shift();
        process(node);
        
        if (node.left !== null) queue.push(node.left);
        if (node.right !== null) queue.push(node.right);
    }
}
```
  </div>
</div>

### 3. In-order Traversal (for BST)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
import java.util.List;

void inorder(TreeNode node, List<Integer> result) {
    if (node == null) return;
    
    inorder(node.left, result);
    result.add(node.val);  // Process in sorted order for BST
    inorder(node.right, result);
}
```
  </div>
  
  <div class="tab-content python">
```python
def inorder(node, result):
    if node is None:
        return
    
    inorder(node.left, result)
    result.append(node.val)  # Process in sorted order for BST
    inorder(node.right, result)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function inorder(node, result) {
    if (node === null) return;
    
    inorder(node.left, result);
    result.push(node.val);  // Process in sorted order for BST
    inorder(node.right, result);
}
```
  </div>
</div>

---

## The 14 Tree Problems

### 1. Maximum Depth of Binary Tree

**🔗 LeetCode Link:** [Maximum Depth of Binary Tree - LeetCode #104](https://leetcode.com/problems/maximum-depth-of-binary-tree/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. How would you measure the "height" of a tree if you were climbing it? What would you count?
2. What happens when you reach a node that has no children (a leaf node)?
3. If you're at a node with left and right children, how does their depth relate to the current node's depth?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding Tree Depth
> **Guided Question:** What does "depth" or "height" actually mean in a tree, and how might we break this problem into smaller subproblems?

<details>
<summary>💭 Think about it, then click to reveal</summary>

The depth of a tree is the longest path from root to any leaf node. For any node, we can think of this recursively:
- A null node has depth 0 (base case)  
- Any other node's depth = 1 + maximum depth of its children

This recursive structure suggests we can solve for each subtree and combine the results.
</details>

#### Step 2: Identifying the Base Case
> **Guided Question:** What should happen when we reach a null node or empty tree? What depth value makes sense?

<details>
<summary>💭 Think about it, then click to reveal</summary>

When we reach a null node (empty tree or beyond a leaf), the depth should be 0. This makes sense because:
- An empty tree has no nodes, so depth = 0
- When we go beyond a leaf node, we're not adding any more nodes to our path
- This gives us our recursive base case: `if (node == null) return 0;`
</details>

#### Step 3: Combining Subproblem Results
> **Guided Question:** If you know the maximum depth of the left subtree and right subtree, how do you calculate the depth of the current node?

<details>
<summary>💭 Think about it, then click to reveal</summary>

The depth of the current node is:
`1 + Math.max(leftDepth, rightDepth)`

- The "1" accounts for the current node itself
- We take the maximum because we want the longest path
- This naturally handles cases where a node has only one child (the null child returns 0)

This gives us the complete recursive solution!
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Handle the base case (null node returns 0)
- [ ] Recursively calculate left subtree depth
- [ ] Recursively calculate right subtree depth  
- [ ] Return 1 + max of both subtree depths

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why do we add 1 to the maximum of left and right depths?
2. **Complexity Analysis:** What's the time complexity and why? What about space complexity?
3. **Trade-offs:** Could we solve this iteratively? What would be the pros and cons?
4. **Pattern Recognition:** What other tree problems use this "process children, then combine" pattern?

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

**Problem Statement**: Given the root of a binary tree, return its maximum depth. The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

**Examples:**
```
Input: root = [3,9,20,null,null,15,7]
Output: 3

Input: root = [1,null,2]
Output: 2
```

### Knowledge Prerequisites
- Basic recursion and tree traversal
- Understanding of tree height and depth concepts
- Base case identification in recursive problems

### First Principles
The depth of a tree is determined by:
- **Base case**: Empty tree has depth 0
- **Recursive case**: 1 + maximum depth of left and right subtrees
- **Tree structure**: Each level adds 1 to the depth

### Problem-First Approach

**Step 1: Understand the Problem**
- Find the longest path from root to any leaf
- Count the number of nodes (or edges + 1) in this path
- Handle empty tree case

**Step 2: Identify Key Insights**
- Use recursive approach: depth = 1 + max(left_depth, right_depth)
- Base case: null node has depth 0
- Each recursive call goes one level deeper

**Step 3: Algorithm Design**
1. Handle base case (null node)
2. Recursively find depth of left and right subtrees
3. Return 1 + maximum of the two depths

### Multiple Java Solutions

#### Solution 1: Recursive DFS (Most Common)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public int maxDepth(TreeNode root) {
    if (root == null) {
        return 0;
    }
    
    int leftDepth = maxDepth(root.left);
    int rightDepth = maxDepth(root.right);
    
    return 1 + Math.max(leftDepth, rightDepth);
}
```
  </div>
  
  <div class="tab-content python">
```python
def maxDepth(self, root):
    if root is None:
        return 0
    
    left_depth = self.maxDepth(root.left)
    right_depth = self.maxDepth(root.right)
    
    return 1 + max(left_depth, right_depth)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function maxDepth(root) {
    if (root === null) {
        return 0;
    }
    
    const leftDepth = maxDepth(root.left);
    const rightDepth = maxDepth(root.right);
    
    return 1 + Math.max(leftDepth, rightDepth);
}
```
  </div>
</div>

#### Solution 2: Iterative BFS with Level Tracking

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
import java.util.LinkedList;
import java.util.Queue;

public int maxDepth(TreeNode root) {
    if (root == null) return 0;
    
    Queue<TreeNode> queue = new LinkedList<>();
    queue.offer(root);
    int depth = 0;
    
    while (!queue.isEmpty()) {
        int levelSize = queue.size();
        depth++;
        
        for (int i = 0; i < levelSize; i++) {
            TreeNode node = queue.poll();
            
            if (node.left != null) queue.offer(node.left);
            if (node.right != null) queue.offer(node.right);
        }
    }
    
    return depth;
}
```
  </div>
  
  <div class="tab-content python">
```python
from collections import deque

def maxDepth(self, root):
    if root is None:
        return 0
    
    queue = deque([root])
    depth = 0
    
    while queue:
        level_size = len(queue)
        depth += 1
        
        for _ in range(level_size):
            node = queue.popleft()
            
            if node.left:
                queue.append(node.left)
            if node.right:
                queue.append(node.right)
    
    return depth
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function maxDepth(root) {
    if (root === null) return 0;
    
    const queue = [root];
    let depth = 0;
    
    while (queue.length > 0) {
        const levelSize = queue.length;
        depth++;
        
        for (let i = 0; i < levelSize; i++) {
            const node = queue.shift();
            
            if (node.left !== null) queue.push(node.left);
            if (node.right !== null) queue.push(node.right);
        }
    }
    
    return depth;
}
```
  </div>
</div>

#### Solution 3: Iterative DFS with Stack

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public int maxDepth(TreeNode root) {
    if (root == null) return 0;
    
    Stack<TreeNode> nodeStack = new Stack<>();
    Stack<Integer> depthStack = new Stack<>();
    
    nodeStack.push(root);
    depthStack.push(1);
    int maxDepth = 0;
    
    while (!nodeStack.isEmpty()) {
        TreeNode node = nodeStack.pop();
        int currentDepth = depthStack.pop();
        
        maxDepth = Math.max(maxDepth, currentDepth);
        
        if (node.left != null) {
            nodeStack.push(node.left);
            depthStack.push(currentDepth + 1);
        }
        if (node.right != null) {
            nodeStack.push(node.right);
            depthStack.push(currentDepth + 1);
        }
    }
    
    return maxDepth;
}
```
  </div>
  
  <div class="tab-content python">
```python
def maxDepth(self, root):
    if root is None:
        return 0
    
    node_stack = [root]
    depth_stack = [1]
    max_depth = 0
    
    while node_stack:
        node = node_stack.pop()
        current_depth = depth_stack.pop()
        
        max_depth = max(max_depth, current_depth)
        
        if node.left:
            node_stack.append(node.left)
            depth_stack.append(current_depth + 1)
        if node.right:
            node_stack.append(node.right)
            depth_stack.append(current_depth + 1)
    
    return max_depth
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function maxDepth(root) {
    if (root === null) return 0;
    
    const nodeStack = [root];
    const depthStack = [1];
    let maxDepth = 0;
    
    while (nodeStack.length > 0) {
        const node = nodeStack.pop();
        const currentDepth = depthStack.pop();
        
        maxDepth = Math.max(maxDepth, currentDepth);
        
        if (node.left !== null) {
            nodeStack.push(node.left);
            depthStack.push(currentDepth + 1);
        }
        if (node.right !== null) {
            nodeStack.push(node.right);
            depthStack.push(currentDepth + 1);
        }
    }
    
    return maxDepth;
}
```
  </div>
</div>

### Complexity Analysis
- **Recursive DFS**: Time O(n), Space O(h) where h is height
- **BFS**: Time O(n), Space O(w) where w is maximum width
- **Iterative DFS**: Time O(n), Space O(h)

### Key Insights & Patterns
1. **Recursive Structure**: Tree problems often have natural recursive solutions
2. **Base Case**: Always handle null/empty cases first
3. **Divide and Conquer**: Solve for subtrees and combine results
4. **Multiple Approaches**: Same problem can be solved with DFS or BFS

### Common Pitfalls
1. **Null Handling**: Forgetting to check for null nodes
2. **Off-by-One**: Confusion between counting nodes vs edges
3. **Stack Overflow**: Very deep trees with recursive solution

### Follow-up Questions
1. How would you find the minimum depth?
2. What if you needed to find the diameter (longest path between any two nodes)?
3. How would you handle trees with millions of nodes?

---

### 2. Same Tree

**🔗 LeetCode Link:** [Same Tree - LeetCode #100](https://leetcode.com/problems/same-tree/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What does it mean for two trees to be "the same"? What two aspects must be identical?
2. If you're comparing two nodes, what conditions would make them "different"?
3. How can you break this problem down using the structure of the trees themselves?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Defining Tree Equality
> **Guided Question:** For two trees to be considered "same," what conditions must be satisfied? Think about both structure and content.

<details>
<summary>💭 Think about it, then click to reveal</summary>

Two trees are the same if:
1. **Structural equality**: Both trees have the same shape (same positions for null and non-null nodes)
2. **Value equality**: All corresponding nodes have the same values

This means we need to check both the structure (where nodes exist) and the content (what values they contain) simultaneously.
</details>

#### Step 2: Base Cases for Comparison
> **Guided Question:** What are the different scenarios when comparing two nodes? Consider when one or both might be null.

<details>
<summary>💭 Think about it, then click to reveal</summary>

When comparing two nodes, we have these cases:
1. **Both null**: Trees are the same (base case: true)
2. **One null, one not**: Trees are different (base case: false)  
3. **Both not null but different values**: Trees are different (base case: false)
4. **Both not null with same values**: Need to check their children recursively

This gives us clear stopping conditions for our recursive approach.
</details>

#### Step 3: Recursive Structure
> **Guided Question:** If two nodes have the same value, what else must be true for the trees rooted at these nodes to be identical?

<details>
<summary>💭 Think about it, then click to reveal</summary>

For trees rooted at nodes with the same value to be identical:
- The left subtrees must be identical
- AND the right subtrees must be identical

This gives us: `isSameTree(p.left, q.left) && isSameTree(p.right, q.right)`

The recursive structure naturally handles all the tree traversal for us!
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Handle case where both nodes are null (return true)
- [ ] Handle case where one node is null (return false)
- [ ] Check if current node values are different (return false)
- [ ] Recursively check left subtrees AND right subtrees

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why do we use AND (&&) instead of OR (||) when combining the recursive calls?
2. **Complexity Analysis:** How many nodes do we visit in the worst case? What's the space complexity?
3. **Trade-offs:** Could we solve this iteratively using stacks/queues? What would change?
4. **Pattern Recognition:** What other tree problems use this "simultaneous traversal" pattern?

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

**Problem Statement**: Given the roots of two binary trees `p` and `q`, write a function to check if they are the same or not. Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.

**Examples:**
```
Input: p = [1,2,3], q = [1,2,3]
Output: true

Input: p = [1,2], q = [1,null,2]
Output: false

Input: p = [1,2,1], q = [1,1,2]
Output: false
```

### Knowledge Prerequisites
- Binary tree structure understanding
- Recursive problem solving
- Tree traversal techniques
- Structural comparison concepts

### First Principles
Two trees are identical if:
- **Structure matches**: Same shape and node positions
- **Values match**: Corresponding nodes have same values
- **Recursive nature**: Subtrees must also be identical

### Problem-First Approach

**Step 1: Understand the Problem**
- Compare both structure and values
- Both null trees are considered same
- One null, one non-null are different

**Step 2: Identify Key Insights**
- Use recursive comparison starting from roots
- Base cases: both null (true), one null (false)
- Recursive case: values equal AND left subtrees same AND right subtrees same

**Step 3: Algorithm Design**
1. Handle base cases (null combinations)
2. Compare current node values
3. Recursively check left and right subtrees

### Multiple Java Solutions

#### Solution 1: Recursive Approach (Optimal)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public boolean isSameTree(TreeNode p, TreeNode q) {
    // Base case: both are null
    if (p == null && q == null) {
        return true;
    }
    
    // One is null, other is not
    if (p == null || q == null) {
        return false;
    }
    
    // Both are non-null: check value and recurse
    return p.val == q.val && 
           isSameTree(p.left, q.left) && 
           isSameTree(p.right, q.right);
}
```
  </div>
  
  <div class="tab-content python">
```python
def isSameTree(self, p, q):
    # Base case: both are None
    if p is None and q is None:
        return True
    
    # One is None, other is not
    if p is None or q is None:
        return False
    
    # Both are non-None: check value and recurse
    return (p.val == q.val and 
            self.isSameTree(p.left, q.left) and 
            self.isSameTree(p.right, q.right))
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function isSameTree(p, q) {
    // Base case: both are null
    if (p === null && q === null) {
        return true;
    }
    
    // One is null, other is not
    if (p === null || q === null) {
        return false;
    }
    
    // Both are non-null: check value and recurse
    return p.val === q.val && 
           isSameTree(p.left, q.left) && 
           isSameTree(p.right, q.right);
}
```
  </div>
</div>

#### Solution 2: Iterative with Stack

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public boolean isSameTree(TreeNode p, TreeNode q) {
    Stack<TreeNode> stack = new Stack<>();
    stack.push(p);
    stack.push(q);
    
    while (!stack.isEmpty()) {
        TreeNode node1 = stack.pop();
        TreeNode node2 = stack.pop();
        
        if (node1 == null && node2 == null) continue;
        if (node1 == null || node2 == null) return false;
        if (node1.val != node2.val) return false;
        
        stack.push(node1.left);
        stack.push(node2.left);
        stack.push(node1.right);
        stack.push(node2.right);
    }
    
    return true;
}
```
  </div>
  
  <div class="tab-content python">
```python
def isSameTree(self, p, q):
    stack = [(p, q)]
    
    while stack:
        node1, node2 = stack.pop()
        
        if node1 is None and node2 is None:
            continue
        if node1 is None or node2 is None:
            return False
        if node1.val != node2.val:
            return False
        
        stack.append((node1.left, node2.left))
        stack.append((node1.right, node2.right))
    
    return True
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function isSameTree(p, q) {
    const stack = [p, q];
    
    while (stack.length > 0) {
        const node2 = stack.pop();
        const node1 = stack.pop();
        
        if (node1 === null && node2 === null) continue;
        if (node1 === null || node2 === null) return false;
        if (node1.val !== node2.val) return false;
        
        stack.push(node1.left);
        stack.push(node2.left);
        stack.push(node1.right);
        stack.push(node2.right);
    }
    
    return true;
}
```
  </div>
</div>

#### Solution 3: BFS with Queue

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
import java.util.LinkedList;
import java.util.Queue;

public boolean isSameTree(TreeNode p, TreeNode q) {
    Queue<TreeNode> queue = new LinkedList<>();
    queue.offer(p);
    queue.offer(q);
    
    while (!queue.isEmpty()) {
        TreeNode node1 = queue.poll();
        TreeNode node2 = queue.poll();
        
        if (node1 == null && node2 == null) continue;
        if (node1 == null || node2 == null) return false;
        if (node1.val != node2.val) return false;
        
        queue.offer(node1.left);
        queue.offer(node2.left);
        queue.offer(node1.right);
        queue.offer(node2.right);
    }
    
    return true;
}
```
  </div>
  
  <div class="tab-content python">
```python
from collections import deque

def isSameTree(self, p, q):
    queue = deque([(p, q)])
    
    while queue:
        node1, node2 = queue.popleft()
        
        if node1 is None and node2 is None:
            continue
        if node1 is None or node2 is None:
            return False
        if node1.val != node2.val:
            return False
        
        queue.append((node1.left, node2.left))
        queue.append((node1.right, node2.right))
    
    return True
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function isSameTree(p, q) {
    const queue = [p, q];
    
    while (queue.length > 0) {
        const node1 = queue.shift();
        const node2 = queue.shift();
        
        if (node1 === null && node2 === null) continue;
        if (node1 === null || node2 === null) return false;
        if (node1.val !== node2.val) return false;
        
        queue.push(node1.left);
        queue.push(node2.left);
        queue.push(node1.right);
        queue.push(node2.right);
    }
    
    return true;
}
```
  </div>
</div>

#### Solution 4: Serialization Approach

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public boolean isSameTree(TreeNode p, TreeNode q) {
    return serialize(p).equals(serialize(q));
}

private String serialize(TreeNode node) {
    if (node == null) return "#";
    return node.val + "," + serialize(node.left) + "," + serialize(node.right);
}
```
  </div>
  
  <div class="tab-content python">
```python
def isSameTree(self, p, q):
    return self.serialize(p) == self.serialize(q)

def serialize(self, node):
    if node is None:
        return "#"
    return str(node.val) + "," + self.serialize(node.left) + "," + self.serialize(node.right)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function isSameTree(p, q) {
    return serialize(p) === serialize(q);
}

function serialize(node) {
    if (node === null) return "#";
    return node.val + "," + serialize(node.left) + "," + serialize(node.right);
}
```
  </div>
</div>

### Complexity Analysis
- **Recursive**: Time O(min(m,n)), Space O(min(m,n)) for recursion stack
- **Iterative**: Time O(min(m,n)), Space O(min(m,n)) for stack/queue
- **Serialization**: Time O(m+n), Space O(m+n) for strings

### Key Insights & Patterns
1. **Structural Comparison**: Check both shape and values
2. **Short-Circuit Evaluation**: Return false as soon as difference found
3. **Null Handling**: Carefully handle all null combinations
4. **Symmetric Recursion**: Process both trees simultaneously

### Common Pitfalls
1. **Null Edge Cases**: Incorrect handling of null node combinations
2. **Value vs Structure**: Checking only values without structure
3. **Early Termination**: Not stopping when difference found

### Follow-up Questions
1. How would you check if trees are mirror images?
2. What if nodes could have different types of values?
3. How would you find the first differing node?

---

### 3. Invert Binary Tree

**🔗 LeetCode Link:** [Invert Binary Tree - LeetCode #226](https://leetcode.com/problems/invert-binary-tree/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What does "inverting" a tree mean visually? What happens to the left and right children?
2. If you invert a node's children, what do you need to do with the children's children?
3. At what point in your recursion should you perform the swap - before or after processing children?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding Tree Inversion
> **Guided Question:** What does it mean to "invert" a binary tree? If you draw it out, what changes about the tree's structure?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Inverting a binary tree means:
- Every left child becomes a right child
- Every right child becomes a left child
- This happens at every level of the tree

Visually, it's like looking at the tree in a mirror. The tree structure remains the same, but left and right are flipped at every node.
</details>

#### Step 2: Recursive Approach
> **Guided Question:** How can you break this problem down? If you can invert the subtrees, what's left to do at each node?

<details>
<summary>💭 Think about it, then click to reveal</summary>

The recursive approach:
1. **Base case**: If the node is null, return null (nothing to invert)
2. **Recursive case**: 
   - Invert the left subtree
   - Invert the right subtree  
   - Swap the left and right children of the current node

This ensures every subtree gets inverted, and then we fix the current level.
</details>

#### Step 3: Order of Operations
> **Guided Question:** Does it matter whether you swap first and then recurse, or recurse first and then swap? Think about what each child pointer represents.

<details>
<summary>💭 Think about it, then click to reveal</summary>

Both approaches work, but they're slightly different:

**Approach 1 - Swap first**: 
```java
temp = root.left;
root.left = invert(root.right);
root.right = invert(temp);
```

**Approach 2 - Recurse first**:
```java
left = invert(root.left);
right = invert(root.right);
root.left = right;
root.right = left;
```

The second approach is often clearer because you're explicitly saying "invert both children, then swap them."
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Handle the base case (null node returns null)
- [ ] Recursively invert the left subtree
- [ ] Recursively invert the right subtree
- [ ] Swap the left and right children of current node
- [ ] Return the current node

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why do we need to return the node after inverting? What does the return value represent?
2. **Complexity Analysis:** How many nodes do we visit? What's the space complexity due to recursion?
3. **Trade-offs:** Could you solve this iteratively using a queue or stack? How would the approach differ?
4. **Pattern Recognition:** What other tree problems involve "processing children then modifying current node"?

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

**Problem Statement**: Given the root of a binary tree, invert the tree, and return its root. Inverting means swapping the left and right children of every node.

**Examples:**
```
Input: root = [4,2,7,1,3,6,9]
Output: [4,7,2,9,6,3,1]

Input: root = [2,1,3]
Output: [2,3,1]

Input: root = []
Output: []
```

### Knowledge Prerequisites
- Binary tree structure and manipulation
- Recursive tree operations
- Reference swapping in Java
- Tree traversal patterns

### First Principles
Tree inversion involves:
- **Mirror transformation**: Left becomes right, right becomes left
- **Recursive nature**: Apply inversion to all subtrees
- **In-place operation**: Can modify original tree or create new one

### Problem-First Approach

**Step 1: Understand the Problem**
- Swap left and right children of every node
- Apply this operation recursively to entire tree
- Original tree structure is preserved but mirrored

**Step 2: Identify Key Insights**
- Simple recursive solution: swap children then recurse
- Can be done iteratively with queue or stack
- Operation affects tree structure, not values

**Step 3: Algorithm Design**
1. Handle base case (null node)
2. Swap left and right children
3. Recursively invert left and right subtrees

### Multiple Java Solutions

#### Solution 1: Recursive (Most Elegant)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public TreeNode invertTree(TreeNode root) {
    if (root == null) {
        return null;
    }
    
    // Swap left and right children
    TreeNode temp = root.left;
    root.left = root.right;
    root.right = temp;
    
    // Recursively invert subtrees
    invertTree(root.left);
    invertTree(root.right);
    
    return root;
}
```
  </div>
  
  <div class="tab-content python">
```python
def invertTree(self, root):
    if root is None:
        return None
    
    # Swap left and right children
    root.left, root.right = root.right, root.left
    
    # Recursively invert subtrees
    self.invertTree(root.left)
    self.invertTree(root.right)
    
    return root
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function invertTree(root) {
    if (root === null) {
        return null;
    }
    
    // Swap left and right children
    const temp = root.left;
    root.left = root.right;
    root.right = temp;
    
    // Recursively invert subtrees
    invertTree(root.left);
    invertTree(root.right);
    
    return root;
}
```
  </div>
</div>

#### Solution 2: Recursive with Direct Swap

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public TreeNode invertTree(TreeNode root) {
    if (root == null) {
        return null;
    }
    
    // Invert subtrees first, then swap
    TreeNode left = invertTree(root.left);
    TreeNode right = invertTree(root.right);
    
    root.left = right;
    root.right = left;
    
    return root;
}
```
  </div>
  
  <div class="tab-content python">
```python
def invertTree(self, root):
    if root is None:
        return None
    
    # Invert subtrees first, then swap
    left = self.invertTree(root.left)
    right = self.invertTree(root.right)
    
    root.left = right
    root.right = left
    
    return root
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function invertTree(root) {
    if (root === null) {
        return null;
    }
    
    // Invert subtrees first, then swap
    const left = invertTree(root.left);
    const right = invertTree(root.right);
    
    root.left = right;
    root.right = left;
    
    return root;
}
```
  </div>
</div>

#### Solution 3: Iterative with Queue (BFS)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
import java.util.LinkedList;
import java.util.Queue;

public TreeNode invertTree(TreeNode root) {
    if (root == null) return null;
    
    Queue<TreeNode> queue = new LinkedList<>();
    queue.offer(root);
    
    while (!queue.isEmpty()) {
        TreeNode node = queue.poll();
        
        // Swap children
        TreeNode temp = node.left;
        node.left = node.right;
        node.right = temp;
        
        // Add children to queue
        if (node.left != null) queue.offer(node.left);
        if (node.right != null) queue.offer(node.right);
    }
    
    return root;
}
```
  </div>
  
  <div class="tab-content python">
```python
from collections import deque

def invertTree(self, root):
    if root is None:
        return None
    
    queue = deque([root])
    
    while queue:
        node = queue.popleft()
        
        # Swap children
        node.left, node.right = node.right, node.left
        
        # Add children to queue
        if node.left:
            queue.append(node.left)
        if node.right:
            queue.append(node.right)
    
    return root
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function invertTree(root) {
    if (root === null) return null;
    
    const queue = [root];
    
    while (queue.length > 0) {
        const node = queue.shift();
        
        // Swap children
        const temp = node.left;
        node.left = node.right;
        node.right = temp;
        
        // Add children to queue
        if (node.left !== null) queue.push(node.left);
        if (node.right !== null) queue.push(node.right);
    }
    
    return root;
}
```
  </div>
</div>

#### Solution 4: Iterative with Stack (DFS)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public TreeNode invertTree(TreeNode root) {
    if (root == null) return null;
    
    Stack<TreeNode> stack = new Stack<>();
    stack.push(root);
    
    while (!stack.isEmpty()) {
        TreeNode node = stack.pop();
        
        // Swap children
        TreeNode temp = node.left;
        node.left = node.right;
        node.right = temp;
        
        // Add children to stack
        if (node.left != null) stack.push(node.left);
        if (node.right != null) stack.push(node.right);
    }
    
    return root;
}
```
  </div>
  
  <div class="tab-content python">
```python
def invertTree(self, root):
    if root is None:
        return None
    
    stack = [root]
    
    while stack:
        node = stack.pop()
        
        # Swap children
        node.left, node.right = node.right, node.left
        
        # Add children to stack
        if node.left:
            stack.append(node.left)
        if node.right:
            stack.append(node.right)
    
    return root
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function invertTree(root) {
    if (root === null) return null;
    
    const stack = [root];
    
    while (stack.length > 0) {
        const node = stack.pop();
        
        // Swap children
        const temp = node.left;
        node.left = node.right;
        node.right = temp;
        
        // Add children to stack
        if (node.left !== null) stack.push(node.left);
        if (node.right !== null) stack.push(node.right);
    }
    
    return root;
}
```
  </div>
</div>

### Complexity Analysis
- **Time Complexity**: O(n) - visit each node once
- **Space Complexity**: 
  - Recursive: O(h) where h is height
  - Iterative: O(w) where w is maximum width

### Key Insights & Patterns
1. **Simple Transformation**: Just swap children at each node
2. **Multiple Approaches**: Can use any traversal method
3. **In-place Operation**: No extra tree structure needed
4. **Order Independence**: Can swap before or after recursion

### Common Pitfalls
1. **Forgetting Base Case**: Not handling null nodes
2. **Double Swapping**: Applying inversion multiple times
3. **Reference Issues**: Losing node references during swap

### Follow-up Questions
1. How would you check if a tree is symmetric?
2. Can you invert only a subtree?
3. How would you invert a tree with parent pointers?

---

### 4. Binary Tree Maximum Path Sum

**🔗 LeetCode Link:** [Binary Tree Maximum Path Sum - LeetCode #124](https://leetcode.com/problems/binary-tree-maximum-path-sum/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What constitutes a "path" in a tree? Can it go through any node, or must it start from the root?
2. If a subtree has all negative values, should you include it in your path or ignore it?
3. At each node, you have a choice: contribute to a path through your parent, or start a new path here. How might these choices differ?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding Path Definition
> **Guided Question:** What kinds of paths are possible in a tree? Think about a node as a potential "junction" - what connections can it make?

<details>
<summary>💭 Think about it, then click to reveal</summary>

At any node, a path can:
1. **Go straight through**: from left subtree → current node → right subtree
2. **End here**: from left or right subtree → current node (no further)
3. **Start here**: current node → left or right subtree (or just the node itself)

The key insight: a node can be part of many potential paths, but we're looking for the maximum sum among all possible paths in the tree.
</details>

#### Step 2: Local vs Global Decision
> **Guided Question:** At each node, you need to make two different decisions. What do you need to track, and what do you need to return?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Two decisions at each node:
1. **Global decision**: What's the maximum path sum that includes this node as the "peak" (goes through both children)?
2. **Local decision**: What's the maximum path sum starting from this node that can be extended upward to the parent?

We track the global maximum across all nodes (answer to return), but we return the local maximum (to help parent make its decision).
</details>

#### Step 3: Handling Negative Values
> **Guided Question:** If a subtree's maximum path sum is negative, how should that influence your decision? When would you include it vs exclude it?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Key insight about negative values:
- **For the global path** (through current node): We can choose to include negative subtrees if the overall sum is still maximum
- **For the local path** (to parent): We should never return a negative sum - it's better to return 0 (meaning "don't include this subtree")

This is why we use `Math.max(0, leftGain)` - we only contribute to parent if we add positive value.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Set up a global variable to track maximum path sum
- [ ] Write helper function that returns max gain from a node
- [ ] Handle base case (null node returns 0)
- [ ] Calculate left and right gains (with 0 minimum)
- [ ] Update global maximum with path through current node
- [ ] Return maximum gain from current node going upward

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why do we use `Math.max(0, childGain)` instead of just `childGain`?
2. **Complexity Analysis:** How many times is each node visited? What's the space complexity?
3. **Trade-offs:** Why can't we solve this with a simple tree traversal without the global variable?
4. **Pattern Recognition:** What other tree problems require tracking both local and global optimums?

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

**Problem Statement**: A path in a binary tree is a sequence of nodes where each pair of adjacent nodes in the sequence has an edge connecting them. A node can only appear in the sequence at most once. The path does not need to pass through the root. The path sum is the sum of the node's values in the path. Given the root of a binary tree, return the maximum path sum of any non-empty path.

**Examples:**
```
Input: root = [1,2,3]
Output: 6
Explanation: The optimal path is 2 -> 1 -> 3 with a path sum of 2 + 1 + 3 = 6.

Input: root = [-10,9,20,null,null,15,7]
Output: 42
Explanation: The optimal path is 15 -> 20 -> 7 with a path sum of 15 + 20 + 7 = 42.
```

### Knowledge Prerequisites
- Tree traversal and recursion
- Understanding of path concepts in trees
- Global vs local optimization problems
- Handling negative values in optimization

### First Principles
Maximum path sum involves:
- **Path definition**: Sequence of connected nodes (no cycles)
- **Two types of paths**: Paths through current node vs paths in subtrees
- **Decision making**: Whether to include negative subtree paths
- **Global tracking**: Maximum seen so far vs current contribution

### Problem-First Approach

**Step 1: Understand the Problem**
- Find maximum sum path anywhere in the tree
- Path doesn't need to go through root
- Can start and end at any nodes
- Handle negative node values appropriately

**Step 2: Key Insights**
- At each node, consider two types of paths:
  1. Path passing through this node (connecting left and right)
  2. Path in left or right subtree only
- Need to track global maximum separately from return value
- Return value: maximum gain from this subtree to parent

**Step 3: Algorithm Design**
1. Use recursive helper that returns max gain from subtree
2. At each node, calculate path through current node
3. Update global maximum
4. Return max gain that can contribute to parent

### Multiple Java Solutions

#### Solution 1: Recursive with Global Variable (Optimal)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
class Solution {
    private int maxSum = Integer.MIN_VALUE;
    
    public int maxPathSum(TreeNode root) {
        maxGain(root);
        return maxSum;
    }
    
    private int maxGain(TreeNode node) {
        if (node == null) return 0;
        
        // Get maximum gain from left and right subtrees
        // Only take positive gains (ignore negative paths)
        int leftGain = Math.max(maxGain(node.left), 0);
        int rightGain = Math.max(maxGain(node.right), 0);
        
        // Calculate path sum through current node
        int pathThroughNode = node.val + leftGain + rightGain;
        
        // Update global maximum
        maxSum = Math.max(maxSum, pathThroughNode);
        
        // Return max gain that can be contributed to parent
        return node.val + Math.max(leftGain, rightGain);
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
class Solution:
    def maxPathSum(self, root):
        self.max_sum = float('-inf')
        self.max_gain(root)
        return self.max_sum
    
    def max_gain(self, node):
        if node is None:
            return 0
        
        # Get maximum gain from left and right subtrees
        # Only take positive gains (ignore negative paths)
        left_gain = max(self.max_gain(node.left), 0)
        right_gain = max(self.max_gain(node.right), 0)
        
        # Calculate path sum through current node
        path_through_node = node.val + left_gain + right_gain
        
        # Update global maximum
        self.max_sum = max(self.max_sum, path_through_node)
        
        # Return max gain that can be contributed to parent
        return node.val + max(left_gain, right_gain)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
class Solution {
    constructor() {
        this.maxSum = -Infinity;
    }
    
    maxPathSum(root) {
        this.maxGain(root);
        return this.maxSum;
    }
    
    maxGain(node) {
        if (node === null) return 0;
        
        // Get maximum gain from left and right subtrees
        // Only take positive gains (ignore negative paths)
        const leftGain = Math.max(this.maxGain(node.left), 0);
        const rightGain = Math.max(this.maxGain(node.right), 0);
        
        // Calculate path sum through current node
        const pathThroughNode = node.val + leftGain + rightGain;
        
        // Update global maximum
        this.maxSum = Math.max(this.maxSum, pathThroughNode);
        
        // Return max gain that can be contributed to parent
        return node.val + Math.max(leftGain, rightGain);
    }
}
```
  </div>
</div>

#### Solution 2: Using Array to Avoid Global Variable

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public int maxPathSum(TreeNode root) {
    int[] maxSum = {Integer.MIN_VALUE};
    maxGain(root, maxSum);
    return maxSum[0];
}

private int maxGain(TreeNode node, int[] maxSum) {
    if (node == null) return 0;
    
    int leftGain = Math.max(maxGain(node.left, maxSum), 0);
    int rightGain = Math.max(maxGain(node.right, maxSum), 0);
    
    // Path through current node
    int currentMax = node.val + leftGain + rightGain;
    maxSum[0] = Math.max(maxSum[0], currentMax);
    
    // Return contribution to parent
    return node.val + Math.max(leftGain, rightGain);
}
```
  </div>
  
  <div class="tab-content python">
```python
def maxPathSum(self, root):
    max_sum = [float('-inf')]
    self.max_gain(root, max_sum)
    return max_sum[0]

def max_gain(self, node, max_sum):
    if node is None:
        return 0
    
    left_gain = max(self.max_gain(node.left, max_sum), 0)
    right_gain = max(self.max_gain(node.right, max_sum), 0)
    
    # Path through current node
    current_max = node.val + left_gain + right_gain
    max_sum[0] = max(max_sum[0], current_max)
    
    # Return contribution to parent
    return node.val + max(left_gain, right_gain)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function maxPathSum(root) {
    const maxSum = [-Infinity];
    maxGain(root, maxSum);
    return maxSum[0];
}

function maxGain(node, maxSum) {
    if (node === null) return 0;
    
    const leftGain = Math.max(maxGain(node.left, maxSum), 0);
    const rightGain = Math.max(maxGain(node.right, maxSum), 0);
    
    // Path through current node
    const currentMax = node.val + leftGain + rightGain;
    maxSum[0] = Math.max(maxSum[0], currentMax);
    
    // Return contribution to parent
    return node.val + Math.max(leftGain, rightGain);
}
```
  </div>
</div>

#### Solution 3: Bottom-Up with Result Class

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
class Result {
    int maxPath;    // Maximum path sum in subtree
    int maxGain;    // Maximum gain that can contribute to parent
    
    Result(int maxPath, int maxGain) {
        this.maxPath = maxPath;
        this.maxGain = maxGain;
    }
}

public int maxPathSum(TreeNode root) {
    return helper(root).maxPath;
}

private Result helper(TreeNode node) {
    if (node == null) {
        return new Result(Integer.MIN_VALUE, 0);
    }
    
    Result left = helper(node.left);
    Result right = helper(node.right);
    
    // Maximum gain from left and right (at least 0)
    int leftGain = Math.max(left.maxGain, 0);
    int rightGain = Math.max(right.maxGain, 0);
    
    // Path through current node
    int pathThroughNode = node.val + leftGain + rightGain;
    
    // Maximum path in current subtree
    int maxPath = Math.max(pathThroughNode, 
                          Math.max(left.maxPath, right.maxPath));
    
    // Maximum gain that can contribute to parent
    int maxGain = node.val + Math.max(leftGain, rightGain);
    
    return new Result(maxPath, maxGain);
}
```
  </div>
  
  <div class="tab-content python">
```python
class Result:
    def __init__(self, max_path, max_gain):
        self.max_path = max_path    # Maximum path sum in subtree
        self.max_gain = max_gain    # Maximum gain that can contribute to parent

def maxPathSum(self, root):
    return self.helper(root).max_path

def helper(self, node):
    if node is None:
        return Result(float('-inf'), 0)
    
    left = self.helper(node.left)
    right = self.helper(node.right)
    
    # Maximum gain from left and right (at least 0)
    left_gain = max(left.max_gain, 0)
    right_gain = max(right.max_gain, 0)
    
    # Path through current node
    path_through_node = node.val + left_gain + right_gain
    
    # Maximum path in current subtree
    max_path = max(path_through_node, max(left.max_path, right.max_path))
    
    # Maximum gain that can contribute to parent
    max_gain = node.val + max(left_gain, right_gain)
    
    return Result(max_path, max_gain)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
class Result {
    constructor(maxPath, maxGain) {
        this.maxPath = maxPath;    // Maximum path sum in subtree
        this.maxGain = maxGain;    // Maximum gain that can contribute to parent
    }
}

function maxPathSum(root) {
    return helper(root).maxPath;
}

function helper(node) {
    if (node === null) {
        return new Result(-Infinity, 0);
    }
    
    const left = helper(node.left);
    const right = helper(node.right);
    
    // Maximum gain from left and right (at least 0)
    const leftGain = Math.max(left.maxGain, 0);
    const rightGain = Math.max(right.maxGain, 0);
    
    // Path through current node
    const pathThroughNode = node.val + leftGain + rightGain;
    
    // Maximum path in current subtree
    const maxPath = Math.max(pathThroughNode, 
                            Math.max(left.maxPath, right.maxPath));
    
    // Maximum gain that can contribute to parent
    const maxGain = node.val + Math.max(leftGain, rightGain);
    
    return new Result(maxPath, maxGain);
}
```
  </div>
</div>

### Complexity Analysis
- **Time Complexity**: O(n) - visit each node once
- **Space Complexity**: O(h) where h is height of tree (recursion stack)

### Key Insights & Patterns
1. **Two Different Values**: Track global max vs contribution to parent
2. **Positive Gains Only**: Ignore negative subtree contributions
3. **Path Through Node**: Connect left and right subtrees through current node
4. **Global State**: Need to maintain maximum seen across all recursive calls

### Common Pitfalls
1. **Confusing Return Value**: Mixing up global max with contribution to parent
2. **Negative Handling**: Not properly ignoring negative path contributions
3. **Single Node**: Forgetting that single node is a valid path
4. **Integer Overflow**: Not handling edge cases with extreme values

### Follow-up Questions
1. How would you find the actual path, not just the sum?
2. What if you needed the k longest paths?
3. How would you modify for a tree where each edge has a weight?

---

### 5. Binary Tree Level Order Traversal

**🔗 LeetCode Link:** [Binary Tree Level Order Traversal - LeetCode #102](https://leetcode.com/problems/binary-tree-level-order-traversal/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What's the difference between visiting nodes level by level vs depth-first? Which would be more natural for this problem?
2. If you're processing level 2, how do you know where level 3 begins? How can you keep levels separate?
3. What data structure naturally processes things in the order they were added?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Level-by-Level vs Depth-First
> **Guided Question:** How is level order traversal fundamentally different from the recursive tree problems we've seen? What does the visiting order tell us about the algorithm type?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Level order traversal is fundamentally a **Breadth-First Search (BFS)** problem:
- We visit all nodes at depth 0, then all at depth 1, then depth 2, etc.
- This is opposite to DFS (Depth-First Search) where we go deep first
- BFS naturally suggests using a **queue** - we process nodes in the order we discover them

The key insight: this is a BFS problem, not a recursive DFS problem.
</details>

#### Step 2: Separating Levels
> **Guided Question:** If you're using a queue to process nodes level by level, how do you know when one level ends and the next begins?

<details>
<summary>💭 Think about it, then click to reveal</summary>

The trick is to process the queue **level by level**:
1. Check how many nodes are currently in the queue (this is the current level size)
2. Process exactly that many nodes, adding their children to the queue
3. All nodes processed in this iteration belong to the same level
4. After processing, the queue contains exactly the next level

This size-based approach naturally separates levels without needing special markers.
</details>

#### Step 3: Building the Result Structure
> **Guided Question:** The result should be a list of lists - each inner list represents one level. How do you construct this while traversing?

<details>
<summary>💭 Think about it, then click to reveal</summary>

For each level:
1. Create a new list for the current level
2. Process all nodes in the current level (based on queue size)
3. Add each node's value to the current level list
4. Add each node's children to the queue for the next level
5. Add the completed level list to the result

This builds the result incrementally, one level at a time.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Initialize queue with root node (if not null)
- [ ] Create result list to store all levels
- [ ] While queue is not empty: get current level size
- [ ] Create list for current level values
- [ ] Process exactly 'size' nodes: poll from queue, add value to level list
- [ ] For each node polled: add its children to queue
- [ ] Add completed level list to result

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why do we need to capture the queue size at the beginning of each level iteration?
2. **Complexity Analysis:** What's the time complexity? How much extra space do we use beyond the result?
3. **Trade-offs:** Could you solve this with DFS recursion? What would be the advantages and disadvantages?
4. **Pattern Recognition:** What other tree problems require level-by-level processing?

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

**Problem Statement**: Given the root of a binary tree, return the level order traversal of its nodes' values (i.e., from left to right, level by level).

**Examples:**
```
Input: root = [3,9,20,null,null,15,7]
Output: [[3],[9,20],[15,7]]

Input: root = [1]
Output: [[1]]

Input: root = []
Output: []
```

### Knowledge Prerequisites
- Queue data structure and BFS algorithm
- Tree traversal techniques
- Level-by-level processing concepts
- Java Collections framework

### First Principles
Level order traversal means:
- **BFS approach**: Process nodes level by level from left to right
- **Queue usage**: FIFO structure naturally handles level ordering
- **Level separation**: Group nodes by their depth in the tree

### Problem-First Approach

**Step 1: Understand the Problem**
- Traverse tree level by level from top to bottom
- Within each level, process from left to right
- Return list of lists (each inner list represents one level)

**Step 2: Key Insights**
- Use BFS with queue for natural level-order processing
- Track level boundaries to separate levels in result
- Can use queue size to process one level at a time

**Step 3: Algorithm Design**
1. Use queue to store nodes to be processed
2. For each level, process all nodes currently in queue
3. Add children of current level to queue for next level
4. Collect nodes of each level into separate lists

### Multiple Java Solutions

#### Solution 1: BFS with Level Size Tracking (Optimal)
```java
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public List<List<Integer>> levelOrder(TreeNode root) {
    List<List<Integer>> result = new ArrayList<>();
    if (root == null) return result;
    
    Queue<TreeNode> queue = new LinkedList<>();
    queue.offer(root);
    
    while (!queue.isEmpty()) {
        int levelSize = queue.size();
        List<Integer> currentLevel = new ArrayList<>();
        
        // Process all nodes at current level
        for (int i = 0; i < levelSize; i++) {
            TreeNode node = queue.poll();
            currentLevel.add(node.val);
            
            // Add children for next level
            if (node.left != null) queue.offer(node.left);
            if (node.right != null) queue.offer(node.right);
        }
        
        result.add(currentLevel);
    }
    
    return result;
}
```

#### Solution 2: BFS with Null Delimiter
```java
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public List<List<Integer>> levelOrder(TreeNode root) {
    List<List<Integer>> result = new ArrayList<>();
    if (root == null) return result;
    
    Queue<TreeNode> queue = new LinkedList<>();
    queue.offer(root);
    queue.offer(null); // Level delimiter
    
    List<Integer> currentLevel = new ArrayList<>();
    
    while (!queue.isEmpty()) {
        TreeNode node = queue.poll();
        
        if (node == null) {
            // End of current level
            result.add(new ArrayList<>(currentLevel));
            currentLevel.clear();
            
            if (!queue.isEmpty()) {
                queue.offer(null); // Add delimiter for next level
            }
        } else {
            currentLevel.add(node.val);
            
            if (node.left != null) queue.offer(node.left);
            if (node.right != null) queue.offer(node.right);
        }
    }
    
    return result;
}
```

#### Solution 3: Recursive DFS with Level Tracking
```java
import java.util.ArrayList;
import java.util.List;

public List<List<Integer>> levelOrder(TreeNode root) {
    List<List<Integer>> result = new ArrayList<>();
    dfs(root, 0, result);
    return result;
}

private void dfs(TreeNode node, int level, List<List<Integer>> result) {
    if (node == null) return;
    
    // Create new level if needed
    if (level >= result.size()) {
        result.add(new ArrayList<>());
    }
    
    // Add current node to its level
    result.get(level).add(node.val);
    
    // Recurse to children
    dfs(node.left, level + 1, result);
    dfs(node.right, level + 1, result);
}
```

#### Solution 4: Two Queue Approach
```java
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

public List<List<Integer>> levelOrder(TreeNode root) {
    List<List<Integer>> result = new ArrayList<>();
    if (root == null) return result;
    
    Queue<TreeNode> currentLevel = new LinkedList<>();
    Queue<TreeNode> nextLevel = new LinkedList<>();
    
    currentLevel.offer(root);
    
    while (!currentLevel.isEmpty()) {
        List<Integer> levelValues = new ArrayList<>();
        
        while (!currentLevel.isEmpty()) {
            TreeNode node = currentLevel.poll();
            levelValues.add(node.val);
            
            if (node.left != null) nextLevel.offer(node.left);
            if (node.right != null) nextLevel.offer(node.right);
        }
        
        result.add(levelValues);
        
        // Swap queues
        Queue<TreeNode> temp = currentLevel;
        currentLevel = nextLevel;
        nextLevel = temp;
    }
    
    return result;
}
```

### Complexity Analysis
- **Time Complexity**: O(n) - visit each node once
- **Space Complexity**: O(w) where w is maximum width of tree (queue space)

### Key Insights & Patterns
1. **BFS for Level Order**: Natural fit for level-by-level processing
2. **Level Boundaries**: Track when one level ends and next begins
3. **Queue Size Trick**: Use queue.size() at start of each level
4. **Alternative Approaches**: DFS can also work with level parameter

### Common Pitfalls
1. **Level Separation**: Incorrectly grouping nodes from different levels
2. **Empty Tree**: Not handling null root case
3. **Queue Operations**: Mixing up offer/poll operations
4. **Level Initialization**: Creating new lists for each level

### Follow-up Questions
1. How would you do bottom-up level order traversal?
2. What if you needed to traverse right to left within each level?
3. How would you find the average value of each level?

---

### 6. Serialize and Deserialize Binary Tree

**🔗 LeetCode Link:** [Serialize and Deserialize Binary Tree - LeetCode #297](https://leetcode.com/problems/serialize-and-deserialize-binary-tree/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. To reconstruct a tree perfectly, what information must be preserved in the string representation?
2. How would you represent null/missing nodes in a string? Why is this representation crucial?
3. If you're building the tree back from a string, in what order should you process the values?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: What Information Must Be Preserved?
> **Guided Question:** For a tree to be perfectly reconstructed, what aspects of its structure and content must be captured in the serialized string?

<details>
<summary>💭 Think about it, then click to reveal</summary>

To reconstruct a tree, we need:
1. **All node values** (including their exact positions)
2. **Null positions** (where nodes are missing)
3. **Structural relationships** (parent-child connections)

The key insight: we can't just store values - we must store the complete structure, including where "holes" exist in the tree.
</details>

#### Step 2: Traversal Order and Null Handling
> **Guided Question:** What traversal order would allow you to reconstruct the tree in the same order you serialized it? How do you handle null nodes?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Pre-order traversal** is ideal because:
- We process the root first, then left subtree, then right subtree
- This matches how we'd reconstruct: create root, build left subtree, build right subtree
- We can use a special marker (like "null" or "#") for null nodes

Example: Tree [1,2,3,null,null,4,5] becomes "1,2,null,null,3,4,null,null,5,null,null"
</details>

#### Step 3: Reconstruction Strategy
> **Guided Question:** During deserialization, how do you know when to stop building the left subtree and start building the right subtree?

<details>
<summary>💭 Think about it, then click to reveal</summary>

The pre-order approach naturally handles this:
1. **Read next value**: If it's null, return null (base case)
2. **Create node**: If it's a value, create the node
3. **Recursive construction**: Set `node.left = deserialize()`, then `node.right = deserialize()`

The recursion automatically handles the boundaries - when the left subtree is complete, the next calls will build the right subtree.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] **Serialize**: Use pre-order traversal, append values and "null" markers to string
- [ ] **Serialize**: Handle null nodes explicitly with a special marker
- [ ] **Deserialize**: Split string and use an index/iterator to track position
- [ ] **Deserialize**: Handle null markers by returning null immediately
- [ ] **Deserialize**: For non-null values: create node, recursively build left and right

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why is pre-order traversal particularly well-suited for this problem compared to in-order or post-order?
2. **Complexity Analysis:** What's the time and space complexity for both serialize and deserialize operations?
3. **Trade-offs:** Could you use level-order traversal instead? What would be the pros and cons?
4. **Pattern Recognition:** What other problems require converting between tree structures and linear representations?

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

**Problem Statement**: Design an algorithm to serialize and deserialize a binary tree. Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored or transmitted and reconstructed later. Deserialization is the reverse process.

**Examples:**
```
Input: root = [1,2,3,null,null,4,5]
Output: [1,2,3,null,null,4,5]
```

### Knowledge Prerequisites
- String manipulation and parsing
- Tree construction algorithms
- Queue/Stack data structures
- Understanding of tree traversals (preorder, postorder, level-order)

### First Principles
Serialization requires:
- **Complete information**: Must capture both structure and values
- **Unambiguous encoding**: Deserialize to exact same tree
- **Handle nulls**: Represent missing nodes clearly
- **Efficient parsing**: Easy to reconstruct during deserialization

### Problem-First Approach

**Step 1: Understand the Problem**
- Convert tree to string representation
- Convert string back to identical tree
- Must handle all possible tree structures including nulls

**Step 2: Key Insights**
- Multiple approaches: preorder, postorder, level-order
- Need delimiter for separating values
- Need special marker for null nodes
- Preorder traversal makes reconstruction easier

**Step 3: Algorithm Design**
1. Serialize: Choose traversal method and convert to string
2. Use delimiter to separate values
3. Use special marker for null nodes
4. Deserialize: Parse string and reconstruct tree

### Multiple Java Solutions

#### Solution 1: Preorder Traversal (Optimal)
```java
import java.util.Arrays;
import java.util.LinkedList;
import java.util.Queue;

public class Codec {
    private static final String NULL_MARKER = "#";
    private static final String DELIMITER = ",";
    
    // Encodes a tree to a single string.
    public String serialize(TreeNode root) {
        StringBuilder sb = new StringBuilder();
        serializeHelper(root, sb);
        return sb.toString();
    }
    
    private void serializeHelper(TreeNode node, StringBuilder sb) {
        if (node == null) {
            sb.append(NULL_MARKER).append(DELIMITER);
            return;
        }
        
        sb.append(node.val).append(DELIMITER);
        serializeHelper(node.left, sb);
        serializeHelper(node.right, sb);
    }
    
    // Decodes your encoded data to tree.
    public TreeNode deserialize(String data) {
        Queue<String> queue = new LinkedList<>(Arrays.asList(data.split(DELIMITER)));
        return deserializeHelper(queue);
    }
    
    private TreeNode deserializeHelper(Queue<String> queue) {
        String val = queue.poll();
        
        if (NULL_MARKER.equals(val)) {
            return null;
        }
        
        TreeNode node = new TreeNode(Integer.parseInt(val));
        node.left = deserializeHelper(queue);
        node.right = deserializeHelper(queue);
        
        return node;
    }
}
```

#### Solution 2: Level Order Traversal
```java
import java.util.LinkedList;
import java.util.Queue;

public class Codec {
    public String serialize(TreeNode root) {
        if (root == null) return "";
        
        StringBuilder sb = new StringBuilder();
        Queue<TreeNode> queue = new LinkedList<>();
        queue.offer(root);
        
        while (!queue.isEmpty()) {
            TreeNode node = queue.poll();
            
            if (node == null) {
                sb.append("#,");
            } else {
                sb.append(node.val).append(",");
                queue.offer(node.left);
                queue.offer(node.right);
            }
        }
        
        return sb.toString();
    }
    
    public TreeNode deserialize(String data) {
        if (data.isEmpty()) return null;
        
        String[] vals = data.split(",");
        TreeNode root = new TreeNode(Integer.parseInt(vals[0]));
        Queue<TreeNode> queue = new LinkedList<>();
        queue.offer(root);
        
        int i = 1;
        while (!queue.isEmpty() && i < vals.length) {
            TreeNode node = queue.poll();
            
            // Process left child
            if (!"#".equals(vals[i])) {
                node.left = new TreeNode(Integer.parseInt(vals[i]));
                queue.offer(node.left);
            }
            i++;
            
            // Process right child
            if (i < vals.length && !"#".equals(vals[i])) {
                node.right = new TreeNode(Integer.parseInt(vals[i]));
                queue.offer(node.right);
            }
            i++;
        }
        
        return root;
    }
}
```

#### Solution 3: Postorder Traversal
```java
public class Codec {
    public String serialize(TreeNode root) {
        StringBuilder sb = new StringBuilder();
        serializePost(root, sb);
        return sb.toString();
    }
    
    private void serializePost(TreeNode node, StringBuilder sb) {
        if (node == null) {
            sb.append("#,");
            return;
        }
        
        serializePost(node.left, sb);
        serializePost(node.right, sb);
        sb.append(node.val).append(",");
    }
    
    public TreeNode deserialize(String data) {
        Stack<String> stack = new Stack<>();
        for (String s : data.split(",")) {
            stack.push(s);
        }
        return deserializePost(stack);
    }
    
    private TreeNode deserializePost(Stack<String> stack) {
        String val = stack.pop();
        if ("#".equals(val)) {
            return null;
        }
        
        TreeNode node = new TreeNode(Integer.parseInt(val));
        node.right = deserializePost(stack);  // Note: right first for postorder
        node.left = deserializePost(stack);
        
        return node;
    }
}
```

#### Solution 4: Compact Encoding with Parent Pointers
```java
public class Codec {
    public String serialize(TreeNode root) {
        List<String> result = new ArrayList<>();
        serializeHelper(root, result);
        return String.join(",", result);
    }
    
    private void serializeHelper(TreeNode node, List<String> result) {
        if (node == null) {
            result.add("#");
            return;
        }
        
        result.add(String.valueOf(node.val));
        serializeHelper(node.left, result);
        serializeHelper(node.right, result);
    }
    
    public TreeNode deserialize(String data) {
        if (data.isEmpty()) return null;
        
        Iterator<String> iter = Arrays.asList(data.split(",")).iterator();
        return deserializeHelper(iter);
    }
    
    private TreeNode deserializeHelper(Iterator<String> iter) {
        String val = iter.next();
        if ("#".equals(val)) return null;
        
        TreeNode node = new TreeNode(Integer.parseInt(val));
        node.left = deserializeHelper(iter);
        node.right = deserializeHelper(iter);
        
        return node;
    }
}
```

### Complexity Analysis
- **Time Complexity**: O(n) for both serialize and deserialize
- **Space Complexity**: O(n) for storing the serialized string and recursion stack

### Key Insights & Patterns
1. **Traversal Choice**: Preorder is most intuitive for reconstruction
2. **Null Handling**: Must explicitly represent null nodes
3. **Delimiter Usage**: Clear separation between values
4. **Reconstruction Order**: Match serialization order during deserialization

### Common Pitfalls
1. **Null Representation**: Forgetting to handle null nodes
2. **Delimiter Issues**: Values containing delimiter characters
3. **Parsing Errors**: Incorrect string splitting or parsing
4. **Index Management**: Off-by-one errors in level-order approach

### Follow-up Questions
1. How would you handle very large trees that don't fit in memory?
2. What if node values could be any strings?
3. How would you minimize the serialized string size?
4. How would you handle serialization across different languages?

---

### 7. Subtree of Another Tree

**🔗 LeetCode Link:** [Subtree of Another Tree - LeetCode #572](https://leetcode.com/problems/subtree-of-another-tree/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What's the difference between a "subtree" and just any subset of nodes? Must a subtree be complete?
2. If you're looking for a subtree match, where in the main tree could the matching potentially start?
3. How can you break this into two separate problems: finding potential starting points and verifying matches?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding Subtree Definition
> **Guided Question:** What exactly is a "subtree"? If the subRoot has 3 nodes, must the matching portion in root also have exactly 3 nodes in the same structure?

<details>
<summary>💭 Think about it, then click to reveal</summary>

A subtree must be **structurally identical**:
- It includes a node and ALL of its descendants  
- The structure must match exactly (same null positions)
- All values must match exactly

This means we can't just find matching values - we need to find a node where the entire subtree rooted at that node matches the target subtree completely.
</details>

#### Step 2: Two-Level Problem Decomposition
> **Guided Question:** How can you break this problem into two simpler problems? Think about what needs to happen at each node of the main tree.

<details>
<summary>💭 Think about it, then click to reveal</summary>

This breaks into two problems:
1. **Tree traversal**: Visit every node in the main tree as a potential subtree root
2. **Tree comparison**: At each node, check if the subtree rooted there matches the target

We already know how to do tree comparison (similar to "Same Tree" problem). We just need to apply it at every possible starting position.
</details>

#### Step 3: Recursive Structure
> **Guided Question:** At each node in the main tree, what are the different ways the subtree could be found? Consider current node vs children.

<details>
<summary>💭 Think about it, then click to reveal</summary>

At each node in the main tree, the subtree could be:
1. **Rooted at this node**: The subtree starting here matches the target
2. **In the left subtree**: The target subtree exists somewhere in the left child's subtree
3. **In the right subtree**: The target subtree exists somewhere in the right child's subtree

This gives us: `isSubtree(root, subRoot) = isSameTree(root, subRoot) || isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot)`
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Write helper function to check if two trees are identical (isSameTree)
- [ ] In isSameTree: handle null cases (both null = true, one null = false)
- [ ] In isSameTree: check value equality and recurse on children
- [ ] Write main function to check if subRoot is subtree of root
- [ ] Check: is subRoot same as current tree OR in left subtree OR in right subtree
- [ ] Handle base case: if root is null but subRoot is not, return false

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why do we use OR (||) to combine the three checks instead of AND (&&)?
2. **Complexity Analysis:** What's the worst-case time complexity? How many tree comparisons might we perform?
3. **Trade-offs:** Could you solve this more efficiently using string serialization? What would be the trade-offs?
4. **Pattern Recognition:** What other problems require checking a condition at every node in a tree?

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

**Problem Statement**: Given the roots of two binary trees `root` and `subRoot`, return `true` if there is a subtree of `root` with the same structure and node values of `subRoot` and `false` otherwise.

**Examples:**
```
Input: root = [3,4,5,1,2], subRoot = [4,1,2]
Output: true

Input: root = [3,4,5,1,2,null,null,null,null,0], subRoot = [4,1,2]
Output: false
```

### Knowledge Prerequisites
- Tree traversal algorithms
- Tree comparison techniques
- Understanding of subtree vs substring concepts
- Recursive problem decomposition

### First Principles
Subtree checking involves:
- **Identical structure**: Same shape and values starting from some node
- **Complete match**: Entire subRoot must match, not just partial
- **Multiple candidates**: Any node in root could be the start of matching subtree

### Problem-First Approach

**Step 1: Understand the Problem**
- Find if subRoot appears as complete subtree in root
- Must match structure and all values exactly
- Subtree means entire subRoot, not just partial match

**Step 2: Key Insights**
- For each node in root, check if subtree starting there matches subRoot
- Reuse "Same Tree" logic for comparison
- Need to traverse entire root tree to find all candidates

**Step 3: Algorithm Design**
1. Traverse root tree
2. At each node, check if subtree matches subRoot
3. Use helper function to compare two trees for exact match

### Multiple Java Solutions

#### Solution 1: Recursive Traversal with Tree Comparison (Optimal)
```java
public boolean isSubtree(TreeNode root, TreeNode subRoot) {
    if (root == null) return false;
    
    // Check if current tree matches subRoot
    if (isSameTree(root, subRoot)) {
        return true;
    }
    
    // Check left and right subtrees
    return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot);
}

private boolean isSameTree(TreeNode p, TreeNode q) {
    if (p == null && q == null) return true;
    if (p == null || q == null) return false;
    
    return p.val == q.val && 
           isSameTree(p.left, q.left) && 
           isSameTree(p.right, q.right);
}
```

#### Solution 2: Serialization Approach
```java
public boolean isSubtree(TreeNode root, TreeNode subRoot) {
    String rootStr = serialize(root);
    String subStr = serialize(subRoot);
    
    return rootStr.contains(subStr);
}

private String serialize(TreeNode node) {
    if (node == null) return "#";
    
    // Use unique delimiters to avoid false matches
    return "^" + node.val + "#" + 
           serialize(node.left) + serialize(node.right);
}
```

#### Solution 3: Preorder Traversal with String Matching
```java
public boolean isSubtree(TreeNode root, TreeNode subRoot) {
    List<String> rootPreorder = new ArrayList<>();
    List<String> subPreorder = new ArrayList<>();
    
    preorder(root, rootPreorder);
    preorder(subRoot, subPreorder);
    
    return Collections.indexOfSubList(rootPreorder, subPreorder) != -1;
}

private void preorder(TreeNode node, List<String> result) {
    if (node == null) {
        result.add("#");
        return;
    }
    
    result.add("^" + node.val);  // Use prefix to avoid false matches
    preorder(node.left, result);
    preorder(node.right, result);
}
```

#### Solution 4: Hash-based Approach
```java
public boolean isSubtree(TreeNode root, TreeNode subRoot) {
    Set<String> rootHashes = new HashSet<>();
    String subHash = getHash(subRoot, rootHashes);
    
    return rootHashes.contains(subHash);
}

private String getHash(TreeNode node, Set<String> hashes) {
    if (node == null) return "#";
    
    String leftHash = getHash(node.left, hashes);
    String rightHash = getHash(node.right, hashes);
    
    String currentHash = node.val + "," + leftHash + "," + rightHash;
    hashes.add(currentHash);
    
    return currentHash;
}
```

### Complexity Analysis
- **Recursive approach**: Time O(m×n), Space O(max(m,n)) where m,n are tree sizes
- **Serialization**: Time O(m+n), Space O(m+n)
- **Hash approach**: Time O(m+n), Space O(m+n)

### Key Insights & Patterns
1. **Tree Traversal + Comparison**: Combine traversal with exact matching
2. **String Representation**: Convert to strings for easier comparison
3. **False Positive Prevention**: Use delimiters to avoid substring matches
4. **Trade-offs**: Time vs space complexity in different approaches

### Common Pitfalls
1. **Partial Matches**: Accepting partial subtree matches instead of complete
2. **String Encoding**: False positives from poor serialization
3. **Null Handling**: Incorrect handling of null nodes in comparison
4. **Edge Cases**: Empty subtree or single node cases

### Follow-up Questions
1. How would you find all positions where subRoot appears?
2. What if trees could have duplicate values?
3. How would you handle very large trees efficiently?
4. Can you solve this iteratively?

---

### 8. Construct Binary Tree from Preorder and Inorder

**🔗 LeetCode Link:** [Construct Binary Tree from Preorder and Inorder Traversal - LeetCode #105](https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What unique property does each traversal order give you about a tree's structure?
2. If you know the root of a tree, how can you identify its left and right subtrees?
3. What information do you need to track to avoid creating duplicate subtrees?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding Traversal Properties
> **Guided Question:** What does the first element in a preorder traversal tell you, and how can you use the inorder traversal to split the tree?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Key Insight:** The first element in preorder is always the root of the current (sub)tree.

In preorder: Root → Left Subtree → Right Subtree
In inorder: Left Subtree → Root → Right Subtree

Once you find the root in the inorder array, everything to its left belongs to the left subtree, and everything to its right belongs to the right subtree. This gives you a way to recursively divide the problem.
</details>

#### Step 2: Naive Recursive Approach
> **Guided Question:** How would you implement this recursively, and what would make it inefficient?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Naive Approach:** For each recursive call:
1. Take the first element from remaining preorder as root
2. Search for root in inorder array (linear search)
3. Split inorder array and recursively build subtrees

**Inefficiency:** Searching for root in inorder takes O(n) time for each node, leading to O(n²) overall time complexity. Also, creating new arrays for each recursive call wastes space.
</details>

#### Step 3: Optimization with HashMap and Index Management
> **Guided Question:** How can you eliminate the linear search and array copying to achieve optimal performance?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Optimizations:**
1. **HashMap for root lookup:** Pre-store all inorder elements with their indices in a HashMap for O(1) lookup
2. **Index boundaries:** Instead of copying arrays, pass start/end indices for the current subarray being processed
3. **Preorder index tracking:** Use a global or passed index to track current position in preorder array

This reduces time complexity to O(n) and space complexity to O(n) for the HashMap plus O(h) for recursion stack.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Create HashMap to store inorder element → index mapping
- [ ] Implement recursive helper with boundary indices (inStart, inEnd)
- [ ] Track preorder index (global variable or parameter)
- [ ] Extract root from preorder, find its position in inorder
- [ ] Calculate left subtree size and recursively build left/right subtrees
- [ ] Handle base case when indices cross

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Can you explain why preorder + inorder uniquely determines a tree, but preorder + postorder might not?
2. **Complexity Analysis:** Why is the HashMap approach O(n) time instead of O(n²)?
3. **Trade-offs:** What's the space trade-off of using HashMap vs. repeated linear searches?
4. **Pattern Recognition:** How does this problem relate to other tree construction problems (like from inorder + postorder)?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding traversal properties: ___/5
- [ ] Implementing recursive tree construction: ___/5  
- [ ] Optimizing with HashMap and indices: ___/5
- [ ] Explaining the approach to others: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Try the follow-up: Can you solve this iteratively using a stack?

**Problem Statement**: Given two integer arrays `preorder` and `inorder` where `preorder` is the preorder traversal of a binary tree and `inorder` is the inorder traversal of the same tree, construct and return the binary tree.

**Examples:**
```
Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
Output: [3,9,20,null,null,15,7]

Input: preorder = [-1], inorder = [-1]
Output: [-1]
```

### Knowledge Prerequisites
- Understanding of tree traversal orders (preorder, inorder, postorder)
- Array manipulation and indexing
- Recursive tree construction
- HashMap for efficient lookups

### First Principles
Tree reconstruction uses traversal properties:
- **Preorder**: Root comes first, then left subtree, then right subtree
- **Inorder**: Left subtree, then root, then right subtree
- **Root identification**: First element in preorder is always root
- **Subtree separation**: Root position in inorder divides left/right subtrees

### Problem-First Approach

**Step 1: Understand the Problem**
- Use two traversals to uniquely determine tree structure
- Preorder gives root nodes in order of processing
- Inorder gives boundary between left and right subtrees

**Step 2: Key Insights**
- Root is first element in preorder
- Find root in inorder to split into left/right subtrees
- Recursively apply same logic to subtrees
- Use indices to avoid array copying

**Step 3: Algorithm Design**
1. Take first element from preorder as root
2. Find root position in inorder array
3. Split inorder into left and right parts
4. Recursively construct left and right subtrees

### Multiple Java Solutions

#### Solution 1: Recursive with HashMap (Optimal)
```java
class Solution {
    private int preorderIndex = 0;
    private Map<Integer, Integer> inorderMap = new HashMap<>();
    
    public TreeNode buildTree(int[] preorder, int[] inorder) {
        // Build map for O(1) lookup of root positions
        for (int i = 0; i < inorder.length; i++) {
            inorderMap.put(inorder[i], i);
        }
        
        return buildTreeHelper(preorder, 0, inorder.length - 1);
    }
    
    private TreeNode buildTreeHelper(int[] preorder, int left, int right) {
        if (left > right) return null;
        
        // Pick current root from preorder
        int rootVal = preorder[preorderIndex++];
        TreeNode root = new TreeNode(rootVal);
        
        // Root splits inorder into left and right subtrees
        int rootIndex = inorderMap.get(rootVal);
        
        // Build left subtree first (matches preorder)
        root.left = buildTreeHelper(preorder, left, rootIndex - 1);
        root.right = buildTreeHelper(preorder, rootIndex + 1, right);
        
        return root;
    }
}
```

#### Solution 2: Without Global Variables
```java
import java.util.HashMap;
import java.util.Map;

public TreeNode buildTree(int[] preorder, int[] inorder) {
    Map<Integer, Integer> inorderMap = new HashMap<>();
    for (int i = 0; i < inorder.length; i++) {
        inorderMap.put(inorder[i], i);
    }
    
    return buildTreeHelper(preorder, 0, 0, inorder.length - 1, inorderMap);
}

private TreeNode buildTreeHelper(int[] preorder, int preStart, 
                                int inStart, int inEnd, 
                                Map<Integer, Integer> inorderMap) {
    if (preStart >= preorder.length || inStart > inEnd) {
        return null;
    }
    
    TreeNode root = new TreeNode(preorder[preStart]);
    int rootIndex = inorderMap.get(preorder[preStart]);
    int leftSubtreeSize = rootIndex - inStart;
    
    root.left = buildTreeHelper(preorder, preStart + 1, 
                               inStart, rootIndex - 1, inorderMap);
    root.right = buildTreeHelper(preorder, preStart + leftSubtreeSize + 1, 
                                rootIndex + 1, inEnd, inorderMap);
    
    return root;
}
```

#### Solution 3: Iterative with Stack
```java
public TreeNode buildTree(int[] preorder, int[] inorder) {
    if (preorder.length == 0) return null;
    
    TreeNode root = new TreeNode(preorder[0]);
    Stack<TreeNode> stack = new Stack<>();
    stack.push(root);
    
    int preIndex = 1, inIndex = 0;
    
    while (preIndex < preorder.length) {
        TreeNode node = stack.peek();
        
        if (node.val != inorder[inIndex]) {
            // Create left child
            node.left = new TreeNode(preorder[preIndex++]);
            stack.push(node.left);
        } else {
            // Found root in inorder, process right subtree
            while (!stack.isEmpty() && stack.peek().val == inorder[inIndex]) {
                node = stack.pop();
                inIndex++;
            }
            
            if (preIndex < preorder.length) {
                node.right = new TreeNode(preorder[preIndex++]);
                stack.push(node.right);
            }
        }
    }
    
    return root;
}
```

#### Solution 4: Recursive with Array Copying (Less Efficient)
```java
public TreeNode buildTree(int[] preorder, int[] inorder) {
    if (preorder.length == 0) return null;
    
    TreeNode root = new TreeNode(preorder[0]);
    
    // Find root in inorder
    int rootIndex = 0;
    for (int i = 0; i < inorder.length; i++) {
        if (inorder[i] == preorder[0]) {
            rootIndex = i;
            break;
        }
    }
    
    // Split arrays
    int[] leftInorder = Arrays.copyOfRange(inorder, 0, rootIndex);
    int[] rightInorder = Arrays.copyOfRange(inorder, rootIndex + 1, inorder.length);
    
    int[] leftPreorder = Arrays.copyOfRange(preorder, 1, 1 + leftInorder.length);
    int[] rightPreorder = Arrays.copyOfRange(preorder, 1 + leftInorder.length, preorder.length);
    
    root.left = buildTree(leftPreorder, leftInorder);
    root.right = buildTree(rightPreorder, rightInorder);
    
    return root;
}
```

### Complexity Analysis
- **Time Complexity**: O(n) with HashMap, O(n²) without
- **Space Complexity**: O(n) for HashMap and recursion stack

### Key Insights & Patterns
1. **Traversal Properties**: Each traversal provides different structural information
2. **Root Identification**: Preorder gives processing order of roots
3. **Subtree Boundaries**: Inorder root position splits left/right subtrees
4. **Index Management**: Careful tracking of array boundaries

### Common Pitfalls
1. **Index Confusion**: Mixing up preorder and inorder indices
2. **Boundary Errors**: Incorrect calculation of subtree sizes
3. **Duplicate Values**: Problem assumes unique values
4. **Empty Tree**: Not handling empty array inputs

### Follow-up Questions
1. How would you handle trees with duplicate values?
2. Can you reconstruct from postorder and inorder?
3. What if you only had one traversal?
4. How would you verify if given traversals are valid?

---

### 9. Validate Binary Search Tree

**🔗 LeetCode Link:** [Validate Binary Search Tree - LeetCode #98](https://leetcode.com/problems/validate-binary-search-tree/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What makes a binary search tree "valid" - is it just about comparing each node to its immediate children?
2. If you traverse a valid BST in inorder, what pattern should you see in the values?
3. What information do you need to track as you move down the tree to ensure global BST property?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding BST Property
> **Guided Question:** Why isn't it enough to just check if each node is greater than its left child and less than its right child?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Key Insight:** BST validation requires global constraints, not just local ones.

Consider this tree: `[5, 1, 4, null, null, 3, 6]`. Node 4 is greater than its left child (3), but 4 is in the right subtree of 5, so it violates the BST property since 4 < 5.

Every node must satisfy constraints based on ALL its ancestors:
- Left subtree: all values < current node
- Right subtree: all values > current node
</details>

#### Step 2: Range-Based Validation Approach
> **Guided Question:** How can you track the valid range of values for each node as you traverse the tree?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Range Validation Approach:**
1. Start with the full range: (-∞, +∞) for the root
2. When going left: update max boundary to current node's value
3. When going right: update min boundary to current node's value
4. At each node, check if its value is within the current valid range

This ensures that every node respects constraints from all its ancestors, not just immediate parent.
</details>

#### Step 3: Alternative Inorder Traversal Approach
> **Guided Question:** What property of inorder traversal on a valid BST can you exploit for validation?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Inorder Property:** Inorder traversal of a valid BST produces values in strictly increasing order.

Algorithm:
1. Perform inorder traversal (left → node → right)
2. Keep track of the previously visited node's value
3. At each node, ensure current value > previous value
4. If any violation found, return false

This is elegant because it transforms the problem into checking if a sequence is sorted, but requires O(n) space for the full traversal or careful state management for early termination.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing both approaches from memory:

**Range-based approach checklist:**
- [ ] Define helper function with (node, min, max) parameters
- [ ] Base case: null nodes are valid
- [ ] Check if current node value violates range constraints
- [ ] Recursively validate left subtree with updated max bound
- [ ] Recursively validate right subtree with updated min bound

**Inorder approach checklist:**
- [ ] Track previous node value (use class variable or wrapper)
- [ ] Implement inorder traversal (left, process, right)
- [ ] Compare current node with previous for strict increasing order
- [ ] Return false immediately on violation for efficiency

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Can you construct a binary tree that looks like a BST locally but violates the global BST property?
2. **Complexity Analysis:** Why is the range-based approach O(n) time and O(h) space while naive checking might be O(n²)?
3. **Trade-offs:** When would you prefer inorder traversal vs. range validation?
4. **Pattern Recognition:** How does this range-passing pattern apply to other tree validation problems?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding global vs. local BST constraints: ___/5
- [ ] Implementing range-based validation: ___/5  
- [ ] Implementing inorder validation: ___/5
- [ ] Choosing the right approach for different scenarios: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Try the follow-up: Can you validate without using recursion (iterative approach)?

**Problem Statement**: Given the root of a binary tree, determine if it is a valid binary search tree (BST). A valid BST is defined as follows: The left subtree of a node contains only nodes with keys less than the node's key. The right subtree of a node contains only nodes with keys greater than the node's key. Both the left and right subtrees must also be binary search trees.

**Examples:**
```
Input: root = [2,1,3]
Output: true

Input: root = [5,1,4,null,null,3,6]
Output: false
Explanation: The root node's value is 5 but its right child's value is 4.
```

### Knowledge Prerequisites
- Binary Search Tree properties
- Tree traversal techniques (especially in-order)
- Recursive validation with bounds
- Understanding of min/max constraints

### First Principles
BST validation requires:
- **Local property**: Left child < parent < right child
- **Global property**: All nodes in left subtree < parent < all nodes in right subtree
- **Recursive structure**: Both subtrees must also be valid BSTs
- **Bound propagation**: Valid range narrows as we traverse down

### Problem-First Approach

**Step 1: Understand the Problem**
- Check if tree satisfies BST property at every node
- Not enough to check immediate children only
- Must consider entire subtree constraints

**Step 2: Key Insights**
- Each node has valid range [min, max] based on ancestors
- In-order traversal of BST gives sorted sequence
- Can validate recursively with bound checking

**Step 3: Algorithm Design**
1. For each node, check if value is within valid bounds
2. Update bounds for left child (upper bound becomes current value)
3. Update bounds for right child (lower bound becomes current value)

### Multiple Java Solutions

#### Solution 1: Recursive with Bounds (Optimal)
```java
public boolean isValidBST(TreeNode root) {
    return validate(root, Long.MIN_VALUE, Long.MAX_VALUE);
}

private boolean validate(TreeNode node, long min, long max) {
    if (node == null) return true;
    
    // Check if current node violates BST property
    if (node.val <= min || node.val >= max) {
        return false;
    }
    
    // Recursively validate left and right subtrees with updated bounds
    return validate(node.left, min, node.val) && 
           validate(node.right, node.val, max);
}
```

#### Solution 2: In-order Traversal Validation
```java
class Solution {
    private Integer prev = null;
    
    public boolean isValidBST(TreeNode root) {
        return inorder(root);
    }
    
    private boolean inorder(TreeNode node) {
        if (node == null) return true;
        
        // Traverse left subtree
        if (!inorder(node.left)) return false;
        
        // Check current node
        if (prev != null && node.val <= prev) {
            return false;
        }
        prev = node.val;
        
        // Traverse right subtree
        return inorder(node.right);
    }
}
```

#### Solution 3: In-order with List
```java
import java.util.ArrayList;
import java.util.List;

public boolean isValidBST(TreeNode root) {
    List<Integer> inorderList = new ArrayList<>();
    inorder(root, inorderList);
    
    // Check if list is strictly increasing
    for (int i = 1; i < inorderList.size(); i++) {
        if (inorderList.get(i) <= inorderList.get(i - 1)) {
            return false;
        }
    }
    
    return true;
}

private void inorder(TreeNode node, List<Integer> result) {
    if (node == null) return;
    
    inorder(node.left, result);
    result.add(node.val);
    inorder(node.right, result);
}
```

#### Solution 4: Iterative In-order
```java
public boolean isValidBST(TreeNode root) {
    Stack<TreeNode> stack = new Stack<>();
    Integer prev = null;
    TreeNode current = root;
    
    while (current != null || !stack.isEmpty()) {
        // Go to leftmost node
        while (current != null) {
            stack.push(current);
            current = current.left;
        }
        
        // Process current node
        current = stack.pop();
        if (prev != null && current.val <= prev) {
            return false;
        }
        prev = current.val;
        
        // Move to right subtree
        current = current.right;
    }
    
    return true;
}
```

### Complexity Analysis
- **Time Complexity**: O(n) - visit each node once
- **Space Complexity**: O(h) where h is height of tree (recursion stack)

### Key Insights & Patterns
1. **Bound Propagation**: Each node constrains valid range for descendants
2. **In-order Property**: BST in-order traversal gives sorted sequence
3. **Global vs Local**: Must check entire subtree, not just immediate children
4. **Edge Cases**: Handle integer overflow with Long.MIN_VALUE/MAX_VALUE

### Common Pitfalls
1. **Local Checking Only**: Only comparing with immediate children
2. **Integer Overflow**: Using Integer.MIN_VALUE/MAX_VALUE with edge cases
3. **Equal Values**: Forgetting that BST requires strict inequality
4. **Null Handling**: Not properly handling null nodes

### Follow-up Questions
1. How would you handle BSTs that allow duplicate values?
2. What if you needed to fix a BST with exactly one swapped pair?
3. How would you find the kth smallest element efficiently?
4. Can you validate a BST iteratively using constant extra space?

---

### 10. Kth Smallest Element in a BST

**🔗 LeetCode Link:** [Kth Smallest Element in a BST - LeetCode #230](https://leetcode.com/problems/kth-smallest-element-in-a-bst/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What property of BST traversal naturally gives you elements in sorted order?
2. Do you need to visit all nodes to find the kth smallest, or can you stop early?
3. How would you track which element you're currently at during traversal?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Leveraging BST Inorder Property
> **Guided Question:** Which traversal order would give you BST elements from smallest to largest, and how does this help?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Key Insight:** Inorder traversal of a BST visits nodes in ascending order.

In a BST, inorder traversal (left → root → right) naturally produces elements in sorted order:
- Process all smaller elements (left subtree) first
- Process current node 
- Process all larger elements (right subtree) last

This means the kth element visited during inorder traversal is the kth smallest element overall!
</details>

#### Step 2: Naive Approach - Full Traversal
> **Guided Question:** What's the straightforward way to solve this, and what makes it suboptimal?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Naive Approach:**
1. Perform complete inorder traversal
2. Store all elements in a list
3. Return the kth element (index k-1)

**Inefficiencies:**
- Time: O(n) - visits all nodes even if k is small
- Space: O(n) - stores all elements unnecessarily
- No early termination when we find the answer

This works but doesn't take advantage of the fact that we can stop as soon as we find the kth element.
</details>

#### Step 3: Optimized Early Termination
> **Guided Question:** How can you modify inorder traversal to stop as soon as you find the kth smallest element?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Optimization Strategies:**

**Recursive with Counter:**
- Pass a counter to track current position
- Increment counter at each node visit
- Return immediately when counter reaches k

**Iterative with Stack:**
- Use explicit stack for inorder traversal
- Maintain count of visited nodes
- Stop and return when count reaches k

Both achieve O(H + k) time complexity where H is height, and O(H) space for recursion/stack. Much better when k << n!
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimized solution from memory:

**Recursive approach checklist:**
- [ ] Define helper function with counter parameter (or use class variable)
- [ ] Implement inorder traversal: left → process → right
- [ ] Increment counter when processing each node
- [ ] Return result when counter equals k
- [ ] Handle early termination to avoid unnecessary traversal

**Iterative approach checklist:**
- [ ] Use stack to simulate inorder traversal
- [ ] Push all left children first
- [ ] Pop and process node, increment count
- [ ] Return when count reaches k
- [ ] Push right child and repeat

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does inorder traversal guarantee ascending order in a BST, but not in a regular binary tree?
2. **Complexity Analysis:** How does the complexity change from O(n) to O(H + k), and when is this beneficial?
3. **Trade-offs:** When would you prefer recursive vs. iterative implementation?
4. **Pattern Recognition:** How does this early-termination pattern apply to other tree search problems?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding inorder BST property: ___/5
- [ ] Implementing early termination optimization: ___/5  
- [ ] Choosing between recursive and iterative approaches: ___/5
- [ ] Analyzing time complexity for different k values: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Try the follow-up: What if the BST is frequently modified and you need to handle multiple kth smallest queries?

**Problem Statement**: Given the root of a binary search tree, and an integer k, return the kth smallest value (1-indexed) in the tree.

**Examples:**
```
Input: root = [3,1,4,null,2], k = 1
Output: 1

Input: root = [5,3,6,2,4,null,null,1], k = 3
Output: 3
```

### Knowledge Prerequisites
- Binary Search Tree properties
- In-order traversal of BST
- Early termination techniques
- Stack-based iteration

### First Principles
Finding kth smallest in BST leverages:
- **BST property**: In-order traversal visits nodes in sorted order
- **Early termination**: Stop after finding kth element
- **Counting**: Track how many elements we've seen
- **Efficiency**: Avoid traversing entire tree if possible

### Problem-First Approach

**Step 1: Understand the Problem**
- Find kth smallest value (not kth node)
- 1-indexed (first smallest is k=1)
- BST property ensures in-order gives sorted sequence

**Step 2: Key Insights**
- In-order traversal naturally gives elements in ascending order
- Can stop after processing k elements
- Both recursive and iterative approaches work

**Step 3: Algorithm Design**
1. Perform in-order traversal
2. Count elements as we visit them
3. Return kth element (stop early when count reaches k)

### Multiple Java Solutions

#### Solution 1: Recursive In-order with Counter (Optimal)
```java
class Solution {
    private int count = 0;
    private int result = 0;
    
    public int kthSmallest(TreeNode root, int k) {
        inorder(root, k);
        return result;
    }
    
    private void inorder(TreeNode node, int k) {
        if (node == null || count >= k) return;
        
        // Traverse left subtree
        inorder(node.left, k);
        
        // Process current node
        count++;
        if (count == k) {
            result = node.val;
            return;
        }
        
        // Traverse right subtree
        inorder(node.right, k);
    }
}
```

#### Solution 2: Iterative In-order (Most Practical)
```java
public int kthSmallest(TreeNode root, int k) {
    Stack<TreeNode> stack = new Stack<>();
    TreeNode current = root;
    
    while (current != null || !stack.isEmpty()) {
        // Go to leftmost node
        while (current != null) {
            stack.push(current);
            current = current.left;
        }
        
        // Process current node
        current = stack.pop();
        k--;
        if (k == 0) {
            return current.val;
        }
        
        // Move to right subtree
        current = current.right;
    }
    
    return -1; // Should never reach here if k is valid
}
```

#### Solution 3: Morris In-order (Constant Space)
```java
public int kthSmallest(TreeNode root, int k) {
    TreeNode current = root;
    int count = 0;
    
    while (current != null) {
        if (current.left == null) {
            // Process current node
            count++;
            if (count == k) {
                return current.val;
            }
            current = current.right;
        } else {
            // Find predecessor
            TreeNode predecessor = current.left;
            while (predecessor.right != null && predecessor.right != current) {
                predecessor = predecessor.right;
            }
            
            if (predecessor.right == null) {
                // Make current the right child of predecessor
                predecessor.right = current;
                current = current.left;
            } else {
                // Revert the changes
                predecessor.right = null;
                count++;
                if (count == k) {
                    return current.val;
                }
                current = current.right;
            }
        }
    }
    
    return -1;
}
```

#### Solution 4: Collect All Then Sort (Less Efficient)
```java
import java.util.ArrayList;
import java.util.List;

public int kthSmallest(TreeNode root, int k) {
    List<Integer> values = new ArrayList<>();
    inorder(root, values);
    return values.get(k - 1);
}

private void inorder(TreeNode node, List<Integer> values) {
    if (node == null) return;
    
    inorder(node.left, values);
    values.add(node.val);
    inorder(node.right, values);
}
```

### Complexity Analysis
- **Recursive/Iterative**: Time O(h + k), Space O(h) where h is height
- **Morris**: Time O(n), Space O(1)
- **Collect all**: Time O(n), Space O(n)

### Key Insights & Patterns
1. **BST In-order**: Natural sorted order for BST traversal
2. **Early Termination**: Stop as soon as kth element is found
3. **Space Trade-offs**: Stack space vs constant space algorithms
4. **Practical Choice**: Iterative approach balances simplicity and efficiency

### Common Pitfalls
1. **1-indexed**: Remember k is 1-indexed, not 0-indexed
2. **Early Termination**: Forgetting to stop after finding kth element
3. **Invalid k**: Not handling k larger than tree size
4. **State Management**: Using instance variables can cause issues in repeated calls

### Follow-up Questions
1. What if the BST is modified frequently (insertions/deletions)?
2. How would you find the kth largest element?
3. What if you needed to find kth smallest in a range [low, high]?
4. How would you optimize for multiple queries?

---

### 11. Lowest Common Ancestor of a BST

**🔗 LeetCode Link:** [Lowest Common Ancestor of a Binary Search Tree - LeetCode #235](https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-search-tree/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. How does the BST property help you determine where two nodes might diverge in their paths from the root?
2. What does it mean for a node to be the "lowest" common ancestor, and how can you identify that split point?
3. Do you need to search both subtrees, or can the BST property guide you in one direction?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding LCA in BST Context
> **Guided Question:** What special property does a BST have that simplifies finding the LCA compared to a regular binary tree?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Key Insight:** BST property allows you to determine the direction to search based on node values.

In a BST:
- If both target nodes have values less than current node → LCA is in left subtree
- If both target nodes have values greater than current node → LCA is in right subtree  
- If one target is smaller and one is larger (or equal) → current node IS the LCA

This eliminates the need to search both subtrees like in a general binary tree LCA problem!
</details>

#### Step 2: Path-Based vs. Value-Based Approach
> **Guided Question:** How would you solve this naively, and how does the BST property offer a more direct solution?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Naive Approach (works for any tree):**
1. Find path from root to node p
2. Find path from root to node q  
3. Compare paths to find the last common node

**BST-Optimized Approach:**
1. Start from root
2. Use node values to decide direction: left if both targets are smaller, right if both are larger
3. Stop when you find the split point (where targets would go in different directions)

The BST approach is much more efficient: O(h) time vs. O(n) for path finding, and O(1) vs. O(h) space.
</details>

#### Step 3: Recognizing the Split Point
> **Guided Question:** At what exact moment do you know you've found the LCA during your BST traversal?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Split Point Recognition:** 
The LCA is the first node where the two target nodes would diverge into different subtrees.

**Conditions for LCA at current node:**
1. `p.val <= current.val <= q.val` (assuming p.val <= q.val)
2. OR one target equals current node value
3. OR targets are on opposite sides: `(p.val < current.val) != (q.val < current.val)`

Once you identify this split point, you don't need to go any deeper - this node is guaranteed to be the lowest point where both targets have a common ancestor.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the BST-optimized solution from memory:

**Recursive approach checklist:**
- [ ] Base case: if current node is null, return null
- [ ] If both target values < current value → recurse left
- [ ] If both target values > current value → recurse right
- [ ] Otherwise (split point found) → return current node
- [ ] Handle edge case where one target equals current node

**Iterative approach checklist:**
- [ ] Start with current = root
- [ ] While current is not null
- [ ] Use same logic as recursive to determine direction
- [ ] Return current when split point is found
- [ ] Move current left or right based on comparison

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does this BST approach guarantee finding the LCA in one pass without backtracking?
2. **Complexity Analysis:** How does leveraging BST property improve both time and space complexity?
3. **Trade-offs:** When would you prefer recursive vs. iterative implementation for this problem?
4. **Pattern Recognition:** How does this "split point detection" pattern apply to other BST problems?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding LCA concept in BST context: ___/5
- [ ] Implementing value-based direction logic: ___/5  
- [ ] Recognizing split point conditions: ___/5
- [ ] Comparing BST vs. general tree approaches: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Try the follow-up: How would you solve LCA for a general binary tree (not BST)?

**Problem Statement**: Given a binary search tree (BST), find the lowest common ancestor (LCA) of two given nodes in the BST. The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).

**Examples:**
```
Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
Output: 6
Explanation: The LCA of nodes 2 and 8 is 6.

Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
Output: 2
Explanation: The LCA of nodes 2 and 4 is 2, since a node can be a descendant of itself.
```

### Knowledge Prerequisites
- Binary Search Tree properties
- Understanding of tree ancestry relationships
- BST navigation principles
- Recursive and iterative tree traversal

### First Principles
LCA in BST leverages ordering property:
- **BST property**: Left subtree < root < right subtree
- **LCA location**: Where paths to p and q diverge
- **Navigation**: Use values to determine direction
- **Termination**: When node is between p and q values

### Problem-First Approach

**Step 1: Understand the Problem**
- Find deepest node that is ancestor of both p and q
- BST property allows efficient navigation
- One node can be ancestor of itself

**Step 2: Key Insights**
- If both p and q are less than current node, go left
- If both p and q are greater than current node, go right
- Otherwise, current node is the LCA

**Step 3: Algorithm Design**
1. Start from root
2. Compare p and q values with current node
3. Navigate based on BST property
4. Stop when paths diverge

### Multiple Java Solutions

#### Solution 1: Recursive (Elegant)
```java
public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
    if (root == null) return null;
    
    // If both nodes are in left subtree
    if (p.val < root.val && q.val < root.val) {
        return lowestCommonAncestor(root.left, p, q);
    }
    
    // If both nodes are in right subtree
    if (p.val > root.val && q.val > root.val) {
        return lowestCommonAncestor(root.right, p, q);
    }
    
    // Otherwise, root is the LCA
    return root;
}
```

#### Solution 2: Iterative (Optimal)
```java
public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
    TreeNode current = root;
    
    while (current != null) {
        if (p.val < current.val && q.val < current.val) {
            current = current.left;
        } else if (p.val > current.val && q.val > current.val) {
            current = current.right;
        } else {
            return current;
        }
    }
    
    return null; // Should never reach here if p and q exist in tree
}
```

#### Solution 3: Path-based Approach
```java
import java.util.ArrayList;
import java.util.List;

public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
    List<TreeNode> pathToP = getPath(root, p);
    List<TreeNode> pathToQ = getPath(root, q);
    
    TreeNode lca = null;
    int i = 0;
    while (i < pathToP.size() && i < pathToQ.size() && 
           pathToP.get(i) == pathToQ.get(i)) {
        lca = pathToP.get(i);
        i++;
    }
    
    return lca;
}

private List<TreeNode> getPath(TreeNode root, TreeNode target) {
    List<TreeNode> path = new ArrayList<>();
    TreeNode current = root;
    
    while (current != null) {
        path.add(current);
        if (current.val == target.val) {
            break;
        } else if (target.val < current.val) {
            current = current.left;
        } else {
            current = current.right;
        }
    }
    
    return path;
}
```

#### Solution 4: Recursive with Value Comparison
```java
public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
    return findLCA(root, Math.min(p.val, q.val), Math.max(p.val, q.val));
}

private TreeNode findLCA(TreeNode node, int minVal, int maxVal) {
    if (node == null) return null;
    
    if (node.val > maxVal) {
        return findLCA(node.left, minVal, maxVal);
    } else if (node.val < minVal) {
        return findLCA(node.right, minVal, maxVal);
    } else {
        return node;
    }
}
```

### Complexity Analysis
- **Time Complexity**: O(h) where h is height of tree
- **Space Complexity**: 
  - Recursive: O(h) for call stack
  - Iterative: O(1)

### Key Insights & Patterns
1. **BST Navigation**: Use value comparisons to determine direction
2. **Divergence Point**: LCA is where paths to p and q split
3. **Efficiency**: Much better than general tree LCA (O(h) vs O(n))
4. **Iterative Advantage**: Constant space with iterative approach

### Common Pitfalls
1. **General Tree Logic**: Overthinking with general tree LCA algorithms
2. **Value Assumptions**: Assuming p.val < q.val without checking
3. **Null Checks**: Not handling edge cases properly
4. **Early Return**: Missing the simple comparison logic

### Follow-up Questions
1. How would you handle a general binary tree (not BST)?
2. What if nodes might not exist in the tree?
3. How would you find LCA of multiple nodes?
4. Can you solve this with parent pointers?

---

### 12. Implement Trie (Prefix Tree)

**🔗 LeetCode Link:** [Implement Trie (Prefix Tree) - LeetCode #208](https://leetcode.com/problems/implement-trie-prefix-tree/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. How would you store multiple words to enable fast prefix-based searches?
2. What information does each node in a prefix tree need to track?
3. How can you distinguish between a prefix that's also a complete word vs. just a prefix?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding Trie Structure
> **Guided Question:** How does a tree structure help with storing words to enable efficient prefix operations?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Key Insight:** A Trie stores words character by character along paths from root to leaves, sharing common prefixes.

Trie Structure:
- **Root**: Empty starting point
- **Edges**: Represent characters
- **Paths**: Root to node represents prefixes
- **Special marking**: Indicate where complete words end

Example: Storing ["cat", "cats", "car"] creates shared paths for common prefixes:
```
    root
     |
     c
     |
     a
    / \
   t   r
   |   |
   s   (end)
   |
  (end)
```
</details>

#### Step 2: Node Design Decisions
> **Guided Question:** What data should each Trie node contain, and how should you represent the connections to child nodes?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Node Components Needed:**
1. **Child references**: Map from character → child node
2. **End marker**: Boolean indicating if this node marks end of a valid word
3. **Optional optimization**: Store character value (though path implies this)

**Design Choices:**
- **Array vs HashMap for children**: Array[26] for lowercase letters (O(1) access) vs HashMap<Character, Node> for flexibility
- **End marking**: `isEndOfWord` boolean flag essential for distinguishing prefixes from complete words

This design allows sharing of common prefixes while marking word boundaries.
</details>

#### Step 3: Operation Implementation Strategy
> **Guided Question:** How do the three operations (insert, search, startsWith) relate to each other, and what's the core logic for each?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Common Pattern - Path Traversal:**
All operations follow character-by-character path traversal from root.

**Insert Algorithm:**
1. Create path if it doesn't exist (create missing nodes)
2. Mark final node as end of word

**Search Algorithm:**
1. Follow existing path
2. Return true only if path exists AND final node is marked as word end

**StartsWith Algorithm:**
1. Follow existing path
2. Return true if path exists (regardless of word end marking)

**Key Insight**: Search and startsWith share logic but differ in final condition - search requires word completion, startsWith only requires path existence.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the Trie class from memory:

**TrieNode design checklist:**
- [ ] Define TrieNode class with children array/map
- [ ] Add boolean isEndOfWord field
- [ ] Constructor to initialize children structure

**Insert method checklist:**
- [ ] Start from root, iterate through word characters
- [ ] Create new nodes for missing characters
- [ ] Mark final node as end of word

**Search method checklist:**
- [ ] Start from root, iterate through word characters
- [ ] Return false if any character path doesn't exist
- [ ] Return node.isEndOfWord for final character

**StartsWith method checklist:**
- [ ] Similar to search but return true if path exists
- [ ] Don't check isEndOfWord flag

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does a Trie enable faster prefix searches than storing words in a list or hash set?
2. **Complexity Analysis:** What's the time complexity for each operation in terms of word length vs. number of words?
3. **Trade-offs:** When would you choose array vs. HashMap for child node storage?
4. **Pattern Recognition:** How does this tree structure relate to other character-based data structures?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding Trie structure and benefits: ___/5
- [ ] Implementing TrieNode with proper fields: ___/5  
- [ ] Implementing insert, search, startsWith methods: ___/5
- [ ] Analyzing time/space complexity trade-offs: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Try the follow-up: How would you add a delete operation to the Trie?

**Problem Statement**: A trie (pronounced as "try") or prefix tree is a tree data structure used to efficiently store and retrieve keys in a dataset of strings. Implement the Trie class with insert, search, and startsWith methods.

**Examples:**
```
Trie trie = new Trie();
trie.insert("apple");
trie.search("apple");   // return True
trie.search("app");     // return False
trie.startsWith("app"); // return True
trie.insert("app");
trie.search("app");     // return True
```

### Knowledge Prerequisites
- Tree data structures and node design
- String processing and character manipulation
- Hash maps or arrays for character storage
- Understanding of prefix relationships

### First Principles
Trie structure provides:
- **Prefix sharing**: Common prefixes share same path
- **Efficient lookup**: O(m) time where m is string length
- **Space optimization**: Shared prefixes reduce memory usage
- **Prefix queries**: Natural support for prefix-based operations

### Problem-First Approach

**Step 1: Understand the Problem**
- Build tree where each path represents a string
- Support insertion, exact search, and prefix search
- Efficient for string operations and prefix matching

**Step 2: Key Insights**
- Each node represents a character position
- Path from root to node represents a prefix
- Need to mark end of complete words
- Use array or HashMap to store children

**Step 3: Algorithm Design**
1. Design TrieNode with children and end marker
2. Insert: traverse/create path for each character
3. Search: follow path and check end marker
4. StartsWith: follow path (ignore end marker)

### Multiple Java Solutions

#### Solution 1: Array-based Children (Optimal for lowercase letters)
```java
class Trie {
    class TrieNode {
        TrieNode[] children;
        boolean isEnd;
        
        TrieNode() {
            children = new TrieNode[26]; // for 'a' to 'z'
            isEnd = false;
        }
    }
    
    private TrieNode root;
    
    public Trie() {
        root = new TrieNode();
    }
    
    public void insert(String word) {
        TrieNode current = root;
        for (char c : word.toCharArray()) {
            int index = c - 'a';
            if (current.children[index] == null) {
                current.children[index] = new TrieNode();
            }
            current = current.children[index];
        }
        current.isEnd = true;
    }
    
    public boolean search(String word) {
        TrieNode node = searchNode(word);
        return node != null && node.isEnd;
    }
    
    public boolean startsWith(String prefix) {
        return searchNode(prefix) != null;
    }
    
    private TrieNode searchNode(String str) {
        TrieNode current = root;
        for (char c : str.toCharArray()) {
            int index = c - 'a';
            if (current.children[index] == null) {
                return null;
            }
            current = current.children[index];
        }
        return current;
    }
}
```

#### Solution 2: HashMap-based Children (Flexible for any characters)
```java
class Trie {
    class TrieNode {
        Map<Character, TrieNode> children;
        boolean isEnd;
        
        TrieNode() {
            children = new HashMap<>();
            isEnd = false;
        }
    }
    
    private TrieNode root;
    
    public Trie() {
        root = new TrieNode();
    }
    
    public void insert(String word) {
        TrieNode current = root;
        for (char c : word.toCharArray()) {
            current.children.putIfAbsent(c, new TrieNode());
            current = current.children.get(c);
        }
        current.isEnd = true;
    }
    
    public boolean search(String word) {
        TrieNode node = searchNode(word);
        return node != null && node.isEnd;
    }
    
    public boolean startsWith(String prefix) {
        return searchNode(prefix) != null;
    }
    
    private TrieNode searchNode(String str) {
        TrieNode current = root;
        for (char c : str.toCharArray()) {
            if (!current.children.containsKey(c)) {
                return null;
            }
            current = current.children.get(c);
        }
        return current;
    }
}
```

#### Solution 3: Optimized with Size Tracking
```java
class Trie {
    class TrieNode {
        TrieNode[] children;
        boolean isEnd;
        int count; // Number of words passing through this node
        
        TrieNode() {
            children = new TrieNode[26];
            isEnd = false;
            count = 0;
        }
    }
    
    private TrieNode root;
    
    public Trie() {
        root = new TrieNode();
    }
    
    public void insert(String word) {
        TrieNode current = root;
        for (char c : word.toCharArray()) {
            int index = c - 'a';
            if (current.children[index] == null) {
                current.children[index] = new TrieNode();
            }
            current = current.children[index];
            current.count++;
        }
        current.isEnd = true;
    }
    
    public boolean search(String word) {
        TrieNode node = searchNode(word);
        return node != null && node.isEnd;
    }
    
    public boolean startsWith(String prefix) {
        return searchNode(prefix) != null;
    }
    
    // Additional method: count words with given prefix
    public int countWordsWithPrefix(String prefix) {
        TrieNode node = searchNode(prefix);
        return node != null ? node.count : 0;
    }
    
    private TrieNode searchNode(String str) {
        TrieNode current = root;
        for (char c : str.toCharArray()) {
            int index = c - 'a';
            if (current.children[index] == null) {
                return null;
            }
            current = current.children[index];
        }
        return current;
    }
}
```

#### Solution 4: With Delete Operation
```java
class Trie {
    class TrieNode {
        TrieNode[] children;
        boolean isEnd;
        
        TrieNode() {
            children = new TrieNode[26];
            isEnd = false;
        }
        
        boolean hasNoChildren() {
            for (TrieNode child : children) {
                if (child != null) return false;
            }
            return true;
        }
    }
    
    private TrieNode root;
    
    public Trie() {
        root = new TrieNode();
    }
    
    public void insert(String word) {
        TrieNode current = root;
        for (char c : word.toCharArray()) {
            int index = c - 'a';
            if (current.children[index] == null) {
                current.children[index] = new TrieNode();
            }
            current = current.children[index];
        }
        current.isEnd = true;
    }
    
    public boolean search(String word) {
        TrieNode node = searchNode(word);
        return node != null && node.isEnd;
    }
    
    public boolean startsWith(String prefix) {
        return searchNode(prefix) != null;
    }
    
    public void delete(String word) {
        deleteHelper(root, word, 0);
    }
    
    private boolean deleteHelper(TrieNode node, String word, int index) {
        if (index == word.length()) {
            if (!node.isEnd) return false; // Word doesn't exist
            node.isEnd = false;
            return node.hasNoChildren(); // Return true if node can be deleted
        }
        
        int charIndex = word.charAt(index) - 'a';
        TrieNode child = node.children[charIndex];
        if (child == null) return false; // Word doesn't exist
        
        boolean shouldDeleteChild = deleteHelper(child, word, index + 1);
        
        if (shouldDeleteChild) {
            node.children[charIndex] = null;
            return !node.isEnd && node.hasNoChildren();
        }
        
        return false;
    }
    
    private TrieNode searchNode(String str) {
        TrieNode current = root;
        for (char c : str.toCharArray()) {
            int index = c - 'a';
            if (current.children[index] == null) {
                return null;
            }
            current = current.children[index];
        }
        return current;
    }
}
```

### Complexity Analysis
- **Insert**: Time O(m), Space O(m) where m is word length
- **Search**: Time O(m), Space O(1)
- **StartsWith**: Time O(m), Space O(1)
- **Overall Space**: O(ALPHABET_SIZE × N × M) in worst case

### Key Insights & Patterns
1. **Character Mapping**: Array vs HashMap trade-offs
2. **End Marking**: Distinguish between prefixes and complete words
3. **Shared Prefixes**: Memory efficiency through shared paths
4. **Traversal Pattern**: Follow character path for all operations

### Common Pitfalls
1. **End Marker**: Forgetting to mark end of words
2. **Character Mapping**: Incorrect index calculation for characters
3. **Null Checks**: Not handling non-existent paths
4. **Memory Usage**: Not considering space complexity for large alphabets

### Follow-up Questions
1. How would you implement auto-complete functionality?
2. What if you needed to support deletion efficiently?
3. How would you handle Unicode characters?
4. Can you implement fuzzy search with edit distance?

---

### 13. Add and Search Word - Data Structure Design

**🔗 LeetCode Link:** [Design Add and Search Words Data Structure - LeetCode #211](https://leetcode.com/problems/design-add-and-search-words-data-structure/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. How does the wildcard '.' character change the search strategy compared to a regular Trie?
2. When you encounter a '.', what are your options, and how do you explore them all?
3. What underlying data structure would efficiently support both exact matches and wildcard searches?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Building on Trie Foundation
> **Guided Question:** How does this problem extend the basic Trie implementation, and what new challenges does the wildcard introduce?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Key Insight:** This is a Trie problem with wildcard pattern matching.

**Extensions from Basic Trie:**
- `addWord`: Identical to Trie insert operation
- `search`: Must handle '.' wildcard that can match any single character

**Wildcard Challenge:** 
When encountering '.', you can't follow a single path - you must explore ALL possible child nodes at that position. This transforms the search from a simple traversal into a backtracking/recursive exploration.
</details>

#### Step 2: Wildcard Search Strategy
> **Guided Question:** When you hit a '.' in your search pattern, how do you handle exploring multiple possible paths?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Backtracking Approach:**
1. **Regular character**: Follow single path (like normal Trie search)
2. **Wildcard '.'**: Try ALL child nodes recursively
3. **Success condition**: Any path leads to valid word completion
4. **Base cases**: End of pattern with isEndOfWord flag

**Implementation Pattern:**
```
search(node, pattern, index):
  if index == pattern.length: return node.isEndOfWord
  if pattern[index] == '.':
    for each child in node.children:
      if search(child, pattern, index+1): return true
    return false
  else:
    return search(node.children[pattern[index]], pattern, index+1)
```
</details>

#### Step 3: Optimization and Edge Cases
> **Guided Question:** What edge cases and optimizations should you consider for wildcard matching?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Critical Edge Cases:**
1. **All wildcards**: "..." should match any 3-letter word
2. **Mixed patterns**: "a.c" should match "abc", "adc", etc.
3. **Empty pattern**: Should return false (no words have zero length)
4. **No matching children**: Early termination when '.' has no child options

**Optimizations:**
1. **Early termination**: Return false if null node encountered
2. **Child existence check**: Skip null children during wildcard exploration
3. **Pattern length verification**: Ensure remaining pattern length matches possible paths

**Time Complexity**: O(N × 26^M) worst case, where N = number of nodes, M = number of wildcards
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the WordDictionary class from memory:

**Basic structure checklist:**
- [ ] Use TrieNode with children array and isEndOfWord flag
- [ ] Implement addWord using standard Trie insertion
- [ ] Initialize root node in constructor

**Search method checklist:**
- [ ] Define recursive helper with (node, word, index) parameters
- [ ] Base case: return node.isEndOfWord when index reaches word length
- [ ] Handle null node case (return false)
- [ ] Wildcard case: iterate through all children recursively
- [ ] Regular character case: follow single path if it exists

**Backtracking logic checklist:**
- [ ] For '.': try each existing child node
- [ ] Return true if ANY child path succeeds
- [ ] For regular char: check if specific child exists before recursing
- [ ] Proper index management for recursive calls

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does wildcard search require backtracking while regular Trie search doesn't?
2. **Complexity Analysis:** How does the number of wildcards affect worst-case time complexity?
3. **Trade-offs:** What are the space/time trade-offs of this approach vs. storing all words in a list?
4. **Pattern Recognition:** How does this backtracking pattern apply to other pattern matching problems?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding wildcard search challenges: ___/5
- [ ] Implementing recursive backtracking for '.': ___/5  
- [ ] Handling edge cases and null checks: ___/5
- [ ] Analyzing complexity with wildcard patterns: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Try the follow-up: How would you optimize for patterns with many consecutive wildcards?

**Problem Statement**: Design a data structure that supports adding new words and finding if a string matches any previously added string. Implement the WordDictionary class with addWord and search methods. The search method should support '.' as a wildcard that can match any letter.

**Examples:**
```
WordDictionary wordDictionary = new WordDictionary();
wordDictionary.addWord("bad");
wordDictionary.addWord("dad");
wordDictionary.addWord("mad");
wordDictionary.search("pad"); // return False
wordDictionary.search("bad"); // return True
wordDictionary.search(".ad"); // return True
wordDictionary.search("b.."); // return True
```

### Knowledge Prerequisites
- Trie data structure implementation
- Backtracking and recursive search
- Wildcard pattern matching
- DFS traversal in trees

### First Principles
Wildcard search in Trie requires:
- **Regular characters**: Follow single path like normal Trie
- **Wildcard '.'**: Explore all possible child paths
- **Backtracking**: Try multiple paths when wildcard encountered
- **Depth matching**: String length must match tree depth

### Problem-First Approach

**Step 1: Understand the Problem**
- Build Trie for efficient word storage
- Handle '.' wildcard that matches any single character
- Support both exact and pattern matching

**Step 2: Key Insights**
- Use standard Trie for addWord operation
- For search with '.', use DFS to explore all matching paths
- Recursively handle each character position

**Step 3: Algorithm Design**
1. Implement Trie with standard insertion
2. For search, use recursive DFS
3. When encountering '.', try all available children
4. Match string length with path depth

### Multiple Java Solutions

#### Solution 1: Trie with Recursive Wildcard Search (Optimal)
```java
class WordDictionary {
    class TrieNode {
        TrieNode[] children;
        boolean isEnd;
        
        TrieNode() {
            children = new TrieNode[26];
            isEnd = false;
        }
    }
    
    private TrieNode root;
    
    public WordDictionary() {
        root = new TrieNode();
    }
    
    public void addWord(String word) {
        TrieNode current = root;
        for (char c : word.toCharArray()) {
            int index = c - 'a';
            if (current.children[index] == null) {
                current.children[index] = new TrieNode();
            }
            current = current.children[index];
        }
        current.isEnd = true;
    }
    
    public boolean search(String word) {
        return searchHelper(word, 0, root);
    }
    
    private boolean searchHelper(String word, int index, TrieNode node) {
        if (index == word.length()) {
            return node.isEnd;
        }
        
        char c = word.charAt(index);
        
        if (c == '.') {
            // Try all possible children
            for (int i = 0; i < 26; i++) {
                if (node.children[i] != null && 
                    searchHelper(word, index + 1, node.children[i])) {
                    return true;
                }
            }
            return false;
        } else {
            // Regular character
            int charIndex = c - 'a';
            if (node.children[charIndex] == null) {
                return false;
            }
            return searchHelper(word, index + 1, node.children[charIndex]);
        }
    }
}
```

#### Solution 2: Trie with Iterative Approach for Regular Search
```java
class WordDictionary {
    class TrieNode {
        TrieNode[] children;
        boolean isEnd;
        
        TrieNode() {
            children = new TrieNode[26];
            isEnd = false;
        }
    }
    
    private TrieNode root;
    
    public WordDictionary() {
        root = new TrieNode();
    }
    
    public void addWord(String word) {
        TrieNode current = root;
        for (char c : word.toCharArray()) {
            int index = c - 'a';
            if (current.children[index] == null) {
                current.children[index] = new TrieNode();
            }
            current = current.children[index];
        }
        current.isEnd = true;
    }
    
    public boolean search(String word) {
        // Check if word contains wildcard
        if (word.contains(".")) {
            return searchWithWildcard(word, 0, root);
        } else {
            return searchExact(word);
        }
    }
    
    private boolean searchExact(String word) {
        TrieNode current = root;
        for (char c : word.toCharArray()) {
            int index = c - 'a';
            if (current.children[index] == null) {
                return false;
            }
            current = current.children[index];
        }
        return current.isEnd;
    }
    
    private boolean searchWithWildcard(String word, int index, TrieNode node) {
        if (index == word.length()) {
            return node.isEnd;
        }
        
        char c = word.charAt(index);
        
        if (c == '.') {
            for (int i = 0; i < 26; i++) {
                if (node.children[i] != null && 
                    searchWithWildcard(word, index + 1, node.children[i])) {
                    return true;
                }
            }
            return false;
        } else {
            int charIndex = c - 'a';
            if (node.children[charIndex] == null) {
                return false;
            }
            return searchWithWildcard(word, index + 1, node.children[charIndex]);
        }
    }
}
```

#### Solution 3: Using Stack for Iterative DFS
```java
class WordDictionary {
    class TrieNode {
        TrieNode[] children;
        boolean isEnd;
        
        TrieNode() {
            children = new TrieNode[26];
            isEnd = false;
        }
    }
    
    class SearchState {
        TrieNode node;
        int index;
        
        SearchState(TrieNode node, int index) {
            this.node = node;
            this.index = index;
        }
    }
    
    private TrieNode root;
    
    public WordDictionary() {
        root = new TrieNode();
    }
    
    public void addWord(String word) {
        TrieNode current = root;
        for (char c : word.toCharArray()) {
            int index = c - 'a';
            if (current.children[index] == null) {
                current.children[index] = new TrieNode();
            }
            current = current.children[index];
        }
        current.isEnd = true;
    }
    
    public boolean search(String word) {
        Stack<SearchState> stack = new Stack<>();
        stack.push(new SearchState(root, 0));
        
        while (!stack.isEmpty()) {
            SearchState state = stack.pop();
            TrieNode node = state.node;
            int index = state.index;
            
            if (index == word.length()) {
                if (node.isEnd) return true;
                continue;
            }
            
            char c = word.charAt(index);
            
            if (c == '.') {
                for (int i = 0; i < 26; i++) {
                    if (node.children[i] != null) {
                        stack.push(new SearchState(node.children[i], index + 1));
                    }
                }
            } else {
                int charIndex = c - 'a';
                if (node.children[charIndex] != null) {
                    stack.push(new SearchState(node.children[charIndex], index + 1));
                }
            }
        }
        
        return false;
    }
}
```

#### Solution 4: Optimized with Early Pruning
```java
class WordDictionary {
    class TrieNode {
        TrieNode[] children;
        boolean isEnd;
        int depth; // Track depth for optimization
        
        TrieNode(int depth) {
            children = new TrieNode[26];
            isEnd = false;
            this.depth = depth;
        }
    }
    
    private TrieNode root;
    private int maxLength; // Track maximum word length
    
    public WordDictionary() {
        root = new TrieNode(0);
        maxLength = 0;
    }
    
    public void addWord(String word) {
        maxLength = Math.max(maxLength, word.length());
        TrieNode current = root;
        for (int i = 0; i < word.length(); i++) {
            char c = word.charAt(i);
            int index = c - 'a';
            if (current.children[index] == null) {
                current.children[index] = new TrieNode(i + 1);
            }
            current = current.children[index];
        }
        current.isEnd = true;
    }
    
    public boolean search(String word) {
        // Early pruning
        if (word.length() > maxLength) {
            return false;
        }
        
        return searchHelper(word, 0, root);
    }
    
    private boolean searchHelper(String word, int index, TrieNode node) {
        if (index == word.length()) {
            return node.isEnd;
        }
        
        char c = word.charAt(index);
        
        if (c == '.') {
            for (int i = 0; i < 26; i++) {
                if (node.children[i] != null && 
                    searchHelper(word, index + 1, node.children[i])) {
                    return true;
                }
            }
            return false;
        } else {
            int charIndex = c - 'a';
            if (node.children[charIndex] == null) {
                return false;
            }
            return searchHelper(word, index + 1, node.children[charIndex]);
        }
    }
}
```

### Complexity Analysis
- **addWord**: Time O(m), Space O(m) where m is word length
- **search**: Time O(n×26^k) where n is number of nodes, k is number of '.' characters
- **Space**: O(ALPHABET_SIZE × N × M) for Trie structure

### Key Insights & Patterns
1. **Wildcard Handling**: DFS exploration for '.' characters
2. **Backtracking**: Try all possible paths for wildcards
3. **Early Termination**: Return true as soon as match found
4. **State Management**: Track position in word and current node

### Common Pitfalls
1. **Depth Mismatch**: Not checking if string length matches path depth
2. **Wildcard Logic**: Incorrect handling of '.' character
3. **Performance**: Not optimizing for worst-case wildcard scenarios
4. **Base Case**: Forgetting to check isEnd at word completion

### Follow-up Questions
1. How would you handle multiple wildcards like '*' (zero or more characters)?
2. What if you needed to support case-insensitive search?
3. How would you optimize for patterns with many consecutive dots?
4. Can you implement regex-like pattern matching?

---

### 14. Word Search II

**🔗 LeetCode Link:** [Word Search II - LeetCode #212](https://leetcode.com/problems/word-search-ii/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. How would you naively search for multiple words on a board, and what makes this inefficient?
2. How can you use a Trie to avoid redundant exploration when multiple words share common prefixes?
3. What information do you need to track during DFS to avoid revisiting cells and detect word completion?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Identifying the Core Challenge
> **Guided Question:** Why is searching for each word individually inefficient, and how does the Trie data structure address this?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Naive Inefficiency:** 
Searching for each word separately means exploring the same board paths multiple times, even when words share common prefixes.

**Trie Solution Insight:**
A Trie allows you to explore all words simultaneously! When traversing the board:
- Each DFS path corresponds to a Trie path
- Shared prefixes are explored only once
- Word completion detected when reaching Trie nodes marked as word endings

**Key Efficiency Gain:** Instead of W separate searches (W = number of words), you perform one unified search that discovers multiple words during a single board traversal.
</details>

#### Step 2: DFS with Trie Integration
> **Guided Question:** How do you modify standard DFS board traversal to work with a Trie for multiple word detection?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Enhanced DFS Algorithm:**
1. **Start from each board cell** with the Trie root
2. **Move in 4 directions** (up, down, left, right)
3. **Follow Trie path** based on current board character
4. **Mark visited cells** to prevent reuse within current word
5. **Detect word completion** when Trie node has isEndOfWord = true
6. **Backtrack** to explore other possibilities

**State Management:**
- **Board state**: Mark/unmark visited cells
- **Trie state**: Current node in Trie tree
- **Word collection**: Accumulate found words (avoid duplicates)

**Integration Logic**: Continue DFS only if current character exists as a child in current Trie node.
</details>

#### Step 3: Optimization Strategies
> **Guided Question:** What optimizations can make this Trie + DFS approach even more efficient?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Critical Optimizations:**

1. **Early Termination**: If current Trie node has no children, stop exploring this path
2. **Word Removal**: Remove found words from Trie to avoid duplicate results and enable branch pruning
3. **Leaf Pruning**: After finding a word, remove unnecessary Trie branches to reduce future exploration
4. **Bounds Checking**: Validate board boundaries before recursive calls

**Advanced Optimization:**
Remove words from Trie after finding them by setting `isEndOfWord = false` and pruning branches with no remaining words. This progressively shrinks the search space.

**Time Complexity**: O(M × N × 4^L) where M×N is board size, L is maximum word length, but Trie pruning significantly improves average case performance.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the Trie + DFS solution from memory:

**Trie setup checklist:**
- [ ] Build Trie from all words in the word list
- [ ] Use standard TrieNode with children array and isEndOfWord flag
- [ ] Insert all words during initialization

**DFS implementation checklist:**
- [ ] Start DFS from each board cell with Trie root
- [ ] Check bounds and visited status before recursing
- [ ] Verify current character exists in Trie before continuing
- [ ] Mark cell as visited, recurse to neighbors, then unmark (backtrack)
- [ ] Add to results when isEndOfWord is true
- [ ] Implement 4-directional movement (up, down, left, right)

**Optimization checklist:**
- [ ] Use visited matrix or modify board in-place for marking
- [ ] Avoid duplicate words in results (use Set or remove from Trie)
- [ ] Consider early termination when Trie path doesn't exist
- [ ] Proper backtracking to restore board state

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does the Trie approach significantly outperform searching for each word individually?
2. **Complexity Analysis:** How does the number of words and their shared prefixes affect performance?
3. **Trade-offs:** What are the space/time trade-offs of building a Trie vs. other approaches?
4. **Pattern Recognition:** How does this Trie + DFS pattern apply to other board + string collection problems?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding Trie + board DFS integration: ___/5
- [ ] Implementing backtracking with state management: ___/5  
- [ ] Optimizing with word removal and pruning: ___/5
- [ ] Analyzing complexity for different input scenarios: ___/5

#### Next Steps
- If confidence is 3+ on all: You've mastered advanced tree problems!
- If confidence is <3: Review the guided discovery section again
- Try the follow-up: How would you handle a dictionary with millions of words efficiently?

**Problem Statement**: Given an m x n board of characters and a list of strings words, return all words on the board. Each word must be constructed from letters of sequentially adjacent cells, where adjacent cells are horizontally or vertically neighboring. The same letter cell may not be used more than once in a word.

**Examples:**
```
Input: board = [["o","a","a","n"],["e","t","a","e"],["i","h","k","r"],["i","f","l","v"]], 
       words = ["oath","pea","eat","rain"]
Output: ["eat","oath"]
```

### Knowledge Prerequisites
- Trie data structure for efficient word storage
- DFS and backtracking algorithms
- 2D grid traversal techniques
- Optimization techniques for pruning search space

### First Principles
Efficient word search requires:
- **Trie for word storage**: Fast prefix checking and word validation
- **DFS with backtracking**: Explore all possible paths from each cell
- **Pruning**: Stop early when current path can't form any word
- **State management**: Track visited cells and current position

### Problem-First Approach

**Step 1: Understand the Problem**
- Find all words that can be formed on the board
- Each cell can be used only once per word
- Movement is only horizontal/vertical (4-directional)

**Step 2: Key Insights**
- Build Trie from word list for efficient prefix checking
- For each cell, start DFS if it matches Trie root children
- Use backtracking to explore all paths
- Remove found words from Trie to avoid duplicates

**Step 3: Algorithm Design**
1. Build Trie from all words
2. For each board cell, start DFS if it matches Trie
3. Use DFS with backtracking to explore paths
4. Mark cells as visited during path exploration
5. Collect words when reaching Trie end nodes

### Multiple Java Solutions

#### Solution 1: Trie + DFS with Backtracking (Optimal)
```java
import java.util.ArrayList;
import java.util.List;

class Solution {
    class TrieNode {
        TrieNode[] children;
        String word; // Store complete word at end node
        
        TrieNode() {
            children = new TrieNode[26];
            word = null;
        }
    }
    
    public List<String> findWords(char[][] board, String[] words) {
        // Build Trie
        TrieNode root = buildTrie(words);
        
        List<String> result = new ArrayList<>();
        int m = board.length, n = board[0].length;
        
        // Try starting from each cell
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                dfs(board, i, j, root, result);
            }
        }
        
        return result;
    }
    
    private void dfs(char[][] board, int i, int j, TrieNode node, List<String> result) {
        if (i < 0 || i >= board.length || j < 0 || j >= board[0].length) {
            return;
        }
        
        char c = board[i][j];
        if (c == '#' || node.children[c - 'a'] == null) {
            return; // Already visited or no matching path in Trie
        }
        
        node = node.children[c - 'a'];
        
        // Found a word
        if (node.word != null) {
            result.add(node.word);
            node.word = null; // Avoid duplicate
        }
        
        // Mark as visited
        board[i][j] = '#';
        
        // Explore 4 directions
        dfs(board, i + 1, j, node, result);
        dfs(board, i - 1, j, node, result);
        dfs(board, i, j + 1, node, result);
        dfs(board, i, j - 1, node, result);
        
        // Backtrack
        board[i][j] = c;
    }
    
    private TrieNode buildTrie(String[] words) {
        TrieNode root = new TrieNode();
        for (String word : words) {
            TrieNode current = root;
            for (char c : word.toCharArray()) {
                int index = c - 'a';
                if (current.children[index] == null) {
                    current.children[index] = new TrieNode();
                }
                current = current.children[index];
            }
            current.word = word;
        }
        return root;
    }
}
```

#### Solution 2: Optimized with Trie Pruning
```java
class Solution {
    class TrieNode {
        TrieNode[] children;
        String word;
        int refs; // Count of words using this node
        
        TrieNode() {
            children = new TrieNode[26];
            word = null;
            refs = 0;
        }
    }
    
    public List<String> findWords(char[][] board, String[] words) {
        TrieNode root = buildTrie(words);
        List<String> result = new ArrayList<>();
        
        for (int i = 0; i < board.length; i++) {
            for (int j = 0; j < board[0].length; j++) {
                dfs(board, i, j, root, result);
            }
        }
        
        return result;
    }
    
    private void dfs(char[][] board, int i, int j, TrieNode node, List<String> result) {
        if (i < 0 || i >= board.length || j < 0 || j >= board[0].length) {
            return;
        }
        
        char c = board[i][j];
        if (c == '#') return;
        
        TrieNode child = node.children[c - 'a'];
        if (child == null || child.refs < 1) {
            return; // No words use this path
        }
        
        if (child.word != null) {
            result.add(child.word);
            child.word = null;
            child.refs--; // Reduce reference count
        }
        
        board[i][j] = '#';
        
        dfs(board, i + 1, j, child, result);
        dfs(board, i - 1, j, child, result);
        dfs(board, i, j + 1, child, result);
        dfs(board, i, j - 1, child, result);
        
        board[i][j] = c;
    }
    
    private TrieNode buildTrie(String[] words) {
        TrieNode root = new TrieNode();
        for (String word : words) {
            TrieNode current = root;
            for (char c : word.toCharArray()) {
                int index = c - 'a';
                if (current.children[index] == null) {
                    current.children[index] = new TrieNode();
                }
                current = current.children[index];
                current.refs++; // Increment reference count
            }
            current.word = word;
        }
        return root;
    }
}
```

#### Solution 3: With Visited Array (Alternative Approach)
```java
class Solution {
    class TrieNode {
        TrieNode[] children;
        String word;
        
        TrieNode() {
            children = new TrieNode[26];
        }
    }
    
    private int[][] directions = { {0, 1}, {1, 0}, {0, -1}, {-1, 0} };
    
    public List<String> findWords(char[][] board, String[] words) {
        TrieNode root = buildTrie(words);
        Set<String> result = new HashSet<>(); // Use Set to avoid duplicates
        boolean[][] visited = new boolean[board.length][board[0].length];
        
        for (int i = 0; i < board.length; i++) {
            for (int j = 0; j < board[0].length; j++) {
                dfs(board, i, j, root, visited, result);
            }
        }
        
        return new ArrayList<>(result);
    }
    
    private void dfs(char[][] board, int i, int j, TrieNode node, 
                     boolean[][] visited, Set<String> result) {
        if (i < 0 || i >= board.length || j < 0 || j >= board[0].length || 
            visited[i][j]) {
            return;
        }
        
        char c = board[i][j];
        if (node.children[c - 'a'] == null) {
            return;
        }
        
        node = node.children[c - 'a'];
        if (node.word != null) {
            result.add(node.word);
        }
        
        visited[i][j] = true;
        
        for (int[] dir : directions) {
            int newI = i + dir[0];
            int newJ = j + dir[1];
            dfs(board, newI, newJ, node, visited, result);
        }
        
        visited[i][j] = false; // Backtrack
    }
    
    private TrieNode buildTrie(String[] words) {
        TrieNode root = new TrieNode();
        for (String word : words) {
            TrieNode current = root;
            for (char c : word.toCharArray()) {
                int index = c - 'a';
                if (current.children[index] == null) {
                    current.children[index] = new TrieNode();
                }
                current = current.children[index];
            }
            current.word = word;
        }
        return root;
    }
}
```

#### Solution 4: Iterative Approach with Stack
```java
class Solution {
    class TrieNode {
        TrieNode[] children;
        String word;
        
        TrieNode() {
            children = new TrieNode[26];
        }
    }
    
    class SearchState {
        int row, col;
        TrieNode node;
        Set<String> path; // Track visited cells
        
        SearchState(int row, int col, TrieNode node, Set<String> path) {
            this.row = row;
            this.col = col;
            this.node = node;
            this.path = new HashSet<>(path);
        }
    }
    
    public List<String> findWords(char[][] board, String[] words) {
        TrieNode root = buildTrie(words);
        Set<String> result = new HashSet<>();
        int[][] directions = { {0, 1}, {1, 0}, {0, -1}, {-1, 0} };
        
        for (int i = 0; i < board.length; i++) {
            for (int j = 0; j < board[0].length; j++) {
                char c = board[i][j];
                if (root.children[c - 'a'] != null) {
                    Stack<SearchState> stack = new Stack<>();
                    Set<String> visited = new HashSet<>();
                    visited.add(i + "," + j);
                    stack.push(new SearchState(i, j, root.children[c - 'a'], visited));
                    
                    while (!stack.isEmpty()) {
                        SearchState state = stack.pop();
                        
                        if (state.node.word != null) {
                            result.add(state.node.word);
                        }
                        
                        for (int[] dir : directions) {
                            int newRow = state.row + dir[0];
                            int newCol = state.col + dir[1];
                            String newKey = newRow + "," + newCol;
                            
                            if (newRow >= 0 && newRow < board.length && 
                                newCol >= 0 && newCol < board[0].length && 
                                !state.path.contains(newKey)) {
                                
                                char nextChar = board[newRow][newCol];
                                if (state.node.children[nextChar - 'a'] != null) {
                                    Set<String> newPath = new HashSet<>(state.path);
                                    newPath.add(newKey);
                                    stack.push(new SearchState(newRow, newCol, 
                                        state.node.children[nextChar - 'a'], newPath));
                                }
                            }
                        }
                    }
                }
            }
        }
        
        return new ArrayList<>(result);
    }
    
    private TrieNode buildTrie(String[] words) {
        TrieNode root = new TrieNode();
        for (String word : words) {
            TrieNode current = root;
            for (char c : word.toCharArray()) {
                int index = c - 'a';
                if (current.children[index] == null) {
                    current.children[index] = new TrieNode();
                }
                current = current.children[index];
            }
            current.word = word;
        }
        return root;
    }
}
```

### Complexity Analysis
- **Time Complexity**: O(M×N×4^L) where M×N is board size, L is max word length
- **Space Complexity**: O(K×L) for Trie where K is number of words
- **Optimization**: Pruning reduces average case significantly

### Key Insights & Patterns
1. **Trie Optimization**: Much faster than checking each word individually
2. **Backtracking**: Essential for exploring all possible paths
3. **Pruning**: Remove found words to avoid duplicates and improve performance
4. **State Management**: Careful handling of visited cells during recursion

### Common Pitfalls
1. **Duplicate Results**: Not handling multiple paths to same word
2. **Backtracking**: Forgetting to restore board state after recursion
3. **Boundary Checks**: Incorrect grid boundary validation
4. **Trie Construction**: Inefficient Trie building or traversal

### Follow-up Questions
1. How would you handle boards with millions of cells?
2. What if words could be formed in 8 directions (including diagonals)?
3. How would you optimize for repeated queries on the same board?
4. Can you solve this with limited memory when word list is huge?

---

## Tree Problem Patterns Summary

### Core Tree Patterns

#### 1. **Basic Tree Traversal**
- **DFS Patterns**: Preorder, inorder, postorder
- **BFS Pattern**: Level-order traversal
- **Applications**: Tree printing, validation, transformation

#### 2. **Recursive Tree Operations**
- **Structure**: Base case + recursive calls on children
- **Examples**: Height calculation, tree comparison, inversion
- **Key insight**: Most tree problems have natural recursive solutions

#### 3. **Path-Based Problems**
- **Path definition**: Sequence of connected nodes
- **Tracking**: Maintain path state during traversal
- **Applications**: Path sum, diameter, lowest common ancestor

#### 4. **BST-Specific Patterns**
- **In-order traversal**: Gives sorted sequence
- **Navigation**: Use comparison to determine direction
- **Validation**: Check BST property with bounds

#### 5. **Tree Construction**
- **From traversals**: Use properties of different traversal orders
- **Serialization**: Convert between tree and string representation
- **Key insight**: Multiple traversals can uniquely determine tree

#### 6. **Trie Patterns**
- **Prefix trees**: Efficient string storage and retrieval
- **Wildcard search**: DFS with backtracking
- **Applications**: Auto-complete, spell check, word games

### Complexity Patterns

#### Time Complexity
- **Simple traversal**: O(n) - visit each node once
- **Tree construction**: O(n) with efficient lookups
- **BST operations**: O(h) where h is height
- **Trie operations**: O(m) where m is string length
- **Complex search**: O(4^L) for backtracking in grids

#### Space Complexity
- **Recursion stack**: O(h) where h is tree height
- **Iterative with queue/stack**: O(w) where w is maximum width
- **Trie storage**: O(ALPHABET_SIZE × N × M)
- **Additional data structures**: Varies by problem

### Problem-Solving Strategies

#### 1. **Identify Tree Type**
- **Binary Tree**: General structure problems
- **BST**: Leverage ordering property
- **Trie**: String-based problems
- **N-ary Tree**: Generalize binary tree solutions

#### 2. **Choose Traversal Method**
- **DFS**: For most tree problems, natural recursion
- **BFS**: For level-based operations
- **In-order**: For BST problems needing sorted access
- **Custom**: For specific requirements (postorder for bottom-up)

#### 3. **Handle Edge Cases**
- **Empty tree**: Always check for null root
- **Single node**: Verify base cases work correctly
- **Unbalanced trees**: Consider worst-case scenarios
- **Large trees**: Be aware of stack overflow risks

#### 4. **Optimization Techniques**
- **Early termination**: Stop when answer found
- **Memoization**: Cache results for repeated subproblems
- **Pruning**: Skip impossible branches
- **Space optimization**: Iterative vs recursive trade-offs

### Interview Tips

#### 1. **Start Simple**
- Begin with recursive solution (usually most intuitive)
- Verify with small examples
- Consider edge cases early

#### 2. **Clarify Requirements**
- Tree structure (binary, BST, complete, etc.)
- Input/output format
- Constraints on values or tree size

#### 3. **Discuss Trade-offs**
- Time vs space complexity
- Recursive vs iterative approaches
- Different algorithms for same problem

#### 4. **Code Organization**
- Helper functions for complex logic
- Clear variable names and comments
- Consistent style and structure

#### 5. **Test Thoroughly**
- Empty tree, single node, balanced/unbalanced trees
- Minimum and maximum values
- Large inputs (discuss approach, don't necessarily implement)

### Advanced Considerations

#### 1. **Thread Safety**
- Tree modifications in concurrent environments
- Immutable vs mutable tree operations

#### 2. **Memory Management**
- Large trees that don't fit in memory
- Lazy loading and tree persistence

#### 3. **Performance Optimization**
- Cache-friendly tree layouts
- Vectorization for bulk operations

#### 4. **Specialized Trees**
- Self-balancing trees (AVL, Red-Black)
- Segment trees, Fenwick trees
- B-trees for disk storage

This comprehensive study guide covers all the essential tree problems from the Blind 75 list, providing multiple solution approaches, complexity analysis, and practical insights for each problem. The patterns and techniques covered here form the foundation for solving virtually any tree-related interview question.