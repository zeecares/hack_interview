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
```java
// Identity: a ^ 0 = a
// Self-inverse: a ^ a = 0
// Commutative: a ^ b = b ^ a
// Associative: (a ^ b) ^ c = a ^ (b ^ c)
```

### Shift Operations
```java
// Left shift: multiply by 2^n
5 << 2 = 20  // 5 * 2^2 = 5 * 4 = 20

// Right shift: divide by 2^n
20 >> 2 = 5  // 20 / 2^2 = 20 / 4 = 5
```

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

**Java Solutions**:

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

**Java Solutions**:

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

**Java Solutions**:

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

**Java Solutions**:

```java
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

**Java Solutions**:

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
```java
0xAAAAAAAA = 10101010... (even positions)
0x55555555 = 01010101... (odd positions)
0xCCCCCCCC = 11001100... (pairs starting at multiples of 4)
0x33333333 = 00110011... (other pairs)
// And so on...
```

---

## Common Bit Manipulation Patterns

### 1. XOR Patterns
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

### 2. Power of Two Detection
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

### 3. Bit Manipulation Utilities
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

### 4. Advanced Patterns
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