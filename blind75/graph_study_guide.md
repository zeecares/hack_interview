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

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// Using List of Lists
List<List<Integer>> adj = new ArrayList<>();
// Using Map for flexibility
Map<Integer, List<Integer>> adj = new HashMap<>();
```
  </div>
  
  <div class="tab-content python">
```python
# Using list of lists
adj = [[] for _ in range(n)]
# Using dictionary for flexibility
from collections import defaultdict
adj = defaultdict(list)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Using array of arrays
const adj = Array.from({length: n}, () => []);
// Using Map for flexibility
const adj = new Map();
// Using object for flexibility
const adj = {};
```
  </div>
</div>

### 2. Adjacency Matrix
**When to Use**: Dense graphs, when checking edge existence frequently

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
boolean[][] adj = new boolean[n][n];
// or for weighted graphs
int[][] adj = new int[n][n];
```
  </div>
  
  <div class="tab-content python">
```python
# Boolean matrix
adj = [[False] * n for _ in range(n)]
# For weighted graphs
adj = [[0] * n for _ in range(n)]
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Boolean matrix
const adj = Array.from({length: n}, () => Array(n).fill(false));
// For weighted graphs
const adj = Array.from({length: n}, () => Array(n).fill(0));
```
  </div>
</div>

### 3. Edge List
**When to Use**: Union-Find problems, minimum spanning tree

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
import java.util.ArrayList;
import java.util.List;

class Edge {
    int from, to, weight;
    Edge(int from, int to, int weight) {
        this.from = from;
        this.to = to;
        this.weight = weight;
    }
}
List<Edge> edges = new ArrayList<>();
```
  </div>
  
  <div class="tab-content python">
```python
# Using tuple
edges = [(from_node, to_node, weight), ...]
# Using list
edges = [[from_node, to_node, weight], ...]
# Using namedtuple for clarity
from collections import namedtuple
Edge = namedtuple('Edge', ['from_node', 'to', 'weight'])
edges = [Edge(from_node, to, weight), ...]
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Using object
class Edge {
    constructor(from, to, weight) {
        this.from = from;
        this.to = to;
        this.weight = weight;
    }
}
const edges = [];
// Using array
const edges = [[from, to, weight], ...];
```
  </div>
</div>

## Core Graph Algorithms

### Depth-First Search (DFS)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
import java.util.List;

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
  </div>
  
  <div class="tab-content python">
```python
def dfs(node, visited, adj):
    visited[node] = True
    # Process current node
    
    for neighbor in adj[node]:
        if not visited[neighbor]:
            dfs(neighbor, visited, adj)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function dfs(node, visited, adj) {
    visited[node] = true;
    // Process current node
    
    for (const neighbor of adj[node]) {
        if (!visited[neighbor]) {
            dfs(neighbor, visited, adj);
        }
    }
}
```
  </div>
</div>

### Breadth-First Search (BFS)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;

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
  </div>
  
  <div class="tab-content python">
```python
from collections import deque

def bfs(start, adj):
    queue = deque([start])
    visited = [False] * len(adj)
    visited[start] = True
    
    while queue:
        node = queue.popleft()
        # Process current node
        
        for neighbor in adj[node]:
            if not visited[neighbor]:
                visited[neighbor] = True
                queue.append(neighbor)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function bfs(start, adj) {
    const queue = [start];
    const visited = Array(adj.length).fill(false);
    visited[start] = true;
    
    while (queue.length > 0) {
        const node = queue.shift();
        // Process current node
        
        for (const neighbor of adj[node]) {
            if (!visited[neighbor]) {
                visited[neighbor] = true;
                queue.push(neighbor);
            }
        }
    }
}
```
  </div>
</div>

### Union-Find (Disjoint Set)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
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
  </div>
  
  <div class="tab-content python">
```python
class UnionFind:
    def __init__(self, n):
        self.parent = list(range(n))
        self.rank = [0] * n
        self.components = n
    
    def find(self, x):
        if self.parent[x] != x:
            self.parent[x] = self.find(self.parent[x])  # Path compression
        return self.parent[x]
    
    def union(self, x, y):
        root_x, root_y = self.find(x), self.find(y)
        if root_x == root_y:
            return False
        
        # Union by rank
        if self.rank[root_x] < self.rank[root_y]:
            self.parent[root_x] = root_y
        elif self.rank[root_x] > self.rank[root_y]:
            self.parent[root_y] = root_x
        else:
            self.parent[root_y] = root_x
            self.rank[root_x] += 1
        
        self.components -= 1
        return True
    
    def get_components(self):
        return self.components
```
  </div>
  
  <div class="tab-content javascript">
```javascript
class UnionFind {
    constructor(n) {
        this.parent = Array.from({length: n}, (_, i) => i);
        this.rank = Array(n).fill(0);
        this.components = n;
    }
    
    find(x) {
        if (this.parent[x] !== x) {
            this.parent[x] = this.find(this.parent[x]); // Path compression
        }
        return this.parent[x];
    }
    
    union(x, y) {
        const rootX = this.find(x);
        const rootY = this.find(y);
        if (rootX === rootY) return false;
        
        // Union by rank
        if (this.rank[rootX] < this.rank[rootY]) {
            this.parent[rootX] = rootY;
        } else if (this.rank[rootX] > this.rank[rootY]) {
            this.parent[rootY] = rootX;
        } else {
            this.parent[rootY] = rootX;
            this.rank[rootX]++;
        }
        this.components--;
        return true;
    }
    
