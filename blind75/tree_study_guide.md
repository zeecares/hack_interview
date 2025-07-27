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
```java
class TreeNode {
    int val;
    TreeNode left;
    TreeNode right;
    
    TreeNode() {}
    TreeNode(int val) { this.val = val; }
    TreeNode(int val, TreeNode left, TreeNode right) {
        this.val = val;
        this.left = left;
        this.right = right;
    }
}
```

### Trie Node Definition
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

---

## Tree Traversal Patterns

### 1. Depth-First Search (DFS) Recursion
```java
void dfs(TreeNode node) {
    if (node == null) return;
    
    // Pre-order: process node before children
    process(node);
    dfs(node.left);
    dfs(node.right);
}
```

### 2. Breadth-First Search (BFS) Level Order
```java
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

### 3. In-order Traversal (for BST)
```java
void inorder(TreeNode node, List<Integer> result) {
    if (node == null) return;
    
    inorder(node.left, result);
    result.add(node.val);  // Process in sorted order for BST
    inorder(node.right, result);
}
```

---

## The 14 Tree Problems

### 1. Maximum Depth of Binary Tree

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

#### Solution 2: Iterative BFS with Level Tracking
```java
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

#### Solution 3: Iterative DFS with Stack
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

#### Solution 2: Iterative with Stack
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

#### Solution 3: BFS with Queue
```java
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

#### Solution 4: Serialization Approach
```java
public boolean isSameTree(TreeNode p, TreeNode q) {
    return serialize(p).equals(serialize(q));
}

private String serialize(TreeNode node) {
    if (node == null) return "#";
    return node.val + "," + serialize(node.left) + "," + serialize(node.right);
}
```

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

#### Solution 2: Recursive with Direct Swap
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

#### Solution 3: Iterative with Queue (BFS)
```java
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

#### Solution 4: Iterative with Stack (DFS)
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

#### Solution 2: Using Array to Avoid Global Variable
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

#### Solution 3: Bottom-Up with Result Class
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
    
    private int[][] directions = {{0, 1}, {1, 0}, {0, -1}, {-1, 0}};
    
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
        int[][] directions = {{0, 1}, {1, 0}, {0, -1}, {-1, 0}};
        
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