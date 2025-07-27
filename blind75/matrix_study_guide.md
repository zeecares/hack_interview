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

### 2. Common Traversal Patterns
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

### 3. Direction Vectors for Movement
```java
// 4-directional movement (up, right, down, left)
int[][] directions = {{-1, 0}, {0, 1}, {1, 0}, {0, -1}};

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

### 4. Coordinate Transformation Concepts
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

### 5. In-Place Manipulation Techniques
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

**Java Solutions**:

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

// Approach 3: Optimized O(1) Space - Single Flag Variable
class Solution {
    public void setZeroes(int[][] matrix) {
        int rows = matrix.length;
        int cols = matrix[0].length;
        
        // Use matrix[0][0] for first row flag
        // Use additional variable for first column flag
        boolean firstColZero = false;
        
        // Check if first column has zero
        for (int i = 0; i < rows; i++) {
            if (matrix[i][0] == 0) {
                firstColZero = true;
                break;
            }
        }
        
        // Mark zeros using first row and column
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (matrix[i][j] == 0) {
                    matrix[i][0] = 0;
                    matrix[0][j] = 0;
                }
            }
        }
        
        // Set zeros based on marks (exclude first row and column)
        for (int i = 1; i < rows; i++) {
            for (int j = 1; j < cols; j++) {
                if (matrix[i][0] == 0 || matrix[0][j] == 0) {
                    matrix[i][j] = 0;
                }
            }
        }
        
        // Handle first row
        if (matrix[0][0] == 0) {
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

// Approach 4: Cleaner Implementation with Helper Method
class Solution {
    public void setZeroes(int[][] matrix) {
        int m = matrix.length, n = matrix[0].length;
        
        // Check if first row/column need to be zero
        boolean firstRowZero = containsZero(matrix[0]);
        boolean firstColZero = containsZeroInColumn(matrix, 0);
        
        // Mark zeros in first row and column
        markZeros(matrix, m, n);
        
        // Set zeros based on marks
        applyZeros(matrix, m, n);
        
        // Handle first row and column
        if (firstRowZero) setRowZero(matrix, 0, n);
        if (firstColZero) setColumnZero(matrix, 0, m);
    }
    
    private boolean containsZero(int[] row) {
        for (int val : row) {
            if (val == 0) return true;
        }
        return false;
    }
    
    private boolean containsZeroInColumn(int[][] matrix, int col) {
        for (int i = 0; i < matrix.length; i++) {
            if (matrix[i][col] == 0) return true;
        }
        return false;
    }
    
    private void markZeros(int[][] matrix, int m, int n) {
        for (int i = 1; i < m; i++) {
            for (int j = 1; j < n; j++) {
                if (matrix[i][j] == 0) {
                    matrix[i][0] = 0;
                    matrix[0][j] = 0;
                }
            }
        }
    }
    
    private void applyZeros(int[][] matrix, int m, int n) {
        for (int i = 1; i < m; i++) {
            for (int j = 1; j < n; j++) {
                if (matrix[i][0] == 0 || matrix[0][j] == 0) {
                    matrix[i][j] = 0;
                }
            }
        }
    }
    
    private void setRowZero(int[][] matrix, int row, int n) {
        for (int j = 0; j < n; j++) {
            matrix[row][j] = 0;
        }
    }
    
    private void setColumnZero(int[][] matrix, int col, int m) {
        for (int i = 0; i < m; i++) {
            matrix[i][col] = 0;
        }
    }
}
```

**Complexity Analysis**:
- **Time**: O(m × n) for all approaches
- **Space**: O(1) for optimized approaches, O(m + n) for basic approach

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

**Java Solutions**:

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
        int[][] directions = {{0, 1}, {1, 0}, {0, -1}, {-1, 0}};
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

// Approach 3: Recursive Layer Processing
class Solution {
    public List<Integer> spiralOrder(int[][] matrix) {
        List<Integer> result = new ArrayList<>();
        if (matrix.length == 0) return result;
        
        spiralHelper(matrix, 0, 0, matrix.length - 1, matrix[0].length - 1, result);
        return result;
    }
    
    private void spiralHelper(int[][] matrix, int topRow, int leftCol, 
                             int bottomRow, int rightCol, List<Integer> result) {
        if (topRow > bottomRow || leftCol > rightCol) return;
        
        // Single row
        if (topRow == bottomRow) {
            for (int col = leftCol; col <= rightCol; col++) {
                result.add(matrix[topRow][col]);
            }
            return;
        }
        
        // Single column
        if (leftCol == rightCol) {
            for (int row = topRow; row <= bottomRow; row++) {
                result.add(matrix[row][leftCol]);
            }
            return;
        }
        
        // Traverse the current layer
        // Top row (left to right)
        for (int col = leftCol; col < rightCol; col++) {
            result.add(matrix[topRow][col]);
        }
        
        // Right column (top to bottom)
        for (int row = topRow; row < bottomRow; row++) {
            result.add(matrix[row][rightCol]);
        }
        
        // Bottom row (right to left)
        for (int col = rightCol; col > leftCol; col--) {
            result.add(matrix[bottomRow][col]);
        }
        
        // Left column (bottom to top)
        for (int row = bottomRow; row > topRow; row--) {
            result.add(matrix[row][leftCol]);
        }
        
        // Recurse for inner layer
        spiralHelper(matrix, topRow + 1, leftCol + 1, bottomRow - 1, rightCol - 1, result);
    }
}