    getComponents() {
        return this.components;
    }
}
```
  </div>
</div>

## Problem Solutions

### 1. Clone Graph (LeetCode 133)

**🔗 LeetCode Link:** [Clone Graph - LeetCode #133](https://leetcode.com/problems/clone-graph/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. How would you create a complete copy of a graph while preserving all connections?
2. What challenge arises when the graph contains cycles, and how might you handle it?
3. What information do you need to track to avoid creating duplicate nodes?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding Deep Copying vs Reference Copying
> **Guided Question:** What's the difference between copying node references versus creating entirely new nodes with the same structure?

<details>
<summary>💭 Think about it, then click to reveal</summary>

When cloning a graph, we need to create completely new node objects, not just copy references. Each cloned node must:
- Have the same value as the original
- Connect to cloned versions of the original's neighbors
- Maintain the exact same graph structure

This is "deep copying" - we're recreating the entire structure, not sharing any objects with the original.
</details>

#### Step 2: Handling Cycles and Avoiding Infinite Loops
> **Guided Question:** If the graph has cycles (A connects to B, B connects to A), how do we avoid creating nodes infinitely?

<details>
<summary>💭 Think about it, then click to reveal</summary>

We need a mapping between original nodes and their clones. When we encounter a node:
- If we've already cloned it, use the existing clone
- If we haven't cloned it yet, create a new clone and add to our mapping

This prevents infinite loops and ensures each original node maps to exactly one clone. A HashMap works perfectly for this original → clone mapping.
</details>

#### Step 3: Traversal Strategy - DFS vs BFS
> **Guided Question:** Should we use DFS (recursion) or BFS (queue) to traverse and clone the graph?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Both DFS and BFS work well for graph cloning:

**DFS Approach:**
- More intuitive recursive solution
- Clone node, then recursively clone all neighbors
- Natural backtracking handles the mapping

**BFS Approach:**
- Iterative with queue
- Clone nodes level by level
- Explicit queue management but no recursion stack

DFS is often preferred for its simplicity, but BFS avoids potential stack overflow on very deep graphs.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Create a HashMap to track original → clone mappings
- [ ] Handle the null input case
- [ ] Clone the starting node and add to mapping
- [ ] Traverse all neighbors (recursively or iteratively)
- [ ] For each neighbor: check if already cloned, clone if needed
- [ ] Connect current clone to neighbor clones

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why is the original → clone mapping essential for correctness?
2. **Complexity Analysis:** Why is the time complexity O(V + E) where V is vertices and E is edges?
3. **Trade-offs:** What are the pros and cons of DFS vs BFS for this problem?
4. **Pattern Recognition:** How does this problem relate to copying other data structures like linked lists with cycles?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the cloning concept: ___/5
- [ ] Implementing DFS solution: ___/5  
- [ ] Implementing BFS solution: ___/5
- [ ] Explaining the mapping strategy: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Try implementing both DFS and BFS versions for practice

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

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
import java.util.HashMap;
import java.util.Map;

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
  </div>
  
  <div class="tab-content python">
```python
class Solution:
    def cloneGraph(self, node: 'Node') -> 'Node':
        if not node:
            return None
        
        visited = {}
        return self.dfs(node, visited)
    
    def dfs(self, node, visited):
        # If already cloned, return the clone
        if node in visited:
            return visited[node]
        
        # Create clone for current node
        clone = Node(node.val)
        visited[node] = clone
        
        # Recursively clone neighbors
        for neighbor in node.neighbors:
            clone.neighbors.append(self.dfs(neighbor, visited))
        
        return clone
```
  </div>
  
  <div class="tab-content javascript">
```javascript
var cloneGraph = function(node) {
    if (!node) return null;
    
    const visited = new Map();
    
    function dfs(node) {
        // If already cloned, return the clone
        if (visited.has(node)) {
            return visited.get(node);
        }
        
        // Create clone for current node
        const clone = new Node(node.val);
        visited.set(node, clone);
        
        // Recursively clone neighbors
        for (const neighbor of node.neighbors) {
            clone.neighbors.push(dfs(neighbor));
        }
        
        return clone;
    }
    
    return dfs(node);
};
```
  </div>
</div>

**Solution 2: BFS with HashMap**

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
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
  </div>
  
  <div class="tab-content python">
```python
from collections import deque

class Solution:
    def cloneGraph(self, node: 'Node') -> 'Node':
        if not node:
            return None
        
        visited = {}
        queue = deque([node])
        
        # Create clone for start node
        clone = Node(node.val)
        visited[node] = clone
        
        while queue:
            current = queue.popleft()
            
            for neighbor in current.neighbors:
                if neighbor not in visited:
                    # Create clone for neighbor
                    visited[neighbor] = Node(neighbor.val)
                    queue.append(neighbor)
                
                # Connect current clone to neighbor clone
                visited[current].neighbors.append(visited[neighbor])
        
        return clone
