# Complete Blind 75 LeetCode Study Guide - Java Edition

## Table of Contents

1. [Overview](#overview)
2. [Study Methodology](#study-methodology)
3. [Array Problems (10 problems)](#array-problems)
4. [String Problems (10 problems)](#string-problems) 
5. [Linked List Problems (6 problems)](#linked-list-problems)
6. [Tree Problems (14 problems)](#tree-problems)
7. [Dynamic Programming Problems (11 problems)](#dynamic-programming-problems)
8. [Graph Problems (8 problems)](#graph-problems)
9. [Binary Problems (5 problems)](#binary-problems)
10. [Interval Problems (5 problems)](#interval-problems)
11. [Matrix Problems (4 problems)](#matrix-problems)
12. [Heap Problems (3 problems)](#heap-problems)
13. [Master Patterns Summary](#master-patterns-summary)
14. [Final Study Tips](#final-study-tips)

---

## Overview

This comprehensive study guide covers all 75 essential LeetCode problems for technical interview preparation. Each problem includes:

- **Knowledge Prerequisites**: Core concepts needed
- **First Principles**: Fundamental approach to problem-solving
- **Problem-First Approach**: Step-by-step thinking process
- **Java Solutions**: Complete implementations with analysis
- **Time/Space Complexity**: Performance analysis
- **Key Insights**: Patterns and techniques for similar problems

The guide is designed to build **hands-on understanding** rather than forced memorization. Each solution teaches transferable problem-solving patterns that apply to many similar problems.

## Study Guide Files

### Individual Category Guides
- **[Array Problems](./blind75-array-study-guide.md)** - 10 problems covering two pointers, sliding window, hash maps
- **[String Problems](./string-blind75-study-guide.md)** - 10 problems covering sliding window, two pointers, pattern matching
- **[Linked List Problems](./linked_list_study_guide.md)** - 6 problems covering pointer manipulation and cycle detection
- **[Tree Problems](./tree_study_guide.md)** - 14 problems covering DFS, BFS, and tree algorithms
- **[Dynamic Programming Problems](./dp_study_guide.md)** - 11 problems covering optimization and counting patterns
- **[Graph Problems](./graph_study_guide.md)** - 8 problems covering traversal and connectivity algorithms
- **[Binary/Bit Manipulation Problems](./binary_study_guide.md)** - 5 problems covering bit operations and mathematical properties
- **[Interval Problems](./interval_study_guide.md)** - 5 problems covering scheduling and merging algorithms
- **[Matrix Problems](./matrix_study_guide.md)** - 4 problems covering 2D array manipulation and transformations
- **[Heap Problems](./heap_study_guide.md)** - 3 problems covering priority queues and streaming algorithms

### Summary
**Total:** 18,146 lines of comprehensive Java solutions and explanations across all 75 problems

---

## Study Methodology

### Learning Philosophy
1. **Problem-First Thinking**: Understand the problem deeply before jumping to solutions
2. **First Principles**: Learn the fundamental reasoning behind each approach
3. **Pattern Recognition**: Identify reusable techniques and when to apply them
4. **Progressive Complexity**: Start simple, then optimize and handle edge cases
5. **Hands-On Practice**: Implement solutions to build muscle memory

### How to Use This Guide
1. **Read problem statement** without looking at solution
2. **Identify category** and required knowledge
3. **Apply first principles** thinking
4. **Implement solution** in Java
5. **Analyze complexity** and optimize if possible
6. **Review patterns** and note for similar problems

---

## Array Problems

Arrays form the foundation of algorithmic problem-solving. These 10 problems cover essential array manipulation patterns that appear frequently in technical interviews.

### Core Array Patterns
- **Two Pointers**: For problems involving pairs or searching
- **Sliding Window**: For subarray problems
- **Hash Maps**: For lookup and frequency counting
- **Sorting**: For order-dependent problems
- **Binary Search**: For sorted array problems

### The 10 Array Problems:
1. **Two Sum** - Hash table pattern, complement thinking
2. **Best Time to Buy and Sell Stock** - Single-pass profit maximization
3. **Contains Duplicate** - Efficient duplicate detection
4. **Product of Array Except Self** - Prefix/suffix product computation
5. **Maximum Subarray** - Kadane's algorithm
6. **Maximum Product Subarray** - Handling negatives and zeros
7. **Find Minimum in Rotated Sorted Array** - Binary search adaptation
8. **Search in Rotated Sorted Array** - Binary search in rotated arrays
9. **3Sum** - Two-pointer technique with sorting
10. **Container With Most Water** - Greedy two-pointer optimization

Each array problem demonstrates fundamental techniques that transfer to hundreds of other problems. Master these patterns and you'll recognize similar problems instantly.

---

## String Problems

String manipulation is essential for many technical interviews. These 10 problems cover the most important string processing patterns.

### Core String Patterns
- **Sliding Window**: For substring problems
- **Two Pointers**: For palindrome and comparison problems
- **Hash Maps**: For character frequency and anagram problems
- **Stack**: For bracket matching and nested structures
- **Center Expansion**: For palindrome detection

### The 10 String Problems:
1. **Longest Substring Without Repeating Characters** - Sliding window with hash set
2. **Longest Repeating Character Replacement** - Sliding window with frequency tracking
3. **Minimum Window Substring** - Complex sliding window with multiple constraints
4. **Valid Anagram** - Character frequency comparison
5. **Group Anagrams** - Hash map grouping with canonical forms
6. **Valid Parentheses** - Stack-based bracket matching
7. **Valid Palindrome** - Two pointers with filtering
8. **Longest Palindromic Substring** - Center expansion and dynamic programming
9. **Palindromic Substrings** - Counting with center expansion
10. **Encode and Decode Strings** - Serialization with length-based encoding

String problems often involve multiple approaches. Learn to recognize when to use sliding window vs two pointers vs stack-based solutions.

---

## Linked List Problems

Linked lists test your understanding of pointer manipulation and memory management. These 6 problems cover all essential linked list patterns.

### Core Linked List Patterns
- **Two Pointers**: Fast/slow pointers for cycle detection
- **Dummy Nodes**: Simplify edge cases involving head changes
- **Reversal**: Three-pointer technique for in-place reversal
- **Merging**: Fundamental operation for combining sorted lists

### The 6 Linked List Problems:
1. **Reverse a Linked List** - Fundamental pointer manipulation
2. **Detect Cycle in a Linked List** - Floyd's cycle detection algorithm
3. **Merge Two Sorted Lists** - Basic merging with dummy nodes
4. **Merge K Sorted Lists** - Advanced divide-and-conquer
5. **Remove Nth Node From End Of List** - Gap maintenance technique
6. **Reorder List** - Complex multi-step algorithm composition

Linked list problems build foundational pointer manipulation skills essential for more advanced data structures and algorithms.

---

## Tree Problems

Trees are naturally recursive structures, making them excellent for learning recursive thinking. These 14 problems cover all major tree algorithms and patterns.

### Core Tree Patterns
- **Recursive Traversal**: DFS patterns for tree exploration
- **Level Order**: BFS for level-by-level processing
- **Tree Construction**: Building trees from traversal arrays
- **Tree Validation**: Checking structural properties
- **Path Problems**: Finding and optimizing paths through trees

### The 14 Tree Problems:
1. **Maximum Depth of Binary Tree** - Basic recursion
2. **Same Tree** - Structural comparison
3. **Invert Binary Tree** - Tree transformation
4. **Binary Tree Maximum Path Sum** - Complex path optimization
5. **Binary Tree Level Order Traversal** - BFS implementation
6. **Serialize and Deserialize Binary Tree** - Tree encoding/decoding
7. **Subtree of Another Tree** - Pattern matching in trees
8. **Construct Binary Tree from Preorder and Inorder** - Tree reconstruction
9. **Validate Binary Search Tree** - BST property validation
10. **Kth Smallest Element in a BST** - In-order traversal optimization
11. **Lowest Common Ancestor of a BST** - BST-specific algorithms
12. **Implement Trie (Prefix Tree)** - String-based tree structure
13. **Add and Search Word** - Trie with wildcard support
14. **Word Search II** - Complex trie-based grid search

Tree problems develop recursive thinking skills that apply to many advanced algorithms and data structures.

---

## Dynamic Programming Problems

Dynamic programming is essential for optimization problems. These 11 problems teach the fundamental DP patterns and thinking process.

### Core DP Patterns
- **Linear DP**: Problems where state depends on previous few states
- **2D DP**: Two-sequence or constraint-based problems
- **Optimization DP**: Finding minimum/maximum values
- **Counting DP**: Counting number of ways
- **Boolean DP**: Yes/no decision problems

### The 11 DP Problems:
1. **Climbing Stairs** - Introduction to Fibonacci pattern
2. **Coin Change** - Unbounded knapsack optimization
3. **Longest Increasing Subsequence** - Subsequence optimization with binary search
4. **Longest Common Subsequence** - 2D DP for string comparison
5. **Word Break Problem** - String partitioning with constraints
6. **Combination Sum** - Backtracking vs DP distinction
7. **House Robber** - Constraint-based linear optimization
8. **House Robber II** - Circular constraint handling
9. **Decode Ways** - Path counting with validity constraints
10. **Unique Paths** - Grid traversal with mathematical insight
11. **Jump Game** - Reachability analysis (DP vs Greedy)

DP problems teach systematic problem decomposition and optimization techniques applicable to many complex problems.

---

## Graph Problems

Graphs model relationships and connections, appearing in many real-world applications. These 8 problems cover essential graph algorithms.

### Core Graph Patterns
- **Graph Traversal**: DFS and BFS for exploration
- **Cycle Detection**: Finding cycles in directed/undirected graphs
- **Topological Sort**: Ordering with dependencies
- **Connected Components**: Finding separate groups
- **Union-Find**: Efficient connectivity tracking

### The 8 Graph Problems:
1. **Clone Graph** - Graph traversal with node mapping
2. **Course Schedule** - Cycle detection and topological sorting
3. **Pacific Atlantic Water Flow** - Multi-source BFS/DFS
4. **Number of Islands** - Connected components in grids
5. **Longest Consecutive Sequence** - Implicit graph thinking
6. **Alien Dictionary** - Topological sort from string relationships
7. **Graph Valid Tree** - Tree validation properties
8. **Number of Connected Components** - Union-Find applications

Graph problems develop algorithmic thinking for modeling and solving relationship-based problems.

---

## Binary Problems

Binary manipulation optimizes many algorithms and enables elegant solutions. These 5 problems cover essential bit manipulation techniques.

### Core Binary Patterns
- **Bit Operations**: AND, OR, XOR for manipulation
- **Bit Counting**: Counting and extracting set bits
- **Mathematical Properties**: Using bit patterns for arithmetic
- **Optimization**: Space and time improvements through bit tricks

### The 5 Binary Problems:
1. **Sum of Two Integers** - Arithmetic without operators
2. **Number of 1 Bits** - Bit counting techniques
3. **Counting Bits** - Dynamic programming with bit patterns
4. **Missing Number** - XOR properties for finding missing elements
5. **Reverse Bits** - Bit manipulation for reversal

Binary problems teach low-level optimization techniques and mathematical properties of bit operations.

---

## Interval Problems

Interval processing appears in scheduling, calendar management, and range-based algorithms. These 5 problems cover interval manipulation patterns.

### Core Interval Patterns
- **Sorting**: By start time for merging, by end time for optimization
- **Merging**: Combining overlapping intervals
- **Greedy Algorithms**: Making locally optimal choices
- **Event Processing**: Handling start/end events

### The 5 Interval Problems:
1. **Insert Interval** - Merging with existing intervals
2. **Merge Intervals** - Combining overlapping ranges
3. **Non-overlapping Intervals** - Greedy optimization
4. **Meeting Rooms** - Basic overlap detection
5. **Meeting Rooms II** - Resource allocation with priority queues

Interval problems teach scheduling algorithms and resource optimization techniques.

---

## Matrix Problems

Matrix operations appear in image processing, game development, and mathematical computations. These 4 problems cover essential 2D array manipulation.

### Core Matrix Patterns
- **In-Place Modification**: Modifying matrices without extra space
- **Layer Processing**: Handling concentric matrix layers
- **Coordinate Transformation**: Mathematical mapping for rotations
- **DFS/BFS Traversal**: Path finding in 2D grids

### The 4 Matrix Problems:
1. **Set Matrix Zeroes** - In-place matrix modification
2. **Spiral Matrix** - Layer-by-layer processing
3. **Rotate Image** - Mathematical coordinate transformation
4. **Word Search** - DFS with backtracking in grids

Matrix problems develop spatial reasoning and 2D algorithm design skills.

---

## Heap Problems

Heaps enable efficient priority-based processing and streaming algorithms. These 3 problems cover essential heap patterns.

### Core Heap Patterns
- **Priority Management**: Always accessing highest/lowest priority elements
- **K-way Operations**: Efficiently handling multiple sorted sources
- **Streaming Algorithms**: Processing data as it arrives
- **Two Heaps**: Balancing elements for median-finding

### The 3 Heap Problems:
1. **Merge K Sorted Lists** - K-way merging with min-heap
2. **Top K Frequent Elements** - Priority-based selection
3. **Find Median from Data Stream** - Two heaps for balance

Heap problems teach priority-based algorithms and streaming data processing techniques.

---

## Master Patterns Summary

### Universal Problem-Solving Patterns

#### 1. Two Pointers
- **When to Use**: Array pairs, palindromes, sorted arrays
- **Variations**: Same direction, opposite direction, sliding window
- **Time Complexity**: Usually O(n), space O(1)

#### 2. Sliding Window
- **When to Use**: Subarray/substring problems with constraints
- **Variations**: Fixed size, variable size, multiple pointers
- **Optimization**: Expand right, contract left strategically

#### 3. Hash Tables
- **When to Use**: Lookups, frequency counting, complement finding
- **Variations**: Hash set for existence, hash map for counting
- **Trade-off**: O(1) lookup for O(n) space

#### 4. Binary Search
- **When to Use**: Sorted arrays, search space with ordering
- **Variations**: Find exact, find insertion point, find boundary
- **Key**: Maintain invariants, handle boundary conditions

#### 5. DFS/BFS
- **DFS**: Deep exploration, backtracking, recursive solutions
- **BFS**: Level-by-level, shortest path, state exploration
- **Choice**: Stack vs queue, recursive vs iterative

#### 6. Dynamic Programming
- **Recognition**: Optimal substructure, overlapping subproblems
- **Approaches**: Top-down (memoization), bottom-up (tabulation)
- **Optimization**: Space optimization through rolling arrays

#### 7. Greedy Algorithms
- **When to Use**: Local optimal choices lead to global optimum
- **Verification**: Prove greedy choice property
- **Examples**: Interval scheduling, Huffman coding

#### 8. Divide and Conquer
- **Pattern**: Divide problem, solve recursively, combine results
- **Examples**: Merge sort, quick sort, binary search trees
- **Analysis**: Master theorem for complexity

### Algorithm Complexity Patterns

#### Time Complexity Hierarchy
- **O(1)**: Hash table operations, array access
- **O(log n)**: Binary search, balanced tree operations
- **O(n)**: Linear scan, one-pass algorithms
- **O(n log n)**: Efficient sorting, divide and conquer
- **O(n²)**: Nested loops, bubble sort
- **O(2ⁿ)**: Exponential algorithms, brute force

#### Space Complexity Considerations
- **O(1)**: In-place algorithms, pointer manipulation
- **O(log n)**: Recursion stack, binary search
- **O(n)**: Linear data structures, hash tables
- **O(n²)**: 2D arrays, adjacency matrices

### Problem Recognition Patterns

#### Optimization Problems
- **Keywords**: Maximum, minimum, optimal, best
- **Techniques**: DP, greedy, binary search
- **Example**: Maximum subarray, coin change

#### Counting Problems
- **Keywords**: Number of ways, count, combinations
- **Techniques**: DP, combinatorics, DFS with memoization
- **Example**: Climbing stairs, decode ways

#### Search Problems
- **Keywords**: Find, locate, exists, contains
- **Techniques**: Binary search, DFS/BFS, hash tables
- **Example**: Two sum, word search

#### Ordering Problems
- **Keywords**: Sort, arrange, sequence, order
- **Techniques**: Sorting algorithms, topological sort
- **Example**: Course schedule, alien dictionary

---

## Final Study Tips

### Progressive Learning Strategy

#### Phase 1: Foundation (Weeks 1-2)
1. **Array and String Problems**: Build basic algorithm intuition
2. **Two Pointers and Sliding Window**: Master fundamental techniques
3. **Hash Tables**: Learn lookup and frequency patterns

#### Phase 2: Structures (Weeks 3-4)
1. **Linked Lists**: Develop pointer manipulation skills
2. **Trees**: Build recursive thinking
3. **Basic DP**: Understand optimization principles

#### Phase 3: Advanced (Weeks 5-6)
1. **Graphs**: Master traversal and connectivity algorithms
2. **Advanced DP**: Handle complex state transitions
3. **Specialized Patterns**: Binary manipulation, intervals, matrices

#### Phase 4: Integration (Weeks 7-8)
1. **Mixed Practice**: Solve problems without category hints
2. **Optimization**: Focus on space/time improvements
3. **Interview Simulation**: Practice explaining solutions clearly

### Implementation Best Practices

#### Code Quality
1. **Clear Variable Names**: Use descriptive names
2. **Edge Case Handling**: Always consider boundary conditions
3. **Comments**: Explain non-obvious logic
4. **Modularity**: Break complex solutions into helper methods

#### Debugging Strategy
1. **Test Small Examples**: Verify logic with simple cases
2. **Trace Execution**: Step through algorithm mentally
3. **Check Invariants**: Ensure conditions hold throughout
4. **Boundary Testing**: Test edge cases thoroughly

#### Interview Communication
1. **Think Out Loud**: Explain your reasoning process
2. **Start Simple**: Begin with brute force, then optimize
3. **Discuss Trade-offs**: Explain space vs time decisions
4. **Ask Questions**: Clarify requirements and constraints

### Common Pitfalls to Avoid

#### Algorithmic Mistakes
1. **Off-by-One Errors**: Careful with array indices
2. **Integer Overflow**: Consider large input values
3. **Null Pointer Exceptions**: Always check for null
4. **Infinite Loops**: Ensure termination conditions

#### Interview Mistakes
1. **Jumping to Code**: Think through approach first
2. **Ignoring Edge Cases**: Consider empty inputs, single elements
3. **Not Testing**: Walk through solution with examples
4. **Poor Communication**: Explain while coding

### Memory Techniques

#### Pattern Association
- **Two Sum → Hash Map**: Complement lookup pattern
- **Linked List → Two Pointers**: Fast/slow for cycles
- **Tree → Recursion**: Natural recursive structure
- **DP → Memoization**: Avoid recomputation

#### Visual Memory
- **Draw Examples**: Visualize data structures and transformations
- **State Diagrams**: Map out DP state transitions
- **Flow Charts**: Outline algorithm decision points

#### Spaced Repetition
1. **Day 1**: Learn new pattern
2. **Day 3**: Review and practice
3. **Day 7**: Apply to new problems
4. **Day 21**: Test retention and mastery

---

## Conclusion

The Blind 75 problems represent fundamental algorithmic patterns that appear throughout computer science and software engineering. By mastering these patterns through first-principles thinking and hands-on practice, you'll develop the problem-solving intuition needed for technical interviews and real-world programming challenges.

Remember: The goal isn't to memorize solutions, but to understand the underlying patterns and reasoning that make these solutions work. This deep understanding will serve you well beyond any single interview or coding challenge.

**Key Success Factors:**
1. **Understand, don't memorize**: Focus on the "why" behind each solution
2. **Practice regularly**: Implement solutions multiple times until patterns become natural
3. **Connect patterns**: See how techniques transfer between different problems
4. **Communicate clearly**: Practice explaining your thought process out loud
5. **Stay curious**: Always ask "Is there a better way?" and explore optimizations

This comprehensive guide provides the foundation for algorithmic thinking that will serve you throughout your programming career. Use it as a reference, but more importantly, use it as a launching point for deeper exploration and understanding of computer science fundamentals.

Good luck with your studies and interviews!