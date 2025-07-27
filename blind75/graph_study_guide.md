---
render_with_liquid: false
---

# Graph Problems Study Guide - Blind 75 LeetCode

## Table of Contents
1. [Graph Fundamentals](#graph-fundamentals)
2. [Graph Representations](#graph-representations)
3. [Core Graph Algorithms](#core-graph-algorithms)
4. [Problem Solutions](#problem-solutions)
5. [Common Patterns](#common-patterns)
6. [Implementation Templates](#implementation-templates)

## Graph Fundamentals

### Essential Concepts
- **Graph**: Collection of vertices (nodes) connected by edges
- **Directed vs Undirected**: Edges have direction or are bidirectional
- **Weighted vs Unweighted**: Edges may have associated costs/weights
- **Connected Components**: Maximal set of vertices where each pair is connected
- **Cycle**: Path that starts and ends at the same vertex
- **Topological Sort**: Linear ordering of vertices in a directed acyclic graph (DAG)

### Key Graph Properties
- **Connectivity**: Whether all vertices are reachable from each other
- **Acyclicity**: Whether the graph contains cycles
- **Bipartiteness**: Whether vertices can be colored with two colors
- **Planarity**: Whether the graph can be drawn without edge crossings

## Graph Representations

### 1. Adjacency List
**When to Use**: Sparse graphs, most common for algorithm problems
```java
// Using List of Lists
List<List<Integer>> adj = new ArrayList<>();
// Using Map for flexibility
Map<Integer, List<Integer>> adj = new HashMap<>();
```

### 2. Adjacency Matrix
**When to Use**: Dense graphs, when checking edge existence frequently
```java
boolean[][] adj = new boolean[n][n];
// or for weighted graphs
int[][] adj = new int[n][n];
```

### 3. Edge List
**When to Use**: Union-Find problems, minimum spanning tree
```java
class Edge {
    int from, to, weight;
    Edge(int from, int to, int weight) {
        this.from = from; this.to = to; this.weight = weight;
    }
}
List<Edge> edges = new ArrayList<>();
```

## Core Graph Algorithms

### Depth-First Search (DFS)
```java
void dfs(int node, boolean[] visited, List<List<Integer>> adj) {
    visited[node] = true;
    // Process current node
    
    for (int neighbor : adj.get(node)) {
        if (!visited[neighbor]) {
            dfs(neighbor, visited, adj);
        }
    }
}
```

### Breadth-First Search (BFS)
```java
void bfs(int start, List<List<Integer>> adj) {
    Queue<Integer> queue = new LinkedList<>();
    boolean[] visited = new boolean[adj.size()];
    
    queue.offer(start);
    visited[start] = true;
    
    while (!queue.isEmpty()) {
        int node = queue.poll();
        // Process current node
        
        for (int neighbor : adj.get(node)) {
            if (!visited[neighbor]) {
                visited[neighbor] = true;
                queue.offer(neighbor);
            }
        }
    }
}
```

### Union-Find (Disjoint Set)
```java
class UnionFind {
    private int[] parent, rank;
    private int components;
    
    public UnionFind(int n) {
        parent = new int[n];
        rank = new int[n];
        components = n;
        for (int i = 0; i < n; i++) parent[i] = i;
    }
    
    public int find(int x) {
        if (parent[x] != x) {
            parent[x] = find(parent[x]); // Path compression
        }
        return parent[x];
    }
    
    public boolean union(int x, int y) {
        int rootX = find(x), rootY = find(y);
        if (rootX == rootY) return false;
        
        // Union by rank
        if (rank[rootX] < rank[rootY]) {
            parent[rootX] = rootY;
        } else if (rank[rootX] > rank[rootY]) {
            parent[rootY] = rootX;
        } else {
            parent[rootY] = rootX;
            rank[rootX]++;
        }
        components--;
        return true;
    }
    
    public int getComponents() { return components; }
}
```

## Problem Solutions

### 1. Clone Graph (LeetCode 133)

**Problem Statement**: Clone an undirected graph where each node contains a value and a list of neighbors.

**Visual Example**:
```
Original: 1 -- 2
          |    |
          4 -- 3

Clone:    1' -- 2'
          |     |
          4' -- 3'
```

**Knowledge Prerequisites**:
- Graph traversal (DFS/BFS)
- Hash maps for node mapping
- Object cloning concepts

**First Principles**:
- Need to create new nodes while preserving structure
- Must avoid infinite loops in cyclic graphs
- Maintain mapping between original and cloned nodes

**Problem-First Approach**:
1. Traverse the graph to visit all nodes
2. Create new nodes and map them to originals
3. Connect cloned nodes using the mapping

**Java Solutions**:

**Solution 1: DFS with HashMap**
```java
class Solution {
    private Map<Node, Node> visited = new HashMap<>();
    
    public Node cloneGraph(Node node) {
        if (node == null) return null;
        
        // If already cloned, return the clone
        if (visited.containsKey(node)) {
            return visited.get(node);
        }
        
        // Create clone for current node
        Node clone = new Node(node.val);
        visited.put(node, clone);
        
        // Recursively clone neighbors
        for (Node neighbor : node.neighbors) {
            clone.neighbors.add(cloneGraph(neighbor));
        }
        
        return clone;
    }
}
```

**Solution 2: BFS with HashMap**
```java
class Solution {
    public Node cloneGraph(Node node) {
        if (node == null) return null;
        
        Map<Node, Node> visited = new HashMap<>();
        Queue<Node> queue = new LinkedList<>();
        
        // Create clone for start node
        Node clone = new Node(node.val);
        visited.put(node, clone);
        queue.offer(node);
        
        while (!queue.isEmpty()) {
            Node current = queue.poll();
            
            for (Node neighbor : current.neighbors) {
                if (!visited.containsKey(neighbor)) {
                    // Create clone for neighbor
                    visited.put(neighbor, new Node(neighbor.val));
                    queue.offer(neighbor);
                }
                // Connect current clone to neighbor clone
                visited.get(current).neighbors.add(visited.get(neighbor));
            }
        }
        
        return clone;
    }
}
```

**Complexity Analysis**:
- Time: O(V + E) where V = vertices, E = edges
- Space: O(V) for the hash map and recursion stack

**Key Insights**:
- Use hash map to track original → clone mapping
- Both DFS and BFS work; DFS is more intuitive
- Handle cycles by checking if node already cloned

---

### 2. Course Schedule (LeetCode 207)

**Problem Statement**: Determine if you can finish all courses given prerequisites. There are `numCourses` courses labeled 0 to `numCourses-1`. Prerequisites are given as pairs `[a, b]` where `b` is prerequisite for `a`.

**Visual Example**:
```
Input: numCourses = 2, prerequisites = [[1,0]]
Graph: 0 → 1 (can finish both)

Input: numCourses = 2, prerequisites = [[1,0],[0,1]]
Graph: 0 ⇄ 1 (cycle detected, cannot finish)
```

**Knowledge Prerequisites**:
- Directed graphs
- Cycle detection
- Topological sorting
- DFS with recursion stack

**First Principles**:
- Model courses as directed graph where edge a→b means "a is prerequisite for b"
- If graph has cycle, impossible to complete all courses
- If no cycle, courses can be completed in topological order

**Problem-First Approach**:
1. Build directed graph from prerequisites
2. Detect cycles using DFS or topological sort
3. Return true if no cycles found

**Java Solutions**:

**Solution 1: DFS Cycle Detection**
```java
class Solution {
    public boolean canFinish(int numCourses, int[][] prerequisites) {
        // Build adjacency list
        List<List<Integer>> adj = new ArrayList<>();
        for (int i = 0; i < numCourses; i++) {
            adj.add(new ArrayList<>());
        }
        
        for (int[] prereq : prerequisites) {
            adj.get(prereq[1]).add(prereq[0]); // prereq[1] → prereq[0]
        }
        
        // 0: unvisited, 1: visiting, 2: visited
        int[] state = new int[numCourses];
        
        for (int i = 0; i < numCourses; i++) {
            if (state[i] == 0 && hasCycle(i, adj, state)) {
                return false;
            }
        }
        return true;
    }
    
    private boolean hasCycle(int course, List<List<Integer>> adj, int[] state) {
        if (state[course] == 1) return true;  // Back edge found (cycle)
        if (state[course] == 2) return false; // Already processed
        
        state[course] = 1; // Mark as visiting
        
        for (int next : adj.get(course)) {
            if (hasCycle(next, adj, state)) {
                return true;
            }
        }
        
        state[course] = 2; // Mark as visited
        return false;
    }
}
```

**Solution 2: Kahn's Algorithm (Topological Sort)**
```java
class Solution {
    public boolean canFinish(int numCourses, int[][] prerequisites) {
        // Build adjacency list and calculate indegrees
        List<List<Integer>> adj = new ArrayList<>();
        int[] indegree = new int[numCourses];
        
        for (int i = 0; i < numCourses; i++) {
            adj.add(new ArrayList<>());
        }
        
        for (int[] prereq : prerequisites) {
            adj.get(prereq[1]).add(prereq[0]);
            indegree[prereq[0]]++;
        }
        
        // Start with courses having no prerequisites
        Queue<Integer> queue = new LinkedList<>();
        for (int i = 0; i < numCourses; i++) {
            if (indegree[i] == 0) {
                queue.offer(i);
            }
        }
        
        int completed = 0;
        while (!queue.isEmpty()) {
            int course = queue.poll();
            completed++;
            
            // Remove this course and update indegrees
            for (int next : adj.get(course)) {
                indegree[next]--;
                if (indegree[next] == 0) {
                    queue.offer(next);
                }
            }
        }
        
        return completed == numCourses;
    }
}
```

**Complexity Analysis**:
- Time: O(V + E) where V = courses, E = prerequisites
- Space: O(V + E) for adjacency list

**Key Insights**:
- Cycle detection is key to solving prerequisite problems
- DFS with 3-state tracking (unvisited/visiting/visited) detects cycles
- Topological sort (Kahn's algorithm) also detects cycles naturally

---

### 3. Pacific Atlantic Water Flow (LeetCode 417)

**Problem Statement**: Given an `m x n` matrix representing heights, find cells where rainwater can flow to both Pacific (top/left edges) and Atlantic (bottom/right edges) oceans. Water flows from higher or equal height to lower height.

**Visual Example**:
```
Input: heights = [[1,2,2,3,5],[3,2,3,4,4],[2,4,5,3,1],[6,7,1,4,5],[5,1,1,2,4]]

Pacific Ocean
  1  2  2  3  5  
3 *  2  3  4  4  Atlantic
2 *  4  5  3  1  Ocean
6 *  7  1  4  5  
5 *  1  1  2  4  
  Atlantic Ocean

Result: [[0,4],[1,3],[1,4],[2,2],[3,0],[3,1],[4,0]]
```

**Knowledge Prerequisites**:
- 2D grid traversal
- DFS/BFS from multiple starting points
- Matrix boundary handling

**First Principles**:
- Water flows from higher to lower (or equal) elevation
- Start from ocean edges and work backwards (reverse flow)
- Cell accessible to both oceans if reachable from both sets of edges

**Problem-First Approach**:
1. Start DFS/BFS from Pacific edges (top and left)
2. Start DFS/BFS from Atlantic edges (bottom and right)
3. Find intersection of reachable cells

**Java Solutions**:

**Solution 1: DFS from Boundaries**
```java
class Solution {
    private int[][] directions = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
    private int m, n;
    
    public List<List<Integer>> pacificAtlantic(int[][] heights) {
        m = heights.length;
        n = heights[0].length;
        
        boolean[][] pacific = new boolean[m][n];
        boolean[][] atlantic = new boolean[m][n];
        
        // DFS from Pacific borders (top and left)
        for (int i = 0; i < m; i++) {
            dfs(heights, i, 0, pacific, heights[i][0]);
        }
        for (int j = 0; j < n; j++) {
            dfs(heights, 0, j, pacific, heights[0][j]);
        }
        
        // DFS from Atlantic borders (bottom and right)
        for (int i = 0; i < m; i++) {
            dfs(heights, i, n - 1, atlantic, heights[i][n - 1]);
        }
        for (int j = 0; j < n; j++) {
            dfs(heights, m - 1, j, atlantic, heights[m - 1][j]);
        }
        
        // Find intersection
        List<List<Integer>> result = new ArrayList<>();
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (pacific[i][j] && atlantic[i][j]) {
                    result.add(Arrays.asList(i, j));
                }
            }
        }
        
        return result;
    }
    
    private void dfs(int[][] heights, int i, int j, boolean[][] visited, int prevHeight) {
        if (i < 0 || i >= m || j < 0 || j >= n || visited[i][j] || heights[i][j] < prevHeight) {
            return;
        }
        
        visited[i][j] = true;
        
        for (int[] dir : directions) {
            dfs(heights, i + dir[0], j + dir[1], visited, heights[i][j]);
        }
    }
}
```

**Solution 2: BFS from Boundaries**
```java
class Solution {
    private int[][] directions = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
    
    public List<List<Integer>> pacificAtlantic(int[][] heights) {
        int m = heights.length, n = heights[0].length;
        
        boolean[][] pacific = new boolean[m][n];
        boolean[][] atlantic = new boolean[m][n];
        
        Queue<int[]> pacificQueue = new LinkedList<>();
        Queue<int[]> atlanticQueue = new LinkedList<>();
        
        // Add Pacific borders
        for (int i = 0; i < m; i++) {
            pacific[i][0] = true;
            pacificQueue.offer(new int[]{i, 0});
        }
        for (int j = 0; j < n; j++) {
            pacific[0][j] = true;
            pacificQueue.offer(new int[]{0, j});
        }
        
        // Add Atlantic borders
        for (int i = 0; i < m; i++) {
            atlantic[i][n - 1] = true;
            atlanticQueue.offer(new int[]{i, n - 1});
        }
        for (int j = 0; j < n; j++) {
            atlantic[m - 1][j] = true;
            atlanticQueue.offer(new int[]{m - 1, j});
        }
        
        // BFS from Pacific
        bfs(heights, pacificQueue, pacific);
        // BFS from Atlantic
        bfs(heights, atlanticQueue, atlantic);
        
        // Find intersection
        List<List<Integer>> result = new ArrayList<>();
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (pacific[i][j] && atlantic[i][j]) {
                    result.add(Arrays.asList(i, j));
                }
            }
        }
        
        return result;
    }
    
    private void bfs(int[][] heights, Queue<int[]> queue, boolean[][] visited) {
        int m = heights.length, n = heights[0].length;
        
        while (!queue.isEmpty()) {
            int[] cell = queue.poll();
            int i = cell[0], j = cell[1];
            
            for (int[] dir : directions) {
                int ni = i + dir[0], nj = j + dir[1];
                
                if (ni >= 0 && ni < m && nj >= 0 && nj < n && 
                    !visited[ni][nj] && heights[ni][nj] >= heights[i][j]) {
                    visited[ni][nj] = true;
                    queue.offer(new int[]{ni, nj});
                }
            }
        }
    }
}
```

**Complexity Analysis**:
- Time: O(m × n) - visit each cell at most twice
- Space: O(m × n) - for visited arrays

**Key Insights**:
- Reverse thinking: start from oceans, not from each cell
- Water can flow to higher or equal elevations in reverse direction
- Use two separate visited arrays for each ocean

---

### 4. Number of Islands (LeetCode 200)

**Problem Statement**: Count the number of islands in a 2D binary grid. An island is surrounded by water and formed by connecting adjacent lands horizontally or vertically.

**Visual Example**:
```
Input: grid = [
  ["1","1","1","1","0"],
  ["1","1","0","1","0"],
  ["1","1","0","0","0"],
  ["0","0","0","0","0"]
]
Output: 1

Input: grid = [
  ["1","1","0","0","0"],
  ["1","1","0","0","0"],
  ["0","0","1","0","0"],
  ["0","0","0","1","1"]
]
Output: 3
```

**Knowledge Prerequisites**:
- 2D grid traversal
- Connected components
- DFS/BFS for exploring components

**First Principles**:
- Each island is a connected component of land cells
- Use DFS/BFS to mark all cells in same island as visited
- Count how many times we start a new DFS/BFS

**Problem-First Approach**:
1. Iterate through each cell in grid
2. When finding unvisited land ('1'), start DFS/BFS to mark entire island
3. Increment island counter for each DFS/BFS started

**Java Solutions**:

**Solution 1: DFS with Grid Modification**
```java
class Solution {
    public int numIslands(char[][] grid) {
        if (grid == null || grid.length == 0) return 0;
        
        int count = 0;
        int m = grid.length, n = grid[0].length;
        
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (grid[i][j] == '1') {
                    count++;
                    dfs(grid, i, j);
                }
            }
        }
        
        return count;
    }
    
    private void dfs(char[][] grid, int i, int j) {
        int m = grid.length, n = grid[0].length;
        
        if (i < 0 || i >= m || j < 0 || j >= n || grid[i][j] != '1') {
            return;
        }
        
        grid[i][j] = '0'; // Mark as visited
        
        // Explore 4 directions
        dfs(grid, i - 1, j);
        dfs(grid, i + 1, j);
        dfs(grid, i, j - 1);
        dfs(grid, i, j + 1);
    }
}
```

**Solution 2: BFS with Queue**
```java
class Solution {
    private int[][] directions = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
    
    public int numIslands(char[][] grid) {
        if (grid == null || grid.length == 0) return 0;
        
        int count = 0;
        int m = grid.length, n = grid[0].length;
        
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (grid[i][j] == '1') {
                    count++;
                    bfs(grid, i, j);
                }
            }
        }
        
        return count;
    }
    
    private void bfs(char[][] grid, int startI, int startJ) {
        int m = grid.length, n = grid[0].length;
        Queue<int[]> queue = new LinkedList<>();
        
        queue.offer(new int[]{startI, startJ});
        grid[startI][startJ] = '0';
        
        while (!queue.isEmpty()) {
            int[] cell = queue.poll();
            int i = cell[0], j = cell[1];
            
            for (int[] dir : directions) {
                int ni = i + dir[0], nj = j + dir[1];
                
                if (ni >= 0 && ni < m && nj >= 0 && nj < n && grid[ni][nj] == '1') {
                    grid[ni][nj] = '0';
                    queue.offer(new int[]{ni, nj});
                }
            }
        }
    }
}
```

**Solution 3: Union-Find**
```java
class Solution {
    public int numIslands(char[][] grid) {
        if (grid == null || grid.length == 0) return 0;
        
        int m = grid.length, n = grid[0].length;
        UnionFind uf = new UnionFind(grid);
        
        int[][] directions = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
        
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                if (grid[i][j] == '1') {
                    for (int[] dir : directions) {
                        int ni = i + dir[0], nj = j + dir[1];
                        if (ni >= 0 && ni < m && nj >= 0 && nj < n && grid[ni][nj] == '1') {
                            uf.union(i * n + j, ni * n + nj);
                        }
                    }
                }
            }
        }
        
        return uf.getCount();
    }
    
    class UnionFind {
        private int[] parent;
        private int count;
        
        public UnionFind(char[][] grid) {
            int m = grid.length, n = grid[0].length;
            parent = new int[m * n];
            count = 0;
            
            for (int i = 0; i < m; i++) {
                for (int j = 0; j < n; j++) {
                    if (grid[i][j] == '1') {
                        parent[i * n + j] = i * n + j;
                        count++;
                    }
                }
            }
        }
        
        public int find(int x) {
            if (parent[x] != x) {
                parent[x] = find(parent[x]);
            }
            return parent[x];
        }
        
        public void union(int x, int y) {
            int rootX = find(x), rootY = find(y);
            if (rootX != rootY) {
                parent[rootX] = rootY;
                count--;
            }
        }
        
        public int getCount() { return count; }
    }
}
```

**Complexity Analysis**:
- Time: O(m × n) for DFS/BFS, O(m × n × α(mn)) for Union-Find
- Space: O(min(m, n)) for BFS queue, O(mn) for Union-Find

**Key Insights**:
- Connected components problem in disguise
- DFS is most intuitive, BFS works equally well
- Can modify grid in-place to avoid extra space
- Union-Find overkill but demonstrates alternative approach

---

### 5. Longest Consecutive Sequence (LeetCode 128)

**Problem Statement**: Find the length of the longest consecutive elements sequence in an unsorted array. Algorithm must run in O(n) time.

**Visual Example**:
```
Input: nums = [100,4,200,1,3,2]
Sequences: [1,2,3,4] and [100] and [200]
Output: 4 (longest consecutive sequence is [1,2,3,4])

Input: nums = [0,3,7,2,5,8,4,6,0,1]
Sequence: [0,1,2,3,4,5,6,7,8]
Output: 9
```

**Knowledge Prerequisites**:
- Hash sets for O(1) lookup
- Graph thinking (implicit graph of consecutive numbers)
- Sequence building algorithms

**First Principles**:
- Each number can be part of a consecutive sequence
- Use hash set for O(1) existence checking
- Only start sequence from numbers that don't have a predecessor
- Build sequence by checking for next consecutive numbers

**Problem-First Approach**:
1. Put all numbers in hash set for O(1) lookup
2. For each number, check if it's the start of a sequence (no predecessor)
3. If it's a start, build the complete sequence by checking consecutive numbers
4. Track maximum sequence length found

**Java Solutions**:

**Solution 1: Hash Set with Smart Starting Points**
```java
class Solution {
    public int longestConsecutive(int[] nums) {
        if (nums.length == 0) return 0;
        
        Set<Integer> numSet = new HashSet<>();
        for (int num : nums) {
            numSet.add(num);
        }
        
        int maxLength = 0;
        
        for (int num : nums) {
            // Only start sequence if num is the beginning
            // (no predecessor exists)
            if (!numSet.contains(num - 1)) {
                int currentNum = num;
                int currentLength = 1;
                
                // Build sequence forward
                while (numSet.contains(currentNum + 1)) {
                    currentNum++;
                    currentLength++;
                }
                
                maxLength = Math.max(maxLength, currentLength);
            }
        }
        
        return maxLength;
    }
}
```

**Solution 2: Union-Find Approach**
```java
class Solution {
    public int longestConsecutive(int[] nums) {
        if (nums.length == 0) return 0;
        
        UnionFind uf = new UnionFind(nums);
        return uf.getMaxComponentSize();
    }
    
    class UnionFind {
        private Map<Integer, Integer> parent;
        private Map<Integer, Integer> size;
        private int maxSize;
        
        public UnionFind(int[] nums) {
            parent = new HashMap<>();
            size = new HashMap<>();
            maxSize = 1;
            
            // Initialize each number as its own component
            for (int num : nums) {
                if (!parent.containsKey(num)) {
                    parent.put(num, num);
                    size.put(num, 1);
                }
            }
            
            // Union consecutive numbers
            for (int num : nums) {
                if (parent.containsKey(num + 1)) {
                    union(num, num + 1);
                }
            }
        }
        
        private int find(int x) {
            if (parent.get(x) != x) {
                parent.put(x, find(parent.get(x)));
            }
            return parent.get(x);
        }
        
        private void union(int x, int y) {
            int rootX = find(x), rootY = find(y);
            if (rootX != rootY) {
                // Union by size
                if (size.get(rootX) < size.get(rootY)) {
                    parent.put(rootX, rootY);
                    size.put(rootY, size.get(rootX) + size.get(rootY));
                    maxSize = Math.max(maxSize, size.get(rootY));
                } else {
                    parent.put(rootY, rootX);
                    size.put(rootX, size.get(rootX) + size.get(rootY));
                    maxSize = Math.max(maxSize, size.get(rootX));
                }
            }
        }
        
        public int getMaxComponentSize() { return maxSize; }
    }
}
```

**Solution 3: HashMap with Sequence Tracking**
```java
class Solution {
    public int longestConsecutive(int[] nums) {
        Map<Integer, Integer> sequenceLength = new HashMap<>();
        int maxLength = 0;
        
        for (int num : nums) {
            if (sequenceLength.containsKey(num)) continue;
            
            // Get lengths of adjacent sequences
            int leftLength = sequenceLength.getOrDefault(num - 1, 0);
            int rightLength = sequenceLength.getOrDefault(num + 1, 0);
            
            // Calculate new sequence length
            int newLength = leftLength + rightLength + 1;
            maxLength = Math.max(maxLength, newLength);
            
            // Update boundary points of the sequence
            sequenceLength.put(num, newLength);
            sequenceLength.put(num - leftLength, newLength);
            sequenceLength.put(num + rightLength, newLength);
        }
        
        return maxLength;
    }
}
```

**Complexity Analysis**:
- Time: O(n) for all solutions
- Space: O(n) for hash set/map

**Key Insights**:
- Think of consecutive numbers as forming an implicit graph
- Hash set enables O(1) lookup, critical for O(n) solution
- Only start building from sequence beginnings to avoid redundant work
- Union-Find can model consecutive grouping but is overkill

---

### 6. Alien Dictionary (LeetCode 269 - Premium)

**Problem Statement**: Given a list of words sorted lexicographically in an alien language, derive the order of characters in the alien alphabet. Return empty string if no valid order exists.

**Visual Example**:
```
Input: words = ["wrt","wrf","er","ett","rftt"]
Analysis:
- "wrt" < "wrf" → 't' < 'f'
- "wrf" < "er" → 'w' < 'e'  
- "er" < "ett" → 'r' < 't'
- "ett" < "rftt" → 'e' < 'r'

Graph: w → e → r → t → f
Output: "wertf"

Input: words = ["z","x"]
Analysis: 'z' < 'x'
Output: "zx"

Input: words = ["z","x","z"] 
Analysis: Contradiction (z < x but z appears after x)
Output: "" (invalid)
```

**Knowledge Prerequisites**:
- Topological sorting
- Directed graphs
- String comparison logic
- Cycle detection in directed graphs

**First Principles**:
- Compare adjacent words to find character ordering relationships
- Build directed graph where edge a→b means 'a' comes before 'b'
- Use topological sort to find valid ordering
- Detect cycles (contradictions) in the ordering

**Problem-First Approach**:
1. Extract ordering relationships by comparing adjacent words
2. Build directed graph from these relationships
3. Apply topological sort to get final ordering
4. Return empty string if cycle detected

**Java Solutions**:

**Solution 1: Kahn's Algorithm (BFS Topological Sort)**
```java
class Solution {
    public String alienOrder(String[] words) {
        // Build adjacency list and calculate indegrees
        Map<Character, Set<Character>> adj = new HashMap<>();
        Map<Character, Integer> indegree = new HashMap<>();
        
        // Initialize all characters
        for (String word : words) {
            for (char c : word.toCharArray()) {
                adj.putIfAbsent(c, new HashSet<>());
                indegree.putIfAbsent(c, 0);
            }
        }
        
        // Build graph by comparing adjacent words
        for (int i = 0; i < words.length - 1; i++) {
            String word1 = words[i], word2 = words[i + 1];
            
            // Check for invalid case: word1 is prefix of word2 but longer
            if (word1.length() > word2.length() && word1.startsWith(word2)) {
                return "";
            }
            
            // Find first different character
            for (int j = 0; j < Math.min(word1.length(), word2.length()); j++) {
                char c1 = word1.charAt(j), c2 = word2.charAt(j);
                if (c1 != c2) {
                    // Add edge c1 → c2 if not already present
                    if (!adj.get(c1).contains(c2)) {
                        adj.get(c1).add(c2);
                        indegree.put(c2, indegree.get(c2) + 1);
                    }
                    break; // Only use first difference
                }
            }
        }
        
        // Kahn's algorithm for topological sort
        Queue<Character> queue = new LinkedList<>();
        for (char c : indegree.keySet()) {
            if (indegree.get(c) == 0) {
                queue.offer(c);
            }
        }
        
        StringBuilder result = new StringBuilder();
        while (!queue.isEmpty()) {
            char c = queue.poll();
            result.append(c);
            
            for (char next : adj.get(c)) {
                indegree.put(next, indegree.get(next) - 1);
                if (indegree.get(next) == 0) {
                    queue.offer(next);
                }
            }
        }
        
        // Check if all characters are included (no cycle)
        return result.length() == indegree.size() ? result.toString() : "";
    }
}
```

**Solution 2: DFS Topological Sort**
```java
class Solution {
    public String alienOrder(String[] words) {
        Map<Character, Set<Character>> adj = new HashMap<>();
        Set<Character> allChars = new HashSet<>();
        
        // Initialize
        for (String word : words) {
            for (char c : word.toCharArray()) {
                adj.putIfAbsent(c, new HashSet<>());
                allChars.add(c);
            }
        }
        
        // Build graph
        for (int i = 0; i < words.length - 1; i++) {
            String word1 = words[i], word2 = words[i + 1];
            
            if (word1.length() > word2.length() && word1.startsWith(word2)) {
                return "";
            }
            
            for (int j = 0; j < Math.min(word1.length(), word2.length()); j++) {
                char c1 = word1.charAt(j), c2 = word2.charAt(j);
                if (c1 != c2) {
                    adj.get(c1).add(c2);
                    break;
                }
            }
        }
        
        // DFS topological sort
        // 0: white (unvisited), 1: gray (visiting), 2: black (visited)
        Map<Character, Integer> color = new HashMap<>();
        Stack<Character> stack = new Stack<>();
        
        for (char c : allChars) {
            if (color.getOrDefault(c, 0) == 0) {
                if (dfs(c, adj, color, stack)) {
                    return ""; // Cycle detected
                }
            }
        }
        
        // Build result from stack (reverse order)
        StringBuilder result = new StringBuilder();
        while (!stack.isEmpty()) {
            result.append(stack.pop());
        }
        
        return result.toString();
    }
    
    private boolean dfs(char node, Map<Character, Set<Character>> adj, 
                       Map<Character, Integer> color, Stack<Character> stack) {
        color.put(node, 1); // Mark as visiting
        
        for (char neighbor : adj.get(node)) {
            if (color.getOrDefault(neighbor, 0) == 1) {
                return true; // Back edge (cycle)
            }
            if (color.getOrDefault(neighbor, 0) == 0 && 
                dfs(neighbor, adj, color, stack)) {
                return true;
            }
        }
        
        color.put(node, 2); // Mark as visited
        stack.push(node);
        return false;
    }
}
```

**Complexity Analysis**:
- Time: O(C) where C = total length of all words
- Space: O(1) since alphabet size is bounded (at most 26 characters)

**Key Insights**:
- Only first differing character between adjacent words gives ordering info
- Handle edge case: longer word cannot be prefix of shorter word if they come first
- Topological sort detects cycles naturally
- DFS and BFS approaches both work for topological sorting

---

### 7. Graph Valid Tree (LeetCode 261 - Premium)

**Problem Statement**: Given `n` nodes labeled from `0` to `n-1` and a list of undirected edges, determine if these edges form a valid tree.

**Visual Example**:
```
Input: n = 5, edges = [[0,1],[0,2],[0,3],[1,4]]
Tree structure:
    0
   /|\
  1 2 3
 /
4
Output: true

Input: n = 5, edges = [[0,1],[1,2],[2,3],[1,3],[3,4]]
Graph with cycle:
0-1-2
  | |
  3-+-4 (cycle: 1-2-3-1)
Output: false
```

**Knowledge Prerequisites**:
- Tree properties: connected, acyclic, n-1 edges
- Union-Find for cycle detection
- DFS for connectivity and cycle detection

**First Principles**:
- Valid tree must be connected (all nodes reachable)
- Valid tree must be acyclic (no cycles)
- Valid tree with n nodes has exactly n-1 edges
- All three conditions are necessary and sufficient

**Problem-First Approach**:
1. Check if edge count equals n-1 (necessary condition)
2. Check if graph is connected (all nodes in one component)
3. Check if graph is acyclic (no cycles)

**Java Solutions**:

**Solution 1: Union-Find**
```java
class Solution {
    public boolean validTree(int n, int[][] edges) {
        // A tree must have exactly n-1 edges
        if (edges.length != n - 1) return false;
        
        UnionFind uf = new UnionFind(n);
        
        for (int[] edge : edges) {
            // If two nodes are already connected, adding this edge creates a cycle
            if (!uf.union(edge[0], edge[1])) {
                return false;
            }
        }
        
        // Check if all nodes are connected (only 1 component)
        return uf.getComponentCount() == 1;
    }
    
    class UnionFind {
        private int[] parent;
        private int[] rank;
        private int componentCount;
        
        public UnionFind(int n) {
            parent = new int[n];
            rank = new int[n];
            componentCount = n;
            for (int i = 0; i < n; i++) {
                parent[i] = i;
            }
        }
        
        public int find(int x) {
            if (parent[x] != x) {
                parent[x] = find(parent[x]);
            }
            return parent[x];
        }
        
        public boolean union(int x, int y) {
            int rootX = find(x), rootY = find(y);
            if (rootX == rootY) return false; // Already connected (cycle)
            
            if (rank[rootX] < rank[rootY]) {
                parent[rootX] = rootY;
            } else if (rank[rootX] > rank[rootY]) {
                parent[rootY] = rootX;
            } else {
                parent[rootY] = rootX;
                rank[rootX]++;
            }
            
            componentCount--;
            return true;
        }
        
        public int getComponentCount() { return componentCount; }
    }
}
```

**Solution 2: DFS with Cycle Detection**
```java
class Solution {
    public boolean validTree(int n, int[][] edges) {
        // A tree must have exactly n-1 edges
        if (edges.length != n - 1) return false;
        
        // Build adjacency list
        List<List<Integer>> adj = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            adj.add(new ArrayList<>());
        }
        
        for (int[] edge : edges) {
            adj.get(edge[0]).add(edge[1]);
            adj.get(edge[1]).add(edge[0]);
        }
        
        boolean[] visited = new boolean[n];
        
        // Check for cycles and connectivity starting from node 0
        if (hasCycle(0, -1, adj, visited)) {
            return false;
        }
        
        // Check if all nodes are visited (connected)
        for (boolean v : visited) {
            if (!v) return false;
        }
        
        return true;
    }
    
    private boolean hasCycle(int node, int parent, List<List<Integer>> adj, boolean[] visited) {
        visited[node] = true;
        
        for (int neighbor : adj.get(node)) {
            if (neighbor == parent) continue; // Skip parent edge in undirected graph
            
            if (visited[neighbor] || hasCycle(neighbor, node, adj, visited)) {
                return true;
            }
        }
        
        return false;
    }
}
```

**Solution 3: BFS Approach**
```java
class Solution {
    public boolean validTree(int n, int[][] edges) {
        if (edges.length != n - 1) return false;
        
        // Build adjacency list
        List<List<Integer>> adj = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            adj.add(new ArrayList<>());
        }
        
        for (int[] edge : edges) {
            adj.get(edge[0]).add(edge[1]);
            adj.get(edge[1]).add(edge[0]);
        }
        
        boolean[] visited = new boolean[n];
        Queue<Integer> queue = new LinkedList<>();
        
        queue.offer(0);
        visited[0] = true;
        
        while (!queue.isEmpty()) {
            int node = queue.poll();
            
            for (int neighbor : adj.get(node)) {
                if (!visited[neighbor]) {
                    visited[neighbor] = true;
                    queue.offer(neighbor);
                }
            }
        }
        
        // Check if all nodes are visited
        for (boolean v : visited) {
            if (!v) return false;
        }
        
        return true;
    }
}
```

**Complexity Analysis**:
- Time: O(n) since we have at most n-1 edges
- Space: O(n) for adjacency list and visited array

**Key Insights**:
- Trees have exactly n-1 edges (quick elimination test)
- If edge count is correct, only need to check connectivity
- Union-Find naturally detects cycles during union operations
- DFS needs parent tracking to avoid false cycle detection in undirected graphs

---

### 8. Number of Connected Components in an Undirected Graph (LeetCode 323 - Premium)

**Problem Statement**: Find the number of connected components in an undirected graph. You have `n` nodes labeled from `0` to `n-1`. A connected component is a group of nodes that are directly or indirectly connected.

**Visual Example**:
```
Input: n = 5, edges = [[0,1],[1,2],[3,4]]
Components:
- Component 1: 0-1-2
- Component 2: 3-4
Output: 2

Input: n = 5, edges = [[0,1],[1,2],[2,3],[3,4]]
Components:
- Component 1: 0-1-2-3-4
Output: 1
```

**Knowledge Prerequisites**:
- Connected components concept
- Union-Find (Disjoint Set Union)
- DFS/BFS for graph traversal

**First Principles**:
- Connected component = maximal set of nodes where every pair is connected by some path
- Use Union-Find to efficiently group connected nodes
- Alternative: Use DFS/BFS to explore each component

**Problem-First Approach**:
1. Start with n components (each node is its own component)
2. For each edge, union the two nodes (merge their components)
3. Count final number of distinct components

**Java Solutions**:

**Solution 1: Union-Find (Optimal)**
```java
class Solution {
    public int countComponents(int n, int[][] edges) {
        UnionFind uf = new UnionFind(n);
        
        for (int[] edge : edges) {
            uf.union(edge[0], edge[1]);
        }
        
        return uf.getComponentCount();
    }
    
    class UnionFind {
        private int[] parent;
        private int[] rank;
        private int componentCount;
        
        public UnionFind(int n) {
            parent = new int[n];
            rank = new int[n];
            componentCount = n;
            
            for (int i = 0; i < n; i++) {
                parent[i] = i;
            }
        }
        
        public int find(int x) {
            if (parent[x] != x) {
                parent[x] = find(parent[x]); // Path compression
            }
            return parent[x];
        }
        
        public void union(int x, int y) {
            int rootX = find(x), rootY = find(y);
            if (rootX != rootY) {
                // Union by rank
                if (rank[rootX] < rank[rootY]) {
                    parent[rootX] = rootY;
                } else if (rank[rootX] > rank[rootY]) {
                    parent[rootY] = rootX;
                } else {
                    parent[rootY] = rootX;
                    rank[rootX]++;
                }
                componentCount--;
            }
        }
        
        public int getComponentCount() {
            return componentCount;
        }
    }
}
```

**Solution 2: DFS**
```java
class Solution {
    public int countComponents(int n, int[][] edges) {
        // Build adjacency list
        List<List<Integer>> adj = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            adj.add(new ArrayList<>());
        }
        
        for (int[] edge : edges) {
            adj.get(edge[0]).add(edge[1]);
            adj.get(edge[1]).add(edge[0]);
        }
        
        boolean[] visited = new boolean[n];
        int components = 0;
        
        for (int i = 0; i < n; i++) {
            if (!visited[i]) {
                dfs(i, adj, visited);
                components++;
            }
        }
        
        return components;
    }
    
    private void dfs(int node, List<List<Integer>> adj, boolean[] visited) {
        visited[node] = true;
        
        for (int neighbor : adj.get(node)) {
            if (!visited[neighbor]) {
                dfs(neighbor, adj, visited);
            }
        }
    }
}
```

**Solution 3: BFS**
```java
class Solution {
    public int countComponents(int n, int[][] edges) {
        // Build adjacency list
        List<List<Integer>> adj = new ArrayList<>();
        for (int i = 0; i < n; i++) {
            adj.add(new ArrayList<>());
        }
        
        for (int[] edge : edges) {
            adj.get(edge[0]).add(edge[1]);
            adj.get(edge[1]).add(edge[0]);
        }
        
        boolean[] visited = new boolean[n];
        int components = 0;
        
        for (int i = 0; i < n; i++) {
            if (!visited[i]) {
                bfs(i, adj, visited);
                components++;
            }
        }
        
        return components;
    }
    
    private void bfs(int start, List<List<Integer>> adj, boolean[] visited) {
        Queue<Integer> queue = new LinkedList<>();
        queue.offer(start);
        visited[start] = true;
        
        while (!queue.isEmpty()) {
            int node = queue.poll();
            
            for (int neighbor : adj.get(node)) {
                if (!visited[neighbor]) {
                    visited[neighbor] = true;
                    queue.offer(neighbor);
                }
            }
        }
    }
}
```

**Solution 4: Counting Roots in Union-Find**
```java
class Solution {
    public int countComponents(int n, int[][] edges) {
        int[] parent = new int[n];
        for (int i = 0; i < n; i++) {
            parent[i] = i;
        }
        
        for (int[] edge : edges) {
            union(edge[0], edge[1], parent);
        }
        
        // Count unique roots
        Set<Integer> roots = new HashSet<>();
        for (int i = 0; i < n; i++) {
            roots.add(find(i, parent));
        }
        
        return roots.size();
    }
    
    private int find(int x, int[] parent) {
        if (parent[x] != x) {
            parent[x] = find(parent[x], parent);
        }
        return parent[x];
    }
    
    private void union(int x, int y, int[] parent) {
        int rootX = find(x, parent);
        int rootY = find(y, parent);
        if (rootX != rootY) {
            parent[rootX] = rootY;
        }
    }
}
```

**Complexity Analysis**:
- Union-Find: Time O(E × α(n)), Space O(n)
- DFS/BFS: Time O(V + E), Space O(V + E)

**Key Insights**:
- Union-Find is optimal for this type of connectivity problem
- Each union operation decreases component count by 1
- DFS/BFS approach: count how many times we start a new traversal
- Connected components are fundamental graph concept

## Common Patterns

### 1. **Graph Traversal Patterns**
- **DFS for Path Problems**: Use when exploring all paths or detecting cycles
- **BFS for Shortest Path**: Use for unweighted shortest path problems
- **Multi-source BFS**: Start BFS from multiple nodes simultaneously

### 2. **Cycle Detection Patterns**
- **Undirected Graph**: Use parent tracking in DFS or Union-Find
- **Directed Graph**: Use 3-color DFS (white/gray/black)
- **Union-Find**: Cycle exists if union operation fails

### 3. **Connectivity Patterns**
- **Connected Components**: Count separate DFS/BFS traversals
- **Strong Connectivity**: Use Kosaraju's or Tarjan's algorithm
- **Union-Find**: Efficiently track and query connectivity

### 4. **Topological Sort Patterns**
- **Kahn's Algorithm**: BFS-based, good for counting
- **DFS-based**: Recursive, good for actual ordering
- **Cycle Detection**: Both methods detect cycles naturally

### 5. **Graph Construction Patterns**
- **Implicit Graphs**: Grid problems, word ladders
- **Reverse Thinking**: Start from targets/boundaries
- **State Space Graphs**: Model problem states as graph nodes

## Implementation Templates

### Basic DFS Template
```java
void dfs(int node, boolean[] visited, List<List<Integer>> adj) {
    visited[node] = true;
    // Process node
    
    for (int neighbor : adj.get(node)) {
        if (!visited[neighbor]) {
            dfs(neighbor, visited, adj);
        }
    }
}
```

### Basic BFS Template
```java
void bfs(int start, List<List<Integer>> adj) {
    Queue<Integer> queue = new LinkedList<>();
    boolean[] visited = new boolean[adj.size()];
    
    queue.offer(start);
    visited[start] = true;
    
    while (!queue.isEmpty()) {
        int node = queue.poll();
        // Process node
        
        for (int neighbor : adj.get(node)) {
            if (!visited[neighbor]) {
                visited[neighbor] = true;
                queue.offer(neighbor);
            }
        }
    }
}
```

### Cycle Detection in Directed Graph
```java
boolean hasCycle(List<List<Integer>> adj) {
    int n = adj.size();
    int[] color = new int[n]; // 0: white, 1: gray, 2: black
    
    for (int i = 0; i < n; i++) {
        if (color[i] == 0 && dfsHasCycle(i, adj, color)) {
            return true;
        }
    }
    return false;
}

boolean dfsHasCycle(int node, List<List<Integer>> adj, int[] color) {
    color[node] = 1; // Gray
    
    for (int neighbor : adj.get(node)) {
        if (color[neighbor] == 1) return true; // Back edge
        if (color[neighbor] == 0 && dfsHasCycle(neighbor, adj, color)) {
            return true;
        }
    }
    
    color[node] = 2; // Black
    return false;
}
```

### Topological Sort (Kahn's Algorithm)
```java
List<Integer> topologicalSort(List<List<Integer>> adj) {
    int n = adj.size();
    int[] indegree = new int[n];
    
    // Calculate indegrees
    for (int i = 0; i < n; i++) {
        for (int neighbor : adj.get(i)) {
            indegree[neighbor]++;
        }
    }
    
    Queue<Integer> queue = new LinkedList<>();
    for (int i = 0; i < n; i++) {
        if (indegree[i] == 0) {
            queue.offer(i);
        }
    }
    
    List<Integer> result = new ArrayList<>();
    while (!queue.isEmpty()) {
        int node = queue.poll();
        result.add(node);
        
        for (int neighbor : adj.get(node)) {
            indegree[neighbor]--;
            if (indegree[neighbor] == 0) {
                queue.offer(neighbor);
            }
        }
    }
    
    return result.size() == n ? result : new ArrayList<>(); // Empty if cycle
}
```

### Union-Find Template
```java
class UnionFind {
    private int[] parent, rank;
    private int components;
    
    public UnionFind(int n) {
        parent = new int[n];
        rank = new int[n];
        components = n;
        for (int i = 0; i < n; i++) parent[i] = i;
    }
    
    public int find(int x) {
        if (parent[x] != x) {
            parent[x] = find(parent[x]); // Path compression
        }
        return parent[x];
    }
    
    public boolean union(int x, int y) {
        int rootX = find(x), rootY = find(y);
        if (rootX == rootY) return false;
        
        // Union by rank
        if (rank[rootX] < rank[rootY]) {
            parent[rootX] = rootY;
        } else if (rank[rootX] > rank[rootY]) {
            parent[rootY] = rootX;
        } else {
            parent[rootY] = rootX;
            rank[rootX]++;
        }
        components--;
        return true;
    }
    
    public int getComponents() { return components; }
    public boolean isConnected(int x, int y) { return find(x) == find(y); }
}
```

## Final Tips for Graph Problems

1. **Choose the Right Representation**:
   - Adjacency list for sparse graphs
   - Adjacency matrix for dense graphs or when checking edge existence frequently

2. **Identify the Graph Type**:
   - Directed vs undirected affects cycle detection approach
   - Weighted vs unweighted affects shortest path algorithms

3. **Common Problem Types**:
   - Connectivity → DFS/BFS or Union-Find
   - Shortest Path → BFS (unweighted) or Dijkstra (weighted)
   - Cycle Detection → DFS with state tracking
   - Topological Sort → Kahn's algorithm or DFS

4. **Implementation Details**:
   - Always handle edge cases (empty graph, single node)
   - Be careful with index bounds in grid problems
   - Consider if you can modify input vs need separate visited array

5. **Optimization Techniques**:
   - Path compression in Union-Find
   - Early termination when result is found
   - Bidirectional search for shortest path problems

This comprehensive guide covers the fundamental graph algorithms and patterns needed to solve the Blind 75 graph problems effectively. Focus on understanding when to apply each technique and practice implementing the core templates until they become second nature.