```
  </div>
  
  <div class="tab-content javascript">
```javascript
var cloneGraph = function(node) {
    if (!node) return null;
    
    const visited = new Map();
    const queue = [node];
    
    // Create clone for start node
    const clone = new Node(node.val);
    visited.set(node, clone);
    
    while (queue.length > 0) {
        const current = queue.shift();
        
        for (const neighbor of current.neighbors) {
            if (!visited.has(neighbor)) {
                // Create clone for neighbor
                visited.set(neighbor, new Node(neighbor.val));
                queue.push(neighbor);
            }
            // Connect current clone to neighbor clone
            visited.get(current).neighbors.push(visited.get(neighbor));
        }
    }
    
    return clone;
};
```
  </div>
</div>

**Complexity Analysis**:
- Time: O(V + E) where V = vertices, E = edges
- Space: O(V) for the hash map and recursion stack

**Key Insights**:
- Use hash map to track original → clone mapping
- Both DFS and BFS work; DFS is more intuitive
- Handle cycles by checking if node already cloned

---

### 2. Course Schedule (LeetCode 207)

**🔗 LeetCode Link:** [Course Schedule - LeetCode #207](https://leetcode.com/problems/course-schedule/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. How would you model the prerequisite relationships between courses as a graph?
2. What would make it impossible to complete all courses, and how would this appear in the graph?
3. What graph algorithm could help you detect if course completion is possible?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Modeling Prerequisites as a Directed Graph
> **Guided Question:** If course B is a prerequisite for course A, how should you draw the edge between them?

<details>
<summary>💭 Think about it, then click to reveal</summary>

We create a directed edge from B → A (prerequisite → course). This means:
- Course B must be completed before course A
- Following edges gives us a valid completion order
- The graph represents dependency relationships

For example, if [1,0] means course 0 is prerequisite for course 1, we draw: 0 → 1

This creates a directed graph where edges point from prerequisites to courses that depend on them.
</details>

#### Step 2: When Course Completion Becomes Impossible
> **Guided Question:** What graph property would make it impossible to complete all courses?

<details>
<summary>💭 Think about it, then click to reveal</summary>

A **cycle** in the prerequisite graph makes completion impossible!

If we have courses A → B → C → A:
- A requires B, B requires C, C requires A
- This creates circular dependency - no valid starting point
- You can never break into the cycle to begin

So the problem reduces to: "Does this directed graph contain any cycles?"
</details>

#### Step 3: Cycle Detection Strategies
> **Guided Question:** What are the two main algorithmic approaches to detect cycles in a directed graph?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Approach 1: DFS with 3-Color State Tracking**
- White (0): Unvisited
- Gray (1): Currently being processed (in recursion stack) 
- Black (2): Completely processed
- Cycle exists if we encounter a gray node during DFS

**Approach 2: Topological Sort (Kahn's Algorithm)**
- Remove nodes with no incoming edges (indegree = 0)
- Update neighbors' indegrees when removing nodes
- If we can remove all nodes, no cycle exists
- If nodes remain, they form cycles

Both approaches work well - DFS is more direct for cycle detection, Kahn's algorithm naturally gives course completion order too.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Build adjacency list from prerequisite pairs
- [ ] Choose cycle detection method (DFS states or Kahn's algorithm)
- [ ] For DFS: implement 3-color state tracking with recursion
- [ ] For Kahn's: calculate indegrees and use queue for 0-indegree nodes
- [ ] Return true if no cycles detected, false otherwise

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does a cycle in the prerequisite graph prevent course completion?
2. **Complexity Analysis:** Why do both DFS and Kahn's approaches run in O(V + E) time?
3. **Trade-offs:** When might you prefer DFS cycle detection versus Kahn's algorithm?
4. **Pattern Recognition:** What other problems involve dependency ordering and cycle detection?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding prerequisite modeling: ___/5
- [ ] Implementing DFS cycle detection: ___/5  
- [ ] Implementing Kahn's algorithm: ___/5
- [ ] Explaining why cycles prevent completion: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Practice drawing prerequisite graphs for different course scenarios

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

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
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
  </div>
  
  <div class="tab-content python">
```python
class Solution:
    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
        # Build adjacency list
        adj = [[] for _ in range(numCourses)]
        
        for prereq in prerequisites:
            adj[prereq[1]].append(prereq[0])  # prereq[1] -> prereq[0]
        
        # 0: unvisited, 1: visiting, 2: visited
        state = [0] * numCourses
        
        def has_cycle(course):
            if state[course] == 1:
                return True  # Back edge found (cycle)
            if state[course] == 2:
                return False  # Already processed
            
            state[course] = 1  # Mark as visiting
            
            for next_course in adj[course]:
                if has_cycle(next_course):
                    return True
            
            state[course] = 2  # Mark as visited
            return False
        
        for i in range(numCourses):
            if state[i] == 0 and has_cycle(i):
                return False
        
        return True
```
  </div>
  
  <div class="tab-content javascript">
```javascript
var canFinish = function(numCourses, prerequisites) {
    // Build adjacency list
    const adj = Array.from({length: numCourses}, () => []);
    
    for (const [course, prereq] of prerequisites) {
        adj[prereq].push(course); // prereq -> course
    }
    
    // 0: unvisited, 1: visiting, 2: visited
    const state = Array(numCourses).fill(0);
    
    function hasCycle(course) {
        if (state[course] === 1) return true;  // Back edge found (cycle)
        if (state[course] === 2) return false; // Already processed
        
        state[course] = 1; // Mark as visiting
        
        for (const nextCourse of adj[course]) {
            if (hasCycle(nextCourse)) {
                return true;
            }
        }
        
        state[course] = 2; // Mark as visited
        return false;
    }
    
    for (let i = 0; i < numCourses; i++) {
        if (state[i] === 0 && hasCycle(i)) {
            return false;
        }
    }
    
    return true;
};
```
  </div>
</div>

**Solution 2: Kahn's Algorithm (Topological Sort)**

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
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
  </div>
  
  <div class="tab-content python">
```python
from collections import deque

class Solution:
    def canFinish(self, numCourses: int, prerequisites: List[List[int]]) -> bool:
        # Build adjacency list and calculate indegrees
        adj = [[] for _ in range(numCourses)]
        indegree = [0] * numCourses
        
        for prereq in prerequisites:
            adj[prereq[1]].append(prereq[0])
            indegree[prereq[0]] += 1
        
        # Start with courses having no prerequisites
        queue = deque()
        for i in range(numCourses):
            if indegree[i] == 0:
                queue.append(i)
        
        completed = 0
        while queue:
            course = queue.popleft()
            completed += 1
            
            # Remove this course and update indegrees
            for next_course in adj[course]:
                indegree[next_course] -= 1
                if indegree[next_course] == 0:
                    queue.append(next_course)
        
        return completed == numCourses
