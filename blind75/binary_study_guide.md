---
render_with_liquid: false
---

# Binary/Bit Manipulation Study Guide - Blind 75 LeetCode Problems

## Table of Contents
1. [Introduction to Binary/Bit Manipulation](#introduction-to-binarybit-manipulation)
2. [Core Concepts and Prerequisites](#core-concepts-and-prerequisites)
3. [Essential Bit Operations](#essential-bit-operations)
4. [Problem-First Approach to Bit Manipulation](#problem-first-approach-to-bit-manipulation)
5. [The 5 Binary/Bit Manipulation Problems](#the-5-binarybit-manipulation-problems)
   - [1. Sum of Two Integers](#1-sum-of-two-integers)
   - [2. Number of 1 Bits](#2-number-of-1-bits)
   - [3. Counting Bits](#3-counting-bits)
   - [4. Missing Number](#4-missing-number)
   - [5. Reverse Bits](#5-reverse-bits)
6. [Common Bit Manipulation Patterns](#common-bit-manipulation-patterns)
7. [Mathematical Properties of Bits](#mathematical-properties-of-bits)

---

## Introduction to Binary/Bit Manipulation

Bit manipulation is the act of algorithmically manipulating bits or binary digits, which are the basic units of information in computing. It involves using bitwise operators to perform operations directly on the binary representation of numbers.

### Key Characteristics of Bit Manipulation Problems:
1. **Direct Binary Representation**: Work with the actual bits of numbers
2. **Mathematical Properties**: Leverage XOR, AND, OR properties for elegant solutions
3. **Space/Time Efficiency**: Often provide O(1) space and very fast solutions
4. **Low-Level Operations**: Closest to how computers actually process data

### Why Learn Bit Manipulation?
- **Performance**: Bitwise operations are among the fastest operations a CPU can perform
- **Memory Efficiency**: Can pack multiple boolean values into single integers
- **Interview Frequency**: Common in technical interviews, especially for system programming roles
- **Elegant Solutions**: Often provides surprisingly simple solutions to complex problems

---

## Core Concepts and Prerequisites

### 1. Binary Number System
Understanding how numbers are represented in binary (base-2) format:
```
Decimal 5 = Binary 101
Decimal 8 = Binary 1000
Decimal 15 = Binary 1111
```

### 2. Two's Complement
How negative numbers are represented:
```
+5: 00000101
-5: 11111011 (flip bits and add 1)
```

### 3. Bitwise Operators
- **AND (&)**: Both bits must be 1
- **OR (|)**: At least one bit must be 1  
- **XOR (^)**: Exactly one bit must be 1
- **NOT (~)**: Flip all bits
- **Left Shift (<<)**: Multiply by 2^n
- **Right Shift (>>)**: Divide by 2^n (arithmetic)
- **Unsigned Right Shift (>>>)**: Divide by 2^n (logical)

### 4. Common Bit Manipulation Tricks

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Check if number is odd
(n & 1) == 1

// Check if number is power of 2
(n & (n - 1)) == 0

// Get rightmost set bit
n & (-n)

// Clear rightmost set bit
n & (n - 1)

// Set bit at position i
n | (1 << i)

// Clear bit at position i
n & ~(1 << i)

// Toggle bit at position i
n ^ (1 << i)
```
  </div>
  
  <div class="tab-content python">
```python
# Check if number is odd
(n & 1) == 1

# Check if number is power of 2
(n & (n - 1)) == 0

# Get rightmost set bit
n & (-n)

# Clear rightmost set bit
n & (n - 1)

# Set bit at position i
n | (1 << i)

# Clear bit at position i
n & ~(1 << i)

# Toggle bit at position i
n ^ (1 << i)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Check if number is odd
(n & 1) === 1

// Check if number is power of 2
(n & (n - 1)) === 0

// Get rightmost set bit
n & (-n)

// Clear rightmost set bit
n & (n - 1)

// Set bit at position i
n | (1 << i)

// Clear bit at position i
n & ~(1 << i)

// Toggle bit at position i
n ^ (1 << i)
```
  </div>
</div>

---

## Essential Bit Operations

### Basic Operations Truth Tables

**AND (&)**
```
0 & 0 = 0    1 & 0 = 0
0 & 1 = 0    1 & 1 = 1
```

**OR (|)**
```
0 | 0 = 0    1 | 0 = 1
0 | 1 = 1    1 | 1 = 1
```

**XOR (^)**
```
0 ^ 0 = 0    1 ^ 0 = 1
0 ^ 1 = 1    1 ^ 1 = 0
```

### Key XOR Properties

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Identity: a ^ 0 = a
// Self-inverse: a ^ a = 0
// Commutative: a ^ b = b ^ a
// Associative: (a ^ b) ^ c = a ^ (b ^ c)
```
  </div>
  
  <div class="tab-content python">
```python
# Identity: a ^ 0 = a
# Self-inverse: a ^ a = 0
# Commutative: a ^ b = b ^ a
# Associative: (a ^ b) ^ c = a ^ (b ^ c)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Identity: a ^ 0 = a
// Self-inverse: a ^ a = 0
// Commutative: a ^ b = b ^ a
// Associative: (a ^ b) ^ c = a ^ (b ^ c)
```
  </div>
</div>

### Shift Operations

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Left shift: multiply by 2^n
5 << 2 = 20  // 5 * 2^2 = 5 * 4 = 20

// Right shift: divide by 2^n
20 >> 2 = 5  // 20 / 2^2 = 20 / 4 = 5
```
  </div>
  
  <div class="tab-content python">
```python
# Left shift: multiply by 2^n
5 << 2 == 20  # 5 * 2^2 = 5 * 4 = 20

# Right shift: divide by 2^n
20 >> 2 == 5  # 20 / 2^2 = 20 / 4 = 5
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Left shift: multiply by 2^n
5 << 2 === 20  // 5 * 2^2 = 5 * 4 = 20

// Right shift: divide by 2^n
20 >> 2 === 5  // 20 / 2^2 = 20 / 4 = 5
```
  </div>
</div>

---

## Problem-First Approach to Bit Manipulation

### How to Identify Bit Manipulation Problems:
1. **Keywords**: "without using +/-", "count bits", "XOR", "single number"
2. **Constraints**: Need O(1) space or very fast performance
3. **Patterns**: Numbers appearing odd/even times, finding duplicates/missing
4. **Mathematical**: Problems involving powers of 2, binary representations

### Steps to Solve Bit Manipulation Problems:
1. **Understand the binary representation** of the input
2. **Identify relevant bitwise properties** (XOR self-canceling, AND masking, etc.)
3. **Look for mathematical patterns** in binary
4. **Consider bit-by-bit processing** vs whole-number operations
5. **Test with simple examples** in binary
6. **Optimize using bit manipulation tricks**

---

## The 5 Binary/Bit Manipulation Problems

### 1. Sum of Two Integers

**🔗 LeetCode Link:** [Sum of Two Integers - LeetCode #371](https://leetcode.com/problems/sum-of-two-integers/)

#### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. How does binary addition work at the bit level, and what happens when bits carry over?
2. What bitwise operations could simulate the addition process without using + or -?
3. How would you handle the carry propagation in binary arithmetic?

*Take a moment to think through these questions before continuing...*

#### 💡 Discovery Process (Guided Learning)

**Step 1: Understanding Binary Addition**
> **Guided Question:** In binary addition, what happens when you add 1+1, and how is this different from XOR?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Binary addition:
- 0 + 0 = 0 (no carry)
- 0 + 1 = 1 (no carry) 
- 1 + 0 = 1 (no carry)
- 1 + 1 = 0 (carry 1)

XOR gives us the sum without carry, while AND tells us where carries occur. This is the foundation of the half-adder circuit in computer architecture.
</details>

**Step 2: Carry Handling Strategy**
> **Guided Question:** If XOR gives the sum without carry and AND gives carry positions, how do you handle multiple carry propagations?

<details>
<summary>💭 Think about it, then click to reveal</summary>

We need an iterative approach:
1. Calculate sum without carry using XOR: `a ^ b`
2. Calculate carry positions using AND: `a & b`
3. Shift carry left by 1: `(a & b) << 1`
4. Repeat until no more carries exist

This simulates how hardware performs addition at the circuit level.
</details>

**Step 3: Implementation Insight**
> **Guided Question:** How do you know when to stop the carry propagation process?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Continue until the carry becomes 0. At each iteration:
- Update `a` to be the sum without carry
- Update `b` to be the shifted carry
- When `b` becomes 0, no more carries exist and `a` contains the final sum

This typically takes at most 32 iterations for 32-bit integers.
</details>

#### 🎯 Practice & Self-Assessment

**Implementation Challenge**
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Use a loop that continues while carry exists
- [ ] Calculate sum without carry using XOR
- [ ] Calculate carry using AND and left shift
- [ ] Update variables for next iteration
- [ ] Return final sum when no carry remains

**Reflection Questions**
After solving, think about:

1. **Understanding Check:** Can you trace through adding 5+3 in binary using this method?
2. **Complexity Analysis:** Why is this O(log max(a,b)) time complexity?
3. **Trade-offs:** What are the advantages of understanding addition at the bit level?
4. **Pattern Recognition:** How does this relate to building other arithmetic operations?

**Confidence Rating**
Rate your confidence (1-5) on:
- [ ] Understanding binary addition fundamentals: ___/5
- [ ] Implementing the carry propagation logic: ___/5  
- [ ] Explaining the XOR and AND operations: ___/5
- [ ] Connecting to computer architecture concepts: ___/5

**Problem Statement**: Calculate the sum of two integers a and b without using the operators + and -.

**Example**:
- Input: a = 1, b = 2
- Output: 3

**Knowledge Prerequisites**:
- XOR operation for addition without carry
- AND operation for carry calculation
- Shift operations for carry propagation
- Understanding of binary addition

**First Principles**:
Binary addition works as:
- XOR gives sum without carry: 1^0=1, 0^1=1, 1^1=0, 0^0=0
- AND gives carry positions: 1&1=1, others=0
- Shift carry left by 1 position to add it properly

**Problem-First Approach**:
1. **Identify pattern**: Need to simulate binary addition manually
2. **XOR operation**: Gives sum without considering carries
3. **AND + shift**: Calculates and positions carries
4. **Repeat**: Until no more carries remain

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: Iterative Bit Manipulation
class SumTwoIntegers {
    public int getSum(int a, int b) {
        while (b != 0) {
            // Calculate carry
            int carry = a & b;
            
            // Sum without carry
            a = a ^ b;
            
            // Shift carry to left by 1
            b = carry << 1;
        }
        
        return a;
    }
}

// Approach 2: Recursive Solution
class SumTwoIntegers {
    public int getSum(int a, int b) {
        if (b == 0) return a;
        
        // Sum without carry
        int sum = a ^ b;
        
        // Carry shifted left
        int carry = (a & b) << 1;
        
        return getSum(sum, carry);
    }
}

// Approach 3: Using Half Adder Logic
class SumTwoIntegers {
    public int getSum(int a, int b) {
        int sum, carry;
        
        do {
            sum = a ^ b;      // XOR for sum without carry
            carry = (a & b) << 1;  // AND and shift for carry
            
            a = sum;
            b = carry;
        } while (carry != 0);
        
        return sum;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: Iterative Bit Manipulation
class SumTwoIntegers:
    def getSum(self, a: int, b: int) -> int:
        # Handle 32-bit signed integer overflow
        mask = 0xFFFFFFFF
        
        while b != 0:
            # Calculate carry
            carry = (a & b) & mask
            
            # Sum without carry
            a = (a ^ b) & mask
            
            # Shift carry to left by 1
            b = (carry << 1) & mask
        
        # Convert back to signed 32-bit integer
        return a if a < 0x80000000 else ~(a ^ mask)

# Approach 2: Recursive Solution
class SumTwoIntegers:
    def getSum(self, a: int, b: int) -> int:
        mask = 0xFFFFFFFF
        
        if b == 0:
            return a if a < 0x80000000 else ~(a ^ mask)
        
        # Sum without carry
        sum_val = (a ^ b) & mask
        
        # Carry shifted left
        carry = ((a & b) << 1) & mask
        
        return self.getSum(sum_val, carry)

# Approach 3: Using Half Adder Logic
class SumTwoIntegers:
    def getSum(self, a: int, b: int) -> int:
        mask = 0xFFFFFFFF
        
        while b != 0:
            sum_val = (a ^ b) & mask      # XOR for sum without carry
            carry = ((a & b) << 1) & mask  # AND and shift for carry
            
            a = sum_val
            b = carry
        
        return a if a < 0x80000000 else ~(a ^ mask)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: Iterative Bit Manipulation
var getSum = function(a, b) {
    while (b !== 0) {
        // Calculate carry
        let carry = a & b;
        
        // Sum without carry
        a = a ^ b;
        
        // Shift carry to left by 1
        b = carry << 1;
    }
    
    return a;
};

// Approach 2: Recursive Solution
var getSum = function(a, b) {
    if (b === 0) return a;
    
    // Sum without carry
    let sum = a ^ b;
    
    // Carry shifted left
    let carry = (a & b) << 1;
    
    return getSum(sum, carry);
};

// Approach 3: Using Half Adder Logic
var getSum = function(a, b) {
    let sum, carry;
    
    do {
        sum = a ^ b;           // XOR for sum without carry
        carry = (a & b) << 1;  // AND and shift for carry
        
        a = sum;
        b = carry;
    } while (carry !== 0);
    
    return sum;
};
```
  </div>
</div>

**Complexity Analysis**:
- **Time**: O(log max(a,b)) - maximum 32 iterations for 32-bit integers
- **Space**: O(1)

**Key Insights & Patterns**:
- XOR operation simulates addition without carry
- AND + left shift handles carry propagation
- Pattern applicable to building arithmetic operations from basic logic
- Foundation for understanding computer arithmetic at hardware level

**Step-by-Step Example**:
```
Adding 5 + 3:
a = 5 = 101, b = 3 = 011

Iteration 1:
sum = 101 ^ 011 = 110
carry = (101 & 011) << 1 = 001 << 1 = 010

Iteration 2:
a = 110, b = 010
sum = 110 ^ 010 = 100
carry = (110 & 010) << 1 = 010 << 1 = 100

Iteration 3:
a = 100, b = 100
sum = 100 ^ 100 = 000
carry = (100 & 100) << 1 = 100 << 1 = 1000

Continue until b = 0...
Final result: 8 = 1000
```

---

### 2. Number of 1 Bits

**🔗 LeetCode Link:** [Number of 1 Bits - LeetCode #191](https://leetcode.com/problems/number-of-1-bits/)

#### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What's the simplest way to check if the rightmost bit of a number is 1?
2. How could you eliminate set bits one by one to count them efficiently?
3. What's the difference between checking all 32 bit positions versus only processing set bits?

*Take a moment to think through these questions before continuing...*

#### 💡 Discovery Process (Guided Learning)

**Step 1: Basic Bit Checking Approach**
> **Guided Question:** How can you check each bit position to count the 1s, and why might this be inefficient?

<details>
<summary>💭 Think about it, then click to reveal</summary>

You can check each bit using `n & 1` for the rightmost bit, then shift right with `n >>>= 1`. This examines all 32 bit positions regardless of how many 1s actually exist.

The inefficiency: you always check 32 positions even if the number only has a few set bits.
</details>

**Step 2: Brian Kernighan's Optimization**
> **Guided Question:** What happens when you compute `n & (n-1)`, and how does this help count set bits more efficiently?

<details>
<summary>💭 Think about it, then click to reveal</summary>

`n & (n-1)` clears the rightmost set bit:
- Example: 12 (1100) & 11 (1011) = 8 (1000)
- Each operation removes exactly one set bit
- You only loop as many times as there are set bits

This is Brian Kernighan's algorithm - instead of checking all positions, you only iterate through the actual set bits.
</details>

**Step 3: Understanding the Bit Clearing Magic**
> **Guided Question:** Why does subtracting 1 from a number and then ANDing it with the original clear the rightmost set bit?

<details>
<summary>💭 Think about it, then click to reveal</summary>

When you subtract 1:
- All bits to the right of the rightmost set bit become 1
- The rightmost set bit becomes 0
- All bits to the left remain unchanged

ANDing with the original:
- Clears the rightmost set bit (0 & 1 = 0)
- Clears all trailing zeros that became 1s
- Preserves all other set bits

This elegant bit manipulation is fundamental to many advanced algorithms.
</details>

#### 🎯 Practice & Self-Assessment

**Implementation Challenge**
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Initialize a counter to 0
- [ ] Loop while n is not 0
- [ ] Use n & (n-1) to clear rightmost set bit
- [ ] Increment counter for each cleared bit
- [ ] Return the total count

**Reflection Questions**
After solving, think about:

1. **Understanding Check:** Can you trace through counting bits in 12 (binary 1100) using Brian Kernighan's method?
2. **Complexity Analysis:** Why is this O(number of set bits) instead of O(32)?
3. **Trade-offs:** When would the simple bit-checking approach be preferable?
4. **Pattern Recognition:** What other problems involve clearing the rightmost set bit?

**Confidence Rating**
Rate your confidence (1-5) on:
- [ ] Understanding the bit-checking basics: ___/5
- [ ] Implementing Brian Kernighan's algorithm: ___/5  
- [ ] Explaining why n & (n-1) works: ___/5
- [ ] Recognizing when this optimization applies: ___/5

**Problem Statement**: Write a function that takes an unsigned integer and returns the number of '1' bits it has (Hamming weight).

**Example**:
- Input: n = 00000000000000000000000000001011
- Output: 3

**Knowledge Prerequisites**:
- Binary representation of numbers
- Bit manipulation techniques
- Understanding of rightmost bit operations
- Loop optimization strategies

**First Principles**:
Count set bits by either:
1. Check each bit position individually
2. Use bit manipulation to eliminate set bits one by one
3. Use mathematical properties to count efficiently

**Problem-First Approach**:
1. **Identify pattern**: Need to count 1s in binary representation
2. **Bit checking**: Examine each bit position
3. **Optimization**: Use n & (n-1) to clear rightmost set bit
4. **Built-in functions**: Leverage Integer.bitCount() for comparison

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: Simple Bit Checking
class NumberOf1Bits {
    public int hammingWeight(int n) {
        int count = 0;
        
        while (n != 0) {
            count += n & 1;  // Check if rightmost bit is 1
            n >>>= 1;        // Unsigned right shift
        }
        
        return count;
    }
}

// Approach 2: Brian Kernighan's Algorithm (Optimal)
class NumberOf1Bits {
    public int hammingWeight(int n) {
        int count = 0;
        
        while (n != 0) {
            n &= (n - 1);  // Clear the rightmost set bit
            count++;
        }
        
        return count;
    }
}

// Approach 3: Built-in Function
class NumberOf1Bits {
    public int hammingWeight(int n) {
        return Integer.bitCount(n);
    }
}

// Approach 4: Using String Conversion
class NumberOf1Bits {
    public int hammingWeight(int n) {
        return Integer.toBinaryString(n).replaceAll("0", "").length();
    }
}

// Approach 5: Lookup Table (for frequent calls)
class NumberOf1Bits {
    private static final int[] BIT_COUNT = new int[256];
    
    static {
        for (int i = 0; i < 256; i++) {
            BIT_COUNT[i] = (i & 1) + BIT_COUNT[i >>> 1];
        }
    }
    
    public int hammingWeight(int n) {
        return BIT_COUNT[n & 0xFF] +
               BIT_COUNT[(n >>> 8) & 0xFF] +
               BIT_COUNT[(n >>> 16) & 0xFF] +
               BIT_COUNT[(n >>> 24) & 0xFF];
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: Simple Bit Checking
class NumberOf1Bits:
    def hammingWeight(self, n: int) -> int:
        count = 0
        
        while n:
            count += n & 1  # Check if rightmost bit is 1
            n >>= 1         # Right shift
        
        return count

# Approach 2: Brian Kernighan's Algorithm (Optimal)
class NumberOf1Bits:
    def hammingWeight(self, n: int) -> int:
        count = 0
        
        while n:
            n &= n - 1  # Clear the rightmost set bit
            count += 1
        
        return count

# Approach 3: Built-in Function
class NumberOf1Bits:
    def hammingWeight(self, n: int) -> int:
        return bin(n).count('1')

# Approach 4: Using String Conversion
class NumberOf1Bits:
    def hammingWeight(self, n: int) -> int:
        return bin(n)[2:].count('1')  # [2:] removes '0b' prefix

# Approach 5: Lookup Table (for frequent calls)
class NumberOf1Bits:
    def __init__(self):
        # Precompute bit counts for 0-255
        self.bit_count = [0] * 256
        for i in range(256):
            self.bit_count[i] = (i & 1) + self.bit_count[i >> 1]
    
    def hammingWeight(self, n: int) -> int:
        return (self.bit_count[n & 0xFF] +
                self.bit_count[(n >> 8) & 0xFF] +
                self.bit_count[(n >> 16) & 0xFF] +
                self.bit_count[(n >> 24) & 0xFF])
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: Simple Bit Checking
var hammingWeight = function(n) {
    let count = 0;
    
    while (n !== 0) {
        count += n & 1;  // Check if rightmost bit is 1
        n >>>= 1;        // Unsigned right shift
    }
    
    return count;
};

// Approach 2: Brian Kernighan's Algorithm (Optimal)
var hammingWeight = function(n) {
    let count = 0;
    
    while (n !== 0) {
        n &= (n - 1);  // Clear the rightmost set bit
        count++;
    }
    
    return count;
};

// Approach 3: Built-in Function
var hammingWeight = function(n) {
    return n.toString(2).split('1').length - 1;
};

// Approach 4: Using String Conversion
var hammingWeight = function(n) {
    return n.toString(2).replace(/0/g, '').length;
};

// Approach 5: Lookup Table (for frequent calls)
var hammingWeight = (function() {
    // Precompute bit counts for 0-255
    const bitCount = new Array(256);
    for (let i = 0; i < 256; i++) {
        bitCount[i] = (i & 1) + (bitCount[i >>> 1] || 0);
    }
    
    return function(n) {
        return bitCount[n & 0xFF] +
               bitCount[(n >>> 8) & 0xFF] +
               bitCount[(n >>> 16) & 0xFF] +
               bitCount[(n >>> 24) & 0xFF];
    };
})();
```
  </div>
</div>

**Complexity Analysis**:
- **Simple**: Time O(32) = O(1), Space O(1)
- **Brian Kernighan**: Time O(number of set bits), Space O(1)
- **Built-in**: Time O(1), Space O(1)

**Key Insights & Patterns**:
- Brian Kernighan's algorithm: n & (n-1) clears rightmost set bit
- Only need to iterate through set bits, not all bit positions
- Pattern useful for problems involving bit counting and manipulation

**Brian Kernighan's Algorithm Explanation**:
```
n = 12 = 1100
n-1 = 11 = 1011
n & (n-1) = 1100 & 1011 = 1000

n = 8 = 1000
n-1 = 7 = 0111
n & (n-1) = 1000 & 0111 = 0000

Total iterations: 2 (same as number of set bits)
```

---

### 3. Counting Bits

**🔗 LeetCode Link:** [Counting Bits - LeetCode #338](https://leetcode.com/problems/counting-bits/)

#### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. If you already know the bit count for some numbers, how could you use that to find the bit count for related numbers?
2. What's the relationship between a number's bit count and the bit count of that number with its rightmost bit removed?
3. How do even and odd numbers differ in their bit patterns, and how could this help?

*Take a moment to think through these questions before continuing...*

#### 💡 Discovery Process (Guided Learning)

**Step 1: Pattern Recognition in Binary Sequences**
> **Guided Question:** Look at numbers 0-7 and their bit counts. What patterns do you notice between consecutive numbers?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Numbers 0-7: 000, 001, 010, 011, 100, 101, 110, 111
Bit counts: [0, 1, 1, 2, 1, 2, 2, 3]

Patterns:
- Each number's bit count relates to a previously computed number
- When you shift right (divide by 2), you remove the rightmost bit
- The relationship: `count[i] = count[i >> 1] + (i & 1)`

This suggests we can build solutions incrementally using dynamic programming.
</details>

**Step 2: Dynamic Programming Relationship**
> **Guided Question:** How does the bit count of number `i` relate to the bit count of `i >> 1` (i divided by 2)?

<details>
<summary>💭 Think about it, then click to reveal</summary>

When you right-shift a number by 1 position:
- You remove the rightmost bit
- The bit count decreases by 1 if the rightmost bit was 1, or stays the same if it was 0

Therefore: `bitCount[i] = bitCount[i >> 1] + (i & 1)`
- `i >> 1` gives us a smaller number we've already computed
- `i & 1` tells us if the rightmost bit is 1 (add 1) or 0 (add 0)

This allows O(1) computation per number!
</details>

**Step 3: Alternative DP Approaches**
> **Guided Question:** Besides the right-shift approach, what other relationships exist between a number and previously computed values?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Brian Kernighan's relationship: `bitCount[i] = bitCount[i & (i-1)] + 1`
- `i & (i-1)` removes the rightmost set bit
- We add 1 for the removed bit

Power-of-2 offset approach:
- Numbers follow patterns based on powers of 2
- For each power of 2, the pattern repeats with +1

Multiple DP transitions are possible, each offering different insights into binary number properties.
</details>

#### 🎯 Practice & Self-Assessment

**Implementation Challenge**
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Create result array of size n+1
- [ ] Initialize ans[0] = 0 as base case
- [ ] Loop from 1 to n
- [ ] Use DP relation: ans[i] = ans[i >> 1] + (i & 1)
- [ ] Return the completed array

**Reflection Questions**
After solving, think about:

1. **Understanding Check:** Can you trace through computing bit counts for numbers 0-5 using the DP approach?
2. **Complexity Analysis:** Why is this O(n) time instead of O(n log n) like the brute force method?
3. **Trade-offs:** What are the advantages of different DP transitions (right shift vs Brian Kernighan's)?
4. **Pattern Recognition:** How does this DP thinking apply to other bit manipulation problems?

**Confidence Rating**
Rate your confidence (1-5) on:
- [ ] Understanding the binary patterns: ___/5
- [ ] Implementing the DP relationship: ___/5  
- [ ] Explaining why the recurrence works: ___/5
- [ ] Recognizing similar DP opportunities: ___/5

**Problem Statement**: Given an integer n, return an array ans of length n + 1 such that for each i (0 ≤ i ≤ n), ans[i] is the number of 1's in the binary representation of i.

**Example**:
- Input: n = 5
- Output: [0,1,1,2,1,2]
- Explanation: 0→0, 1→1, 2→10, 3→11, 4→100, 5→101

**Knowledge Prerequisites**:
- Dynamic programming concepts
- Bit manipulation patterns
- Understanding of binary number progression
- Relationship between consecutive binary numbers

**First Principles**:
For each number i, count of 1-bits relates to previously computed values:
- i & (i-1) removes rightmost set bit
- i >> 1 shifts right by one position
- i & 1 checks if number is odd (rightmost bit)

**Problem-First Approach**:
1. **Identify pattern**: Build solution using previously computed results
2. **DP relationship**: ans[i] = ans[i & (i-1)] + 1 OR ans[i] = ans[i >> 1] + (i & 1)
3. **Base case**: ans[0] = 0
4. **Optimization**: Use bit manipulation properties for O(1) computation per number

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: DP with Brian Kernighan's Algorithm
class CountingBits {
    public int[] countBits(int n) {
        int[] ans = new int[n + 1];
        
        for (int i = 1; i <= n; i++) {
            // ans[i & (i-1)] is count for i with rightmost bit cleared
            ans[i] = ans[i & (i - 1)] + 1;
        }
        
        return ans;
    }
}

// Approach 2: DP with Right Shift
class CountingBits {
    public int[] countBits(int n) {
        int[] ans = new int[n + 1];
        
        for (int i = 1; i <= n; i++) {
            // ans[i >> 1] is count for i/2, plus 1 if i is odd
            ans[i] = ans[i >> 1] + (i & 1);
        }
        
        return ans;
    }
}

// Approach 3: DP with Last Set Bit
class CountingBits {
    public int[] countBits(int n) {
        int[] ans = new int[n + 1];
        
        for (int i = 1; i <= n; i++) {
            // If i is even: same as i/2
            // If i is odd: i/2 + 1
            ans[i] = ans[i / 2] + (i % 2);
        }
        
        return ans;
    }
}

// Approach 4: Using Power of 2 Offset
class CountingBits {
    public int[] countBits(int n) {
        int[] ans = new int[n + 1];
        int offset = 1;
        
        for (int i = 1; i <= n; i++) {
            if (offset * 2 == i) {
                offset = i;
            }
            ans[i] = 1 + ans[i - offset];
        }
        
        return ans;
    }
}

// Approach 5: Brute Force (for comparison)
class CountingBits {
    public int[] countBits(int n) {
        int[] ans = new int[n + 1];
        
        for (int i = 0; i <= n; i++) {
            ans[i] = Integer.bitCount(i);
        }
        
        return ans;
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: DP with Brian Kernighan's Algorithm
class CountingBits:
    def countBits(self, n: int) -> List[int]:
        ans = [0] * (n + 1)
        
        for i in range(1, n + 1):
            # ans[i & (i-1)] is count for i with rightmost bit cleared
            ans[i] = ans[i & (i - 1)] + 1
        
        return ans

# Approach 2: DP with Right Shift
class CountingBits:
    def countBits(self, n: int) -> List[int]:
        ans = [0] * (n + 1)
        
        for i in range(1, n + 1):
            # ans[i >> 1] is count for i/2, plus 1 if i is odd
            ans[i] = ans[i >> 1] + (i & 1)
        
        return ans

# Approach 3: DP with Last Set Bit
class CountingBits:
    def countBits(self, n: int) -> List[int]:
        ans = [0] * (n + 1)
        
        for i in range(1, n + 1):
            # If i is even: same as i//2
            # If i is odd: i//2 + 1
            ans[i] = ans[i // 2] + (i % 2)
        
        return ans

# Approach 4: Using Power of 2 Offset
class CountingBits:
    def countBits(self, n: int) -> List[int]:
        ans = [0] * (n + 1)
        offset = 1
        
        for i in range(1, n + 1):
            if offset * 2 == i:
                offset = i
            ans[i] = 1 + ans[i - offset]
        
        return ans

# Approach 5: Brute Force (for comparison)
class CountingBits:
    def countBits(self, n: int) -> List[int]:
        ans = [0] * (n + 1)
        
        for i in range(n + 1):
            ans[i] = bin(i).count('1')
        
        return ans
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: DP with Brian Kernighan's Algorithm
var countBits = function(n) {
    const ans = new Array(n + 1).fill(0);
    
    for (let i = 1; i <= n; i++) {
        // ans[i & (i-1)] is count for i with rightmost bit cleared
        ans[i] = ans[i & (i - 1)] + 1;
    }
    
    return ans;
};

// Approach 2: DP with Right Shift
var countBits = function(n) {
    const ans = new Array(n + 1).fill(0);
    
    for (let i = 1; i <= n; i++) {
        // ans[i >> 1] is count for i/2, plus 1 if i is odd
        ans[i] = ans[i >> 1] + (i & 1);
    }
    
    return ans;
};

// Approach 3: DP with Last Set Bit
var countBits = function(n) {
    const ans = new Array(n + 1).fill(0);
    
    for (let i = 1; i <= n; i++) {
        // If i is even: same as Math.floor(i/2)
        // If i is odd: Math.floor(i/2) + 1
        ans[i] = ans[Math.floor(i / 2)] + (i % 2);
    }
    
    return ans;
};

// Approach 4: Using Power of 2 Offset
var countBits = function(n) {
    const ans = new Array(n + 1).fill(0);
    let offset = 1;
    
    for (let i = 1; i <= n; i++) {
        if (offset * 2 === i) {
            offset = i;
        }
        ans[i] = 1 + ans[i - offset];
    }
    
    return ans;
};

// Approach 5: Brute Force (for comparison)
var countBits = function(n) {
    const ans = new Array(n + 1);
    
    for (let i = 0; i <= n; i++) {
        ans[i] = i.toString(2).split('1').length - 1;
    }
    
    return ans;
};
```
  </div>
</div>

**Complexity Analysis**:
- **DP approaches**: Time O(n), Space O(1) extra (excluding output array)
- **Brute force**: Time O(n × log n), Space O(1) extra

**Key Insights & Patterns**:
- Each number's bit count relates to a previously computed number
- Multiple DP transitions possible: i & (i-1), i >> 1, power of 2 offsets
- Pattern fundamental to many bit manipulation DP problems

**DP Transition Explanations**:
```
Method 1: ans[i] = ans[i & (i-1)] + 1
i=5 (101) → i&(i-1) = 5&4 = 101&100 = 100 = 4
ans[5] = ans[4] + 1 = 1 + 1 = 2

Method 2: ans[i] = ans[i >> 1] + (i & 1)
i=5 (101) → i>>1 = 2 (10), i&1 = 1
ans[5] = ans[2] + 1 = 1 + 1 = 2
```

---

### 4. Missing Number

**🔗 LeetCode Link:** [Missing Number - LeetCode #268](https://leetcode.com/problems/missing-number/)

#### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What happens when you XOR a number with itself, and how could this help find a missing element?
2. How could you use the mathematical sum formula to solve this without bit manipulation?
3. What are the advantages of the XOR approach over arithmetic approaches?

*Take a moment to think through these questions before continuing...*

#### 💡 Discovery Process (Guided Learning)

**Step 1: Understanding XOR's Self-Canceling Property**
> **Guided Question:** If you XOR all numbers from 0 to n with all numbers in the array, what remains?

<details>
<summary>💭 Think about it, then click to reveal</summary>

XOR properties:
- `a ^ a = 0` (any number XORed with itself equals 0)
- `a ^ 0 = a` (any number XORed with 0 equals itself)
- XOR is commutative and associative

When you XOR [0,1,2,3] with [3,0,1]:
- 0^0 = 0 (cancels)
- 1^1 = 0 (cancels) 
- 3^3 = 0 (cancels)
- 2 remains (the missing number)

All present numbers cancel out, leaving only the missing one!
</details>

**Step 2: Implementing the XOR Strategy**
> **Guided Question:** How can you efficiently XOR all expected numbers with all array elements in a single pass?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Elegant approach:
1. Start with `missing = n` (the highest expected number)
2. For each index `i` and value `nums[i]`, compute: `missing ^= i ^ nums[i]`
3. This simultaneously XORs all indices [0 to n-1] and all array values

Alternative: XOR all numbers 0 to n, then XOR all array elements separately.

Both approaches leverage XOR's self-canceling property to eliminate paired values.
</details>

**Step 3: Comparing Solution Approaches**
> **Guided Question:** What are the trade-offs between XOR, arithmetic sum, and other approaches?

<details>
<summary>💭 Think about it, then click to reveal</summary>

XOR approach:
- ✅ No integer overflow risk
- ✅ Constant space
- ✅ Single pass
- ✅ Elegant bit manipulation

Arithmetic sum approach:
- ✅ Intuitive (expected sum - actual sum)
- ⚠️ Potential integer overflow for large n
- ✅ Single pass

XOR is preferred for its mathematical elegance and overflow safety.
</details>

#### 🎯 Practice & Self-Assessment

**Implementation Challenge**
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Initialize missing variable with the array length
- [ ] Loop through array indices and values
- [ ] XOR the missing variable with both index and value
- [ ] Return the final missing value
- [ ] Handle edge cases (empty array, single element)

**Reflection Questions**
After solving, think about:

1. **Understanding Check:** Can you trace through finding the missing number in [3,0,1] using XOR?
2. **Complexity Analysis:** Why is this O(n) time with O(1) space?
3. **Trade-offs:** When might you prefer the arithmetic sum approach despite overflow risks?
4. **Pattern Recognition:** What other "find the single different element" problems use similar XOR techniques?

**Confidence Rating**
Rate your confidence (1-5) on:
- [ ] Understanding XOR's self-canceling property: ___/5
- [ ] Implementing the XOR solution efficiently: ___/5  
- [ ] Explaining why XOR avoids overflow issues: ___/5
- [ ] Recognizing XOR patterns in other problems: ___/5

**Problem Statement**: Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.

**Example**:
- Input: nums = [3,0,1]
- Output: 2

**Knowledge Prerequisites**:
- XOR properties and self-canceling
- Mathematical series formulas
- Array traversal techniques
- Understanding of missing element problems

**First Principles**:
Several approaches work:
1. **XOR**: Missing number = XOR of all numbers [0,n] XOR all array elements
2. **Sum**: Missing number = expected_sum - actual_sum
3. **Sorting**: Sort and find gap
4. **Set**: Use hash set to track presence

**Problem-First Approach**:
1. **Identify pattern**: One number missing from consecutive sequence
2. **XOR approach**: Leverage a ⊕ a = 0 property
3. **Mathematical**: Use arithmetic series sum formula
4. **Choose optimal**: XOR avoids potential integer overflow

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
import java.util.*;

// Approach 1: XOR (Most Elegant)
class MissingNumber {
    public int missingNumber(int[] nums) {
        int missing = nums.length;  // Start with n
        
        for (int i = 0; i < nums.length; i++) {
            missing ^= i ^ nums[i];  // XOR index and value
        }
        
        return missing;
    }
}

// Approach 2: XOR Alternative
class MissingNumber {
    public int missingNumber(int[] nums) {
        int result = 0;
        
        // XOR all indices 0 to n
        for (int i = 1; i <= nums.length; i++) {
            result ^= i;
        }
        
        // XOR all array elements
        for (int num : nums) {
            result ^= num;
        }
        
        return result;
    }
}

// Approach 3: Mathematical Sum
class MissingNumber {
    public int missingNumber(int[] nums) {
        int n = nums.length;
        int expectedSum = n * (n + 1) / 2;  // Sum of 0 to n
        int actualSum = 0;
        
        for (int num : nums) {
            actualSum += num;
        }
        
        return expectedSum - actualSum;
    }
}

// Approach 4: Binary Search (requires sorting)
class MissingNumber {
    public int missingNumber(int[] nums) {
        Arrays.sort(nums);
        int left = 0, right = nums.length;
        
        while (left < right) {
            int mid = left + (right - left) / 2;
            
            if (nums[mid] == mid) {
                left = mid + 1;
            } else {
                right = mid;
            }
        }
        
        return left;
    }
}

// Approach 5: HashSet
class MissingNumber {
    public int missingNumber(int[] nums) {
        Set<Integer> numSet = new HashSet<>();
        for (int num : nums) {
            numSet.add(num);
        }
        
        for (int i = 0; i <= nums.length; i++) {
            if (!numSet.contains(i)) {
                return i;
            }
        }
        
        return -1; // Should never reach here
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: XOR (Most Elegant)
class MissingNumber:
    def missingNumber(self, nums: List[int]) -> int:
        missing = len(nums)  # Start with n
        
        for i, num in enumerate(nums):
            missing ^= i ^ num  # XOR index and value
        
        return missing

# Approach 2: XOR Alternative
class MissingNumber:
    def missingNumber(self, nums: List[int]) -> int:
        result = 0
        
        # XOR all indices 0 to n
        for i in range(1, len(nums) + 1):
            result ^= i
        
        # XOR all array elements
        for num in nums:
            result ^= num
        
        return result

# Approach 3: Mathematical Sum
class MissingNumber:
    def missingNumber(self, nums: List[int]) -> int:
        n = len(nums)
        expected_sum = n * (n + 1) // 2  # Sum of 0 to n
        actual_sum = sum(nums)
        
        return expected_sum - actual_sum

# Approach 4: Binary Search (requires sorting)
class MissingNumber:
    def missingNumber(self, nums: List[int]) -> int:
        nums.sort()
        left, right = 0, len(nums)
        
        while left < right:
            mid = (left + right) // 2
            
            if nums[mid] == mid:
                left = mid + 1
            else:
                right = mid
        
        return left

# Approach 5: Set
class MissingNumber:
    def missingNumber(self, nums: List[int]) -> int:
        num_set = set(nums)
        
        for i in range(len(nums) + 1):
            if i not in num_set:
                return i
        
        return -1  # Should never reach here
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: XOR (Most Elegant)
var missingNumber = function(nums) {
    let missing = nums.length;  // Start with n
    
    for (let i = 0; i < nums.length; i++) {
        missing ^= i ^ nums[i];  // XOR index and value
    }
    
    return missing;
};

// Approach 2: XOR Alternative
var missingNumber = function(nums) {
    let result = 0;
    
    // XOR all indices 0 to n
    for (let i = 1; i <= nums.length; i++) {
        result ^= i;
    }
    
    // XOR all array elements
    for (const num of nums) {
        result ^= num;
    }
    
    return result;
};

// Approach 3: Mathematical Sum
var missingNumber = function(nums) {
    const n = nums.length;
    const expectedSum = n * (n + 1) / 2;  // Sum of 0 to n
    const actualSum = nums.reduce((sum, num) => sum + num, 0);
    
    return expectedSum - actualSum;
};

// Approach 4: Binary Search (requires sorting)
var missingNumber = function(nums) {
    nums.sort((a, b) => a - b);
    let left = 0, right = nums.length;
    
    while (left < right) {
        const mid = Math.floor((left + right) / 2);
        
        if (nums[mid] === mid) {
            left = mid + 1;
        } else {
            right = mid;
        }
    }
    
    return left;
};

// Approach 5: Set
var missingNumber = function(nums) {
    const numSet = new Set(nums);
    
    for (let i = 0; i <= nums.length; i++) {
        if (!numSet.has(i)) {
            return i;
        }
    }
    
    return -1; // Should never reach here
};
```
  </div>
</div>

**Complexity Analysis**:
- **XOR**: Time O(n), Space O(1)
- **Sum**: Time O(n), Space O(1) (but potential overflow)
- **Binary Search**: Time O(n log n), Space O(1)
- **HashSet**: Time O(n), Space O(n)

**Key Insights & Patterns**:
- XOR's self-canceling property: a ⊕ a = 0
- Mathematical approach using arithmetic series
- Pattern applicable to finding single missing/duplicate elements
- XOR approach prevents integer overflow issues

**XOR Solution Explanation**:
```
Array: [3, 0, 1], Missing: 2

Step 1: missing = 3 (length of array)
Step 2: XOR with indices and values
i=0: missing = 3 ^ 0 ^ 3 = 0
i=1: missing = 0 ^ 1 ^ 0 = 1  
i=2: missing = 1 ^ 2 ^ 1 = 2

Result: 2 (the missing number)
```

**Why XOR Works**:
```
XOR all numbers 0 to n: 0 ^ 1 ^ 2 ^ 3
XOR all array elements: 3 ^ 0 ^ 1
Combined: (0 ^ 1 ^ 2 ^ 3) ^ (3 ^ 0 ^ 1) = 2
Since a ^ a = 0, all present numbers cancel out
```

---

### 5. Reverse Bits

**🔗 LeetCode Link:** [Reverse Bits - LeetCode #190](https://leetcode.com/problems/reverse-bits/)

#### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. How would you extract bits from the right side of a number and place them on the left side of the result?
2. What's the relationship between bit positions in the original number versus the reversed number?
3. How could you reverse bits by swapping larger groups instead of individual bits?

*Take a moment to think through these questions before continuing...*

#### 💡 Discovery Process (Guided Learning)

**Step 1: Bit-by-Bit Reversal Approach**
> **Guided Question:** How can you extract each bit from the input and place it in the correct position in the result?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Basic approach:
1. Extract rightmost bit using `n & 1`
2. Shift result left to make room: `result <<= 1`
3. Add extracted bit to result: `result |= (n & 1)`
4. Shift input right: `n >>>= 1`
5. Repeat for all 32 bits

This processes bits from right to left in input, placing them left to right in result, achieving the reversal.
</details>

**Step 2: Understanding Divide and Conquer Optimization**
> **Guided Question:** Instead of swapping individual bits, how could you swap larger groups of bits more efficiently?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Divide and conquer strategy:
1. Swap every pair of adjacent bits
2. Swap every pair of adjacent 2-bit groups  
3. Swap every pair of adjacent 4-bit groups
4. Continue until swapping the two 16-bit halves

Example masks:
- `0xAAAAAAAA` and `0x55555555` for 1-bit swaps
- `0xCCCCCCCC` and `0x33333333` for 2-bit swaps

This reduces operations from 32 to just 5 steps!
</details>

**Step 3: Bit Manipulation Masking Technique**
> **Guided Question:** How do the hexadecimal masks work to isolate and swap specific bit groups?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Mask patterns:
- `0xAAAAAAAA` = 10101010... (all even bit positions)
- `0x55555555` = 01010101... (all odd bit positions)

Swapping process:
1. `(n & 0xAAAAAAAA) >>> 1` extracts even bits and shifts them right
2. `(n & 0x55555555) << 1` extracts odd bits and shifts them left  
3. OR them together to complete the swap

Each mask pair targets specific bit groups, creating an elegant logarithmic solution.
</details>

#### 🎯 Practice & Self-Assessment

**Implementation Challenge**
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Set up bit-by-bit loop for 32 iterations
- [ ] Extract rightmost bit with AND operation
- [ ] Shift result left and add extracted bit
- [ ] Shift input right for next iteration
- [ ] Or try the divide-and-conquer approach with masks

**Reflection Questions**
After solving, think about:

1. **Understanding Check:** Can you trace through reversing 8 bits (11010010) using the bit-by-bit method?
2. **Complexity Analysis:** Why is the divide-and-conquer approach O(1) with fewer operations?
3. **Trade-offs:** When would you choose bit-by-bit over divide-and-conquer?
4. **Pattern Recognition:** How do the masking techniques apply to other bit manipulation problems?

**Confidence Rating**
Rate your confidence (1-5) on:
- [ ] Understanding bit extraction and placement: ___/5
- [ ] Implementing the basic bit-by-bit approach: ___/5  
- [ ] Understanding the divide-and-conquer optimization: ___/5
- [ ] Recognizing bit masking patterns: ___/5

**Problem Statement**: Reverse bits of a given 32-bit unsigned integer.

**Example**:
- Input: n = 00000010100101000001111010011100
- Output: 00111001011110000010100101000000

**Knowledge Prerequisites**:
- Binary representation understanding
- Bit manipulation operations
- Shift operations (left and right)
- Masking techniques

**First Principles**:
To reverse bits:
1. Extract bits from right side of input
2. Place them on left side of result
3. Continue for all 32 bit positions
4. Use shift operations to move bits to correct positions

**Problem-First Approach**:
1. **Identify pattern**: Mirror the binary representation
2. **Bit extraction**: Use AND with 1 to get rightmost bit
3. **Bit placement**: Use OR and left shift to place bits
4. **Iteration**: Process all 32 bits of the integer

**Solutions**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Approach 1: Bit by Bit Reversal
class ReverseBits {
    public int reverseBits(int n) {
        int result = 0;
        
        for (int i = 0; i < 32; i++) {
            // Shift result left to make room for next bit
            result <<= 1;
            
            // Add the rightmost bit of n to result
            result |= (n & 1);
            
            // Shift n right to process next bit
            n >>= 1;
        }
        
        return result;
    }
}

// Approach 2: Alternative Implementation
class ReverseBits {
    public int reverseBits(int n) {
        int result = 0;
        
        for (int i = 0; i < 32; i++) {
            // Extract bit at position i from right
            int bit = (n >> i) & 1;
            
            // Place bit at position (31-i) from right
            result |= (bit << (31 - i));
        }
        
        return result;
    }
}

// Approach 3: Divide and Conquer (Most Efficient)
class ReverseBits {
    public int reverseBits(int n) {
        // Swap every two consecutive bits
        n = ((n & 0xAAAAAAAA) >>> 1) | ((n & 0x55555555) << 1);
        
        // Swap every two consecutive pairs
        n = ((n & 0xCCCCCCCC) >>> 2) | ((n & 0x33333333) << 2);
        
        // Swap every two consecutive quartets
        n = ((n & 0xF0F0F0F0) >>> 4) | ((n & 0x0F0F0F0F) << 4);
        
        // Swap every two consecutive bytes
        n = ((n & 0xFF00FF00) >>> 8) | ((n & 0x00FF00FF) << 8);
        
        // Swap the two halves
        n = (n >>> 16) | (n << 16);
        
        return n;
    }
}

// Approach 4: Using StringBuilder (Less Efficient)
class ReverseBits {
    public int reverseBits(int n) {
        StringBuilder binary = new StringBuilder();
        
        for (int i = 0; i < 32; i++) {
            binary.append(n & 1);
            n >>= 1;
        }
        
        return (int) Long.parseLong(binary.toString(), 2);
    }
}

// Approach 5: Lookup Table (for frequent calls)
class ReverseBits {
    private static final int[] REVERSED = new int[256];
    
    static {
        for (int i = 0; i < 256; i++) {
            int reversed = 0;
            int temp = i;
            for (int j = 0; j < 8; j++) {
                reversed = (reversed << 1) | (temp & 1);
                temp >>= 1;
            }
            REVERSED[i] = reversed;
        }
    }
    
    public int reverseBits(int n) {
        return (REVERSED[n & 0xFF] << 24) |
               (REVERSED[(n >>> 8) & 0xFF] << 16) |
               (REVERSED[(n >>> 16) & 0xFF] << 8) |
               (REVERSED[(n >>> 24) & 0xFF]);
    }
}
```
  </div>
  
  <div class="tab-content python">
```python
# Approach 1: Bit by Bit Reversal
class ReverseBits:
    def reverseBits(self, n: int) -> int:
        result = 0
        
        for i in range(32):
            # Shift result left to make room for next bit
            result <<= 1
            
            # Add the rightmost bit of n to result
            result |= (n & 1)
            
            # Shift n right to process next bit
            n >>= 1
        
        return result

# Approach 2: Alternative Implementation
class ReverseBits:
    def reverseBits(self, n: int) -> int:
        result = 0
        
        for i in range(32):
            # Extract bit at position i from right
            bit = (n >> i) & 1
            
            # Place bit at position (31-i) from right
            result |= (bit << (31 - i))
        
        return result

# Approach 3: Divide and Conquer (Most Efficient)
class ReverseBits:
    def reverseBits(self, n: int) -> int:
        # Swap every two consecutive bits
        n = ((n & 0xAAAAAAAA) >> 1) | ((n & 0x55555555) << 1)
        
        # Swap every two consecutive pairs
        n = ((n & 0xCCCCCCCC) >> 2) | ((n & 0x33333333) << 2)
        
        # Swap every two consecutive quartets
        n = ((n & 0xF0F0F0F0) >> 4) | ((n & 0x0F0F0F0F) << 4)
        
        # Swap every two consecutive bytes
        n = ((n & 0xFF00FF00) >> 8) | ((n & 0x00FF00FF) << 8)
        
        # Swap the two halves
        n = (n >> 16) | ((n & 0xFFFF) << 16)
        
        return n & 0xFFFFFFFF  # Ensure 32-bit result

# Approach 4: Using String Conversion
class ReverseBits:
    def reverseBits(self, n: int) -> int:
        # Convert to 32-bit binary string and reverse
        binary = format(n, '032b')[::-1]
        return int(binary, 2)

# Approach 5: Lookup Table (for frequent calls)
class ReverseBits:
    def __init__(self):
        # Precompute reversed values for 0-255
        self.reversed = [0] * 256
        for i in range(256):
            reversed_val = 0
            temp = i
            for j in range(8):
                reversed_val = (reversed_val << 1) | (temp & 1)
                temp >>= 1
            self.reversed[i] = reversed_val
    
    def reverseBits(self, n: int) -> int:
        return ((self.reversed[n & 0xFF] << 24) |
                (self.reversed[(n >> 8) & 0xFF] << 16) |
                (self.reversed[(n >> 16) & 0xFF] << 8) |
                (self.reversed[(n >> 24) & 0xFF]))
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Approach 1: Bit by Bit Reversal
var reverseBits = function(n) {
    let result = 0;
    
    for (let i = 0; i < 32; i++) {
        // Shift result left to make room for next bit
        result <<= 1;
        
        // Add the rightmost bit of n to result
        result |= (n & 1);
        
        // Shift n right to process next bit
        n >>>= 1;  // Unsigned right shift
    }
    
    return result >>> 0;  // Ensure unsigned 32-bit integer
};

// Approach 2: Alternative Implementation
var reverseBits = function(n) {
    let result = 0;
    
    for (let i = 0; i < 32; i++) {
        // Extract bit at position i from right
        const bit = (n >>> i) & 1;
        
        // Place bit at position (31-i) from right
        result |= (bit << (31 - i));
    }
    
    return result >>> 0;  // Ensure unsigned 32-bit integer
};

// Approach 3: Divide and Conquer (Most Efficient)
var reverseBits = function(n) {
    // Swap every two consecutive bits
    n = ((n & 0xAAAAAAAA) >>> 1) | ((n & 0x55555555) << 1);
    
    // Swap every two consecutive pairs
    n = ((n & 0xCCCCCCCC) >>> 2) | ((n & 0x33333333) << 2);
    
    // Swap every two consecutive quartets
    n = ((n & 0xF0F0F0F0) >>> 4) | ((n & 0x0F0F0F0F) << 4);
    
    // Swap every two consecutive bytes
    n = ((n & 0xFF00FF00) >>> 8) | ((n & 0x00FF00FF) << 8);
    
    // Swap the two halves
    n = (n >>> 16) | (n << 16);
    
    return n >>> 0;  // Ensure unsigned 32-bit integer
};

// Approach 4: Using String Conversion
var reverseBits = function(n) {
    // Convert to 32-bit binary string and reverse
    const binary = n.toString(2).padStart(32, '0').split('').reverse().join('');
    return parseInt(binary, 2);
};

// Approach 5: Lookup Table (for frequent calls)
var reverseBits = (function() {
    // Precompute reversed values for 0-255
    const reversed = new Array(256);
    for (let i = 0; i < 256; i++) {
        let reversedVal = 0;
        let temp = i;
        for (let j = 0; j < 8; j++) {
            reversedVal = (reversedVal << 1) | (temp & 1);
            temp >>>= 1;
        }
        reversed[i] = reversedVal;
    }
    
    return function(n) {
        return ((reversed[n & 0xFF] << 24) |
                (reversed[(n >>> 8) & 0xFF] << 16) |
                (reversed[(n >>> 16) & 0xFF] << 8) |
                (reversed[(n >>> 24) & 0xFF])) >>> 0;
    };
})();
```
  </div>
</div>

**Complexity Analysis**:
- **Bit by bit**: Time O(32) = O(1), Space O(1)
- **Divide and conquer**: Time O(1), Space O(1)
- **Lookup table**: Time O(1), Space O(256) for preprocessing

**Key Insights & Patterns**:
- Divide and conquer approach swaps bits in larger and larger groups
- Lookup table optimization for repeated calls
- Pattern useful for any bit reversal/swapping problems

**Divide and Conquer Explanation**:
```
Original: 11010010 (example 8-bit for clarity)

Step 1: Swap adjacent bits
11|01|00|10 → 11|10|00|01 → 11100001

Step 2: Swap adjacent pairs
1110|0001 → 0001|1110 → 00011110

Step 3: Swap adjacent quartets
00011110 → 11100001 → Final result

Each step processes larger groups, achieving O(log n) levels
```

**Masks Used in Divide and Conquer**:

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
0xAAAAAAAA = 10101010... (even positions)
0x55555555 = 01010101... (odd positions)
0xCCCCCCCC = 11001100... (pairs starting at multiples of 4)
0x33333333 = 00110011... (other pairs)
// And so on...
```
  </div>
  
  <div class="tab-content python">
```python
0xAAAAAAAA = 0b10101010101010101010101010101010  # (even positions)
0x55555555 = 0b01010101010101010101010101010101  # (odd positions)
0xCCCCCCCC = 0b11001100110011001100110011001100  # (pairs starting at multiples of 4)
0x33333333 = 0b00110011001100110011001100110011  # (other pairs)
# And so on...
```
  </div>
  
  <div class="tab-content javascript">
```javascript
0xAAAAAAAA = 0b10101010101010101010101010101010; // (even positions)
0x55555555 = 0b01010101010101010101010101010101; // (odd positions)
0xCCCCCCCC = 0b11001100110011001100110011001100; // (pairs starting at multiples of 4)
0x33333333 = 0b00110011001100110011001100110011; // (other pairs)
// And so on...
```
  </div>
</div>

---

## Common Bit Manipulation Patterns

### 1. XOR Patterns

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Find single number (others appear twice)
int findSingle(int[] nums) {
    int result = 0;
    for (int num : nums) {
        result ^= num;
    }
    return result;
}

// Swap two numbers without temporary variable
void swap(int a, int b) {
    a ^= b;
    b ^= a;  // b = b ^ (a ^ b) = a
    a ^= b;  // a = (a ^ b) ^ a = b
}
```
  </div>
  
  <div class="tab-content python">
```python
# Find single number (others appear twice)
def find_single(nums):
    result = 0
    for num in nums:
        result ^= num
    return result

# Swap two numbers without temporary variable
def swap(a, b):
    a ^= b
    b ^= a  # b = b ^ (a ^ b) = a
    a ^= b  # a = (a ^ b) ^ a = b
    return a, b
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Find single number (others appear twice)
function findSingle(nums) {
    let result = 0;
    for (const num of nums) {
        result ^= num;
    }
    return result;
}

// Swap two numbers without temporary variable
function swap(a, b) {
    a ^= b;
    b ^= a;  // b = b ^ (a ^ b) = a
    a ^= b;  // a = (a ^ b) ^ a = b
    return [a, b];
}
```
  </div>
</div>

### 2. Power of Two Detection

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Check if number is power of 2
boolean isPowerOfTwo(int n) {
    return n > 0 && (n & (n - 1)) == 0;
}

// Count trailing zeros (position of rightmost set bit)
int trailingZeros(int n) {
    return Integer.numberOfTrailingZeros(n);
    // Or: Integer.numberOfTrailingZeros(n & -n)
}
```
  </div>
  
  <div class="tab-content python">
```python
# Check if number is power of 2
def is_power_of_two(n):
    return n > 0 and (n & (n - 1)) == 0

# Count trailing zeros (position of rightmost set bit)
def trailing_zeros(n):
    return (n & -n).bit_length() - 1 if n != 0 else 32
    # Alternative: bin(n & -n)[::-1].find('1') if n != 0 else 32
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Check if number is power of 2
function isPowerOfTwo(n) {
    return n > 0 && (n & (n - 1)) === 0;
}

// Count trailing zeros (position of rightmost set bit)
function trailingZeros(n) {
    if (n === 0) return 32;
    let count = 0;
    while ((n & 1) === 0) {
        n >>>= 1;
        count++;
    }
    return count;
}
```
  </div>
</div>

### 3. Bit Manipulation Utilities

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Set bit at position i
int setBit(int n, int i) {
    return n | (1 << i);
}

// Clear bit at position i
int clearBit(int n, int i) {
    return n & ~(1 << i);
}

// Toggle bit at position i
int toggleBit(int n, int i) {
    return n ^ (1 << i);
}

// Check if bit at position i is set
boolean isSet(int n, int i) {
    return (n & (1 << i)) != 0;
}
```
  </div>
  
  <div class="tab-content python">
```python
# Set bit at position i
def set_bit(n, i):
    return n | (1 << i)

# Clear bit at position i
def clear_bit(n, i):
    return n & ~(1 << i)

# Toggle bit at position i
def toggle_bit(n, i):
    return n ^ (1 << i)

# Check if bit at position i is set
def is_set(n, i):
    return (n & (1 << i)) != 0
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Set bit at position i
function setBit(n, i) {
    return n | (1 << i);
}

// Clear bit at position i
function clearBit(n, i) {
    return n & ~(1 << i);
}

// Toggle bit at position i
function toggleBit(n, i) {
    return n ^ (1 << i);
}

// Check if bit at position i is set
function isSet(n, i) {
    return (n & (1 << i)) !== 0;
}
```
  </div>
</div>

### 4. Advanced Patterns

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Count set bits in range [0, n]
int countBitsInRange(int n) {
    int count = 0;
    for (int i = 0; i <= n; i++) {
        count += Integer.bitCount(i);
    }
    return count;
}

// Find position of rightmost set bit (1-indexed)
int rightmostSetBit(int n) {
    return Integer.numberOfTrailingZeros(n) + 1;
}

// Isolate rightmost set bit
int isolateRightmostSetBit(int n) {
    return n & (-n);
}
```
  </div>
  
  <div class="tab-content python">
```python
# Count set bits in range [0, n]
def count_bits_in_range(n):
    count = 0
    for i in range(n + 1):
        count += bin(i).count('1')
    return count

# Find position of rightmost set bit (1-indexed)
def rightmost_set_bit(n):
    if n == 0:
        return 0
    return (n & -n).bit_length()

# Isolate rightmost set bit
def isolate_rightmost_set_bit(n):
    return n & (-n)
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Count set bits in range [0, n]
function countBitsInRange(n) {
    let count = 0;
    for (let i = 0; i <= n; i++) {
        count += i.toString(2).split('1').length - 1;
    }
    return count;
}

// Find position of rightmost set bit (1-indexed)
function rightmostSetBit(n) {
    if (n === 0) return 0;
    let position = 1;
    while ((n & 1) === 0) {
        n >>>= 1;
        position++;
    }
    return position;
}

// Isolate rightmost set bit
function isolateRightmostSetBit(n) {
    return n & (-n);
}
```
  </div>
</div>

---

## Mathematical Properties of Bits

### XOR Properties
1. **Commutative**: a ⊕ b = b ⊕ a
2. **Associative**: (a ⊕ b) ⊕ c = a ⊕ (b ⊕ c)
3. **Identity**: a ⊕ 0 = a
4. **Self-inverse**: a ⊕ a = 0
5. **Transitivity**: if a ⊕ b = c, then a ⊕ c = b and b ⊕ c = a

### AND Properties
1. **Commutative**: a & b = b & a
2. **Associative**: (a & b) & c = a & (b & c)
3. **Identity**: a & 1 = a (for individual bits)
4. **Null**: a & 0 = 0
5. **Idempotent**: a & a = a

### OR Properties
1. **Commutative**: a | b = b | a
2. **Associative**: (a | b) | c = a | (b | c)
3. **Identity**: a | 0 = a
4. **Null**: a | 1 = 1 (for individual bits)
5. **Idempotent**: a | a = a

### Shift Properties
1. **Left shift**: n << k = n × 2^k
2. **Right shift**: n >> k = n ÷ 2^k (arithmetic)
3. **Unsigned right shift**: n >>> k = n ÷ 2^k (logical)

### Two's Complement Properties
1. **Negation**: -n = ~n + 1
2. **Absolute value**: |n| = (n ^ (n >> 31)) - (n >> 31)
3. **Sign check**: n < 0 iff (n >> 31) == -1

### Useful Bit Identities

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
// Clear rightmost set bit
n & (n - 1)

// Isolate rightmost set bit
n & (-n)

// Check if power of 2
(n & (n - 1)) == 0 && n > 0

// Toggle case of alphabet character
c ^= 32  // or c ^= ' '

// Check if two numbers have opposite signs
(a ^ b) < 0

// Compute max without branching
max(a, b) = a ^ ((a ^ b) & -(a < b))
```
  </div>
  
  <div class="tab-content python">
```python
# Clear rightmost set bit
n & (n - 1)

# Isolate rightmost set bit
n & (-n)

# Check if power of 2
(n & (n - 1)) == 0 and n > 0

# Toggle case of alphabet character
ord(c) ^ 32  # or ord(c) ^ ord(' ')

# Check if two numbers have opposite signs
(a ^ b) < 0

# Compute max without branching
# max(a, b) = a ^ ((a ^ b) & -(a < b))
```
  </div>
  
  <div class="tab-content javascript">
```javascript
// Clear rightmost set bit
n & (n - 1)

// Isolate rightmost set bit
n & (-n)

// Check if power of 2
(n & (n - 1)) === 0 && n > 0

// Toggle case of alphabet character
c.charCodeAt(0) ^ 32  // or c.charCodeAt(0) ^ ' '.charCodeAt(0)

// Check if two numbers have opposite signs
(a ^ b) < 0

// Compute max without branching
// max(a, b) = a ^ ((a ^ b) & -(a < b))
```
  </div>
</div>

---

## Final Tips for Bit Manipulation Mastery

### Recognition Patterns:
1. **Keywords**: "without using +/-", "count bits", "single number", "missing number"
2. **Constraints**: O(1) space requirement, very fast performance needed
3. **Input patterns**: Arrays with numbers appearing even/odd times
4. **Mathematical**: Problems involving powers of 2, binary properties

### Problem-Solving Strategy:
1. **Understand binary representation** of the problem
2. **Identify relevant bitwise properties** (XOR, AND, shifts)
3. **Work through small examples** manually in binary
4. **Look for patterns** in bit positions and transformations
5. **Consider mathematical properties** (two's complement, etc.)
6. **Test edge cases** (0, negative numbers, max values)

### Common Mistakes to Avoid:
1. Forgetting about signed vs unsigned operations
2. Not handling negative numbers properly (two's complement)
3. Integer overflow in shift operations
4. Using wrong shift operator (>> vs >>>)
5. Not considering endianness in multi-byte operations

### When to Use Bit Manipulation:
- **Performance critical** code
- **Space optimization** needed
- **Hardware-level** programming
- **Cryptographic** operations
- **Mathematical** computations with binary properties

This study guide provides a comprehensive foundation for mastering bit manipulation concepts through the Blind 75 problems. Practice with different approaches for each problem to build strong intuition about when and how to apply bit manipulation techniques.