// Approach 4: Clean Implementation with Helper Methods
class Solution {
    public List<Integer> spiralOrder(int[][] matrix) {
        List<Integer> result = new ArrayList<>();
        if (matrix.length == 0) return result;
        
        int top = 0, bottom = matrix.length - 1;
        int left = 0, right = matrix[0].length - 1;
        
        while (top <= bottom && left <= right) {
            addTopRow(matrix, top, left, right, result);
            top++;
            
            addRightColumn(matrix, right, top, bottom, result);
            right--;
            
            if (top <= bottom) {
                addBottomRow(matrix, bottom, right, left, result);
                bottom--;
            }
            
            if (left <= right) {
                addLeftColumn(matrix, left, bottom, top, result);
                left++;
            }
        }
        
        return result;
    }
    
    private void addTopRow(int[][] matrix, int row, int startCol, int endCol, List<Integer> result) {
        for (int col = startCol; col <= endCol; col++) {
            result.add(matrix[row][col]);
        }
    }
    
    private void addRightColumn(int[][] matrix, int col, int startRow, int endRow, List<Integer> result) {
        for (int row = startRow; row <= endRow; row++) {
            result.add(matrix[row][col]);
        }
    }
    
    private void addBottomRow(int[][] matrix, int row, int startCol, int endCol, List<Integer> result) {
        for (int col = startCol; col >= endCol; col--) {
            result.add(matrix[row][col]);
        }
    }
    
    private void addLeftColumn(int[][] matrix, int col, int startRow, int endRow, List<Integer> result) {
        for (int row = startRow; row >= endRow; row--) {
            result.add(matrix[row][col]);
        }
    }
}
```

**Complexity Analysis**:
- **Time**: O(m × n) - visit each element once
- **Space**: O(1) excluding output array, O(m × n) for direction vector approach with visited array

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

**Java Solutions**:

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

// Approach 3: Mathematical Rotation with Visited Tracking
class Solution {
    public void rotate(int[][] matrix) {
        int n = matrix.length;
        boolean[][] visited = new boolean[n][n];
        
        for (int i = 0; i < n; i++) {
            for (int j = 0; j < n; j++) {
                if (!visited[i][j]) {
                    rotateCycle(matrix, i, j, visited);
                }
            }
        }
    }
    
    private void rotateCycle(int[][] matrix, int startI, int startJ, boolean[][] visited) {
        int n = matrix.length;
        int currentI = startI, currentJ = startJ;
        int temp = matrix[currentI][currentJ];
        
        do {
            visited[currentI][currentJ] = true;
            
            // Calculate next position: (i,j) -> (j, n-1-i)
            int nextI = currentJ;
            int nextJ = n - 1 - currentI;
            
            int nextTemp = matrix[nextI][nextJ];
            matrix[nextI][nextJ] = temp;
            temp = nextTemp;
            
            currentI = nextI;
            currentJ = nextJ;
        } while (currentI != startI || currentJ != startJ);
    }
}

// Approach 4: Clean Layer-by-Layer Implementation
class Solution {
    public void rotate(int[][] matrix) {
        int n = matrix.length;
        
        for (int layer = 0; layer < n / 2; layer++) {
            rotateLayer(matrix, layer, n);
        }
    }
    
    private void rotateLayer(int[][] matrix, int layer, int n) {
        int start = layer;
        int end = n - 1 - layer;
        
        for (int i = start; i < end; i++) {
            int offset = i - start;
            
            // Store positions
            int top = matrix[start][i];
            int right = matrix[i][end];
            int bottom = matrix[end][end - offset];
            int left = matrix[end - offset][start];
            
            // Rotate positions
            matrix[start][i] = left;          // Top = Left
            matrix[i][end] = top;             // Right = Top  
            matrix[end][end - offset] = right; // Bottom = Right
            matrix[end - offset][start] = bottom; // Left = Bottom
        }
    }
}

// Approach 5: Using Built-in Array Reversal
class Solution {
    public void rotate(int[][] matrix) {
        transpose(matrix);
        reverseRows(matrix);
    }
    
    private void transpose(int[][] matrix) {
        int n = matrix.length;
        for (int i = 0; i < n; i++) {
            for (int j = i; j < n; j++) {
                swap(matrix, i, j, j, i);
            }
        }
    }
    
    private void reverseRows(int[][] matrix) {
        int n = matrix.length;
        for (int i = 0; i < n; i++) {
            reverseArray(matrix[i]);
        }
    }
    
    private void reverseArray(int[] arr) {
        int left = 0, right = arr.length - 1;
        while (left < right) {
            int temp = arr[left];
            arr[left] = arr[right];
            arr[right] = temp;
            left++;
            right--;
        }
    }
    
    private void swap(int[][] matrix, int i1, int j1, int i2, int j2) {
        int temp = matrix[i1][j1];
        matrix[i1][j1] = matrix[i2][j2];
        matrix[i2][j2] = temp;
    }
}
```