```
  </div>
  
  <div class="tab-content javascript">
```javascript
var canFinish = function(numCourses, prerequisites) {
    // Build adjacency list and calculate indegrees
    const adj = Array.from({length: numCourses}, () => []);
    const indegree = Array(numCourses).fill(0);
    
    for (const [course, prereq] of prerequisites) {
        adj[prereq].push(course);
        indegree[course]++;
    }
    
    // Start with courses having no prerequisites
    const queue = [];
    for (let i = 0; i < numCourses; i++) {
        if (indegree[i] === 0) {
            queue.push(i);
        }
    }
    
    let completed = 0;
    while (queue.length > 0) {
        const course = queue.shift();
        completed++;
        
        // Remove this course and update indegrees
        for (const nextCourse of adj[course]) {
            indegree[nextCourse]--;
            if (indegree[nextCourse] === 0) {
                queue.push(nextCourse);
            }
        }
    }
    
    return completed === numCourses;
};
```
  </div>
</div>

**Complexity Analysis**:
- Time: O(V + E) where V = courses, E = prerequisites
- Space: O(V + E) for adjacency list

**Key Insights**:
- Cycle detection is key to solving prerequisite problems
- DFS with 3-state tracking (unvisited/visiting/visited) detects cycles
- Topological sort (Kahn's algorithm) also detects cycles naturally

---

### 3. Pacific Atlantic Water Flow (LeetCode 417)

**🔗 LeetCode Link:** [Pacific Atlantic Water Flow - LeetCode #417](https://leetcode.com/problems/pacific-atlantic-water-flow/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. If you had to check every cell individually to see if water can reach both oceans, what would be the time complexity?
2. What's the opposite approach - instead of checking where water can go from each cell, what could you check?
3. How might you model this water flow problem as a graph traversal?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: The Reverse Thinking Insight
> **Guided Question:** Instead of asking "from this cell, can water reach both oceans?", what's the reverse question that might be easier to answer?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Ask: "From each ocean, which cells can the water reach?"

This reverse approach is much more efficient because:
- We start from ocean boundaries (known starting points)
- We flow "backwards" - from lower/equal height to higher height
- We only need to run traversal twice (once per ocean)
- The intersection of reachable cells gives us our answer

This transforms an O(m²n²) brute force into an O(mn) solution!
</details>

#### Step 2: Multi-source BFS/DFS Strategy
> **Guided Question:** How do you start a graph traversal from multiple starting points simultaneously?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Multi-source traversal:** Start from all ocean boundary cells at once.

For Pacific Ocean:
- Start from all cells in top row (row 0)
- Start from all cells in left column (col 0)

For Atlantic Ocean:
- Start from all cells in bottom row (row m-1)
- Start from all cells in right column (col n-1)

You can use either DFS or BFS - both explore all cells reachable from ocean boundaries. The key insight is that water can flow "upward" in this reverse direction.
</details>

#### Step 3: Finding the Intersection
> **Guided Question:** Once you know which cells each ocean can reach, how do you find cells reachable by both?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Use two separate boolean matrices to track reachability:
- `pacificReachable[i][j]` = true if Pacific can reach cell (i,j)
- `atlanticReachable[i][j]` = true if Atlantic can reach cell (i,j)

The answer is all cells where both matrices are true:
```java
if (pacificReachable[i][j] && atlanticReachable[i][j]) {
    result.add(Arrays.asList(i, j));
}
```

This intersection represents cells where rainwater can flow to both oceans.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Create two boolean matrices for Pacific and Atlantic reachability
- [ ] Add all Pacific border cells to queue/start DFS from them
- [ ] Add all Atlantic border cells to queue/start DFS from them
- [ ] For each traversal, move to neighbors with height >= current height
- [ ] Find intersection of both reachability matrices

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does the reverse approach (ocean → cells) work better than forward (cells → ocean)?
2. **Complexity Analysis:** How does multi-source BFS achieve O(mn) time complexity?
3. **Trade-offs:** When would you choose DFS versus BFS for this problem?
4. **Pattern Recognition:** What other problems benefit from "reverse thinking" or multi-source traversal?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the reverse thinking insight: ___/5
- [ ] Implementing multi-source DFS: ___/5  
- [ ] Implementing multi-source BFS: ___/5
- [ ] Explaining why intersection gives the answer: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Try drawing the flow direction on a small example to visualize the concept

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

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
class Solution {
    private int[][] directions = { {-1, 0}, {1, 0}, {0, -1}, {0, 1} };
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
  </div>
  
  <div class="tab-content python">
```python
class Solution:
    def pacificAtlantic(self, heights: List[List[int]]) -> List[List[int]]:
        if not heights or not heights[0]:
            return []
        
        m, n = len(heights), len(heights[0])
        directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        
        pacific = [[False] * n for _ in range(m)]
        atlantic = [[False] * n for _ in range(m)]
        
        def dfs(i, j, visited, prev_height):
            if (i < 0 or i >= m or j < 0 or j >= n or 
                visited[i][j] or heights[i][j] < prev_height):
                return
            
            visited[i][j] = True
            
            for di, dj in directions:
                dfs(i + di, j + dj, visited, heights[i][j])
        
        # DFS from Pacific borders (top and left)
        for i in range(m):
            dfs(i, 0, pacific, heights[i][0])
        for j in range(n):
            dfs(0, j, pacific, heights[0][j])
        
        # DFS from Atlantic borders (bottom and right)
        for i in range(m):
            dfs(i, n - 1, atlantic, heights[i][n - 1])
        for j in range(n):
            dfs(m - 1, j, atlantic, heights[m - 1][j])
        
        # Find intersection
        result = []
        for i in range(m):
            for j in range(n):
                if pacific[i][j] and atlantic[i][j]:
                    result.append([i, j])
        
        return result
```
  </div>
  
  <div class="tab-content javascript">
```javascript
var pacificAtlantic = function(heights) {
    if (!heights || heights.length === 0 || heights[0].length === 0) {
        return [];
    }
    
    const m = heights.length;
    const n = heights[0].length;
    const directions = [[-1, 0], [1, 0], [0, -1], [0, 1]];
    
    const pacific = Array.from({length: m}, () => Array(n).fill(false));
    const atlantic = Array.from({length: m}, () => Array(n).fill(false));
    
    function dfs(i, j, visited, prevHeight) {
        if (i < 0 || i >= m || j < 0 || j >= n || 
            visited[i][j] || heights[i][j] < prevHeight) {
            return;
        }
        
        visited[i][j] = true;
        
        for (const [di, dj] of directions) {
            dfs(i + di, j + dj, visited, heights[i][j]);
        }
    }
    
    // DFS from Pacific borders (top and left)
    for (let i = 0; i < m; i++) {
        dfs(i, 0, pacific, heights[i][0]);
    }
    for (let j = 0; j < n; j++) {
        dfs(0, j, pacific, heights[0][j]);
    }
    
    // DFS from Atlantic borders (bottom and right)
    for (let i = 0; i < m; i++) {
        dfs(i, n - 1, atlantic, heights[i][n - 1]);
    }
    for (let j = 0; j < n; j++) {
        dfs(m - 1, j, atlantic, heights[m - 1][j]);
    }
    
    // Find intersection
    const result = [];
    for (let i = 0; i < m; i++) {
        for (let j = 0; j < n; j++) {
            if (pacific[i][j] && atlantic[i][j]) {
                result.push([i, j]);
            }
        }
    }
    
    return result;
};
```
  </div>
</div>

**Solution 2: BFS from Boundaries**

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
class Solution {
    private int[][] directions = { {-1, 0}, {1, 0}, {0, -1}, {0, 1} };
    
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
  </div>
  
  <div class="tab-content python">
```python
from collections import deque

