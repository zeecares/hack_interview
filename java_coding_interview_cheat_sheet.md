---
layout: default
title: Java Coding Interview Cheat Sheet
description: Complete Java cheat sheet for coding interviews with syntax, data structures, and common patterns
---

# Java Coding Interview Cheat Sheet

<div style="margin-bottom: 20px;">
  <a href="/hack_interview/" style="text-decoration: none; color: #007bff; font-weight: 500;">
    ← Back to Home
  </a>
</div>

## Table of Contents
1. [Big O Notation](#big-o-notation)
2. [Basic Syntax & Data Types](#basic-syntax--data-types)
3. [Strings](#strings)
4. [Arrays](#arrays)
5. [Collections Framework](#collections-framework)
6. [Data Structures](#data-structures)
7. [Algorithms](#algorithms)
8. [Common Patterns](#common-patterns)
9. [Input/Output](#inputoutput)
10. [Useful Methods](#useful-methods)

---

## Big O Notation

| Complexity | Name | Example |
|------------|------|---------|
| O(1) | Constant | Array access |
| O(log n) | Logarithmic | Binary search |
| O(n) | Linear | Linear search |
| O(n log n) | Log-linear | Merge sort |
| O(n²) | Quadratic | Nested loops |
| O(2ⁿ) | Exponential | Recursive fibonacci |

---

## Basic Syntax & Data Types

### Primitive Data Types
```java
// Integer types
byte b = 127;           // 8-bit, -128 to 127
short s = 32767;        // 16-bit, -32768 to 32767
int i = 2147483647;     // 32-bit, -2^31 to 2^31-1
long l = 9223372036854775807L; // 64-bit

// Floating point
float f = 3.14f;        // 32-bit
double d = 3.14159;     // 64-bit

// Other types
char c = 'A';           // 16-bit Unicode
boolean bool = true;    // true or false
```

### Variables & Constants
```java
int variable = 10;              // Variable
final int CONSTANT = 100;       // Constant
static final int GLOBAL = 50;   // Global constant
```

---

## Strings

### String Basics
```java
String str = "Hello World";
String str2 = new String("Hello");

// String length
int len = str.length();

// Character at index
char ch = str.charAt(0);

// Substring
String sub = str.substring(0, 5);  // "Hello"
String sub2 = str.substring(6);    // "World"
```

### String Methods
```java
// Case conversion
str.toLowerCase();
str.toUpperCase();

// Trimming
str.trim();                    // Remove leading/trailing whitespace

// Splitting
String[] parts = str.split(" ");

// Replacing
str.replace('o', 'a');         // Replace chars
str.replaceAll("\\s+", " ");   // Replace with regex

// Checking
str.startsWith("Hello");
str.endsWith("World");
str.contains("llo");
str.isEmpty();
str.equals("Hello World");     // Case sensitive
str.equalsIgnoreCase("hello world");
```

### StringBuilder (Mutable Strings)
```java
StringBuilder sb = new StringBuilder();
sb.append("Hello");
sb.append(" ");
sb.append("World");
sb.insert(5, ",");             // Insert at index
sb.delete(5, 6);               // Delete range
sb.reverse();                  // Reverse string
String result = sb.toString();
```

---

## Arrays

### Array Declaration & Initialization
```java
// Declaration
int[] arr1 = new int[5];                    // Size 5, default values (0)
int[] arr2 = {1, 2, 3, 4, 5};             // Initialize with values
int[] arr3 = new int[]{1, 2, 3, 4, 5};    // Alternative syntax

// 2D Arrays
int[][] matrix = new int[3][4];             // 3x4 matrix
int[][] matrix2 = {{1, 2}, {3, 4}};       // Initialize with values
```

### Array Operations
```java
// Length
int length = arr.length;

// Accessing elements
int first = arr[0];
int last = arr[arr.length - 1];

// Iterating
for (int i = 0; i < arr.length; i++) {
    System.out.println(arr[i]);
}

// Enhanced for loop
for (int num : arr) {
    System.out.println(num);
}
```

### Array Utilities
```java
import java.util.Arrays;

// Sorting
Arrays.sort(arr);                          // Ascending order
Arrays.sort(arr, Collections.reverseOrder()); // Descending (Integer[] only)

// Searching
int index = Arrays.binarySearch(arr, target); // Must be sorted first

// Copying
int[] copy = Arrays.copyOf(arr, arr.length);
int[] range = Arrays.copyOfRange(arr, 1, 4);  // Copy from index 1 to 3

// Filling
Arrays.fill(arr, 0);                       // Fill all with 0

// Comparing
boolean equal = Arrays.equals(arr1, arr2);

// Converting to string
String str = Arrays.toString(arr);         // [1, 2, 3, 4, 5]
```

---

## Collections Framework

### List Interface

#### ArrayList (Dynamic Array)
```java
import java.util.*;

List<Integer> list = new ArrayList<>();
list.add(1);                    // Add element
list.add(0, 2);                 // Add at index
list.get(0);                    // Get element at index
list.set(0, 3);                 // Set element at index
list.remove(0);                 // Remove by index
list.remove(Integer.valueOf(3)); // Remove by value
list.size();                    // Size
list.isEmpty();                 // Check if empty
list.contains(3);               // Check if contains
list.indexOf(3);                // First occurrence index
list.clear();                   // Remove all elements
```

#### LinkedList
```java
LinkedList<Integer> linkedList = new LinkedList<>();
linkedList.addFirst(1);         // Add to beginning
linkedList.addLast(2);          // Add to end
linkedList.removeFirst();       // Remove from beginning
linkedList.removeLast();        // Remove from end
```

### Set Interface

#### HashSet (No duplicates, no order)
```java
Set<Integer> set = new HashSet<>();
set.add(1);
set.add(2);
set.add(1);                     // Won't be added (duplicate)
set.contains(1);                // true
set.remove(1);
set.size();                     // 1
```

#### TreeSet (Sorted, no duplicates)
```java
Set<Integer> treeSet = new TreeSet<>();
treeSet.add(3);
treeSet.add(1);
treeSet.add(2);                 // Automatically sorted: [1, 2, 3]
```

### Map Interface

#### HashMap (Key-Value pairs)
```java
Map<String, Integer> map = new HashMap<>();
map.put("apple", 1);            // Add key-value pair
map.put("banana", 2);
map.get("apple");               // Get value by key
map.getOrDefault("orange", 0);  // Get with default value
map.containsKey("apple");       // Check if key exists
map.containsValue(1);           // Check if value exists
map.remove("apple");            // Remove by key
map.size();                     // Size
map.isEmpty();                  // Check if empty

// Iterate over keys
for (String key : map.keySet()) {
    System.out.println(key + ": " + map.get(key));
}

// Iterate over entries
for (Map.Entry<String, Integer> entry : map.entrySet()) {
    System.out.println(entry.getKey() + ": " + entry.getValue());
}
```

#### TreeMap (Sorted by keys)
```java
Map<String, Integer> treeMap = new TreeMap<>();
// Keys are automatically sorted
```

### Queue Interface

#### Queue (FIFO)
```java
Queue<Integer> queue = new LinkedList<>();
queue.offer(1);                 // Add to rear
queue.offer(2);
queue.poll();                   // Remove from front (returns null if empty)
queue.peek();                   // Look at front without removing
queue.isEmpty();
queue.size();
```

#### Priority Queue (Heap)
```java
PriorityQueue<Integer> pq = new PriorityQueue<>(); // Min heap by default
pq.offer(3);
pq.offer(1);
pq.offer(2);
pq.poll();                      // Returns 1 (smallest)

// Max heap
PriorityQueue<Integer> maxHeap = new PriorityQueue<>(Collections.reverseOrder());

// Custom comparator
PriorityQueue<String> pqStr = new PriorityQueue<>((a, b) -> a.length() - b.length());
```

#### Stack (LIFO)
```java
Stack<Integer> stack = new Stack<>();
stack.push(1);                  // Add to top
stack.push(2);
stack.pop();                    // Remove from top
stack.peek();                   // Look at top without removing
stack.isEmpty();
stack.size();
```

---

## Data Structures

### Implementing Linked List
```java
class ListNode {
    int val;
    ListNode next;
    
    ListNode() {}
    ListNode(int val) { this.val = val; }
    ListNode(int val, ListNode next) { this.val = val; this.next = next; }
}

// Operations
public ListNode reverseList(ListNode head) {
    ListNode prev = null;
    ListNode curr = head;
    
    while (curr != null) {
        ListNode next = curr.next;
        curr.next = prev;
        prev = curr;
        curr = next;
    }
    return prev;
}
```

### Implementing Binary Tree
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

// Tree Traversals
public void inorderTraversal(TreeNode root) {
    if (root != null) {
        inorderTraversal(root.left);
        System.out.println(root.val);
        inorderTraversal(root.right);
    }
}

public void preorderTraversal(TreeNode root) {
    if (root != null) {
        System.out.println(root.val);
        preorderTraversal(root.left);
        preorderTraversal(root.right);
    }
}

public void postorderTraversal(TreeNode root) {
    if (root != null) {
        postorderTraversal(root.left);
        postorderTraversal(root.right);
        System.out.println(root.val);
    }
}
```

---

## Algorithms

### Sorting Algorithms

#### Quick Sort
```java
public void quickSort(int[] arr, int low, int high) {
    if (low < high) {
        int pi = partition(arr, low, high);
        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
}

private int partition(int[] arr, int low, int high) {
    int pivot = arr[high];
    int i = low - 1;
    
    for (int j = low; j < high; j++) {
        if (arr[j] < pivot) {
            i++;
            swap(arr, i, j);
        }
    }
    swap(arr, i + 1, high);
    return i + 1;
}
```

#### Merge Sort
```java
public void mergeSort(int[] arr, int left, int right) {
    if (left < right) {
        int mid = left + (right - left) / 2;
        mergeSort(arr, left, mid);
        mergeSort(arr, mid + 1, right);
        merge(arr, left, mid, right);
    }
}

private void merge(int[] arr, int left, int mid, int right) {
    int[] temp = new int[right - left + 1];
    int i = left, j = mid + 1, k = 0;
    
    while (i <= mid && j <= right) {
        if (arr[i] <= arr[j]) {
            temp[k++] = arr[i++];
        } else {
            temp[k++] = arr[j++];
        }
    }
    
    while (i <= mid) temp[k++] = arr[i++];
    while (j <= right) temp[k++] = arr[j++];
    
    System.arraycopy(temp, 0, arr, left, temp.length);
}
```

### Searching Algorithms

#### Binary Search
```java
public int binarySearch(int[] arr, int target) {
    int left = 0, right = arr.length - 1;
    
    while (left <= right) {
        int mid = left + (right - left) / 2;
        
        if (arr[mid] == target) {
            return mid;
        } else if (arr[mid] < target) {
            left = mid + 1;
        } else {
            right = mid - 1;
        }
    }
    return -1; // Not found
}
```

### Graph Algorithms

#### BFS (Breadth-First Search)
```java
public void bfs(int[][] graph, int start) {
    boolean[] visited = new boolean[graph.length];
    Queue<Integer> queue = new LinkedList<>();
    
    visited[start] = true;
    queue.offer(start);
    
    while (!queue.isEmpty()) {
        int vertex = queue.poll();
        System.out.println(vertex);
        
        for (int i = 0; i < graph[vertex].length; i++) {
            if (graph[vertex][i] == 1 && !visited[i]) {
                visited[i] = true;
                queue.offer(i);
            }
        }
    }
}
```

#### DFS (Depth-First Search)
```java
public void dfs(int[][] graph, int vertex, boolean[] visited) {
    visited[vertex] = true;
    System.out.println(vertex);
    
    for (int i = 0; i < graph[vertex].length; i++) {
        if (graph[vertex][i] == 1 && !visited[i]) {
            dfs(graph, i, visited);
        }
    }
}
```

---

## Common Patterns

### Two Pointers
```java
public boolean isPalindrome(String s) {
    int left = 0, right = s.length() - 1;
    
    while (left < right) {
        if (s.charAt(left) != s.charAt(right)) {
            return false;
        }
        left++;
        right--;
    }
    return true;
}
```

### Sliding Window
```java
public int maxSubarraySum(int[] nums, int k) {
    int maxSum = 0, windowSum = 0;
    
    // Calculate sum of first window
    for (int i = 0; i < k; i++) {
        windowSum += nums[i];
    }
    maxSum = windowSum;
    
    // Slide the window
    for (int i = k; i < nums.length; i++) {
        windowSum = windowSum - nums[i - k] + nums[i];
        maxSum = Math.max(maxSum, windowSum);
    }
    return maxSum;
}
```

### Dynamic Programming
```java
// Fibonacci with memoization
public int fibonacci(int n, Map<Integer, Integer> memo) {
    if (n <= 1) return n;
    
    if (memo.containsKey(n)) {
        return memo.get(n);
    }
    
    int result = fibonacci(n - 1, memo) + fibonacci(n - 2, memo);
    memo.put(n, result);
    return result;
}
```

### Backtracking
```java
public List<List<Integer>> permute(int[] nums) {
    List<List<Integer>> result = new ArrayList<>();
    backtrack(result, new ArrayList<>(), nums);
    return result;
}

private void backtrack(List<List<Integer>> result, List<Integer> current, int[] nums) {
    if (current.size() == nums.length) {
        result.add(new ArrayList<>(current));
        return;
    }
    
    for (int num : nums) {
        if (!current.contains(num)) {
            current.add(num);
            backtrack(result, current, nums);
            current.remove(current.size() - 1);
        }
    }
}
```

---

## Input/Output

### Scanner for Input
```java
import java.util.Scanner;

Scanner scanner = new Scanner(System.in);

// Reading different types
int num = scanner.nextInt();
double d = scanner.nextDouble();
String str = scanner.next();        // Single word
String line = scanner.nextLine();   // Entire line
boolean bool = scanner.nextBoolean();

scanner.close();
```

### File I/O
```java
import java.io.*;

// Reading from file
try (BufferedReader br = new BufferedReader(new FileReader("input.txt"))) {
    String line;
    while ((line = br.readLine()) != null) {
        System.out.println(line);
    }
} catch (IOException e) {
    e.printStackTrace();
}

// Writing to file
try (PrintWriter pw = new PrintWriter(new FileWriter("output.txt"))) {
    pw.println("Hello World");
} catch (IOException e) {
    e.printStackTrace();
}
```

---

## Useful Methods

### Math Class
```java
Math.abs(-5);           // Absolute value: 5
Math.max(3, 7);         // Maximum: 7
Math.min(3, 7);         // Minimum: 3
Math.pow(2, 3);         // Power: 8.0
Math.sqrt(16);          // Square root: 4.0
Math.ceil(4.3);         // Ceiling: 5.0
Math.floor(4.7);        // Floor: 4.0
Math.round(4.6);        // Round: 5
Math.random();          // Random double [0.0, 1.0)
```

### Collections Utility
```java
import java.util.Collections;

List<Integer> list = Arrays.asList(3, 1, 4, 1, 5);

Collections.sort(list);                    // Sort ascending
Collections.reverse(list);                 // Reverse
Collections.shuffle(list);                 // Random shuffle
Collections.max(list);                     // Maximum element
Collections.min(list);                     // Minimum element
Collections.frequency(list, 1);            // Count occurrences
Collections.binarySearch(list, 3);         // Binary search (must be sorted)
```

### String Conversion
```java
// String to number
int num = Integer.parseInt("123");
double d = Double.parseDouble("3.14");

// Number to string
String str = String.valueOf(123);
String str2 = Integer.toString(123);

// Character operations
Character.isDigit('5');                    // true
Character.isLetter('A');                   // true
Character.isUpperCase('A');                // true
Character.toLowerCase('A');                // 'a'
Character.toUpperCase('a');                // 'A'
```

---

## Tips for Coding Interviews

1. **Always clarify the problem** - Ask about edge cases, constraints, and expected input/output format
2. **Start with brute force** - Get a working solution first, then optimize
3. **Think out loud** - Explain your thought process to the interviewer
4. **Test your code** - Walk through examples, especially edge cases
5. **Optimize time and space complexity** - Discuss trade-offs
6. **Use meaningful variable names** - Make your code readable
7. **Handle edge cases** - Empty arrays, null inputs, single elements, etc.
8. **Know your data structures** - Understand when to use each one
9. **Practice common patterns** - Two pointers, sliding window, DFS/BFS, DP, etc.
10. **Time management** - Don't spend too much time on one approach

---

## Common Edge Cases to Consider

- Empty arrays or strings
- Single element arrays
- Null inputs
- Integer overflow
- Negative numbers
- Duplicate elements
- Already sorted arrays
- Arrays with all same elements