**Complexity Analysis**:
- **Time**: O(n²) for all approaches
- **Space**: O(1) for most approaches, O(n²) for visited tracking approach

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

**Java Solutions**:

```java
// Approach 1: Standard DFS with Backtracking
class Solution {
    private int[][] directions = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
    
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
    private int[][] directions = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
    
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

// Approach 3: Optimized with Character Frequency Pruning
class Solution {
    private int[][] directions = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
    
    public boolean exist(char[][] board, String word) {
        // Optimization: check if board has enough characters
        if (!hasEnoughCharacters(board, word)) {
            return false;
        }
        
        // Optimization: start from less frequent character end
        word = optimizeWordDirection(board, word);
        
        int rows = board.length;
        int cols = board[0].length;
        
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
    
    private boolean hasEnoughCharacters(char[][] board, String word) {
        Map<Character, Integer> boardCount = new HashMap<>();
        Map<Character, Integer> wordCount = new HashMap<>();
        
        // Count characters in board
        for (char[] row : board) {
            for (char c : row) {
                boardCount.put(c, boardCount.getOrDefault(c, 0) + 1);
            }
        }
        
        // Count characters in word
        for (char c : word.toCharArray()) {
            wordCount.put(c, wordCount.getOrDefault(c, 0) + 1);
        }
        
        // Check if board has enough of each character
        for (Map.Entry<Character, Integer> entry : wordCount.entrySet()) {
            if (boardCount.getOrDefault(entry.getKey(), 0) < entry.getValue()) {
                return false;
            }
        }
        
        return true;
    }
    
    private String optimizeWordDirection(char[][] board, String word) {
        Map<Character, Integer> boardCount = new HashMap<>();
        
        for (char[] row : board) {
            for (char c : row) {
                boardCount.put(c, boardCount.getOrDefault(c, 0) + 1);
            }
        }
        
        char firstChar = word.charAt(0);
        char lastChar = word.charAt(word.length() - 1);
        
        int firstCount = boardCount.getOrDefault(firstChar, 0);
        int lastCount = boardCount.getOrDefault(lastChar, 0);
        
        // Start from less frequent character
        if (lastCount < firstCount) {
            return new StringBuilder(word).reverse().toString();
        }
        
        return word;
    }
    
    private boolean dfs(char[][] board, String word, int row, int col, int index) {
        if (index == word.length()) return true;
        
        if (row < 0 || row >= board.length || col < 0 || col >= board[0].length ||
            board[row][col] != word.charAt(index)) {
            return false;
        }
        
        char temp = board[row][col];
        board[row][col] = '#';
        
        for (int[] dir : directions) {
            if (dfs(board, word, row + dir[0], col + dir[1], index + 1)) {
                board[row][col] = temp;
                return true;
            }
        }
        
        board[row][col] = temp;
        return false;
    }
}

// Approach 4: Iterative DFS with Stack
class Solution {
    public boolean exist(char[][] board, String word) {
        int rows = board.length;
        int cols = board[0].length;
        int[][] directions = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
        
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                if (board[i][j] == word.charAt(0)) {
                    Stack<int[]> stack = new Stack<>();
                    Set<String> visited = new HashSet<>();
                    
                    stack.push(new int[]{i, j, 0}); // row, col, word_index
                    
                    while (!stack.isEmpty()) {
                        int[] current = stack.pop();
                        int row = current[0], col = current[1], index = current[2];
                        
                        if (index == word.length()) return true;
                        
                        String key = row + "," + col + "," + index;
                        if (visited.contains(key)) continue;
                        visited.add(key);
                        
                        if (row < 0 || row >= rows || col < 0 || col >= cols ||
                            board[row][col] != word.charAt(index)) {
                            continue;
                        }
                        
                        if (index == word.length() - 1) return true;
                        
                        for (int[] dir : directions) {
                            int newRow = row + dir[0];
                            int newCol = col + dir[1];
                            String newKey = newRow + "," + newCol + "," + (index + 1);
                            
                            if (!visited.contains(newKey)) {
                                stack.push(new int[]{newRow, newCol, index + 1});
                            }
                        }
                    }
                }
            }
        }
        
        return false;
    }
}
```

**Complexity Analysis**:
- **Time**: O(m × n × 4^L) where L is word length (worst case explores all paths)
- **Space**: O(L) for recursion stack depth

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

### In-Place Modification Template
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

### Layer Processing Template
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

### DFS with Backtracking Template
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
    int[][] directions = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
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

### Spiral Traversal Template
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