class Solution:
    def pacificAtlantic(self, heights: List[List[int]]) -> List[List[int]]:
        if not heights or not heights[0]:
            return []
        
        m, n = len(heights), len(heights[0])
        directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        
        pacific = [[False] * n for _ in range(m)]
        atlantic = [[False] * n for _ in range(m)]
        
        pacific_queue = deque()
        atlantic_queue = deque()
        
        # Add Pacific borders
        for i in range(m):
            pacific[i][0] = True
            pacific_queue.append((i, 0))
        for j in range(n):
            pacific[0][j] = True
            pacific_queue.append((0, j))
        
        # Add Atlantic borders
        for i in range(m):
            atlantic[i][n - 1] = True
            atlantic_queue.append((i, n - 1))
        for j in range(n):
            atlantic[m - 1][j] = True
            atlantic_queue.append((m - 1, j))
        
        def bfs(queue, visited):
            while queue:
                i, j = queue.popleft()
                
                for di, dj in directions:
                    ni, nj = i + di, j + dj
                    
                    if (0 <= ni < m and 0 <= nj < n and 
                        not visited[ni][nj] and heights[ni][nj] >= heights[i][j]):
                        visited[ni][nj] = True
                        queue.append((ni, nj))
        
        # BFS from Pacific and Atlantic
        bfs(pacific_queue, pacific)
        bfs(atlantic_queue, atlantic)
        
        # Find intersection
        result = []
        for i in range(m):
            for j in range(n):
                if pacific[i][j] and atlantic[i][j]:
                    result.append([i, j])
        
        return result
```
  </div>
  
  <div class="tab-content javascript">
```javascript
var pacificAtlantic = function(heights) {
    if (!heights || heights.length === 0 || heights[0].length === 0) {
        return [];
    }
    
    const m = heights.length;
    const n = heights[0].length;
    const directions = [[-1, 0], [1, 0], [0, -1], [0, 1]];
    
    const pacific = Array.from({length: m}, () => Array(n).fill(false));
    const atlantic = Array.from({length: m}, () => Array(n).fill(false));
    
    const pacificQueue = [];
    const atlanticQueue = [];
    
    // Add Pacific borders
    for (let i = 0; i < m; i++) {
        pacific[i][0] = true;
        pacificQueue.push([i, 0]);
    }
    for (let j = 0; j < n; j++) {
        pacific[0][j] = true;
        pacificQueue.push([0, j]);
    }
    
    // Add Atlantic borders
    for (let i = 0; i < m; i++) {
        atlantic[i][n - 1] = true;
        atlanticQueue.push([i, n - 1]);
    }
    for (let j = 0; j < n; j++) {
        atlantic[m - 1][j] = true;
        atlanticQueue.push([m - 1, j]);
    }
    
    function bfs(queue, visited) {
        while (queue.length > 0) {
            const [i, j] = queue.shift();
            
            for (const [di, dj] of directions) {
                const ni = i + di;
                const nj = j + dj;
                
                if (ni >= 0 && ni < m && nj >= 0 && nj < n && 
                    !visited[ni][nj] && heights[ni][nj] >= heights[i][j]) {
                    visited[ni][nj] = true;
                    queue.push([ni, nj]);
                }
            }
        }
    }
    
    // BFS from Pacific and Atlantic
    bfs(pacificQueue, pacific);
    bfs(atlanticQueue, atlantic);
    
    // Find intersection
    const result = [];
    for (let i = 0; i < m; i++) {
        for (let j = 0; j < n; j++) {
            if (pacific[i][j] && atlantic[i][j]) {
                result.push([i, j]);
            }
        }
    }
    
    return result;
};
```
  </div>
</div>

**Complexity Analysis**:
- Time: O(m × n) - visit each cell at most twice
- Space: O(m × n) - for visited arrays

**Key Insights**:
- Reverse thinking: start from oceans, not from each cell
- Water can flow to higher or equal elevations in reverse direction
- Use two separate visited arrays for each ocean

---

### 4. Number of Islands (LeetCode 200)

**🔗 LeetCode Link:** [Number of Islands - LeetCode #200](https://leetcode.com/problems/number-of-islands/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. How would you define what makes a group of connected land cells form a single island?
2. What happens when you find a land cell - how do you ensure you count its entire island only once?
3. What graph concept does this problem represent, and what traversal would help solve it?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Recognizing Connected Components
> **Guided Question:** If you think of the grid as a graph, what do the land cells and their connections represent?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Each land cell ('1') is a **node** in the graph, and **edges** connect horizontally/vertically adjacent land cells.

This creates connected components:
- Each island = one connected component of land cells
- Water cells ('0') act as barriers between components
- The problem asks: "How many connected components are there?"

This transforms a 2D grid problem into a classic graph theory problem!
</details>

#### Step 2: Marking Visited Cells Strategy
> **Guided Question:** When you find a land cell, how do you ensure you don't count any part of its island again?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Strategy: Mark and explore entire island at once**

When you find an unvisited land cell:
1. Increment island counter (found a new island!)
2. Use DFS/BFS to explore ALL connected land cells
3. Mark each visited cell to avoid recounting

**Space-saving trick:** Instead of a separate visited array, you can modify the grid in-place by changing '1' → '0' as you explore. This "sinks" the island as you count it.
</details>

#### Step 3: DFS vs BFS vs Union-Find
> **Guided Question:** What are the different algorithmic approaches to explore connected components, and when would you use each?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**DFS (Recursive/Iterative):**
- Most intuitive and common approach
- Recursively explore neighbors until island is fully marked
- Simple to implement but uses O(min(m,n)) space for recursion

**BFS with Queue:**
- Iterative approach using queue
- Explores island level-by-level
- Uses O(min(m,n)) space for queue, avoids recursion stack

**Union-Find:**
- Overkill for this problem but demonstrates the concept
- Union adjacent land cells, count final components
- More complex but educational for understanding connectivity

DFS is usually preferred for its simplicity and natural recursive structure.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Iterate through every cell in the grid
- [ ] When you find an unvisited land cell ('1'), increment island count
- [ ] Start DFS/BFS from that cell to mark the entire island
- [ ] In DFS/BFS: mark current cell as visited, explore 4 neighbors
- [ ] Continue until all cells are processed

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does starting a new DFS/BFS indicate finding a new island?
2. **Complexity Analysis:** Why is the time complexity O(m×n) even though we might visit cells multiple times?
3. **Trade-offs:** What are the pros and cons of modifying the grid in-place versus using a visited array?
4. **Pattern Recognition:** How does this problem relate to other connected component problems?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding connected components concept: ___/5
- [ ] Implementing DFS solution: ___/5  
- [ ] Implementing BFS solution: ___/5
- [ ] Explaining the marking strategy: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Try implementing both grid modification and separate visited array approaches

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

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
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
  </div>
  
  <div class="tab-content python">
```python
class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        if not grid or not grid[0]:
            return 0
        
        count = 0
        m, n = len(grid), len(grid[0])
        
        def dfs(i, j):
            if (i < 0 or i >= m or j < 0 or j >= n or 
                grid[i][j] != '1'):
                return
            
            grid[i][j] = '0'  # Mark as visited
            
            # Explore 4 directions
            dfs(i - 1, j)
            dfs(i + 1, j)
            dfs(i, j - 1)
            dfs(i, j + 1)
        
        for i in range(m):
            for j in range(n):
                if grid[i][j] == '1':
                    count += 1
                    dfs(i, j)
        
        return count
