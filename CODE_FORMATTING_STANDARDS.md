# Code Formatting Standards - Blind 75 Study Guides

## Overview
This document defines the standardized formatting rules for all Java, Python, and JavaScript code blocks across the Blind 75 study guide files.

## Java Formatting Standards

### Basic Rules
- **Indentation**: 4 spaces per level (no tabs)
- **Line length**: Maximum 100 characters
- **Encoding**: UTF-8

### Braces and Brackets
```java
// Opening brace on same line
public int[] twoSum(int[] nums, int target) {
    if (nums == null || nums.length < 2) {
        return new int[0];
    }
    // Method body
}

// Array initialization
int[] result = new int[]{index1, index2};
int[] result = {index1, index2}; // Also acceptable
```

### Variable Naming
```java
// camelCase for variables and methods
int currentIndex;
String firstName;
Map<Integer, Integer> numToIndex;

// PascalCase for classes
public class ListNode {
    int val;
    ListNode next;
}
```

### Method Signatures
```java
// Short parameters - single line
public int maxDepth(TreeNode root) {

// Long parameters - one per line
public boolean hasPathSum(
    TreeNode root,
    int targetSum,
    List<Integer> path
) {
```

### Imports
```java
// Standard library imports first
import java.util.*;
import java.util.concurrent.*;

// Custom imports
import custom.package.*;

// Avoid wildcard imports when possible
import java.util.HashMap;
import java.util.Map;
```

### Comments
```java
// Single-line comments with space after //
// This explains the next line

/* 
 * Multi-line comments for complex explanations
 * Use when explanation needs multiple lines
 */

/**
 * JavaDoc style for public methods
 * @param nums input array
 * @return result array
 */
```

### Blank Lines
```java
public class Solution {
    
    public int method1() {
        // Method body
        return result;
    }
    
    public int method2() {
        // Single blank line between methods
        return result;
    }
}
```

## Python Formatting Standards (PEP 8 Compliant)

### Basic Rules
- **Indentation**: 4 spaces per level (no tabs)
- **Line length**: Maximum 79 characters
- **Encoding**: UTF-8

### Function Definitions
```python
def two_sum(nums, target):
    """
    Find two numbers that add up to target.
    
    Args:
        nums: List of integers
        target: Target sum
        
    Returns:
        List of two indices
    """
    if not nums or len(nums) < 2:
        return []
    
    num_to_index = {}
    for i, num in enumerate(nums):
        complement = target - num
        if complement in num_to_index:
            return [num_to_index[complement], i]
        num_to_index[num] = i
    
    return []
```

### Variable Naming
```python
# snake_case for variables and functions
current_index = 0
first_name = "John"
num_to_index = {}

# PascalCase for classes
class ListNode:
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next
```

### Imports
```python
# Standard library imports
from collections import defaultdict, deque
import heapq
import sys

# Third-party imports
# (if any)

# Local imports
# (if any)
```

### Comments
```python
# Single-line comments with space after #
# This explains the next line

"""
Multi-line comments using triple quotes
for complex explanations
"""
```

### List/Dict Formatting
```python
# Short collections - single line
nums = [1, 2, 3, 4]
mapping = {"key": "value"}

# Long collections - multiple lines
long_list = [
    "first_item",
    "second_item",
    "third_item",
]

complex_dict = {
    "key1": "value1",
    "key2": "value2",
    "key3": "value3",
}
```

## JavaScript Formatting Standards

### Basic Rules
- **Indentation**: 2 spaces per level (no tabs)
- **Line length**: Maximum 100 characters
- **Semicolons**: Always include semicolons

### Function Definitions
```javascript
// Function declarations for main functions
function twoSum(nums, target) {
  if (!nums || nums.length < 2) {
    return [];
  }
  
  const numToIndex = new Map();
  for (let i = 0; i < nums.length; i++) {
    const complement = target - nums[i];
    if (numToIndex.has(complement)) {
      return [numToIndex.get(complement), i];
    }
    numToIndex.set(nums[i], i);
  }
  
  return [];
}

// Arrow functions for short utility functions
const isValid = (char) => char === '(' || char === ')';
```

### Variable Declarations
```javascript
// Use const by default
const nums = [1, 2, 3, 4];
const target = 9;

// Use let when reassignment is needed
let currentIndex = 0;
let result = [];

// Avoid var
```

### Object and Array Formatting
```javascript
// Short objects - single line
const point = {x: 1, y: 2};

// Long objects - multiple lines
const config = {
  maxLength: 100,
  allowDuplicates: false,
  timeout: 5000,
};

// Arrays
const shortArray = [1, 2, 3];
const longArray = [
  "first_item",
  "second_item", 
  "third_item",
];
```

### Comments
```javascript
// Single-line comments with space after //
// This explains the next line

/*
 * Multi-line comments for complex explanations
 * Use when explanation spans multiple lines
 */
```

### Conditional and Loop Formatting
```javascript
// Conditionals
if (condition) {
  // action
} else if (otherCondition) {
  // other action
} else {
  // default action
}

// Loops
for (let i = 0; i < nums.length; i++) {
  // loop body
}

for (const item of items) {
  // iteration body
}
```

## Cross-Language Consistency Rules

### Code Block Structure
1. **Consistent problem-solving approach** across all three languages
2. **Similar variable names** (adapted to language conventions)
3. **Consistent commenting style** explaining the same concepts
4. **Parallel algorithm implementation** with same logical flow

### Common Patterns
```java
// Java
Map<Integer, Integer> numToIndex = new HashMap<>();
```

```python
# Python
num_to_index = {}
```

```javascript
// JavaScript
const numToIndex = new Map();
```

### Error Handling
```java
// Java - input validation
if (nums == null || nums.length < 2) {
    return new int[0];
}
```

```python
# Python - input validation
if not nums or len(nums) < 2:
    return []
```

```javascript
// JavaScript - input validation
if (!nums || nums.length < 2) {
  return [];
}
```

## Implementation Priority

### High Priority
1. Fix indentation inconsistencies
2. Standardize variable naming within each language
3. Consistent brace/bracket placement
4. Remove redundant imports

### Medium Priority
1. Standardize comment styles
2. Fix blank line usage
3. Align method signatures

### Low Priority
1. Optimize import organization
2. Enhance documentation consistency
3. Standardize error handling patterns

## Validation Checklist

Before marking any file as "formatted", ensure:
- [ ] Indentation follows language standards
- [ ] Variable naming follows conventions
- [ ] Imports are organized and necessary
- [ ] Comments are consistent and helpful
- [ ] Blank lines follow standards
- [ ] Braces/brackets are consistently placed
- [ ] Code blocks are readable and maintainable