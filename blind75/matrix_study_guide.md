---
render_with_liquid: false
---

# Matrix Problems Study Guide - Blind 75 LeetCode Problems

## Table of Contents
1. [Introduction to Matrix Problems](#introduction-to-matrix-problems)
2. [Core Concepts and Prerequisites](#core-concepts-and-prerequisites)
3. [Problem-First Approach to Matrices](#problem-first-approach-to-matrices)
4. [The 4 Matrix Problems](#the-4-matrix-problems)
   - [1. Set Matrix Zeroes](#1-set-matrix-zeroes)
   - [2. Spiral Matrix](#2-spiral-matrix)
   - [3. Rotate Image](#3-rotate-image)
   - [4. Word Search](#4-word-search)
5. [Common Matrix Patterns Summary](#common-matrix-patterns-summary)
6. [Implementation Templates](#implementation-templates)

---

## Introduction to Matrix Problems

Matrix problems involve manipulating 2D arrays and grids, which are fundamental data structures in computer science. These problems test spatial reasoning, in-place manipulation skills, and understanding of coordinate transformations. They frequently appear in image processing, game development, and computational geometry contexts.

### Key Characteristics of Matrix Problems:
1. **2D Coordinate System**: Working with `(row, col)` or `(x, y)` coordinates
2. **Boundary Management**: Handling edges and corners of the matrix
3. **In-Place Operations**: Modifying matrix without extra space when possible
4. **Transformation Patterns**: Rotation, reflection, spiral traversal
5. **Search and Traversal**: DFS, BFS, and backtracking in 2D space

### Common Applications:
- **Image Processing**: Rotation, filtering, transformation operations
- **Game Development**: Grid-based games, pathfinding, collision detection
- **Computer Graphics**: Matrix transformations, coordinate systems
- **Data Processing**: 2D data analysis, spreadsheet operations
- **Computational Geometry**: Point-in-polygon, geometric transformations

---

## Core Concepts and Prerequisites

### 1. Matrix Representation and Access
<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Standard 2D array representation
int[][] matrix = new int[rows][cols];

// Access patterns
int value = matrix[row][col];        // Direct access
int rows = matrix.length;            // Number of rows
int cols = matrix[0].length;         // Number of columns (assuming non-empty)

// Boundary checking
boolean isValid(int row, int col, int[][] matrix) {
    return row >= 0 && row < matrix.length && 
           col >= 0 && col < matrix[0].length;
}
```
  </div>
  
  <div class="tab-content python">
```python
# Standard 2D list representation
matrix = [[0] * cols for _ in range(rows)]

# Access patterns
value = matrix[row][col]             # Direct access
rows = len(matrix)                   # Number of rows
cols = len(matrix[0])                # Number of columns (assuming non-empty)

# Boundary checking
def is_valid(row, col, matrix):
    return 0 <= row < len(matrix) and 0 <= col < len(matrix[0])
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Standard 2D array representation
const matrix = Array(rows).fill().map(() => Array(cols).fill(0));

// Access patterns
const value = matrix[row][col];      // Direct access
const rows = matrix.length;          // Number of rows
const cols = matrix[0].length;       // Number of columns (assuming non-empty)

// Boundary checking
function isValid(row, col, matrix) {
    return row >= 0 && row < matrix.length && 
           col >= 0 && col < matrix[0].length;
}
```
  </div>
</div>

### 2. Common Traversal Patterns
<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Row-wise traversal
for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
        // Process matrix[i][j]
    }
}

// Column-wise traversal
for (int j = 0; j < cols; j++) {
    for (int i = 0; i < rows; i++) {
        // Process matrix[i][j]
    }
}

// Diagonal traversal
for (int i = 0; i < Math.min(rows, cols); i++) {
    // Main diagonal: matrix[i][i]
    // Anti-diagonal: matrix[i][cols-1-i]
}
```
  </div>
  
  <div class="tab-content python">
```python
# Row-wise traversal
for i in range(rows):
    for j in range(cols):
        # Process matrix[i][j]
        pass

# Column-wise traversal
for j in range(cols):
    for i in range(rows):
        # Process matrix[i][j]
        pass

# Diagonal traversal
for i in range(min(rows, cols)):
    # Main diagonal: matrix[i][i]
    # Anti-diagonal: matrix[i][cols-1-i]
    pass
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Row-wise traversal
for (let i = 0; i < rows; i++) {
    for (let j = 0; j < cols; j++) {
        // Process matrix[i][j]
    }
}

// Column-wise traversal
for (let j = 0; j < cols; j++) {
    for (let i = 0; i < rows; i++) {
        // Process matrix[i][j]
    }
}

// Diagonal traversal
for (let i = 0; i < Math.min(rows, cols); i++) {
    // Main diagonal: matrix[i][i]
    // Anti-diagonal: matrix[i][cols-1-i]
}
```
  </div>
</div>

### 3. Direction Vectors for Movement
<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// 4-directional movement (up, right, down, left)
int[][] directions = { {-1, 0}, {0, 1}, {1, 0}, {0, -1} };

// 8-directional movement (including diagonals)
int[][] directions8 = {
    {-1, -1}, {-1, 0}, {-1, 1},
    {0, -1},           {0, 1},
    {1, -1},  {1, 0},  {1, 1}
};

// Usage in traversal
for (int[] dir : directions) {
    int newRow = currentRow + dir[0];
    int newCol = currentCol + dir[1];
    if (isValid(newRow, newCol, matrix)) {
        // Process neighbor
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# 4-directional movement (up, right, down, left)
directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]

# 8-directional movement (including diagonals)
directions8 = [
    (-1, -1), (-1, 0), (-1, 1),
    (0, -1),           (0, 1),
    (1, -1),  (1, 0),  (1, 1)
]

# Usage in traversal
for dr, dc in directions:
    new_row = current_row + dr
    new_col = current_col + dc
    if is_valid(new_row, new_col, matrix):
        # Process neighbor
        pass
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// 4-directional movement (up, right, down, left)
const directions = [[-1, 0], [0, 1], [1, 0], [0, -1]];

// 8-directional movement (including diagonals)
const directions8 = [
    [-1, -1], [-1, 0], [-1, 1],
    [0, -1],           [0, 1],
    [1, -1],  [1, 0],  [1, 1]
];

// Usage in traversal
for (const [dr, dc] of directions) {
    const newRow = currentRow + dr;
    const newCol = currentCol + dc;
    if (isValid(newRow, newCol, matrix)) {
        // Process neighbor
    }
}
```
  </div>
</div>

### 4. Coordinate Transformation Concepts
<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// 90-degree clockwise rotation
// (i, j) -> (j, n-1-i)

// 90-degree counterclockwise rotation  
// (i, j) -> (n-1-j, i)

// Horizontal flip (reflection across vertical axis)
// (i, j) -> (i, n-1-j)

// Vertical flip (reflection across horizontal axis)
// (i, j) -> (n-1-i, j)

// Transpose (reflection across main diagonal)
// (i, j) -> (j, i)
```
  </div>
  
  <div class="tab-content python">
```python
# 90-degree clockwise rotation
# (i, j) -> (j, n-1-i)

# 90-degree counterclockwise rotation  
# (i, j) -> (n-1-j, i)

# Horizontal flip (reflection across vertical axis)
# (i, j) -> (i, n-1-j)

# Vertical flip (reflection across horizontal axis)
# (i, j) -> (n-1-i, j)

# Transpose (reflection across main diagonal)
# (i, j) -> (j, i)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// 90-degree clockwise rotation
// (i, j) -> (j, n-1-i)

// 90-degree counterclockwise rotation  
// (i, j) -> (n-1-j, i)

// Horizontal flip (reflection across vertical axis)
// (i, j) -> (i, n-1-j)

// Vertical flip (reflection across horizontal axis)
// (i, j) -> (n-1-i, j)

// Transpose (reflection across main diagonal)
// (i, j) -> (j, i)
```
  </div>
</div>

### 5. In-Place Manipulation Techniques
<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Using markers for state tracking
final int MARKED = Integer.MAX_VALUE;

// Bit manipulation for flags
matrix[i][j] |= FLAG_BIT;  // Set flag
boolean hasFlag = (matrix[i][j] & FLAG_BIT) != 0;  // Check flag

// Using first row/column as metadata storage
// Store information in matrix[0][j] for column j
// Store information in matrix[i][0] for row i
```
  </div>
  
  <div class="tab-content python">
```python
# Using markers for state tracking
MARKED = float('inf')

# Bit manipulation for flags
matrix[i][j] |= FLAG_BIT  # Set flag
has_flag = (matrix[i][j] & FLAG_BIT) != 0  # Check flag

# Using first row/column as metadata storage
# Store information in matrix[0][j] for column j
# Store information in matrix[i][0] for row i
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Using markers for state tracking
const MARKED = Number.MAX_SAFE_INTEGER;

// Bit manipulation for flags
matrix[i][j] |= FLAG_BIT;  // Set flag
const hasFlag = (matrix[i][j] & FLAG_BIT) !== 0;  // Check flag

// Using first row/column as metadata storage
// Store information in matrix[0][j] for column j
// Store information in matrix[i][0] for row i
```
  </div>
</div>

---

## Problem-First Approach to Matrices

### How to Identify Matrix Problems:
1. **Input Format**: 2D arrays, grids, or coordinate-based problems
2. **Operations**: Rotation, traversal, modification, search in 2D space
3. **Constraints**: In-place requirements, space optimization needs
4. **Patterns**: Spiral movement, coordinate transformations, flood fill

### Steps to Solve Matrix Problems:
1. **Understand dimensions** - rows, columns, square vs rectangular
2. **Identify traversal pattern** - row-wise, spiral, layer-by-layer
3. **Plan coordinate transformations** - rotation, reflection formulas
4. **Handle boundaries** - edge cases for first/last rows/columns
5. **Optimize space usage** - in-place vs extra space trade-offs
6. **Consider direction vectors** - for search and neighbor exploration

### Common Patterns:
1. **In-Place Modification**: Use existing matrix space for metadata
2. **Layer Processing**: Handle matrix in concentric layers
3. **Coordinate Transformation**: Mathematical formulas for rotation/reflection
4. **Search with Backtracking**: DFS with state restoration
5. **Boundary Marking**: Use first row/column for flags and metadata

---

## The 4 Matrix Problems

### 1. Set Matrix Zeroes

**🔗 LeetCode Link:** [Set Matrix Zeroes - LeetCode #73](https://leetcode.com/problems/set-matrix-zeroes/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. Why can't you immediately set rows/columns to zero as you find zeros?
2. If you need to remember which rows and columns to zero, where could you store this information?
3. How can the matrix itself serve as storage space for metadata?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding the Core Challenge
> **Guided Question:** What happens if you start setting zeros immediately as you find them?

<details>
<summary>💭 Think about it, then click to reveal</summary>

If you set zeros immediately, you'll **lose information**:
- New zeros created by your operation will be indistinguishable from original zeros
- You might end up zeroing more rows/columns than intended
- Example: Finding a zero at (1,1) and immediately zeroing row 1 and column 1 would create new zeros that aren't "original"

**Key insight**: You need a **two-phase approach**: 
1. **Mark** which rows/columns need to be zeroed
2. **Apply** the zeros based on your marks
</details>

#### Step 2: Space-Efficient Marking Strategy
> **Guided Question:** If you can't use extra O(m+n) space for tracking, where in the matrix could you store the "mark" information?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Clever insight: **Use the first row and first column as flags!**

- `matrix[i][0] = 0` means "row i should be zeroed"
- `matrix[0][j] = 0` means "column j should be zeroed"

This achieves O(1) space complexity by repurposing existing matrix space.

**Special challenge**: What about the first row and column themselves? You need separate flags to track if they originally contained zeros.
</details>

#### Step 3: Handling the First Row/Column Edge Case
> **Guided Question:** Since you're using the first row and column as flags, how do you handle the case where they originally contained zeros?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Solution: **Use separate boolean variables**:
- `firstRowZero`: Track if first row originally had any zeros
- `firstColZero`: Track if first column originally had any zeros

Processing order matters:
1. Check if first row/column originally have zeros
2. Use first row/column as flags for the rest of the matrix
3. Process the main matrix based on flags
4. Finally handle first row/column based on the boolean variables
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Check if first row originally contains any zeros
- [ ] Check if first column originally contains any zeros
- [ ] Use first row/column as flags for main matrix
- [ ] Process main matrix based on flags
- [ ] Handle first row based on firstRowZero flag
- [ ] Handle first column based on firstColZero flag

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why is the processing order crucial in the O(1) space solution?
2. **Complexity Analysis:** What's the trade-off between the O(m+n) space and O(1) space approaches?
3. **Trade-offs:** In what scenarios might the simpler O(m+n) space approach be preferable?
4. **Pattern Recognition:** What other problems use the "repurpose matrix space for metadata" technique?

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

**Problem Statement**: Given an m×n matrix, if an element is 0, set its entire row and column to 0. Do it in-place.

**Example**:
```
Input:  [[1,1,1],      Output: [[1,0,1],
         [1,0,1],               [0,0,0],
         [1,1,1]]               [1,0,1]]
```

**Knowledge Prerequisites**:
- In-place matrix manipulation
- Using matrix elements as flags
- Two-pass algorithm design
- Space optimization techniques

**First Principles**:
To set entire rows and columns to zero:
1. First pass: identify which rows and columns should be zeroed
2. Second pass: actually set the zeros based on identified rows/columns
3. Challenge: store row/column information without extra space

**Problem-First Approach**:
1. **Identify zero positions**: Mark which rows and columns need to be zeroed
2. **Store metadata efficiently**: Use first row/column or constant space
3. **Apply transformations**: Set zeros in marked rows and columns
4. **Handle edge cases**: First row and column need special treatment

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: O(1) Space - Using First Row and Column as Flags
class Solution {
    public void setZeroes(int[][] matrix) {
        int rows = matrix.length;
        int cols = matrix[0].length;
        
        // Check if first row or first column should be zero
        boolean firstRowZero = false;
        boolean firstColZero = false;
        
        // Check first column
        for (int i = 0; i < rows; i++) {
            if (matrix[i][0] == 0) {
                firstColZero = true;
                break;
            }
        }
        
        // Check first row
        for (int j = 0; j < cols; j++) {
            if (matrix[0][j] == 0) {
                firstRowZero = true;
                break;
            }
        }
        
        // Use first row and column as flags for the rest of the matrix
        for (int i = 1; i < rows; i++) {
            for (int j = 1; j < cols; j++) {
                if (matrix[i][j] == 0) {
                    matrix[i][0] = 0;  // Mark row
                    matrix[0][j] = 0;  // Mark column
                }
            }
        }
        
        // Set zeros based on flags (skip first row and column for now)
        for (int i = 1; i < rows; i++) {
            for (int j = 1; j < cols; j++) {
                if (matrix[i][0] == 0 || matrix[0][j] == 0) {
                    matrix[i][j] = 0;
                }
            }
        }
        
        // Handle first row
        if (firstRowZero) {
            for (int j = 0; j < cols; j++) {
                matrix[0][j] = 0;
            }
        }
        
        // Handle first column
        if (firstColZero) {
            for (int i = 0; i < rows; i++) {
                matrix[i][0] = 0;
            }
        }
    }
}

// Approach 2: O(m + n) Space - Using Additional Arrays
class Solution {
    public void setZeroes(int[][] matrix) {
        int rows = matrix.length;
        int cols = matrix[0].length;
        
        boolean[] zeroRows = new boolean[rows];
        boolean[] zeroCols = new boolean[cols];
        
        // First pass: identify zero positions
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (matrix[i][j] == 0) {
                    zeroRows[i] = true;
                    zeroCols[j] = true;
                }
            }
        }
        
        // Second pass: set zeros
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (zeroRows[i] || zeroCols[j]) {
                    matrix[i][j] = 0;
                }
            }
        }
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: O(1) Space - Using First Row and Column as Flags
class Solution:
    def setZeroes(self, matrix):
        rows, cols = len(matrix), len(matrix[0])
        
        # Check if first row or first column should be zero
        first_row_zero = any(matrix[0][j] == 0 for j in range(cols))
        first_col_zero = any(matrix[i][0] == 0 for i in range(rows))
        
        # Use first row and column as flags for the rest of the matrix
        for i in range(1, rows):
            for j in range(1, cols):
                if matrix[i][j] == 0:
                    matrix[i][0] = 0  # Mark row
                    matrix[0][j] = 0  # Mark column
        
        # Set zeros based on flags (skip first row and column for now)
        for i in range(1, rows):
            for j in range(1, cols):
                if matrix[i][0] == 0 or matrix[0][j] == 0:
                    matrix[i][j] = 0
        
        # Handle first row
        if first_row_zero:
            for j in range(cols):
                matrix[0][j] = 0
        
        # Handle first column
        if first_col_zero:
            for i in range(rows):
                matrix[i][0] = 0

# Approach 2: O(m + n) Space - Using Additional Arrays
class Solution:
    def setZeroes(self, matrix):
        rows, cols = len(matrix), len(matrix[0])
        
        zero_rows = set()
        zero_cols = set()
        
        # First pass: identify zero positions
        for i in range(rows):
            for j in range(cols):
                if matrix[i][j] == 0:
                    zero_rows.add(i)
                    zero_cols.add(j)
        
        # Second pass: set zeros
        for i in range(rows):
            for j in range(cols):
                if i in zero_rows or j in zero_cols:
                    matrix[i][j] = 0
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: O(1) Space - Using First Row and Column as Flags
var setZeroes = function(matrix) {
    const rows = matrix.length;
    const cols = matrix[0].length;
    
    // Check if first row or first column should be zero
    let firstRowZero = matrix[0].some(val => val === 0);
    let firstColZero = false;
    
    for (let i = 0; i < rows; i++) {
        if (matrix[i][0] === 0) {
            firstColZero = true;
            break;
        }
    }
    
    // Use first row and column as flags for the rest of the matrix
    for (let i = 1; i < rows; i++) {
        for (let j = 1; j < cols; j++) {
            if (matrix[i][j] === 0) {
                matrix[i][0] = 0;  // Mark row
                matrix[0][j] = 0;  // Mark column
            }
        }
    }
    
    // Set zeros based on flags (skip first row and column for now)
    for (let i = 1; i < rows; i++) {
        for (let j = 1; j < cols; j++) {
            if (matrix[i][0] === 0 || matrix[0][j] === 0) {
                matrix[i][j] = 0;
            }
        }
    }
    
    // Handle first row
    if (firstRowZero) {
        for (let j = 0; j < cols; j++) {
            matrix[0][j] = 0;
        }
    }
    
    // Handle first column
    if (firstColZero) {
        for (let i = 0; i < rows; i++) {
            matrix[i][0] = 0;
        }
    }
};

// Approach 2: O(m + n) Space - Using Additional Arrays
var setZeroes = function(matrix) {
    const rows = matrix.length;
    const cols = matrix[0].length;
    
    const zeroRows = new Set();
    const zeroCols = new Set();
    
    // First pass: identify zero positions
    for (let i = 0; i < rows; i++) {
        for (let j = 0; j < cols; j++) {
            if (matrix[i][j] === 0) {
                zeroRows.add(i);
                zeroCols.add(j);
            }
        }
    }
    
    // Second pass: set zeros
    for (let i = 0; i < rows; i++) {
        for (let j = 0; j < cols; j++) {
            if (zeroRows.has(i) || zeroCols.has(j)) {
                matrix[i][j] = 0;
            }
        }
    }
};
```
  </div>
</div>

<p><strong>Complexity Analysis</strong>:</p>
<ul>
<li><strong>Time</strong>: O(m × n) for all approaches</li>
<li><strong>Space</strong>: O(1) for optimized approaches, O(m + n) for basic approach</li>
</ul>

**Key Insights & Patterns**:
- Use first row/column as metadata storage to achieve O(1) space
- Two-pass algorithm: mark positions first, then apply changes
- Handle first row/column separately since they store flags
- Foundation pattern for in-place matrix modifications

**State Transition Explanation**:
```
Pass 1: For each zero at (i,j), mark matrix[i][0] = 0 and matrix[0][j] = 0
Pass 2: For each (i,j), if matrix[i][0] == 0 OR matrix[0][j] == 0, set matrix[i][j] = 0
Special handling: Store first row/column zero flags separately
```

---

### 2. Spiral Matrix

**🔗 LeetCode Link:** [Spiral Matrix - LeetCode #54](https://leetcode.com/problems/spiral-matrix/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What's the pattern of movement in a spiral traversal (which directions and in what order)?
2. How do you know when to "turn" during spiral traversal?
3. What information do you need to track to avoid revisiting cells?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding the Spiral Pattern
> **Guided Question:** If you trace a spiral with your finger on a matrix, what's the sequence of directions you follow?

<details>
<summary>💭 Think about it, then click to reveal</summary>

The spiral pattern follows a consistent sequence:
1. **Right** → Move across the top row
2. **Down** → Move down the right column
3. **Left** → Move across the bottom row (if there are still rows)
4. **Up** → Move up the left column (if there are still columns)
5. **Repeat** for the inner "layer"

Key insight: You're processing the matrix in **concentric layers** from outside to inside.
</details>

#### Step 2: Boundary Management Strategy
> **Guided Question:** How can you track which parts of the matrix you've already visited without using extra space?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Efficient approach: **Use boundary pointers**
- `top`, `bottom`: Track valid row range
- `left`, `right`: Track valid column range

After traversing each direction:
- Move right: increment `top` (top row is done)
- Move down: decrement `right` (right column is done)
- Move left: decrement `bottom` (bottom row is done)
- Move up: increment `left` (left column is done)

This naturally "shrinks" the valid area inward.
</details>

#### Step 3: Handling Edge Cases
> **Guided Question:** What special cases do you need to handle when the matrix becomes very "thin" (single row or single column remaining)?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Critical edge cases:
1. **Single row remaining**: Skip the "move left" step (would duplicate elements)
2. **Single column remaining**: Skip the "move up" step (would duplicate elements)

Conditions to check:
- Before moving left: `if (top <= bottom)` 
- Before moving up: `if (left <= right)`

Without these checks, you'd traverse the same elements multiple times in the final layer.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Initialize boundary pointers (top, bottom, left, right)
- [ ] While boundaries are valid, process current layer:
- [ ] Move right across top row, then increment top
- [ ] Move down along right column, then decrement right
- [ ] Check if still have rows, then move left along bottom row, then decrement bottom
- [ ] Check if still have columns, then move up along left column, then increment left

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why do you need the boundary checks before moving left and up?
2. **Complexity Analysis:** What's the time and space complexity of the boundary pointer approach?
3. **Trade-offs:** How does this compare to using a visited array or direction vector approach?
4. **Pattern Recognition:** What other matrix traversal problems use layer-by-layer processing?

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

**Problem Statement**: Given an m×n matrix, return all elements of the matrix in spiral order (clockwise from outside to inside).

**Example**:
```
Input:  [[1,2,3],      Output: [1,2,3,6,9,8,7,4,5]
         [4,5,6],       
         [7,8,9]]       
```

**Knowledge Prerequisites**:
- Layer-by-layer processing
- Boundary management and updates
- Direction state machines
- Matrix traversal patterns

**First Principles**:
Spiral traversal follows a pattern:
1. Move right across top row
2. Move down along right column  
3. Move left across bottom row
4. Move up along left column
5. Repeat for inner layers

**Problem-First Approach**:
1. **Define boundaries**: top, bottom, left, right pointers
2. **Process each direction**: right → down → left → up
3. **Update boundaries**: shrink the traversal area after each direction
4. **Handle edge cases**: Single row, single column, empty matrix

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: Layer-by-Layer with Boundary Pointers
class Solution {
    public List<Integer> spiralOrder(int[][] matrix) {
        List<Integer> result = new ArrayList<>();
        if (matrix.length == 0 || matrix[0].length == 0) return result;
        
        int top = 0, bottom = matrix.length - 1;
        int left = 0, right = matrix[0].length - 1;
        
        while (top <= bottom && left <= right) {
            // Traverse right along top row
            for (int col = left; col <= right; col++) {
                result.add(matrix[top][col]);
            }
            top++;
            
            // Traverse down along right column
            for (int row = top; row <= bottom; row++) {
                result.add(matrix[row][right]);
            }
            right--;
            
            // Traverse left along bottom row (if we still have rows)
            if (top <= bottom) {
                for (int col = right; col >= left; col--) {
                    result.add(matrix[bottom][col]);
                }
                bottom--;
            }
            
            // Traverse up along left column (if we still have columns)
            if (left <= right) {
                for (int row = bottom; row >= top; row--) {
                    result.add(matrix[row][left]);
                }
                left++;
            }
        }
        
        return result;
    }
}

// Approach 2: Direction Vector with State Machine
class Solution {
    public List<Integer> spiralOrder(int[][] matrix) {
        List<Integer> result = new ArrayList<>();
        if (matrix.length == 0) return result;
        
        int rows = matrix.length, cols = matrix[0].length;
        boolean[][] visited = new boolean[rows][cols];
        
        // Direction vectors: right, down, left, up
        int[][] directions = { {0, 1}, {1, 0}, {0, -1}, {-1, 0} };
        int currentDirection = 0;
        
        int row = 0, col = 0;
        
        for (int i = 0; i < rows * cols; i++) {
            result.add(matrix[row][col]);
            visited[row][col] = true;
            
            // Calculate next position
            int nextRow = row + directions[currentDirection][0];
            int nextCol = col + directions[currentDirection][1];
            
            // Check if we need to turn (hit boundary or visited cell)
            if (nextRow < 0 || nextRow >= rows || nextCol < 0 || nextCol >= cols || 
                visited[nextRow][nextCol]) {
                currentDirection = (currentDirection + 1) % 4;
                nextRow = row + directions[currentDirection][0];
                nextCol = col + directions[currentDirection][1];
            }
            
            row = nextRow;
            col = nextCol;
        }
        
        return result;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: Layer-by-Layer with Boundary Pointers
class Solution:
    def spiral_order(self, matrix):
        if not matrix or not matrix[0]:
            return []
        
        result = []
        top, bottom = 0, len(matrix) - 1
        left, right = 0, len(matrix[0]) - 1
        
        while top <= bottom and left <= right:
            # Traverse right along top row
            for col in range(left, right + 1):
                result.append(matrix[top][col])
            top += 1
            
            # Traverse down along right column
            for row in range(top, bottom + 1):
                result.append(matrix[row][right])
            right -= 1
            
            # Traverse left along bottom row (if we still have rows)
            if top <= bottom:
                for col in range(right, left - 1, -1):
                    result.append(matrix[bottom][col])
                bottom -= 1
            
            # Traverse up along left column (if we still have columns)
            if left <= right:
                for row in range(bottom, top - 1, -1):
                    result.append(matrix[row][left])
                left += 1
        
        return result

# Approach 2: Direction Vector with State Machine
class Solution:
    def spiral_order(self, matrix):
        if not matrix:
            return []
        
        rows, cols = len(matrix), len(matrix[0])
        visited = [[False] * cols for _ in range(rows)]
        result = []
        
        # Direction vectors: right, down, left, up
        directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        current_direction = 0
        
        row, col = 0, 0
        
        for _ in range(rows * cols):
            result.append(matrix[row][col])
            visited[row][col] = True
            
            # Calculate next position
            dr, dc = directions[current_direction]
            next_row, next_col = row + dr, col + dc
            
            # Check if we need to turn (hit boundary or visited cell)
            if (next_row < 0 or next_row >= rows or 
                next_col < 0 or next_col >= cols or 
                visited[next_row][next_col]):
                current_direction = (current_direction + 1) % 4
                dr, dc = directions[current_direction]
                next_row, next_col = row + dr, col + dc
            
            row, col = next_row, next_col
        
        return result
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: Layer-by-Layer with Boundary Pointers
var spiralOrder = function(matrix) {
    if (matrix.length === 0 || matrix[0].length === 0) return [];
    
    const result = [];
    let top = 0, bottom = matrix.length - 1;
    let left = 0, right = matrix[0].length - 1;
    
    while (top <= bottom && left <= right) {
        // Traverse right along top row
        for (let col = left; col <= right; col++) {
            result.push(matrix[top][col]);
        }
        top++;
        
        // Traverse down along right column
        for (let row = top; row <= bottom; row++) {
            result.push(matrix[row][right]);
        }
        right--;
        
        // Traverse left along bottom row (if we still have rows)
        if (top <= bottom) {
            for (let col = right; col >= left; col--) {
                result.push(matrix[bottom][col]);
            }
            bottom--;
        }
        
        // Traverse up along left column (if we still have columns)
        if (left <= right) {
            for (let row = bottom; row >= top; row--) {
                result.push(matrix[row][left]);
            }
            left++;
        }
    }
    
    return result;
};

// Approach 2: Direction Vector with State Machine
var spiralOrder = function(matrix) {
    if (matrix.length === 0) return [];
    
    const rows = matrix.length, cols = matrix[0].length;
    const visited = Array(rows).fill().map(() => Array(cols).fill(false));
    const result = [];
    
    // Direction vectors: right, down, left, up
    const directions = [[0, 1], [1, 0], [0, -1], [-1, 0]];
    let currentDirection = 0;
    
    let row = 0, col = 0;
    
    for (let i = 0; i < rows * cols; i++) {
        result.push(matrix[row][col]);
        visited[row][col] = true;
        
        // Calculate next position
        const [dr, dc] = directions[currentDirection];
        let nextRow = row + dr;
        let nextCol = col + dc;
        
        // Check if we need to turn (hit boundary or visited cell)
        if (nextRow < 0 || nextRow >= rows || nextCol < 0 || nextCol >= cols || 
            visited[nextRow][nextCol]) {
            currentDirection = (currentDirection + 1) % 4;
            const [newDr, newDc] = directions[currentDirection];
            nextRow = row + newDr;
            nextCol = col + newDc;
        }
        
        row = nextRow;
        col = nextCol;
    }
    
    return result;
};
```
  </div>
</div>

<p><strong>Complexity Analysis</strong>:</p>
<ul>
<li><strong>Time</strong>: O(m × n) - visit each element once</li>
<li><strong>Space</strong>: O(1) excluding output array, O(m × n) for direction vector approach with visited array</li>
</ul>

**Key Insights & Patterns**:
- Layer-by-layer processing with boundary updates
- Direction state machine for complex traversals
- Handle single row/column edge cases separately
- Template for spiral and zigzag traversal patterns

**State Transition Explanation**:
```
For each layer (while boundaries valid):
  1. Move right: (row, left) to (row, right)
  2. Move down: (top+1, right) to (bottom, right)  
  3. Move left: (bottom, right-1) to (bottom, left) [if multiple rows]
  4. Move up: (bottom-1, left) to (top+1, left) [if multiple columns]
  5. Shrink boundaries: top++, right--, bottom--, left++
```

---

### 3. Rotate Image

**🔗 LeetCode Link:** [Rotate Image - LeetCode #48](https://leetcode.com/problems/rotate-image/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. If you rotate a point (i, j) by 90 degrees clockwise, what are its new coordinates?
2. How can you break down a 90-degree rotation into simpler transformations?
3. What's the challenge with doing this "in-place" without extra space?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding the Mathematical Transformation
> **Guided Question:** In an n×n matrix, if a point is at position (i, j), where does it end up after a 90-degree clockwise rotation?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Mathematical formula**: `(i, j) → (j, n-1-i)`

Visualization:
- Top row (i=0) becomes right column
- Right column (j=n-1) becomes bottom row  
- Bottom row (i=n-1) becomes left column
- Left column (j=0) becomes top row

Example for 3×3: (0,0) → (0,2), (0,1) → (1,2), (1,0) → (0,1)

But direct application is tricky in-place because you'd overwrite values you still need!
</details>

#### Step 2: Two-Step Transformation Approach
> **Guided Question:** How can you decompose a 90-degree clockwise rotation into two simpler operations?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Elegant decomposition**: 
1. **Transpose** the matrix (flip along main diagonal): `(i,j) → (j,i)`
2. **Reverse each row** (horizontal flip): `(i,j) → (i, n-1-j)`

Combined effect: `(i,j) → (j,i) → (j, n-1-i)` ✓

This is much easier to implement in-place because:
- Transpose: swap symmetric elements across diagonal
- Reverse: swap elements from both ends of each row
</details>

#### Step 3: Layer-by-Layer Rotation Alternative
> **Guided Question:** How could you rotate the matrix by processing it in concentric "layers" or "rings"?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Layer-by-layer approach**:
1. **Process outer layer first**: Rotate elements in outermost ring
2. **Work inward**: Process each concentric layer
3. **4-element cycles**: Each rotation involves 4 positions that cycle together

For each layer, rotate elements in groups of 4:
- Save `top` element
- `top = left`, `left = bottom`, `bottom = right`, `right = top`

This is more complex but gives deeper insight into the rotation mechanics.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist (Transpose + Reverse approach):**
- [ ] Transpose matrix: swap matrix[i][j] with matrix[j][i] for i < j
- [ ] Reverse each row: swap elements from both ends moving inward
- [ ] Ensure you don't double-swap elements during transpose
- [ ] Handle the square matrix constraint (n×n)

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does "transpose then reverse rows" achieve clockwise rotation?
2. **Complexity Analysis:** What are the time and space complexities of different approaches?
3. **Trade-offs:** When might the layer-by-layer approach be preferable to transpose+reverse?
4. **Pattern Recognition:** How do these techniques apply to other matrix transformation problems?

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

**Problem Statement**: Rotate an n×n 2D matrix representing an image by 90 degrees clockwise. Do it in-place.

**Example**:
```
Input:  [[1,2,3],      Output: [[7,4,1],
         [4,5,6],               [8,5,2],
         [7,8,9]]               [9,6,3]]
```

**Knowledge Prerequisites**:
- Matrix transformation mathematics
- In-place swapping techniques
- Coordinate geometry and rotation formulas
- Layer-by-layer processing

**First Principles**:
90-degree clockwise rotation can be achieved by:
1. **Mathematical approach**: `(i,j) → (j, n-1-i)`
2. **Two-step approach**: Transpose + horizontal flip
3. **Layer rotation**: Rotate elements in concentric layers

**Problem-First Approach**:
1. **Choose transformation method**: Direct formula vs two-step process
2. **Handle in-place requirement**: Careful swapping to avoid overwriting
3. **Process systematically**: Layer-by-layer or element-by-element
4. **Verify transformation**: Check rotation formula correctness

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: Transpose + Horizontal Flip (Most Intuitive)
class Solution {
    public void rotate(int[][] matrix) {
        int n = matrix.length;
        
        // Step 1: Transpose the matrix (flip along main diagonal)
        for (int i = 0; i < n; i++) {
            for (int j = i + 1; j < n; j++) {
                // Swap matrix[i][j] with matrix[j][i]
                int temp = matrix[i][j];
                matrix[i][j] = matrix[j][i];
                matrix[j][i] = temp;
            }
        }
        
        // Step 2: Flip horizontally (reverse each row)
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n / 2; j++) {
                // Swap matrix[i][j] with matrix[i][n-1-j]
                int temp = matrix[i][j];
                matrix[i][j] = matrix[i][n - 1 - j];
                matrix[i][n - 1 - j] = temp;
            }
        }
    }
}

// Approach 2: Direct Rotation Formula with 4-Element Cycles
class Solution {
    public void rotate(int[][] matrix) {
        int n = matrix.length;
        
        // Process each layer (concentric squares)
        for (int layer = 0; layer < n / 2; layer++) {
            int first = layer;
            int last = n - 1 - layer;
            
            // Rotate elements in current layer
            for (int i = first; i < last; i++) {
                int offset = i - first;
                
                // Save top element
                int top = matrix[first][i];
                
                // Top = Left
                matrix[first][i] = matrix[last - offset][first];
                
                // Left = Bottom
                matrix[last - offset][first] = matrix[last][last - offset];
                
                // Bottom = Right
                matrix[last][last - offset] = matrix[i][last];
                
                // Right = Top (saved)
                matrix[i][last] = top;
            }
        }
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: Transpose + Horizontal Flip (Most Intuitive)
class Solution:
    def rotate(self, matrix):
        n = len(matrix)
        
        # Step 1: Transpose the matrix (flip along main diagonal)
        for i in range(n):
            for j in range(i + 1, n):
                # Swap matrix[i][j] with matrix[j][i]
                matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
        
        # Step 2: Flip horizontally (reverse each row)
        for i in range(n):
            matrix[i].reverse()

# Approach 2: Direct Rotation Formula with 4-Element Cycles
class Solution:
    def rotate(self, matrix):
        n = len(matrix)
        
        # Process each layer (concentric squares)
        for layer in range(n // 2):
            first = layer
            last = n - 1 - layer
            
            # Rotate elements in current layer
            for i in range(first, last):
                offset = i - first
                
                # Save top element
                top = matrix[first][i]
                
                # Top = Left
                matrix[first][i] = matrix[last - offset][first]
                
                # Left = Bottom
                matrix[last - offset][first] = matrix[last][last - offset]
                
                # Bottom = Right
                matrix[last][last - offset] = matrix[i][last]
                
                # Right = Top (saved)
                matrix[i][last] = top

# Approach 3: Using List Comprehension (Pythonic)
class Solution:
    def rotate(self, matrix):
        n = len(matrix)
        
        # Transpose
        for i in range(n):
            for j in range(i, n):
                matrix[i][j], matrix[j][i] = matrix[j][i], matrix[i][j]
        
        # Reverse each row
        for row in matrix:
            row.reverse()
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: Transpose + Horizontal Flip (Most Intuitive)
var rotate = function(matrix) {
    const n = matrix.length;
    
    // Step 1: Transpose the matrix (flip along main diagonal)
    for (let i = 0; i < n; i++) {
        for (let j = i + 1; j < n; j++) {
            // Swap matrix[i][j] with matrix[j][i]
            [matrix[i][j], matrix[j][i]] = [matrix[j][i], matrix[i][j]];
        }
    }
    
    // Step 2: Flip horizontally (reverse each row)
    for (let i = 0; i < n; i++) {
        matrix[i].reverse();
    }
};

// Approach 2: Direct Rotation Formula with 4-Element Cycles
var rotate = function(matrix) {
    const n = matrix.length;
    
    // Process each layer (concentric squares)
    for (let layer = 0; layer < Math.floor(n / 2); layer++) {
        const first = layer;
        const last = n - 1 - layer;
        
        // Rotate elements in current layer
        for (let i = first; i < last; i++) {
            const offset = i - first;
            
            // Save top element
            const top = matrix[first][i];
            
            // Top = Left
            matrix[first][i] = matrix[last - offset][first];
            
            // Left = Bottom
            matrix[last - offset][first] = matrix[last][last - offset];
            
            // Bottom = Right
            matrix[last][last - offset] = matrix[i][last];
            
            // Right = Top (saved)
            matrix[i][last] = top;
        }
    }
};

// Approach 3: Functional Approach with Helper Functions
var rotate = function(matrix) {
    transpose(matrix);
    reverseRows(matrix);
};

function transpose(matrix) {
    const n = matrix.length;
    for (let i = 0; i < n; i++) {
        for (let j = i; j < n; j++) {
            [matrix[i][j], matrix[j][i]] = [matrix[j][i], matrix[i][j]];
        }
    }
}

function reverseRows(matrix) {
    matrix.forEach(row => row.reverse());
}
```
  </div>
</div>

<p><strong>Complexity Analysis</strong>:</p>
<ul>
<li><strong>Time</strong>: O(n²) for all approaches</li>
<li><strong>Space</strong>: O(1) for most approaches, O(n²) for visited tracking approach</li>
</ul>

**Key Insights & Patterns**:
- Two-step rotation: transpose + horizontal flip is most intuitive
- Layer-by-layer processing handles rotation systematically  
- Mathematical formula: `(i,j) → (j, n-1-i)` for 90° clockwise
- Foundation for general matrix transformations

**State Transition Explanation**:
```
Method 1 (Transpose + Flip):
  Step 1: (i,j) → (j,i) [transpose]
  Step 2: (i,j) → (i, n-1-j) [horizontal flip]
  
Method 2 (Layer rotation):
  For each layer, rotate 4-element cycles:
  top → right → bottom → left → top
```

---

### 4. Word Search

**🔗 LeetCode Link:** [Word Search - LeetCode #79](https://leetcode.com/problems/word-search/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What search algorithm would you use to explore all possible paths in a grid?
2. How do you ensure you don't use the same cell twice in a single word path?
3. What optimizations could help avoid exploring obviously wrong paths?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Recognizing the Search Pattern
> **Guided Question:** What type of search algorithm is most suitable for exploring all possible paths from a starting point?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Depth-First Search (DFS) with Backtracking** is ideal because:
- You need to explore all possible paths from each starting cell
- When a path doesn't work, you backtrack and try other directions
- You need to track visited cells to avoid cycles
- You can terminate early when a path is clearly wrong

This is a classic **DFS + Backtracking** problem pattern in 2D grids.
</details>

#### Step 2: State Management Challenge
> **Guided Question:** How do you track which cells are "visited" in the current path while allowing them to be used in different paths?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Key insight**: Visited state is **path-specific**, not global.

Efficient approach:
1. **Mark cell as visited** when entering it (e.g., temporarily change its value)
2. **Explore all 4 directions** recursively
3. **Restore original value** when backtracking (crucial!)

Alternative: Use a separate `visited` array, but remember to unmark when backtracking.

The "mark and restore" pattern is essential for correct backtracking.
</details>

#### Step 3: Optimization Strategies
> **Guided Question:** What optimizations can significantly reduce the search space?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Powerful optimizations**:
1. **Character frequency analysis**: If the board doesn't have enough of any character in the word, return false immediately
2. **Start from less frequent end**: If the last character of the word appears less frequently than the first, search the word backwards
3. **Early termination**: Stop as soon as any path succeeds

**Why frequency matters**: Starting from a rare character dramatically reduces the number of starting positions to explore.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Try each cell as a potential starting point
- [ ] Implement DFS with proper backtracking
- [ ] Mark cells as visited, then restore when backtracking
- [ ] Check bounds and character matching before recursing
- [ ] Use direction vectors for clean 4-direction movement
- [ ] Return immediately when word is found

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why is the "restore state" step crucial in backtracking?
2. **Complexity Analysis:** What's the worst-case time complexity and when does it occur?
3. **Trade-offs:** What are the pros and cons of modifying the board vs using a visited array?
4. **Pattern Recognition:** What other grid exploration problems use similar DFS + backtracking patterns?

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

**Problem Statement**: Given an m×n grid of characters and a string word, return true if the word exists in the grid. The word can be constructed from letters of sequentially adjacent cells (horizontally or vertically). The same letter cell may not be used more than once.

**Example**:
```
Input: board = [["A","B","C","E"],
                ["S","F","C","S"],  
                ["A","D","E","E"]], word = "ABCCED"
Output: true
```

**Knowledge Prerequisites**:
- Depth-First Search (DFS) in 2D grids
- Backtracking with state restoration
- Matrix traversal with direction vectors
- Pruning and optimization techniques

**First Principles**:
Word search in a grid requires:
1. Try starting from each cell that matches the first character
2. Use DFS to explore all possible paths from each starting point
3. Backtrack when a path doesn't lead to a solution
4. Mark visited cells and restore state during backtracking

**Problem-First Approach**:
1. **Find starting points**: Locate all cells matching first character of word
2. **DFS exploration**: From each starting point, explore all 4 directions
3. **Backtracking**: Mark cells as visited, then unmark when backtracking
4. **Optimization**: Early termination, character frequency pruning

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: Standard DFS with Backtracking
class Solution {
    private int[][] directions = { {-1, 0}, {1, 0}, {0, -1}, {0, 1} };
    
    public boolean exist(char[][] board, String word) {
        if (board == null || board.length == 0 || word == null || word.length() == 0) {
            return false;
        }
        
        int rows = board.length;
        int cols = board[0].length;
        
        // Try starting from each cell
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (board[i][j] == word.charAt(0)) {
                    if (dfs(board, word, i, j, 0)) {
                        return true;
                    }
                }
            }
        }
        
        return false;
    }
    
    private boolean dfs(char[][] board, String word, int row, int col, int index) {
        // Base case: found complete word
        if (index == word.length()) {
            return true;
        }
        
        // Boundary check and character match
        if (row < 0 || row >= board.length || col < 0 || col >= board[0].length ||
            board[row][col] != word.charAt(index)) {
            return false;
        }
        
        // Mark current cell as visited
        char temp = board[row][col];
        board[row][col] = '#'; // Mark as visited
        
        // Explore all 4 directions
        for (int[] dir : directions) {
            int newRow = row + dir[0];
            int newCol = col + dir[1];
            
            if (dfs(board, word, newRow, newCol, index + 1)) {
                board[row][col] = temp; // Restore before returning
                return true;
            }
        }
        
        // Backtrack: restore original character
        board[row][col] = temp;
        return false;
    }
}

// Approach 2: DFS with Separate Visited Array
class Solution {
    private int[][] directions = { {-1, 0}, {1, 0}, {0, -1}, {0, 1} };
    
    public boolean exist(char[][] board, String word) {
        int rows = board.length;
        int cols = board[0].length;
        boolean[][] visited = new boolean[rows][cols];
        
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (board[i][j] == word.charAt(0)) {
                    if (dfs(board, word, i, j, 0, visited)) {
                        return true;
                    }
                }
            }
        }
        
        return false;
    }
    
    private boolean dfs(char[][] board, String word, int row, int col, 
                       int index, boolean[][] visited) {
        if (index == word.length()) return true;
        
        if (row < 0 || row >= board.length || col < 0 || col >= board[0].length ||
            visited[row][col] || board[row][col] != word.charAt(index)) {
            return false;
        }
        
        visited[row][col] = true;
        
        for (int[] dir : directions) {
            int newRow = row + dir[0];
            int newCol = col + dir[1];
            
            if (dfs(board, word, newRow, newCol, index + 1, visited)) {
                visited[row][col] = false; // Restore state
                return true;
            }
        }
        
        visited[row][col] = false; // Backtrack
        return false;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: Standard DFS with Backtracking
class Solution:
    def exist(self, board, word):
        if not board or not board[0] or not word:
            return False
        
        rows, cols = len(board), len(board[0])
        directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        
        def dfs(row, col, index):
            # Base case: found complete word
            if index == len(word):
                return True
            
            # Boundary check and character match
            if (row < 0 or row >= rows or col < 0 or col >= cols or
                board[row][col] != word[index]):
                return False
            
            # Mark current cell as visited
            temp = board[row][col]
            board[row][col] = '#'  # Mark as visited
            
            # Explore all 4 directions
            for dr, dc in directions:
                if dfs(row + dr, col + dc, index + 1):
                    board[row][col] = temp  # Restore before returning
                    return True
            
            # Backtrack: restore original character
            board[row][col] = temp
            return False
        
        # Try starting from each cell
        for i in range(rows):
            for j in range(cols):
                if board[i][j] == word[0]:
                    if dfs(i, j, 0):
                        return True
        
        return False

# Approach 2: DFS with Separate Visited Array
class Solution:
    def exist(self, board, word):
        rows, cols = len(board), len(board[0])
        directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        
        def dfs(row, col, index, visited):
            if index == len(word):
                return True
            
            if (row < 0 or row >= rows or col < 0 or col >= cols or
                visited[row][col] or board[row][col] != word[index]):
                return False
            
            visited[row][col] = True
            
            for dr, dc in directions:
                if dfs(row + dr, col + dc, index + 1, visited):
                    visited[row][col] = False  # Restore state
                    return True
            
            visited[row][col] = False  # Backtrack
            return False
        
        for i in range(rows):
            for j in range(cols):
                if board[i][j] == word[0]:
                    visited = [[False] * cols for _ in range(rows)]
                    if dfs(i, j, 0, visited):
                        return True
        
        return False

# Approach 3: Optimized with Character Frequency Pruning
class Solution:
    def exist(self, board, word):
        from collections import Counter
        
        # Optimization: check if board has enough characters
        board_count = Counter(c for row in board for c in row)
        word_count = Counter(word)
        
        if not all(board_count[c] >= word_count[c] for c in word_count):
            return False
        
        # Optimization: start from less frequent character end
        if board_count[word[0]] > board_count[word[-1]]:
            word = word[::-1]
        
        rows, cols = len(board), len(board[0])
        directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        
        def dfs(row, col, index):
            if index == len(word):
                return True
            
            if (row < 0 or row >= rows or col < 0 or col >= cols or
                board[row][col] != word[index]):
                return False
            
            temp = board[row][col]
            board[row][col] = '#'
            
            for dr, dc in directions:
                if dfs(row + dr, col + dc, index + 1):
                    board[row][col] = temp
                    return True
            
            board[row][col] = temp
            return False
        
        for i in range(rows):
            for j in range(cols):
                if board[i][j] == word[0] and dfs(i, j, 0):
                    return True
        
        return False
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: Standard DFS with Backtracking
var exist = function(board, word) {
    if (!board || board.length === 0 || !word || word.length === 0) {
        return false;
    }
    
    const rows = board.length;
    const cols = board[0].length;
    const directions = [[-1, 0], [1, 0], [0, -1], [0, 1]];
    
    function dfs(row, col, index) {
        // Base case: found complete word
        if (index === word.length) {
            return true;
        }
        
        // Boundary check and character match
        if (row < 0 || row >= rows || col < 0 || col >= cols ||
            board[row][col] !== word[index]) {
            return false;
        }
        
        // Mark current cell as visited
        const temp = board[row][col];
        board[row][col] = '#'; // Mark as visited
        
        // Explore all 4 directions
        for (const [dr, dc] of directions) {
            if (dfs(row + dr, col + dc, index + 1)) {
                board[row][col] = temp; // Restore before returning
                return true;
            }
        }
        
        // Backtrack: restore original character
        board[row][col] = temp;
        return false;
    }
    
    // Try starting from each cell
    for (let i = 0; i < rows; i++) {
        for (let j = 0; j < cols; j++) {
            if (board[i][j] === word[0]) {
                if (dfs(i, j, 0)) {
                    return true;
                }
            }
        }
    }
    
    return false;
};

// Approach 2: DFS with Separate Visited Array
var exist = function(board, word) {
    const rows = board.length;
    const cols = board[0].length;
    const directions = [[-1, 0], [1, 0], [0, -1], [0, 1]];
    
    function dfs(row, col, index, visited) {
        if (index === word.length) return true;
        
        if (row < 0 || row >= rows || col < 0 || col >= cols ||
            visited[row][col] || board[row][col] !== word[index]) {
            return false;
        }
        
        visited[row][col] = true;
        
        for (const [dr, dc] of directions) {
            if (dfs(row + dr, col + dc, index + 1, visited)) {
                visited[row][col] = false; // Restore state
                return true;
            }
        }
        
        visited[row][col] = false; // Backtrack
        return false;
    }
    
    for (let i = 0; i < rows; i++) {
        for (let j = 0; j < cols; j++) {
            if (board[i][j] === word[0]) {
                const visited = Array(rows).fill().map(() => Array(cols).fill(false));
                if (dfs(i, j, 0, visited)) {
                    return true;
                }
            }
        }
    }
    
    return false;
};

// Approach 3: Optimized with Character Frequency Pruning
var exist = function(board, word) {
    // Count characters in board
    const boardCount = new Map();
    for (const row of board) {
        for (const char of row) {
            boardCount.set(char, (boardCount.get(char) || 0) + 1);
        }
    }
    
    // Count characters in word
    const wordCount = new Map();
    for (const char of word) {
        wordCount.set(char, (wordCount.get(char) || 0) + 1);
    }
    
    // Check if board has enough characters
    for (const [char, count] of wordCount) {
        if ((boardCount.get(char) || 0) < count) {
            return false;
        }
    }
    
    // Optimization: start from less frequent character end
    const firstCount = boardCount.get(word[0]) || 0;
    const lastCount = boardCount.get(word[word.length - 1]) || 0;
    if (lastCount < firstCount) {
        word = word.split('').reverse().join('');
    }
    
    const rows = board.length;
    const cols = board[0].length;
    const directions = [[-1, 0], [1, 0], [0, -1], [0, 1]];
    
    function dfs(row, col, index) {
        if (index === word.length) return true;
        
        if (row < 0 || row >= rows || col < 0 || col >= cols ||
            board[row][col] !== word[index]) {
            return false;
        }
        
        const temp = board[row][col];
        board[row][col] = '#';
        
        for (const [dr, dc] of directions) {
            if (dfs(row + dr, col + dc, index + 1)) {
                board[row][col] = temp;
                return true;
            }
        }
        
        board[row][col] = temp;
        return false;
    }
    
    for (let i = 0; i < rows; i++) {
        for (let j = 0; j < cols; j++) {
            if (board[i][j] === word[0] && dfs(i, j, 0)) {
                return true;
            }
        }
    }
    
    return false;
};
```
  </div>
</div>

<p><strong>Complexity Analysis</strong>:</p>
<ul>
<li><strong>Time</strong>: O(m × n × 4^L) where L is word length (worst case explores all paths)</li>
<li><strong>Space</strong>: O(L) for recursion stack depth</li>
</ul>

**Key Insights & Patterns**:
- Classic DFS with backtracking pattern in 2D grids
- State restoration is crucial for correctness
- Optimizations: character frequency, direction optimization
- Template for pathfinding and exploration problems in grids

**State Transition Explanation**:
```
For each starting position matching word[0]:
  DFS(position, wordIndex):
    if wordIndex == word.length: return true (found complete word)
    if out of bounds OR visited OR char mismatch: return false
    
    mark current cell as visited
    for each of 4 directions:
      if DFS(newPosition, wordIndex + 1): return true
    restore current cell (backtrack)
    return false
```

---

## Common Matrix Patterns Summary

### 1. In-Place Modification Pattern
- **Examples**: Set Matrix Zeroes, Rotate Image
- **Technique**: Use first row/column for metadata, careful swapping
- **Template**: Store flags in unused space, apply changes in second pass

### 2. Layer-by-Layer Processing Pattern
- **Examples**: Spiral Matrix, Rotate Image
- **Technique**: Process concentric layers from outside to inside
- **Template**: Track boundaries, update after processing each layer

### 3. Coordinate Transformation Pattern
- **Examples**: Rotate Image, Matrix Rotations
- **Technique**: Mathematical formulas for position mapping
- **Template**: `(i,j) → f(i,j)` where f is transformation function

### 4. DFS with Backtracking Pattern
- **Examples**: Word Search, Path Finding
- **Technique**: Mark visited, explore recursively, restore state
- **Template**: DFS with state marking and restoration

### 5. Boundary Management Pattern
- **Examples**: Spiral Matrix, Matrix Traversal
- **Technique**: Careful tracking of valid regions and boundaries
- **Template**: Maintain boundary pointers, update systematically

---

## Implementation Templates

### Basic Matrix Traversal Template
<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public void processMatrix(int[][] matrix) {
    int rows = matrix.length;
    int cols = matrix[0].length;
    
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            // Process matrix[i][j]
            processCell(matrix, i, j);
        }
    }
}

private boolean isValid(int row, int col, int[][] matrix) {
    return row >= 0 && row < matrix.length && 
           col >= 0 && col < matrix[0].length;
}
```
  </div>
  
  <div class="tab-content python">
```python
def process_matrix(matrix):
    rows = len(matrix)
    cols = len(matrix[0])
    
    for i in range(rows):
        for j in range(cols):
            # Process matrix[i][j]
            process_cell(matrix, i, j)

def is_valid(row, col, matrix):
    return 0 <= row < len(matrix) and 0 <= col < len(matrix[0])
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function processMatrix(matrix) {
    const rows = matrix.length;
    const cols = matrix[0].length;
    
    for (let i = 0; i < rows; i++) {
        for (let j = 0; j < cols; j++) {
            // Process matrix[i][j]
            processCell(matrix, i, j);
        }
    }
}

function isValid(row, col, matrix) {
    return row >= 0 && row < matrix.length && 
           col >= 0 && col < matrix[0].length;
}
```
  </div>
</div>

### In-Place Modification Template
<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public void modifyInPlace(int[][] matrix) {
    int rows = matrix.length, cols = matrix[0].length;
    
    // Phase 1: Mark elements that need modification
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            if (shouldModify(matrix[i][j])) {
                markForModification(matrix, i, j);
            }
        }
    }
    
    // Phase 2: Apply modifications based on marks
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            if (isMarked(matrix[i][j])) {
                applyModification(matrix, i, j);
            }
        }
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
def modify_in_place(matrix):
    rows, cols = len(matrix), len(matrix[0])
    
    # Phase 1: Mark elements that need modification
    for i in range(rows):
        for j in range(cols):
            if should_modify(matrix[i][j]):
                mark_for_modification(matrix, i, j)
    
    # Phase 2: Apply modifications based on marks
    for i in range(rows):
        for j in range(cols):
            if is_marked(matrix[i][j]):
                apply_modification(matrix, i, j)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function modifyInPlace(matrix) {
    const rows = matrix.length, cols = matrix[0].length;
    
    // Phase 1: Mark elements that need modification
    for (let i = 0; i < rows; i++) {
        for (let j = 0; j < cols; j++) {
            if (shouldModify(matrix[i][j])) {
                markForModification(matrix, i, j);
            }
        }
    }
    
    // Phase 2: Apply modifications based on marks
    for (let i = 0; i < rows; i++) {
        for (let j = 0; j < cols; j++) {
            if (isMarked(matrix[i][j])) {
                applyModification(matrix, i, j);
            }
        }
    }
}
```
  </div>
</div>

### Layer Processing Template
<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public void processLayers(int[][] matrix) {
    int n = matrix.length;
    
    for (int layer = 0; layer < n / 2; layer++) {
        int first = layer;
        int last = n - 1 - layer;
        
        // Process current layer
        processLayer(matrix, first, last);
    }
}

private void processLayer(int[][] matrix, int first, int last) {
    for (int i = first; i < last; i++) {
        int offset = i - first;
        
        // Process 4 elements in the layer cycle
        processLayerElements(matrix, first, last, i, offset);
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
def process_layers(matrix):
    n = len(matrix)
    
    for layer in range(n // 2):
        first = layer
        last = n - 1 - layer
        
        # Process current layer
        process_layer(matrix, first, last)

def process_layer(matrix, first, last):
    for i in range(first, last):
        offset = i - first
        
        # Process 4 elements in the layer cycle
        process_layer_elements(matrix, first, last, i, offset)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function processLayers(matrix) {
    const n = matrix.length;
    
    for (let layer = 0; layer < Math.floor(n / 2); layer++) {
        const first = layer;
        const last = n - 1 - layer;
        
        // Process current layer
        processLayer(matrix, first, last);
    }
}

function processLayer(matrix, first, last) {
    for (let i = first; i < last; i++) {
        const offset = i - first;
        
        // Process 4 elements in the layer cycle
        processLayerElements(matrix, first, last, i, offset);
    }
}
```
  </div>
</div>

### DFS with Backtracking Template
<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public boolean searchMatrix(char[][] board, String target) {
    int rows = board.length, cols = board[0].length;
    
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            if (dfs(board, target, i, j, 0)) {
                return true;
            }
        }
    }
    
    return false;
}

private boolean dfs(char[][] board, String target, int row, int col, int index) {
    // Base cases
    if (index == target.length()) return true;
    if (!isValid(row, col, board) || board[row][col] != target.charAt(index)) {
        return false;
    }
    
    // Mark as visited
    char temp = board[row][col];
    board[row][col] = '#';
    
    // Explore 4 directions
    int[][] directions = { {-1, 0}, {1, 0}, {0, -1}, {0, 1} };
    for (int[] dir : directions) {
        if (dfs(board, target, row + dir[0], col + dir[1], index + 1)) {
            board[row][col] = temp; // Restore
            return true;
        }
    }
    
    // Backtrack
    board[row][col] = temp;
    return false;
}
```
  </div>
  
  <div class="tab-content python">
```python
def search_matrix(board, target):
    rows, cols = len(board), len(board[0])
    directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    
    def dfs(row, col, index):
        # Base cases
        if index == len(target):
            return True
        if not is_valid(row, col, board) or board[row][col] != target[index]:
            return False
        
        # Mark as visited
        temp = board[row][col]
        board[row][col] = '#'
        
        # Explore 4 directions
        for dr, dc in directions:
            if dfs(row + dr, col + dc, index + 1):
                board[row][col] = temp  # Restore
                return True
        
        # Backtrack
        board[row][col] = temp
        return False
    
    for i in range(rows):
        for j in range(cols):
            if dfs(i, j, 0):
                return True
    
    return False
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function searchMatrix(board, target) {
    const rows = board.length, cols = board[0].length;
    const directions = [[-1, 0], [1, 0], [0, -1], [0, 1]];
    
    function dfs(row, col, index) {
        // Base cases
        if (index === target.length) return true;
        if (!isValid(row, col, board) || board[row][col] !== target[index]) {
            return false;
        }
        
        // Mark as visited
        const temp = board[row][col];
        board[row][col] = '#';
        
        // Explore 4 directions
        for (const [dr, dc] of directions) {
            if (dfs(row + dr, col + dc, index + 1)) {
                board[row][col] = temp; // Restore
                return true;
            }
        }
        
        // Backtrack
        board[row][col] = temp;
        return false;
    }
    
    for (let i = 0; i < rows; i++) {
        for (let j = 0; j < cols; j++) {
            if (dfs(i, j, 0)) {
                return true;
            }
        }
    }
    
    return false;
}
```
  </div>
</div>

### Spiral Traversal Template
<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public List<Integer> spiralTraversal(int[][] matrix) {
    List<Integer> result = new ArrayList<>();
    if (matrix.length == 0) return result;
    
    int top = 0, bottom = matrix.length - 1;
    int left = 0, right = matrix[0].length - 1;
    
    while (top <= bottom && left <= right) {
        // Traverse right
        for (int col = left; col <= right; col++) {
            result.add(matrix[top][col]);
        }
        top++;
        
        // Traverse down
        for (int row = top; row <= bottom; row++) {
            result.add(matrix[row][right]);
        }
        right--;
        
        // Traverse left (if still have rows)
        if (top <= bottom) {
            for (int col = right; col >= left; col--) {
                result.add(matrix[bottom][col]);
            }
            bottom--;
        }
        
        // Traverse up (if still have columns)
        if (left <= right) {
            for (int row = bottom; row >= top; row--) {
                result.add(matrix[row][left]);
            }
            left++;
        }
    }
    
    return result;
}
```
  </div>
  
  <div class="tab-content python">
```python
def spiral_traversal(matrix):
    if not matrix:
        return []
    
    result = []
    top, bottom = 0, len(matrix) - 1
    left, right = 0, len(matrix[0]) - 1
    
    while top <= bottom and left <= right:
        # Traverse right
        for col in range(left, right + 1):
            result.append(matrix[top][col])
        top += 1
        
        # Traverse down
        for row in range(top, bottom + 1):
            result.append(matrix[row][right])
        right -= 1
        
        # Traverse left (if still have rows)
        if top <= bottom:
            for col in range(right, left - 1, -1):
                result.append(matrix[bottom][col])
            bottom -= 1
        
        # Traverse up (if still have columns)
        if left <= right:
            for row in range(bottom, top - 1, -1):
                result.append(matrix[row][left])
            left += 1
    
    return result
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function spiralTraversal(matrix) {
    if (matrix.length === 0) return [];
    
    const result = [];
    let top = 0, bottom = matrix.length - 1;
    let left = 0, right = matrix[0].length - 1;
    
    while (top <= bottom && left <= right) {
        // Traverse right
        for (let col = left; col <= right; col++) {
            result.push(matrix[top][col]);
        }
        top++;
        
        // Traverse down
        for (let row = top; row <= bottom; row++) {
            result.push(matrix[row][right]);
        }
        right--;
        
        // Traverse left (if still have rows)
        if (top <= bottom) {
            for (let col = right; col >= left; col--) {
                result.push(matrix[bottom][col]);
            }
            bottom--;
        }
        
        // Traverse up (if still have columns)
        if (left <= right) {
            for (let row = bottom; row >= top; row--) {
                result.push(matrix[row][left]);
            }
            left++;
        }
    }
    
    return result;
}
```
  </div>
</div>

## Final Tips for Matrix Problems

### Recognition Patterns:
1. **Keywords**: "matrix", "grid", "2D array", "rotate", "spiral", "in-place"
2. **Input Format**: 2D arrays, coordinate pairs, grid representations
3. **Operations**: Rotation, traversal, search, modification

### Problem-Solving Strategy:
1. **Understand dimensions** - square vs rectangular, size constraints
2. **Identify transformation type** - rotation, reflection, traversal pattern
3. **Plan space usage** - in-place vs additional space requirements
4. **Handle boundaries** - edge cases for matrix edges and corners
5. **Choose algorithm** - layer processing, coordinate transformation, DFS
6. **Optimize if needed** - early termination, pruning, character frequency

### Common Mistakes to Avoid:
1. **Index bounds** - off-by-one errors in matrix boundaries
2. **Coordinate confusion** - mixing up row/column or x/y coordinates
3. **State restoration** - forgetting to backtrack in DFS problems
4. **Edge cases** - empty matrix, single element, single row/column
5. **In-place corruption** - overwriting needed data before using it

### Optimization Techniques:
1. **Early termination** - return as soon as answer is found
2. **Pruning** - eliminate impossible paths early in search
3. **Character frequency** - optimize search order based on frequency
4. **Boundary optimization** - minimize boundary checks with careful loop design
5. **Mathematical shortcuts** - use rotation formulas instead of simulation

### Space Optimization:
1. **Use matrix elements as flags** - store metadata in unused bits/values
2. **First row/column storage** - use boundaries for flag storage
3. **In-place swapping** - careful ordering to avoid data loss
4. **Direction vectors** - reuse arrays for movement patterns

This comprehensive guide provides the foundation for mastering matrix problems through the Blind 75 collection. The patterns and templates shown here apply broadly to 2D array manipulation, image processing, and coordinate transformation problems in both interviews and real-world applications.