```
  </div>
  
  <div class="tab-content javascript">
```javascript
var numIslands = function(grid) {
    if (!grid || grid.length === 0 || grid[0].length === 0) {
        return 0;
    }
    
    let count = 0;
    const m = grid.length;
    const n = grid[0].length;
    
    function dfs(i, j) {
        if (i < 0 || i >= m || j < 0 || j >= n || grid[i][j] !== '1') {
            return;
        }
        
        grid[i][j] = '0'; // Mark as visited
        
        // Explore 4 directions
        dfs(i - 1, j);
        dfs(i + 1, j);
        dfs(i, j - 1);
        dfs(i, j + 1);
    }
    
    for (let i = 0; i < m; i++) {
        for (let j = 0; j < n; j++) {
            if (grid[i][j] === '1') {
                count++;
                dfs(i, j);
            }
        }
    }
    
    return count;
};
```
  </div>
</div>

**Solution 2: BFS with Queue**

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
class Solution {
    private int[][] directions = { {-1, 0}, {1, 0}, {0, -1}, {0, 1} };
    
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
  </div>
  
  <div class="tab-content python">
```python
from collections import deque

class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:
        if not grid or not grid[0]:
            return 0
        
        count = 0
        m, n = len(grid), len(grid[0])
        directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
        
        def bfs(start_i, start_j):
            queue = deque([(start_i, start_j)])
            grid[start_i][start_j] = '0'
            
            while queue:
                i, j = queue.popleft()
                
                for di, dj in directions:
                    ni, nj = i + di, j + dj
                    
                    if (0 <= ni < m and 0 <= nj < n and 
                        grid[ni][nj] == '1'):
                        grid[ni][nj] = '0'
                        queue.append((ni, nj))
        
        for i in range(m):
            for j in range(n):
                if grid[i][j] == '1':
                    count += 1
                    bfs(i, j)
        
        return count
```
  </div>
  
  <div class="tab-content javascript">
```javascript
var numIslands = function(grid) {
    if (!grid || grid.length === 0 || grid[0].length === 0) {
        return 0;
    }
    
    let count = 0;
    const m = grid.length;
    const n = grid[0].length;
    const directions = [[-1, 0], [1, 0], [0, -1], [0, 1]];
    
    function bfs(startI, startJ) {
        const queue = [[startI, startJ]];
        grid[startI][startJ] = '0';
        
        while (queue.length > 0) {
            const [i, j] = queue.shift();
            
            for (const [di, dj] of directions) {
                const ni = i + di;
                const nj = j + dj;
                
                if (ni >= 0 && ni < m && nj >= 0 && nj < n && 
                    grid[ni][nj] === '1') {
                    grid[ni][nj] = '0';
                    queue.push([ni, nj]);
                }
            }
        }
    }
    
    for (let i = 0; i < m; i++) {
        for (let j = 0; j < n; j++) {
            if (grid[i][j] === '1') {
                count++;
                bfs(i, j);
            }
        }
    }
    
    return count;
};
```
  </div>
</div>

**Solution 3: Union-Find**
```java
class Solution {
    public int numIslands(char[][] grid) {
        if (grid == null || grid.length == 0) return 0;
        
        int m = grid.length, n = grid[0].length;
        UnionFind uf = new UnionFind(grid);
        
        int[][] directions = { {-1, 0}, {1, 0}, {0, -1}, {0, 1} };
        
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

**🔗 LeetCode Link:** [Longest Consecutive Sequence - LeetCode #128](https://leetcode.com/problems/longest-consecutive-sequence/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. If you were allowed to sort the array, how would you solve this? What's the time complexity?
2. What data structure allows O(1) lookup to check if a number exists in the array?
3. How could you avoid building the same sequence multiple times when checking consecutive numbers?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: From Sorting to Hash Set Optimization
> **Guided Question:** The sorting approach would be O(n log n). How can a hash set help you achieve O(n) time complexity?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Hash Set enables O(1) lookups:**
- Put all numbers in a hash set for instant existence checking
- For each number, check if consecutive numbers exist: num+1, num+2, etc.
- Build sequences by following consecutive numbers
- No sorting needed - just constant-time lookups!

**Key insight:** We can build sequences on-demand by checking if num+1, num+2, etc. exist in the set.
</details>

#### Step 2: Avoiding Redundant Work - Smart Starting Points
> **Guided Question:** If you check consecutive sequences starting from every number, you'll do redundant work. How can you ensure each sequence is built only once?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Only start sequences from their beginning:**
- For each number `num`, check if `num-1` exists in the set
- If `num-1` exists, then `num` is NOT the start of a sequence
- If `num-1` doesn't exist, then `num` IS the start of a sequence
- Only build sequences starting from sequence beginnings

This ensures each sequence is built exactly once, maintaining O(n) time complexity.

Example: For sequence [1,2,3,4], only start building from 1, not from 2, 3, or 4.
</details>

#### Step 3: Implicit Graph Perspective
> **Guided Question:** How can you think of consecutive numbers as forming an implicit graph structure?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Consecutive numbers form implicit linked chains:**
- Each number has at most one "next" number (num+1)
- Each number has at most one "previous" number (num-1)
- This creates chains: ... ← num-1 ← num ← num+1 ← ...

**Graph analogy:**
- Numbers are nodes
- "Consecutive" relationship creates directed edges
- We're finding the longest path in these chains
- Hash set lets us navigate these implicit edges in O(1) time

This graph perspective helps understand why we only start from "heads" of chains (numbers with no predecessor).
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Create a hash set containing all numbers from the array
- [ ] Iterate through the original array (or the set)
- [ ] For each number, check if it's the start of a sequence (num-1 not in set)
- [ ] If it's a start, build the sequence by checking num+1, num+2, etc.
- [ ] Track the maximum sequence length found

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does starting only from sequence beginnings ensure O(n) time complexity?
2. **Complexity Analysis:** Even with nested loops, why is this still O(n) and not O(n²)?
3. **Trade-offs:** What's the space complexity trade-off for achieving O(n) time?
4. **Pattern Recognition:** How does the "smart starting points" technique apply to other problems?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding the hash set optimization: ___/5
- [ ] Implementing the smart starting points logic: ___/5  
- [ ] Explaining why time complexity is O(n): ___/5
- [ ] Recognizing the implicit graph structure: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Try tracing through the algorithm on a sample array to see why each sequence is built only once

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

**🔗 LeetCode Link:** [Alien Dictionary - LeetCode #269](https://leetcode.com/problems/alien-dictionary/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. If words are given in sorted order, what can you infer by comparing two adjacent words?
2. How would you represent the ordering relationships between characters as a data structure?
3. What algorithm helps you find a valid ordering when you have dependencies between elements?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Extracting Character Ordering from Word Comparisons
> **Guided Question:** If word "abc" comes before word "adc" in alien dictionary order, what does this tell you about character relationships?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Compare adjacent words to find character ordering:**
- "abc" < "adc" → Compare character by character
- 'a' == 'a' → Continue to next position
- 'b' < 'd' → This gives us the ordering: 'b' comes before 'd' in alien alphabet

**Key insight:** Only the first differing character pair matters!
- Once we find 'b' < 'd', we know the relative order
- Later characters don't provide additional ordering information for this word pair

We build a directed graph where edge A → B means "character A comes before character B"
</details>

#### Step 2: Building the Dependency Graph
> **Guided Question:** How do you systematically extract all character ordering relationships from the word list?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Process all adjacent word pairs:**
1. Compare each word with the next word in the list
2. Find the first position where characters differ
3. Add directed edge: first_char → second_char
4. Stop comparing this pair (only first difference matters)

**Edge case to handle:**
If word1 is a prefix of word2 but word1 comes after word2 (like "abc" after "ab"), this is invalid - return empty string immediately.

**Result:** A directed graph representing character precedence relationships.
</details>

#### Step 3: Topological Sort for Valid Ordering
> **Guided Question:** Once you have a graph of character dependencies, how do you find a valid linear ordering of all characters?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Use Topological Sort to find character order:**

**Why topological sort?**
- Dependencies form a directed acyclic graph (if valid)
- Topological sort gives a linear ordering respecting all dependencies
- If a cycle exists, no valid alphabet order is possible

**Two approaches:**
1. **Kahn's Algorithm (BFS):** Remove nodes with indegree 0, update neighbors
2. **DFS-based:** Use DFS with cycle detection, build result in reverse order

**Cycle detection is crucial:** If there's a cycle (like A → B → C → A), no valid alphabet exists.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Initialize adjacency list and indegree map for all characters
- [ ] Compare adjacent words to extract character ordering relationships
- [ ] Handle edge case: longer word is prefix of shorter word
- [ ] Apply topological sort (Kahn's or DFS) to find valid ordering
- [ ] Return empty string if cycle detected, otherwise return the character order

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does a cycle in the character dependency graph make the problem impossible?
2. **Complexity Analysis:** Why is the time complexity O(C) where C is the total length of all words?
3. **Trade-offs:** When would you choose Kahn's algorithm versus DFS-based topological sort?
4. **Pattern Recognition:** What other problems involve extracting dependencies and finding valid orderings?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding character ordering extraction: ___/5
- [ ] Building the dependency graph correctly: ___/5  
- [ ] Implementing topological sort: ___/5
- [ ] Handling edge cases and cycle detection: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Practice on small examples to see how word comparisons lead to character dependencies

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
import java.util.*;

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

**🔗 LeetCode Link:** [Graph Valid Tree - LeetCode #261](https://leetcode.com/problems/graph-valid-tree/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What are the mathematical properties that define a valid tree with n nodes?
2. How would you check if a graph is connected (all nodes can reach each other)?
3. How would you detect if there are cycles in an undirected graph?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Mathematical Properties of Trees
> **Guided Question:** What are the essential properties that every tree must satisfy, and how do they relate to edge count?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**A valid tree with n nodes must have:**
1. **Exactly n-1 edges** (not more, not less)
2. **Be connected** (all nodes reachable from any node)
3. **Be acyclic** (no cycles)

**Why n-1 edges?**
- Too few edges (< n-1): Graph will be disconnected
- Too many edges (> n-1): Graph will have cycles
- Exactly n-1 edges: Necessary but not sufficient condition

**Quick elimination:** If edge count ≠ n-1, immediately return false!
</details>

#### Step 2: Connectivity Check Strategies
> **Guided Question:** If the edge count is correct (n-1), what's the most efficient way to verify the graph is connected?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Strategy: Single traversal from any node**
- Start DFS/BFS from node 0 (or any node)
- Count how many nodes you can reach
- If you reach all n nodes, the graph is connected
- If you reach fewer than n nodes, the graph is disconnected

**Why this works with n-1 edges:**
- If graph has n-1 edges and is connected, it must be acyclic (tree property)
- If graph has n-1 edges and has cycles, it must be disconnected
- So with correct edge count, checking connectivity is sufficient!
</details>

#### Step 3: Cycle Detection Approaches
> **Guided Question:** What are the different ways to detect cycles in an undirected graph, and which is most suitable here?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Approach 1: DFS with Parent Tracking**
- During DFS, track the parent of each node
- If you visit a neighbor that's not the parent and already visited → cycle!
- Need to avoid false positives from undirected edges

**Approach 2: Union-Find**
- For each edge (u,v), check if u and v are already connected
- If they are connected, adding this edge creates a cycle
- If not connected, union them and continue

**Approach 3: Edge Count + Connectivity**
- If edges = n-1 AND graph is connected → no cycles (tree property)
- This is often the cleanest approach!

Union-Find is particularly elegant because it naturally handles both cycle detection and connectivity.
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] First check: edge count must equal n-1 (quick elimination)
- [ ] Build adjacency list from edges
- [ ] Choose approach: DFS connectivity + parent tracking OR Union-Find
- [ ] For DFS: traverse from node 0, check if all nodes visited
- [ ] For Union-Find: check for cycles during union operations
- [ ] Return true only if connected and acyclic

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does the combination of "n-1 edges + connected" guarantee no cycles?
2. **Complexity Analysis:** Why are all approaches O(n) time when edges are bounded by n-1?
3. **Trade-offs:** What are the pros and cons of DFS versus Union-Find for this problem?
4. **Pattern Recognition:** How does this problem relate to minimum spanning tree algorithms?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding tree properties (n-1 edges, connected, acyclic): ___/5
- [ ] Implementing DFS with cycle detection: ___/5  
- [ ] Implementing Union-Find approach: ___/5
- [ ] Explaining why edge count + connectivity works: ___/5

#### Next Steps
- If confidence is 3+ on all: Move to next problem
- If confidence is <3: Review the guided discovery section again
- Try implementing both DFS and Union-Find versions to compare approaches

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

**🔗 LeetCode Link:** [Number of Connected Components in an Undirected Graph - LeetCode #323](https://leetcode.com/problems/number-of-connected-components-in-an-undirected-graph/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What defines a "connected component" - when are two nodes in the same component?
2. If you start DFS/BFS from an unvisited node, what does that represent in terms of components?
3. What data structure is specifically designed to efficiently track and merge groups of connected elements?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding Connected Components
> **Guided Question:** What's the relationship between connected components and graph traversal algorithms?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Connected component = maximal set of mutually reachable nodes**
- If you can reach node B from node A (through any path), they're in the same component
- A connected component includes ALL nodes reachable from any node in it
- Components are disjoint - a node belongs to exactly one component

**DFS/BFS insight:**
- Starting DFS/BFS from any node explores its ENTIRE connected component
- Each time you start a new DFS/BFS from an unvisited node = new component discovered
- Count the number of DFS/BFS calls needed to visit all nodes = number of components
</details>

#### Step 2: Component Counting with DFS/BFS
> **Guided Question:** How do you systematically count components without double-counting or missing any?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Algorithm: Count DFS/BFS starts**
1. Mark all nodes as unvisited
2. Initialize component count = 0
3. For each node i from 0 to n-1:
   - If node i is unvisited:
     - Increment component count (found new component!)
     - Start DFS/BFS from i to mark entire component as visited
4. Return component count

**Why this works:**
- Each DFS/BFS call explores exactly one complete component
- We only start DFS/BFS from unvisited nodes
- Number of DFS/BFS calls = number of distinct components
</details>

#### Step 3: Union-Find Optimization
> **Guided Question:** How can Union-Find data structure make component counting more efficient, especially for dynamic scenarios?

<details>
<summary>💭 Think about it, then click to reveal</summary>

**Union-Find advantages for component problems:**
- **Dynamic:** Can handle edges being added incrementally
- **Efficient:** Nearly O(1) operations with path compression + union by rank
- **Natural fit:** Union-Find is designed exactly for tracking connected components

**Algorithm with Union-Find:**
1. Initialize: Each node is its own component (count = n)
2. For each edge (u, v):
   - If u and v are in different components, union them
   - Decrement component count (two components merged into one)
3. Return final component count

**When to choose Union-Find vs DFS:**
- Static graph → DFS is simpler and sufficient
- Dynamic edges → Union-Find handles updates efficiently
</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Choose approach: DFS/BFS traversal counting OR Union-Find
- [ ] For DFS: build adjacency list, iterate through nodes, count traversal starts
- [ ] For Union-Find: initialize with n components, union edges, track final count
- [ ] Ensure each component is counted exactly once

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does counting the number of DFS/BFS starts give you the component count?
2. **Complexity Analysis:** How do the time complexities of DFS/BFS vs Union-Find compare?
3. **Trade-offs:** In what scenarios would you prefer Union-Find over DFS/BFS traversal?
4. **Pattern Recognition:** How does this problem relate to clustering algorithms and network analysis?

#### Confidence Rating
Rate your confidence (1-5) on:
- [ ] Understanding connected components concept: ___/5
- [ ] Implementing DFS component counting: ___/5  
- [ ] Implementing Union-Find solution: ___/5
- [ ] Choosing the right approach for different scenarios: ___/5

#### Next Steps
- If confidence is 3+ on all: You've mastered the graph problems section!
- If confidence is <3: Review the guided discovery section again
- Try implementing both approaches and compare their performance on different input sizes

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