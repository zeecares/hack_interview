---
render_with_liquid: false
---

# String Problems - Blind 75 Study Guide

## Table of Contents
1. [Longest Substring Without Repeating Characters](#1-longest-substring-without-repeating-characters)
2. [Longest Repeating Character Replacement](#2-longest-repeating-character-replacement)
3. [Minimum Window Substring](#3-minimum-window-substring)
4. [Valid Anagram](#4-valid-anagram)
5. [Group Anagrams](#5-group-anagrams)
6. [Valid Parentheses](#6-valid-parentheses)
7. [Valid Palindrome](#7-valid-palindrome)
8. [Longest Palindromic Substring](#8-longest-palindromic-substring)
9. [Palindromic Substrings](#9-palindromic-substrings)
10. [Encode and Decode Strings](#10-encode-and-decode-strings)

---

## 1. Longest Substring Without Repeating Characters

**🔗 LeetCode Link:** [Longest Substring Without Repeating Characters - LeetCode #3](https://leetcode.com/problems/longest-substring-without-repeating-characters/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What's the main challenge in finding a substring without repeating characters?
2. How could you track which characters you've already seen in your current substring?
3. When you encounter a duplicate character, what should happen to your substring window?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding the Core Challenge
> **Guided Question:** What makes a substring "valid" in this problem, and what breaks that validity?

<details>
<summary>💭 Think about it, then click to reveal</summary>

A valid substring has all unique characters. The moment we encounter a character we've already seen in our current substring, we need to adjust our approach. The key insight is that we need to maintain a "window" of characters where all are unique.

</details>

#### Step 2: Naive Approach - Check All Possibilities
> **Guided Question:** What would be the most straightforward way to check every possible substring?

<details>
<summary>💭 Think about it, then click to reveal</summary>

We could check every possible substring by using two nested loops - one for the start position and one for the end position. For each substring, we'd check if all characters are unique. This gives us O(n³) time complexity - n² for generating all substrings and n for checking uniqueness.

</details>

#### Step 3: Sliding Window Optimization
> **Guided Question:** Instead of checking every substring, how could you maintain a "window" that's always valid and expand/contract it efficiently?

<details>
<summary>💭 Think about it, then click to reveal</summary>

The sliding window technique! Use two pointers (left and right) to maintain a window of unique characters. Expand the right pointer to include new characters, and when you hit a duplicate, move the left pointer to eliminate the duplicate. Use a HashMap to track character positions for efficient duplicate detection and window adjustment.

</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Initialize left pointer, right pointer, and HashMap for character tracking
- [ ] Expand right pointer and add characters to your tracking structure
- [ ] When duplicate found, update left pointer to skip past the duplicate
- [ ] Track the maximum window size seen so far
- [ ] Return the maximum length

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does the sliding window approach work better than checking all substrings?
2. **Complexity Analysis:** What's the time complexity and why is it O(n) instead of O(n²)?
3. **Trade-offs:** What's the space complexity trade-off we're making for better time complexity?
4. **Pattern Recognition:** What other problems might benefit from the sliding window technique?

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

### Problem Statement
Given a string `s`, find the length of the **longest substring** without repeating characters.

**Examples:**
```
Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.

Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.

Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
```

### Knowledge Prerequisites
- String manipulation and indexing
- Hash maps for character frequency tracking
- Sliding window technique
- Two pointers approach

### First Principles
The core concept is maintaining a window of unique characters and expanding/contracting it efficiently:
- **Sliding Window**: Maintain a window [left, right] with unique characters
- **Character Tracking**: Use a data structure to track character positions
- **Window Expansion**: Extend right pointer to include new characters
- **Window Contraction**: Move left pointer when duplicates are found

### Problem-First Approach

**Step 1: Understand the Problem**
- We need a contiguous substring (not subsequence)
- All characters in the substring must be unique
- Return the length of the longest such substring

**Step 2: Identify Key Insights**
- Use sliding window with two pointers
- Track character positions to handle duplicates efficiently
- Expand window when character is new, contract when duplicate found

**Step 3: Algorithm Design**
1. Use two pointers: left and right
2. Use HashMap to store character and its most recent index
3. Expand right pointer, check if character exists in current window
4. If duplicate found, move left pointer past the duplicate
5. Update maximum length at each step

### Multiple Java Solutions

#### Solution 1: Brute Force (Intuitive)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public int lengthOfLongestSubstring(String s) {
    int n = s.length();
    int maxLength = 0;
    
    // Check all possible substrings
    for (int i = 0; i < n; i++) {
        Set<Character> seen = new HashSet<>();
        for (int j = i; j < n; j++) {
            char c = s.charAt(j);
            if (seen.contains(c)) {
                break; // Found duplicate, break inner loop
            }
            seen.add(c);
            maxLength = Math.max(maxLength, j - i + 1);
        }
    }
    
    return maxLength;
}
```
  </div>
  
  <div class="tab-content python">
```python
def lengthOfLongestSubstring(self, s: str) -> int:
    n = len(s)
    max_length = 0
    
    # Check all possible substrings
    for i in range(n):
        seen = set()
        for j in range(i, n):
            c = s[j]
            if c in seen:
                break  # Found duplicate, break inner loop
            seen.add(c)
            max_length = max(max_length, j - i + 1)
    
    return max_length
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function lengthOfLongestSubstring(s) {
    const n = s.length;
    let maxLength = 0;
    
    // Check all possible substrings
    for (let i = 0; i < n; i++) {
        const seen = new Set();
        for (let j = i; j < n; j++) {
            const c = s[j];
            if (seen.has(c)) {
                break; // Found duplicate, break inner loop
            }
            seen.add(c);
            maxLength = Math.max(maxLength, j - i + 1);
        }
    }
    
    return maxLength;
}
```
  </div>
</div>

#### Solution 2: Sliding Window with HashSet

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public int lengthOfLongestSubstring(String s) {
    Set<Character> window = new HashSet<>();
    int left = 0, maxLength = 0;
    
    for (int right = 0; right < s.length(); right++) {
        char rightChar = s.charAt(right);
        
        // Shrink window until no duplicate
        while (window.contains(rightChar)) {
            window.remove(s.charAt(left));
            left++;
        }
        
        window.add(rightChar);
        maxLength = Math.max(maxLength, right - left + 1);
    }
    
    return maxLength;
}
```
  </div>
  
  <div class="tab-content python">
```python
def lengthOfLongestSubstring(self, s: str) -> int:
    window = set()
    left = 0
    max_length = 0
    
    for right in range(len(s)):
        right_char = s[right]
        
        # Shrink window until no duplicate
        while right_char in window:
            window.remove(s[left])
            left += 1
        
        window.add(right_char)
        max_length = max(max_length, right - left + 1)
    
    return max_length
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function lengthOfLongestSubstring(s) {
    const window = new Set();
    let left = 0;
    let maxLength = 0;
    
    for (let right = 0; right < s.length; right++) {
        const rightChar = s[right];
        
        // Shrink window until no duplicate
        while (window.has(rightChar)) {
            window.delete(s[left]);
            left++;
        }
        
        window.add(rightChar);
        maxLength = Math.max(maxLength, right - left + 1);
    }
    
    return maxLength;
}
```
  </div>
</div>

#### Solution 3: Optimized Sliding Window with HashMap (Most Efficient)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public int lengthOfLongestSubstring(String s) {
    Map<Character, Integer> charIndex = new HashMap<>();
    int left = 0, maxLength = 0;
    
    for (int right = 0; right < s.length(); right++) {
        char rightChar = s.charAt(right);
        
        // If character seen before and within current window
        if (charIndex.containsKey(rightChar) && charIndex.get(rightChar) >= left) {
            left = charIndex.get(rightChar) + 1;
        }
        
        charIndex.put(rightChar, right);
        maxLength = Math.max(maxLength, right - left + 1);
    }
    
    return maxLength;
}
```
  </div>
  
  <div class="tab-content python">
```python
def lengthOfLongestSubstring(self, s: str) -> int:
    char_index = {}
    left = 0
    max_length = 0
    
    for right in range(len(s)):
        right_char = s[right]
        
        # If character seen before and within current window
        if right_char in char_index and char_index[right_char] >= left:
            left = char_index[right_char] + 1
        
        char_index[right_char] = right
        max_length = max(max_length, right - left + 1)
    
    return max_length
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function lengthOfLongestSubstring(s) {
    const charIndex = new Map();
    let left = 0;
    let maxLength = 0;
    
    for (let right = 0; right < s.length; right++) {
        const rightChar = s[right];
        
        // If character seen before and within current window
        if (charIndex.has(rightChar) && charIndex.get(rightChar) >= left) {
            left = charIndex.get(rightChar) + 1;
        }
        
        charIndex.set(rightChar, right);
        maxLength = Math.max(maxLength, right - left + 1);
    }
    
    return maxLength;
}
```
  </div>
</div>

### Complexity Analysis
- **Brute Force**: Time O(n³), Space O(min(m,n)) where m is charset size
- **Sliding Window with HashSet**: Time O(n), Space O(min(m,n))
- **Optimized Sliding Window**: Time O(n), Space O(min(m,n))

### Key Insights & Patterns
1. **Sliding Window Pattern**: Expand right, contract left when condition violated
2. **Character Position Tracking**: HashMap allows jumping directly past duplicates
3. **Window Validity**: Always maintain window with unique characters
4. **Optimization**: Skip unnecessary left pointer movements

### Common Pitfalls
1. **Index Boundaries**: Ensure left pointer doesn't go beyond character's last seen position
2. **HashMap Updates**: Always update character's latest position
3. **Window Size Calculation**: Use `right - left + 1` for current window size
4. **Edge Cases**: Empty string, single character, all same characters

### Follow-up Questions
1. What if we need to return the actual substring instead of length?
2. How would you modify for longest substring with at most k distinct characters?
3. Can you solve this for a stream of characters with limited memory?

---

## 2. Longest Repeating Character Replacement

**🔗 LeetCode Link:** [Longest Repeating Character Replacement - LeetCode #424](https://leetcode.com/problems/longest-repeating-character-replacement/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What's the key insight about which characters to replace in a window to make them all the same?
2. How can you determine if a window is "valid" (can be made uniform with at most k replacements)?
3. What happens to your window when you have too many characters that need to be replaced?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding the Replacement Strategy
> **Guided Question:** In any window of characters, which characters should you keep and which should you replace to get the longest possible uniform substring?

<details>
<summary>💭 Think about it, then click to reveal</summary>

You should keep the most frequent character in the window and replace all others! If a window has 'A' appearing 3 times and 'B' appearing 2 times, you'd keep the A's and replace the B's. This minimizes the number of replacements needed.

</details>

#### Step 2: Window Validity Check
> **Guided Question:** How can you mathematically determine if a window can be made uniform with at most k replacements?

<details>
<summary>💭 Think about it, then click to reveal</summary>

The number of replacements needed = window_size - max_frequency_in_window. So a window is valid when: window_size - max_frequency ≤ k. When this condition is violated, you need to shrink the window.

</details>

#### Step 3: Sliding Window with Frequency Tracking
> **Guided Question:** How can you efficiently maintain the window while tracking character frequencies and the maximum frequency?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Use a sliding window with frequency counting! Expand the right pointer while tracking character counts and maximum frequency. When the window becomes invalid (needs more than k replacements), contract the left pointer. The key optimization: you don't need to recalculate max frequency when shrinking - just track the maximum you've seen.

</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Initialize left pointer, frequency array/map, and max frequency tracker
- [ ] Expand right pointer and update character frequency
- [ ] Update maximum frequency seen in current window
- [ ] Check if window is valid (window_size - max_frequency ≤ k)
- [ ] If invalid, shrink window by moving left pointer
- [ ] Track maximum valid window size

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why is it optimal to always keep the most frequent character in the window?
2. **Complexity Analysis:** Why don't we need to recalculate max frequency when shrinking the window?
3. **Trade-offs:** What's the benefit of using an array vs HashMap for frequency counting?
4. **Pattern Recognition:** How does this relate to the previous sliding window problem?

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

### Problem Statement
You are given a string `s` and an integer `k`. You can choose any character of the string and change it to any other uppercase English letter. You can perform this operation at most `k` times. Return the length of the longest substring containing the same letter you can get after performing the above operations.

**Examples:**
```
Input: s = "ABAB", k = 2
Output: 4
Explanation: Replace the two 'A's with two 'B's or vice versa.

Input: s = "AABABBA", k = 1
Output: 4
Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
```

### Knowledge Prerequisites
- Sliding window technique
- Hash maps for frequency counting
- String manipulation
- Greedy algorithms

### First Principles
The key insight is that we want to find the longest window where we can make all characters the same by changing at most k characters:
- **Window Validity**: Window size - count of most frequent character ≤ k
- **Sliding Window**: Expand when valid, contract when invalid
- **Frequency Tracking**: Track character counts in current window

### Problem-First Approach

**Step 1: Understand the Problem**
- We can change any character to any other character
- We can perform at most k changes
- Find the longest substring that can be made uniform

**Step 2: Key Insight**
- In any valid window, we keep the most frequent character and change others
- Changes needed = window_size - max_frequency_in_window
- Valid window: changes_needed ≤ k

**Step 3: Algorithm Design**
1. Use sliding window with frequency map
2. Track the maximum frequency in current window
3. Expand window while valid, contract when invalid
4. Return maximum window size seen

### Multiple Java Solutions

#### Solution 1: Basic Sliding Window

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public int characterReplacement(String s, int k) {
    Map<Character, Integer> count = new HashMap<>();
    int left = 0, maxLength = 0, maxFreq = 0;
    
    for (int right = 0; right < s.length(); right++) {
        char rightChar = s.charAt(right);
        count.put(rightChar, count.getOrDefault(rightChar, 0) + 1);
        maxFreq = Math.max(maxFreq, count.get(rightChar));
        
        // If window is invalid, shrink it
        while (right - left + 1 - maxFreq > k) {
            char leftChar = s.charAt(left);
            count.put(leftChar, count.get(leftChar) - 1);
            left++;
            // Recalculate maxFreq (expensive)
            maxFreq = Collections.max(count.values());
        }
        
        maxLength = Math.max(maxLength, right - left + 1);
    }
    
    return maxLength;
}
```
  </div>
  
  <div class="tab-content python">
```python
def characterReplacement(self, s: str, k: int) -> int:
    count = {}
    left = 0
    max_length = 0
    max_freq = 0
    
    for right in range(len(s)):
        right_char = s[right]
        count[right_char] = count.get(right_char, 0) + 1
        max_freq = max(max_freq, count[right_char])
        
        # If window is invalid, shrink it
        while right - left + 1 - max_freq > k:
            left_char = s[left]
            count[left_char] -= 1
            left += 1
            # Recalculate max_freq (expensive)
            max_freq = max(count.values()) if count else 0
        
        max_length = max(max_length, right - left + 1)
    
    return max_length
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function characterReplacement(s, k) {
    const count = new Map();
    let left = 0;
    let maxLength = 0;
    let maxFreq = 0;
    
    for (let right = 0; right < s.length; right++) {
        const rightChar = s[right];
        count.set(rightChar, (count.get(rightChar) || 0) + 1);
        maxFreq = Math.max(maxFreq, count.get(rightChar));
        
        // If window is invalid, shrink it
        while (right - left + 1 - maxFreq > k) {
            const leftChar = s[left];
            count.set(leftChar, count.get(leftChar) - 1);
            left++;
            // Recalculate maxFreq (expensive)
            maxFreq = Math.max(...count.values());
        }
        
        maxLength = Math.max(maxLength, right - left + 1);
    }
    
    return maxLength;
}
```
  </div>
</div>

#### Solution 2: Optimized Sliding Window

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public int characterReplacement(String s, int k) {
    int[] count = new int[26]; // For uppercase English letters
    int left = 0, maxLength = 0, maxFreq = 0;
    
    for (int right = 0; right < s.length(); right++) {
        char rightChar = s.charAt(right);
        count[rightChar - 'A']++;
        maxFreq = Math.max(maxFreq, count[rightChar - 'A']);
        
        // If window is invalid, shrink it
        while (right - left + 1 - maxFreq > k) {
            char leftChar = s.charAt(left);
            count[leftChar - 'A']--;
            left++;
            // Note: We don't update maxFreq here for optimization
        }
        
        maxLength = Math.max(maxLength, right - left + 1);
    }
    
    return maxLength;
}
```
  </div>
  
  <div class="tab-content python">
```python
def characterReplacement(self, s: str, k: int) -> int:
    count = [0] * 26  # For uppercase English letters
    left = 0
    max_length = 0
    max_freq = 0
    
    for right in range(len(s)):
        right_char = s[right]
        count[ord(right_char) - ord('A')] += 1
        max_freq = max(max_freq, count[ord(right_char) - ord('A')])
        
        # If window is invalid, shrink it
        while right - left + 1 - max_freq > k:
            left_char = s[left]
            count[ord(left_char) - ord('A')] -= 1
            left += 1
            # Note: We don't update max_freq here for optimization
        
        max_length = max(max_length, right - left + 1)
    
    return max_length
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function characterReplacement(s, k) {
    const count = new Array(26).fill(0); // For uppercase English letters
    let left = 0;
    let maxLength = 0;
    let maxFreq = 0;
    
    for (let right = 0; right < s.length; right++) {
        const rightChar = s[right];
        count[rightChar.charCodeAt(0) - 'A'.charCodeAt(0)]++;
        maxFreq = Math.max(maxFreq, count[rightChar.charCodeAt(0) - 'A'.charCodeAt(0)]);
        
        // If window is invalid, shrink it
        while (right - left + 1 - maxFreq > k) {
            const leftChar = s[left];
            count[leftChar.charCodeAt(0) - 'A'.charCodeAt(0)]--;
            left++;
            // Note: We don't update maxFreq here for optimization
        }
        
        maxLength = Math.max(maxLength, right - left + 1);
    }
    
    return maxLength;
}
```
  </div>
</div>

#### Solution 3: Most Optimized (No While Loop)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public int characterReplacement(String s, int k) {
    int[] count = new int[26];
    int left = 0, maxFreq = 0;
    
    for (int right = 0; right < s.length(); right++) {
        char rightChar = s.charAt(right);
        count[rightChar - 'A']++;
        maxFreq = Math.max(maxFreq, count[rightChar - 'A']);
        
        // If window is invalid, shrink by one
        if (right - left + 1 - maxFreq > k) {
            char leftChar = s.charAt(left);
            count[leftChar - 'A']--;
            left++;
        }
    }
    
    return s.length() - left;
}
```
  </div>
  
  <div class="tab-content python">
```python
def characterReplacement(self, s: str, k: int) -> int:
    count = [0] * 26
    left = 0
    max_freq = 0
    
    for right in range(len(s)):
        right_char = s[right]
        count[ord(right_char) - ord('A')] += 1
        max_freq = max(max_freq, count[ord(right_char) - ord('A')])
        
        # If window is invalid, shrink by one
        if right - left + 1 - max_freq > k:
            left_char = s[left]
            count[ord(left_char) - ord('A')] -= 1
            left += 1
    
    return len(s) - left
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function characterReplacement(s, k) {
    const count = new Array(26).fill(0);
    let left = 0;
    let maxFreq = 0;
    
    for (let right = 0; right < s.length; right++) {
        const rightChar = s[right];
        count[rightChar.charCodeAt(0) - 'A'.charCodeAt(0)]++;
        maxFreq = Math.max(maxFreq, count[rightChar.charCodeAt(0) - 'A'.charCodeAt(0)]);
        
        // If window is invalid, shrink by one
        if (right - left + 1 - maxFreq > k) {
            const leftChar = s[left];
            count[leftChar.charCodeAt(0) - 'A'.charCodeAt(0)]--;
            left++;
        }
    }
    
    return s.length - left;
}
```
  </div>
</div>

### Complexity Analysis
- **Time Complexity**: O(n) for optimized solutions
- **Space Complexity**: O(1) using array, O(k) using HashMap where k is number of unique characters

### Key Insights & Patterns
1. **Sliding Window Validity**: Window size - max frequency ≤ k
2. **Frequency Optimization**: Don't need to recalculate max frequency when shrinking
3. **Greedy Choice**: Always keep the most frequent character in the window
4. **Window Size**: The answer is the maximum valid window size we've seen

### Common Pitfalls
1. **Frequency Recalculation**: Avoid expensive max frequency calculation in while loop
2. **Window Shrinking**: Understand that we only need to shrink, not find exact max frequency
3. **Character Mapping**: Use `char - 'A'` for array indexing
4. **K=0 Case**: When k=0, answer is length of longest sequence of same characters

### Follow-up Questions
1. What if we have lowercase letters as well?
2. How would you solve for any character replacement (not just same character)?
3. Can you extend this to find all valid windows of maximum length?

---

## 3. Minimum Window Substring

**🔗 LeetCode Link:** [Minimum Window Substring - LeetCode #76](https://leetcode.com/problems/minimum-window-substring/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What does it mean for a window to "contain" all characters from the target string?
2. How would you track whether your current window satisfies all the requirements?
3. Once you find a valid window, how can you try to make it smaller while keeping it valid?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding Window Validity
> **Guided Question:** When is a window "valid" - what exactly needs to be satisfied for it to contain all required characters?

<details>
<summary>💭 Think about it, then click to reveal</summary>

A window is valid when it contains at least the required count of each character from the target string. If target has "AAB", your window must have at least 2 A's and 1 B (it can have more). You need to track both required frequencies and current window frequencies.

</details>

#### Step 2: Two-Phase Sliding Window Strategy
> **Guided Question:** What should be your strategy for finding the minimum window - should you expand first or contract first?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Use a two-phase approach: First expand the right pointer until you have a valid window (contains all required characters), then contract the left pointer to minimize the window while maintaining validity. This ensures you find the smallest possible window.

</details>

#### Step 3: Efficient Validity Tracking
> **Guided Question:** Instead of checking all character frequencies every time, how can you efficiently track when a window becomes valid or invalid?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Use a "formed" counter that tracks how many distinct characters have met their required frequency. When a character's count reaches its requirement, increment "formed". When it drops below, decrement "formed". Window is valid when formed equals the number of distinct required characters.

</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Create frequency map for target string characters
- [ ] Initialize window frequency map and validity tracking
- [ ] Expand right pointer until window is valid
- [ ] Once valid, try contracting left pointer to minimize window
- [ ] Update minimum window when a smaller valid window is found
- [ ] Continue until right pointer reaches end

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why is the two-phase expand-then-contract approach optimal?
2. **Complexity Analysis:** What's the time complexity and why is each character visited at most twice?
3. **Trade-offs:** How does the "formed" counter optimization improve efficiency?
4. **Pattern Recognition:** How does this template matching pattern apply to other problems?

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

### Problem Statement
Given two strings `s` and `t`, return the minimum window substring of `s` such that every character in `t` (including duplicates) is included in the window. If there is no such window, return an empty string.

**Examples:**
```
Input: s = "ADOBECODEBANC", t = "ABC"
Output: "BANC"
Explanation: The minimum window substring "BANC" includes 'A', 'B', and 'C' from string t.

Input: s = "a", t = "a"
Output: "a"

Input: s = "a", t = "aa"
Output: ""
Explanation: Both 'a's from t must be included in the window.
```

### Knowledge Prerequisites
- Sliding window technique
- Hash maps for frequency counting
- String manipulation and substring operations
- Two pointers approach

### First Principles
This is a sliding window problem where we need to find the smallest window containing all characters from target string:
- **Window Expansion**: Expand right until window contains all required characters
- **Window Contraction**: Contract left while maintaining validity
- **Frequency Matching**: Track how many characters from target are satisfied
- **Minimum Tracking**: Keep track of the smallest valid window found

### Problem-First Approach

**Step 1: Understand the Problem**
- Find minimum substring of s that contains all characters of t
- Must include duplicates (if t has 2 'a's, window must have at least 2 'a's)
- Return empty string if no valid window exists

**Step 2: Key Insights**
- Use frequency maps to track required and current character counts
- Expand window until all characters are covered
- Contract window while maintaining coverage
- Track minimum window size and position

**Step 3: Algorithm Design**
1. Create frequency map for target string t
2. Use sliding window with two pointers
3. Expand right pointer until window is valid
4. Contract left pointer while maintaining validity
5. Update minimum window when valid window is found

### Multiple Java Solutions

#### Solution 1: Two HashMap Approach

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public String minWindow(String s, String t) {
    if (s.length() < t.length()) return "";
    
    Map<Character, Integer> required = new HashMap<>();
    Map<Character, Integer> windowCounts = new HashMap<>();
    
    // Build required frequency map
    for (char c : t.toCharArray()) {
        required.put(c, required.getOrDefault(c, 0) + 1);
    }
    
    int left = 0, formed = 0;
    int requiredSize = required.size();
    int minLen = Integer.MAX_VALUE, minLeft = 0;
    
    for (int right = 0; right < s.length(); right++) {
        char rightChar = s.charAt(right);
        windowCounts.put(rightChar, windowCounts.getOrDefault(rightChar, 0) + 1);
        
        // Check if current character's frequency matches requirement
        if (required.containsKey(rightChar) && 
            windowCounts.get(rightChar).intValue() == required.get(rightChar).intValue()) {
            formed++;
        }
        
        // Contract window if valid
        while (left <= right && formed == requiredSize) {
            if (right - left + 1 < minLen) {
                minLen = right - left + 1;
                minLeft = left;
            }
            
            char leftChar = s.charAt(left);
            windowCounts.put(leftChar, windowCounts.get(leftChar) - 1);
            if (required.containsKey(leftChar) && 
                windowCounts.get(leftChar) < required.get(leftChar)) {
                formed--;
            }
            left++;
        }
    }
    
    return minLen == Integer.MAX_VALUE ? "" : s.substring(minLeft, minLeft + minLen);
}
```
  </div>
  
  <div class="tab-content python">
```python
def minWindow(self, s: str, t: str) -> str:
    if len(s) < len(t):
        return ""
    
    required = {}
    window_counts = {}
    
    # Build required frequency map
    for c in t:
        required[c] = required.get(c, 0) + 1
    
    left = 0
    formed = 0
    required_size = len(required)
    min_len = float('inf')
    min_left = 0
    
    for right in range(len(s)):
        right_char = s[right]
        window_counts[right_char] = window_counts.get(right_char, 0) + 1
        
        # Check if current character's frequency matches requirement
        if right_char in required and window_counts[right_char] == required[right_char]:
            formed += 1
        
        # Contract window if valid
        while left <= right and formed == required_size:
            if right - left + 1 < min_len:
                min_len = right - left + 1
                min_left = left
            
            left_char = s[left]
            window_counts[left_char] -= 1
            if left_char in required and window_counts[left_char] < required[left_char]:
                formed -= 1
            left += 1
    
    return "" if min_len == float('inf') else s[min_left:min_left + min_len]
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function minWindow(s, t) {
    if (s.length < t.length) return "";
    
    const required = new Map();
    const windowCounts = new Map();
    
    // Build required frequency map
    for (const c of t) {
        required.set(c, (required.get(c) || 0) + 1);
    }
    
    let left = 0;
    let formed = 0;
    const requiredSize = required.size;
    let minLen = Infinity;
    let minLeft = 0;
    
    for (let right = 0; right < s.length; right++) {
        const rightChar = s[right];
        windowCounts.set(rightChar, (windowCounts.get(rightChar) || 0) + 1);
        
        // Check if current character's frequency matches requirement
        if (required.has(rightChar) && windowCounts.get(rightChar) === required.get(rightChar)) {
            formed++;
        }
        
        // Contract window if valid
        while (left <= right && formed === requiredSize) {
            if (right - left + 1 < minLen) {
                minLen = right - left + 1;
                minLeft = left;
            }
            
            const leftChar = s[left];
            windowCounts.set(leftChar, windowCounts.get(leftChar) - 1);
            if (required.has(leftChar) && windowCounts.get(leftChar) < required.get(leftChar)) {
                formed--;
            }
            left++;
        }
    }
    
    return minLen === Infinity ? "" : s.substring(minLeft, minLeft + minLen);
}
```
  </div>
</div>

#### Solution 2: Array-based (for ASCII characters)

<div class="code-tabs">
  <div class="tab-buttons">
    <button class="tab-btn active" data-lang="java">Java</button>
    <button class="tab-btn" data-lang="python">Python</button>
    <button class="tab-btn" data-lang="javascript">JavaScript</button>
  </div>
  
  <div class="tab-content java active">
```java
public String minWindow(String s, String t) {
    if (s.length() < t.length()) return "";
    
    int[] required = new int[128];
    int[] window = new int[128];
    int requiredChars = 0;
    
    // Build required frequency array
    for (char c : t.toCharArray()) {
        if (required[c] == 0) requiredChars++;
        required[c]++;
    }
    
    int left = 0, formed = 0;
    int minLen = Integer.MAX_VALUE, minLeft = 0;
    
    for (int right = 0; right < s.length(); right++) {
        char rightChar = s.charAt(right);
        window[rightChar]++;
        
        if (required[rightChar] > 0 && window[rightChar] == required[rightChar]) {
            formed++;
        }
        
        while (formed == requiredChars) {
            if (right - left + 1 < minLen) {
                minLen = right - left + 1;
                minLeft = left;
            }
            
            char leftChar = s.charAt(left);
            window[leftChar]--;
            if (required[leftChar] > 0 && window[leftChar] < required[leftChar]) {
                formed--;
            }
            left++;
        }
    }
    
    return minLen == Integer.MAX_VALUE ? "" : s.substring(minLeft, minLeft + minLen);
}
```
  </div>
  
  <div class="tab-content python">
```python
def minWindow(self, s: str, t: str) -> str:
    if len(s) < len(t):
        return ""
    
    required = [0] * 128
    window = [0] * 128
    required_chars = 0
    
    # Build required frequency array
    for c in t:
        if required[ord(c)] == 0:
            required_chars += 1
        required[ord(c)] += 1
    
    left = 0
    formed = 0
    min_len = float('inf')
    min_left = 0
    
    for right in range(len(s)):
        right_char = s[right]
        window[ord(right_char)] += 1
        
        if required[ord(right_char)] > 0 and window[ord(right_char)] == required[ord(right_char)]:
            formed += 1
        
        while formed == required_chars:
            if right - left + 1 < min_len:
                min_len = right - left + 1
                min_left = left
            
            left_char = s[left]
            window[ord(left_char)] -= 1
            if required[ord(left_char)] > 0 and window[ord(left_char)] < required[ord(left_char)]:
                formed -= 1
            left += 1
    
    return "" if min_len == float('inf') else s[min_left:min_left + min_len]
```
  </div>
  
  <div class="tab-content javascript">
```javascript
function minWindow(s, t) {
    if (s.length < t.length) return "";
    
    const required = new Array(128).fill(0);
    const window = new Array(128).fill(0);
    let requiredChars = 0;
    
    // Build required frequency array
    for (const c of t) {
        if (required[c.charCodeAt(0)] === 0) requiredChars++;
        required[c.charCodeAt(0)]++;
    }
    
    let left = 0;
    let formed = 0;
    let minLen = Infinity;
    let minLeft = 0;
    
    for (let right = 0; right < s.length; right++) {
        const rightChar = s[right];
        window[rightChar.charCodeAt(0)]++;
        
        if (required[rightChar.charCodeAt(0)] > 0 && 
            window[rightChar.charCodeAt(0)] === required[rightChar.charCodeAt(0)]) {
            formed++;
        }
        
        while (formed === requiredChars) {
            if (right - left + 1 < minLen) {
                minLen = right - left + 1;
                minLeft = left;
            }
            
            const leftChar = s[left];
            window[leftChar.charCodeAt(0)]--;
            if (required[leftChar.charCodeAt(0)] > 0 && 
                window[leftChar.charCodeAt(0)] < required[leftChar.charCodeAt(0)]) {
                formed--;
            }
            left++;
        }
    }
    
    return minLen === Infinity ? "" : s.substring(minLeft, minLeft + minLen);
}
```
  </div>
</div>

#### Solution 3: Optimized with Character Filtering
```java
public String minWindow(String s, String t) {
    if (s.length() < t.length()) return "";
    
    Map<Character, Integer> required = new HashMap<>();
    for (char c : t.toCharArray()) {
        required.put(c, required.getOrDefault(c, 0) + 1);
    }
    
    // Filter s to only include characters in t
    List<int[]> filteredS = new ArrayList<>();
    for (int i = 0; i < s.length(); i++) {
        char c = s.charAt(i);
        if (required.containsKey(c)) {
            filteredS.add(new int[]{(int) c, i});
        }
    }
    
    int left = 0, formed = 0;
    Map<Character, Integer> windowCounts = new HashMap<>();
    int minLen = Integer.MAX_VALUE, minLeft = 0;
    
    for (int right = 0; right < filteredS.size(); right++) {
        char rightChar = (char) filteredS.get(right)[0];
        windowCounts.put(rightChar, windowCounts.getOrDefault(rightChar, 0) + 1);
        
        if (windowCounts.get(rightChar).intValue() == required.get(rightChar).intValue()) {
            formed++;
        }
        
        while (left <= right && formed == required.size()) {
            int rightIndex = filteredS.get(right)[1];
            int leftIndex = filteredS.get(left)[1];
            
            if (rightIndex - leftIndex + 1 < minLen) {
                minLen = rightIndex - leftIndex + 1;
                minLeft = leftIndex;
            }
            
            char leftChar = (char) filteredS.get(left)[0];
            windowCounts.put(leftChar, windowCounts.get(leftChar) - 1);
            if (windowCounts.get(leftChar) < required.get(leftChar)) {
                formed--;
            }
            left++;
        }
    }
    
    return minLen == Integer.MAX_VALUE ? "" : s.substring(minLeft, minLeft + minLen);
}
```

### Complexity Analysis
- **Time Complexity**: O(|s| + |t|) where |s| and |t| are lengths of strings
- **Space Complexity**: O(|s| + |t|) for hash maps
- **Optimized filtering**: O(|s| + |t|) time, but only processes relevant characters

### Key Insights & Patterns
1. **Frequency Matching**: Track both required and current frequencies
2. **Valid Window**: When all characters from t are satisfied in current window
3. **Two-Phase**: Expand to find valid window, then contract to minimize
4. **Formed Counter**: Efficient way to check if all requirements are met

### Common Pitfalls
1. **Duplicate Characters**: Must handle multiple occurrences correctly
2. **Window Validity**: Check exact frequency matches, not just presence
3. **Substring Extraction**: Use correct indices for final result
4. **Edge Cases**: Empty strings, t longer than s, no valid window

### Follow-up Questions
1. What if we need to find all minimum windows?
2. How would you modify for case-insensitive matching?
3. Can you solve this with a fixed-size sliding window?

---

## 4. Valid Anagram

**🔗 LeetCode Link:** [Valid Anagram - LeetCode #242](https://leetcode.com/problems/valid-anagram/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What mathematical property must be true about two strings for them to be anagrams?
2. What's the fastest way to check if two strings have the same character frequencies?
3. Are there any shortcuts you can take before doing a full character-by-character comparison?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding Anagram Properties
> **Guided Question:** What fundamental characteristics must two anagrammatic strings share?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Two strings are anagrams if and only if they contain exactly the same characters with exactly the same frequencies. This means they must also have the same length - if lengths differ, they can't be anagrams. This gives us a quick early exit condition.

</details>

#### Step 2: Naive Approach - Sorting
> **Guided Question:** What's the most straightforward way to check if two strings have the same characters with the same frequencies?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Sort both strings and compare them! If they're anagrams, sorted versions will be identical. This is simple to implement: convert to char arrays, sort both, and compare. Time complexity is O(n log n) due to sorting.

</details>

#### Step 3: Optimization - Frequency Counting
> **Guided Question:** Can you verify anagrams in linear time without sorting?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Yes! Count character frequencies in both strings and compare. You can do this in one pass: increment count for characters in first string, decrement for characters in second string. If all counts are zero at the end, they're anagrams. This achieves O(n) time complexity with O(1) space for fixed character sets.

</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Check if string lengths are equal (early exit if not)
- [ ] Create frequency counting structure (array for ASCII or HashMap for Unicode)
- [ ] Count frequencies of first string (increment)
- [ ] Count frequencies of second string (decrement)
- [ ] Check if all frequencies are zero

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does the increment/decrement counting approach work?
2. **Complexity Analysis:** What's the time and space complexity of each approach?
3. **Trade-offs:** When would you choose sorting vs frequency counting?
4. **Pattern Recognition:** How does this frequency comparison technique apply to other problems?

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

### Problem Statement
Given two strings `s` and `t`, return `true` if `t` is an anagram of `s`, and `false` otherwise. An anagram is a word formed by rearranging the letters of another word, using all letters exactly once.

**Examples:**
```
Input: s = "anagram", t = "nagaram"
Output: true

Input: s = "rat", t = "car"
Output: false
```

### Knowledge Prerequisites
- String manipulation
- Hash maps for frequency counting
- Sorting algorithms
- Character arrays and ASCII values

### First Principles
An anagram means both strings contain exactly the same characters with the same frequencies:
- **Character Frequency**: Both strings must have identical character counts
- **Length Check**: Anagrams must have the same length
- **Efficiency**: Can be solved with O(n) time using frequency counting or O(n log n) using sorting

### Problem-First Approach

**Step 1: Understand the Problem**
- Two strings are anagrams if one can be rearranged to form the other
- Must use all characters exactly once
- Case sensitive (unless specified otherwise)

**Step 2: Key Insights**
- Same length is necessary but not sufficient
- Character frequencies must match exactly
- Can use sorting or frequency counting

**Step 3: Algorithm Options**
1. Sort both strings and compare
2. Count character frequencies and compare
3. Use array for ASCII characters or HashMap for Unicode

### Multiple Java Solutions

#### Solution 1: Sorting Approach
```java
public boolean isAnagram(String s, String t) {
    if (s.length() != t.length()) {
        return false;
    }
    
    char[] sChars = s.toCharArray();
    char[] tChars = t.toCharArray();
    
    Arrays.sort(sChars);
    Arrays.sort(tChars);
    
    return Arrays.equals(sChars, tChars);
}
```

#### Solution 2: HashMap Frequency Counting
```java
public boolean isAnagram(String s, String t) {
    if (s.length() != t.length()) {
        return false;
    }
    
    Map<Character, Integer> charCount = new HashMap<>();
    
    // Count characters in s
    for (char c : s.toCharArray()) {
        charCount.put(c, charCount.getOrDefault(c, 0) + 1);
    }
    
    // Subtract characters in t
    for (char c : t.toCharArray()) {
        if (!charCount.containsKey(c)) {
            return false;
        }
        charCount.put(c, charCount.get(c) - 1);
        if (charCount.get(c) == 0) {
            charCount.remove(c);
        }
    }
    
    return charCount.isEmpty();
}
```

#### Solution 3: Array Frequency Counting (ASCII only)
```java
public boolean isAnagram(String s, String t) {
    if (s.length() != t.length()) {
        return false;
    }
    
    int[] charCount = new int[26]; // For lowercase English letters
    
    for (int i = 0; i < s.length(); i++) {
        charCount[s.charAt(i) - 'a']++;
        charCount[t.charAt(i) - 'a']--;
    }
    
    for (int count : charCount) {
        if (count != 0) {
            return false;
        }
    }
    
    return true;
}
```

#### Solution 4: Two-Pass Array Counting
```java
public boolean isAnagram(String s, String t) {
    if (s.length() != t.length()) {
        return false;
    }
    
    int[] count = new int[26];
    
    // Count characters in s
    for (char c : s.toCharArray()) {
        count[c - 'a']++;
    }
    
    // Subtract characters in t
    for (char c : t.toCharArray()) {
        count[c - 'a']--;
        if (count[c - 'a'] < 0) {
            return false; // Early termination
        }
    }
    
    return true; // All counts should be zero
}
```

### Complexity Analysis
- **Sorting Approach**: Time O(n log n), Space O(1) if in-place sorting
- **HashMap Approach**: Time O(n), Space O(1) for fixed charset
- **Array Approach**: Time O(n), Space O(1)

### Key Insights & Patterns
1. **Length Check First**: Quick elimination for non-anagrams
2. **Frequency Invariant**: Character frequencies must be identical
3. **Early Termination**: Can return false as soon as mismatch found
4. **Space-Time Tradeoff**: O(n log n) time with O(1) space vs O(n) time with O(k) space

### Common Pitfalls
1. **Case Sensitivity**: Clarify if comparison is case-sensitive
2. **Unicode Handling**: Array approach only works for limited character sets
3. **Empty Strings**: Both empty strings are anagrams
4. **Length Mismatch**: Must check lengths first

### Follow-up Questions
1. What if the strings contain Unicode characters?
2. How would you handle case-insensitive anagrams?
3. Can you solve this with O(1) extra space if modification of input is allowed?
4. How would you find all anagrams of a string in a list of strings?

---

## 5. Group Anagrams

**🔗 LeetCode Link:** [Group Anagrams - LeetCode #49](https://leetcode.com/problems/group-anagrams/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. How can you identify which strings should be grouped together?
2. What would be a good "key" to represent a group of anagrams?
3. What data structure would efficiently allow you to group strings by their anagram key?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Finding a Canonical Form
> **Guided Question:** What could serve as a unique identifier that would be the same for all anagrams in a group?

<details>
<summary>💭 Think about it, then click to reveal</summary>

All anagrams will have the same characters in the same frequencies. So if you create a "canonical form" - like sorting the characters or creating a frequency signature - all anagrams will map to the same canonical form. This becomes your grouping key!

</details>

#### Step 2: Choosing the Right Canonical Form
> **Guided Question:** What are the different ways to create a canonical form, and what are the trade-offs?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Two main approaches: 1) Sort the characters (simple but O(k log k) per string), or 2) Create a frequency signature like "a2b1c1" (O(k) per string but more complex). Sorting is easier to implement and works for any character set, while frequency counting is faster but requires careful key construction.

</details>

#### Step 3: HashMap Grouping Strategy
> **Guided Question:** Once you have a canonical form for each string, how do you efficiently group them?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Use a HashMap where the key is the canonical form and the value is a list of strings that share that form. Iterate through each string, compute its canonical form, and add it to the appropriate group in the HashMap. Finally, return all the groups as a list of lists.

</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Create a HashMap to store groups (canonical form → list of strings)
- [ ] For each string, compute its canonical form (sorting or frequency signature)
- [ ] Add the string to the appropriate group in the HashMap
- [ ] Convert HashMap values to a list of lists and return

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does the canonical form approach work for grouping anagrams?
2. **Complexity Analysis:** What's the overall time complexity when using sorting vs frequency counting?
3. **Trade-offs:** What are the pros and cons of different canonical form strategies?
4. **Pattern Recognition:** How does this grouping pattern apply to other problems?

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

### Problem Statement
Given an array of strings `strs`, group the anagrams together. You can return the answer in any order.

**Examples:**
```
Input: strs = ["eat","tea","tan","ate","nat","bat"]
Output: [["bat"],["nat","tan"],["ate","eat","tea"]]

Input: strs = [""]
Output: [[""]]

Input: strs = ["a"]
Output: [["a"]]
```

### Knowledge Prerequisites
- Hash maps for grouping
- String sorting or frequency counting
- Understanding of anagram properties
- Collection manipulation in Java

### First Principles
Anagrams have the same characters with the same frequencies, so they can be grouped using a common key:
- **Canonical Form**: Create a unique representation for each anagram group
- **Grouping Strategy**: Use HashMap where key is canonical form, value is list of anagrams
- **Key Generation**: Sort characters or create frequency signature

### Problem-First Approach

**Step 1: Understand the Problem**
- Group strings that are anagrams of each other
- Anagrams contain the same characters with same frequencies
- Return groups as lists within a list

**Step 2: Key Insights**
- Need a way to identify anagrams (canonical form)
- Use HashMap to group strings with same canonical form
- Two main approaches: sorting or frequency counting

**Step 3: Algorithm Design**
1. For each string, generate a canonical key
2. Use HashMap to group strings by their keys
3. Return all groups as a list of lists

### Multiple Java Solutions

#### Solution 1: Sorting-based Grouping
```java
public List<List<String>> groupAnagrams(String[] strs) {
    Map<String, List<String>> groups = new HashMap<>();
    
    for (String str : strs) {
        // Create canonical form by sorting characters
        char[] chars = str.toCharArray();
        Arrays.sort(chars);
        String key = new String(chars);
        
        // Group by canonical form
        groups.computeIfAbsent(key, k -> new ArrayList<>()).add(str);
    }
    
    return new ArrayList<>(groups.values());
}
```

#### Solution 2: Frequency Counting with Prime Numbers
```java
public List<List<String>> groupAnagrams(String[] strs) {
    // Prime numbers for each letter (a-z)
    int[] primes = {2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 
                   43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101};
    
    Map<Long, List<String>> groups = new HashMap<>();
    
    for (String str : strs) {
        long key = 1;
        for (char c : str.toCharArray()) {
            key *= primes[c - 'a'];
        }
        
        groups.computeIfAbsent(key, k -> new ArrayList<>()).add(str);
    }
    
    return new ArrayList<>(groups.values());
}
```

#### Solution 3: Character Count Array as Key
```java
public List<List<String>> groupAnagrams(String[] strs) {
    Map<String, List<String>> groups = new HashMap<>();
    
    for (String str : strs) {
        // Create frequency signature
        int[] count = new int[26];
        for (char c : str.toCharArray()) {
            count[c - 'a']++;
        }
        
        // Convert count array to string key
        StringBuilder keyBuilder = new StringBuilder();
        for (int i = 0; i < 26; i++) {
            keyBuilder.append('#');
            keyBuilder.append(count[i]);
        }
        String key = keyBuilder.toString();
        
        groups.computeIfAbsent(key, k -> new ArrayList<>()).add(str);
    }
    
    return new ArrayList<>(groups.values());
}
```

#### Solution 4: Optimized Character Count Key
```java
public List<List<String>> groupAnagrams(String[] strs) {
    Map<String, List<String>> groups = new HashMap<>();
    
    for (String str : strs) {
        String key = getFrequencyKey(str);
        groups.computeIfAbsent(key, k -> new ArrayList<>()).add(str);
    }
    
    return new ArrayList<>(groups.values());
}

private String getFrequencyKey(String str) {
    int[] count = new int[26];
    for (char c : str.toCharArray()) {
        count[c - 'a']++;
    }
    
    StringBuilder key = new StringBuilder();
    for (int i = 0; i < 26; i++) {
        if (count[i] > 0) {
            key.append((char) ('a' + i)).append(count[i]);
        }
    }
    return key.toString();
}
```

### Complexity Analysis
- **Sorting Approach**: Time O(n * k log k), Space O(n * k) where n is number of strings, k is max string length
- **Prime Product**: Time O(n * k), Space O(n * k), but risk of overflow for long strings
- **Frequency Count**: Time O(n * k), Space O(n * k)

### Key Insights & Patterns
1. **Canonical Form**: Create unique identifier for anagram groups
2. **HashMap Grouping**: Use map where key identifies group, value stores members
3. **Key Selection**: Choose between sorting (simple) vs frequency counting (faster)
4. **Prime Product**: Elegant but has overflow limitations

### Common Pitfalls
1. **Overflow with Primes**: Large strings can cause integer overflow
2. **Key Uniqueness**: Ensure frequency keys are unambiguous
3. **Empty Strings**: Handle empty string case correctly
4. **Memory Usage**: Be mindful of space complexity for large inputs

### Follow-up Questions
1. How would you handle Unicode characters?
2. What if memory is limited and you need to process strings in batches?
3. How would you find the largest anagram group?
4. Can you solve this without using extra space for keys?

---

## 6. Valid Parentheses

**🔗 LeetCode Link:** [Valid Parentheses - LeetCode #20](https://leetcode.com/problems/valid-parentheses/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What makes a sequence of brackets "valid" - what rules must be followed?
2. When you encounter a closing bracket, what do you need to check?
3. What data structure naturally handles "most recent" items in a Last-In-First-Out manner?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding the Validation Rules
> **Guided Question:** What exactly makes a bracket sequence valid or invalid? Think about the order and matching requirements.

<details>
<summary>💭 Think about it, then click to reveal</summary>

A valid sequence requires: 1) Every opening bracket has a matching closing bracket of the same type, 2) Brackets are closed in the correct order (most recent opening bracket should be closed first), and 3) No closing bracket appears without a corresponding opening bracket. This creates a nested structure where brackets must be properly paired.

</details>

#### Step 2: Recognizing the LIFO Pattern
> **Guided Question:** When you encounter a closing bracket like ')', which opening bracket should it match with?

<details>
<summary>💭 Think about it, then click to reveal</summary>

It should match with the most recently encountered unmatched opening bracket. This is a classic Last-In-First-Out (LIFO) pattern - the last opening bracket we saw should be the first one to be closed. A stack data structure naturally implements LIFO behavior, making it perfect for tracking opening brackets.

</details>

#### Step 3: Stack-Based Algorithm Design
> **Guided Question:** How would you use a stack to track and validate the bracket matching process?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Push opening brackets onto a stack. When you encounter a closing bracket, check if the stack is empty (invalid) or if the top of the stack matches the closing bracket type. If it matches, pop the stack; if not, the sequence is invalid. At the end, the stack should be empty for a valid sequence. This elegantly handles both the matching and ordering requirements.

</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Initialize a stack to track opening brackets
- [ ] Iterate through each character in the string
- [ ] Push opening brackets onto the stack
- [ ] For closing brackets, check if stack is empty or top doesn't match
- [ ] Return true only if stack is empty at the end

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does the stack approach naturally handle the "most recent first" requirement?
2. **Complexity Analysis:** What's the time and space complexity, and why is this optimal?
3. **Trade-offs:** Could you solve this without a stack, and what would be the drawbacks?
4. **Pattern Recognition:** What other problems involve nested structures that could use similar stack-based approaches?

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

### Problem Statement
Given a string `s` containing just the characters `'('`, `')'`, `'{'`, `'}'`, `'['` and `']'`, determine if the input string is valid. An input string is valid if:
1. Open brackets must be closed by the same type of brackets
2. Open brackets must be closed in the correct order
3. Every close bracket has a corresponding open bracket of the same type

**Examples:**
```
Input: s = "()"
Output: true

Input: s = "()[]{}"
Output: true

Input: s = "(]"
Output: false

Input: s = "([)]"
Output: false

Input: s = "{[]}"
Output: true
```

### Knowledge Prerequisites
- Stack data structure (LIFO - Last In, First Out)
- String character iteration
- HashMap for character mapping
- Understanding of bracket matching rules

### First Principles
The problem requires checking proper nesting and matching of brackets:
- **LIFO Nature**: Most recent open bracket should be closed first
- **Stack Property**: Perfect data structure for nested structures
- **Matching Pairs**: Each opening bracket must match corresponding closing bracket
- **Order Validation**: Brackets must be closed in reverse order of opening

### Problem-First Approach

**Step 1: Understand the Problem**
- Valid means properly nested and matched brackets
- Each opening bracket needs corresponding closing bracket
- Order matters: `([)]` is invalid because brackets cross each other

**Step 2: Key Insights**
- Use stack to track opening brackets
- When encountering closing bracket, check if it matches top of stack
- String is valid if stack is empty at the end

**Step 3: Algorithm Design**
1. Iterate through each character
2. Push opening brackets onto stack
3. For closing brackets, check if they match stack top
4. Return true if stack is empty at end

### Multiple Java Solutions

#### Solution 1: Stack with HashMap
```java
public boolean isValid(String s) {
    Stack<Character> stack = new Stack<>();
    Map<Character, Character> mapping = new HashMap<>();
    mapping.put(')', '(');
    mapping.put('}', '{');
    mapping.put(']', '[');
    
    for (char c : s.toCharArray()) {
        if (mapping.containsKey(c)) {
            // Closing bracket
            if (stack.isEmpty() || stack.pop() != mapping.get(c)) {
                return false;
            }
        } else {
            // Opening bracket
            stack.push(c);
        }
    }
    
    return stack.isEmpty();
}
```

#### Solution 2: Stack with Direct Character Checks
```java
public boolean isValid(String s) {
    Stack<Character> stack = new Stack<>();
    
    for (char c : s.toCharArray()) {
        if (c == '(' || c == '{' || c == '[') {
            stack.push(c);
        } else if (c == ')' || c == '}' || c == ']') {
            if (stack.isEmpty()) {
                return false;
            }
            
            char top = stack.pop();
            if ((c == ')' && top != '(') ||
                (c == '}' && top != '{') ||
                (c == ']' && top != '[')) {
                return false;
            }
        }
    }
    
    return stack.isEmpty();
}
```

#### Solution 3: Optimized with Early Return
```java
public boolean isValid(String s) {
    if (s.length() % 2 == 1) {
        return false; // Odd length cannot be valid
    }
    
    Stack<Character> stack = new Stack<>();
    
    for (char c : s.toCharArray()) {
        switch (c) {
            case '(':
            case '{':
            case '[':
                stack.push(c);
                break;
            case ')':
                if (stack.isEmpty() || stack.pop() != '(') return false;
                break;
            case '}':
                if (stack.isEmpty() || stack.pop() != '{') return false;
                break;
            case ']':
                if (stack.isEmpty() || stack.pop() != '[') return false;
                break;
        }
    }
    
    return stack.isEmpty();
}
```

#### Solution 4: Using StringBuilder (Memory Efficient)
```java
public boolean isValid(String s) {
    if (s.length() % 2 == 1) return false;
    
    StringBuilder stack = new StringBuilder();
    
    for (char c : s.toCharArray()) {
        if (c == '(' || c == '{' || c == '[') {
            stack.append(c);
        } else {
            if (stack.length() == 0) return false;
            
            char last = stack.charAt(stack.length() - 1);
            if ((c == ')' && last == '(') ||
                (c == '}' && last == '{') ||
                (c == ']' && last == '[')) {
                stack.deleteCharAt(stack.length() - 1);
            } else {
                return false;
            }
        }
    }
    
    return stack.length() == 0;
}
```

### Complexity Analysis
- **Time Complexity**: O(n) where n is the length of string
- **Space Complexity**: O(n) in worst case when all characters are opening brackets

### Key Insights & Patterns
1. **Stack for Nesting**: Perfect data structure for nested bracket problems
2. **Early Termination**: Check for impossible cases (odd length, empty stack on closing)
3. **Character Mapping**: Use HashMap for clean closing-to-opening mapping
4. **LIFO Validation**: Most recent opening bracket must be closed first

### Common Pitfalls
1. **Empty Stack**: Check if stack is empty before popping
2. **Odd Length**: Strings with odd length cannot be valid
3. **Final Check**: Must verify stack is empty at the end
4. **Character Types**: Only consider valid bracket characters

### Follow-up Questions
1. What if the string contains other characters besides brackets?
2. How would you modify this to return the position of the first invalid bracket?
3. Can you solve this without using extra space?
4. How would you handle nested structures with different bracket types having different priorities?

---

## 7. Valid Palindrome

**🔗 LeetCode Link:** [Valid Palindrome - LeetCode #125](https://leetcode.com/problems/valid-palindrome/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What characters should you ignore when checking if a phrase is a palindrome?
2. How can you efficiently compare characters from both ends of a string without creating a new string?
3. What would happen if you cleaned the string first versus checking character validity on-the-fly?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding Palindrome Requirements
> **Guided Question:** What preprocessing is needed to check if "A man, a plan, a canal: Panama" is a palindrome?

<details>
<summary>💭 Think about it, then click to reveal</summary>

You need to ignore case differences and non-alphanumeric characters. After removing spaces, punctuation, and converting to lowercase, "A man, a plan, a canal: Panama" becomes "amanaplanacanalpanama", which reads the same forwards and backwards. The key insight is that only letters and digits matter for the comparison.

</details>

#### Step 2: Two Approaches - Clean vs. Skip
> **Guided Question:** Should you create a cleaned string first, or process characters on-the-fly? What are the trade-offs?

<details>
<summary>💭 Think about it, then click to reveal</summary>

You can either: 1) Create a cleaned string first (easy to understand, uses O(n) extra space), or 2) Use two pointers and skip invalid characters on-the-fly (more complex logic, but O(1) space). The two-pointer approach is more efficient as it avoids creating a new string and handles the validation in a single pass.

</details>

#### Step 3: Two-Pointer Technique with Character Skipping
> **Guided Question:** How would you implement the two-pointer approach while handling character validation and case insensitivity?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Use left and right pointers starting from both ends. Skip non-alphanumeric characters by advancing the appropriate pointer. When both pointers point to valid characters, compare them in a case-insensitive manner. If they don't match, it's not a palindrome. Continue until pointers meet or cross. This elegantly handles both the character filtering and palindrome checking in one pass.

</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Initialize left and right pointers at string ends
- [ ] Skip non-alphanumeric characters from both sides
- [ ] Compare characters in case-insensitive manner
- [ ] Return false immediately on mismatch
- [ ] Return true when pointers meet/cross

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why is the two-pointer approach more space-efficient than preprocessing?
2. **Complexity Analysis:** What's the time complexity, and why do we only visit each character at most twice?
3. **Trade-offs:** When might the preprocessing approach be preferable despite using more space?
4. **Pattern Recognition:** How does this two-pointer technique apply to other string comparison problems?

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

### Problem Statement
A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Given a string `s`, return `true` if it is a palindrome, or `false` otherwise.

**Examples:**
```
Input: s = "A man, a plan, a canal: Panama"
Output: true
Explanation: "amanaplanacanalpanama" is a palindrome.

Input: s = "race a car"
Output: false
Explanation: "raceacar" is not a palindrome.

Input: s = " "
Output: true
Explanation: After removing non-alphanumeric characters, s becomes an empty string "" which is a palindrome.
```

### Knowledge Prerequisites
- Two pointers technique
- String character manipulation
- ASCII character classification
- Character case conversion

### First Principles
A palindrome reads the same forwards and backwards. For this problem:
- **Preprocessing**: Convert to lowercase and keep only alphanumeric characters
- **Two Pointers**: Compare characters from both ends moving inward
- **Character Classification**: Identify alphanumeric characters
- **Symmetry Check**: Characters at mirrored positions must match

### Problem-First Approach

**Step 1: Understand the Problem**
- Ignore case differences and non-alphanumeric characters
- Check if the cleaned string reads the same forwards and backwards
- Empty string and single character are palindromes

**Step 2: Key Insights**
- Can preprocess string or check on-the-fly
- Two pointers approach avoids creating new string
- Character comparison can be done with case-insensitive methods

**Step 3: Algorithm Design**
1. Use two pointers from start and end
2. Skip non-alphanumeric characters
3. Compare characters in case-insensitive manner
4. Return false if any mismatch, true if all match

### Multiple Java Solutions

#### Solution 1: Preprocessing with StringBuilder
```java
public boolean isPalindrome(String s) {
    StringBuilder cleaned = new StringBuilder();
    
    // Clean the string
    for (char c : s.toCharArray()) {
        if (Character.isAlphabetic(c) || Character.isDigit(c)) {
            cleaned.append(Character.toLowerCase(c));
        }
    }
    
    // Check palindrome using two pointers
    String cleanStr = cleaned.toString();
    int left = 0, right = cleanStr.length() - 1;
    
    while (left < right) {
        if (cleanStr.charAt(left) != cleanStr.charAt(right)) {
            return false;
        }
        left++;
        right--;
    }
    
    return true;
}
```

#### Solution 2: Two Pointers without Preprocessing
```java
public boolean isPalindrome(String s) {
    int left = 0, right = s.length() - 1;
    
    while (left < right) {
        // Skip non-alphanumeric characters from left
        while (left < right && !isAlphanumeric(s.charAt(left))) {
            left++;
        }
        
        // Skip non-alphanumeric characters from right
        while (left < right && !isAlphanumeric(s.charAt(right))) {
            right--;
        }
        
        // Compare characters (case-insensitive)
        if (Character.toLowerCase(s.charAt(left)) != 
            Character.toLowerCase(s.charAt(right))) {
            return false;
        }
        
        left++;
        right--;
    }
    
    return true;
}

private boolean isAlphanumeric(char c) {
    return Character.isLetterOrDigit(c);
}
```

#### Solution 3: Optimized with ASCII Value Checks
```java
public boolean isPalindrome(String s) {
    int left = 0, right = s.length() - 1;
    
    while (left < right) {
        char leftChar = s.charAt(left);
        char rightChar = s.charAt(right);
        
        if (!isAlphanumeric(leftChar)) {
            left++;
        } else if (!isAlphanumeric(rightChar)) {
            right--;
        } else {
            if (toLowerCase(leftChar) != toLowerCase(rightChar)) {
                return false;
            }
            left++;
            right--;
        }
    }
    
    return true;
}

private boolean isAlphanumeric(char c) {
    return (c >= 'a' && c <= 'z') || 
           (c >= 'A' && c <= 'Z') || 
           (c >= '0' && c <= '9');
}

private char toLowerCase(char c) {
    if (c >= 'A' && c <= 'Z') {
        return (char) (c + 32);
    }
    return c;
}
```

#### Solution 4: Single Pass with Character Normalization
```java
public boolean isPalindrome(String s) {
    int left = 0, right = s.length() - 1;
    
    while (left < right) {
        while (left < right && !Character.isLetterOrDigit(s.charAt(left))) {
            left++;
        }
        while (left < right && !Character.isLetterOrDigit(s.charAt(right))) {
            right--;
        }
        
        if (normalize(s.charAt(left)) != normalize(s.charAt(right))) {
            return false;
        }
        
        left++;
        right--;
    }
    
    return true;
}

private char normalize(char c) {
    if (c >= 'A' && c <= 'Z') {
        return (char) (c - 'A' + 'a');
    }
    return c;
}
```

### Complexity Analysis
- **Time Complexity**: O(n) where n is the length of the string
- **Space Complexity**: 
  - With preprocessing: O(n) for cleaned string
  - Two pointers: O(1) constant space

### Key Insights & Patterns
1. **Two Pointers**: Efficient for palindrome checking without extra space
2. **Character Skipping**: Skip non-alphanumeric characters on-the-fly
3. **Case Normalization**: Handle case-insensitive comparison
4. **Early Termination**: Return false immediately on first mismatch

### Common Pitfalls
1. **Character Classification**: Properly identify alphanumeric characters
2. **Case Sensitivity**: Remember to compare in case-insensitive manner
3. **Empty String**: Handle edge case of empty or whitespace-only strings
4. **Unicode**: Be careful with non-ASCII characters if they need to be supported

### Follow-up Questions
1. What if we need to consider accented characters as their base characters?
2. How would you modify this to find the longest palindromic substring?
3. Can you solve this recursively?
4. How would you handle Unicode normalization?

---

## 8. Longest Palindromic Substring

**🔗 LeetCode Link:** [Longest Palindromic Substring - LeetCode #5](https://leetcode.com/problems/longest-palindromic-substring/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What are the different "centers" around which a palindrome can be formed?
2. How would you find all possible palindromes versus just checking if a specific substring is a palindrome?
3. What's the key insight about how palindromes grow from their centers?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding Palindrome Centers
> **Guided Question:** Where can the "center" of a palindrome be located, and why does this matter for finding all palindromes?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Palindromes can have two types of centers: 1) A single character (for odd-length palindromes like "aba"), or 2) Between two characters (for even-length palindromes like "abba"). This means for a string of length n, there are 2n-1 possible centers to check. Understanding this is crucial because every palindrome grows symmetrically around its center.

</details>

#### Step 2: Expand Around Centers Strategy
> **Guided Question:** Instead of checking every possible substring, how can you use the center-expansion property to find palindromes more efficiently?

<details>
<summary>💭 Think about it, then click to reveal</summary>

For each possible center, expand outward while characters match. Start with the center and expand left and right pointers as long as the characters are equal. This gives you the longest palindrome centered at that position. By checking all centers, you find all palindromes in O(n²) time instead of O(n³) for the brute force approach.

</details>

#### Step 3: Tracking the Longest Palindrome
> **Guided Question:** As you expand around each center, how do you efficiently track and extract the longest palindrome found so far?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Keep track of the start position and maximum length found so far. When you find a longer palindrome, update both values. The key insight for calculating the start position: if a palindrome has length `len` and center at position `i`, the start position is `i - (len-1)/2`. This formula works for both odd and even length palindromes.

</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Iterate through each possible center position
- [ ] For each center, check both odd-length and even-length palindromes
- [ ] Expand around center while characters match
- [ ] Track the start position and length of the longest palindrome
- [ ] Return the substring using the tracked start and length

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why do you need to check both odd and even center types for each position?
2. **Complexity Analysis:** How does center expansion achieve O(n²) time instead of O(n³)?
3. **Trade-offs:** What are the space complexity differences between center expansion and dynamic programming approaches?
4. **Pattern Recognition:** How does this center expansion technique apply to counting palindromes or other palindrome problems?

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

### Problem Statement
Given a string `s`, return the longest palindromic substring in `s`.

**Examples:**
```
Input: s = "babad"
Output: "bab"
Note: "aba" is also a valid answer.

Input: s = "cbbd"
Output: "bb"
```

### Knowledge Prerequisites
- String manipulation and substring operations
- Understanding of palindrome properties
- Dynamic programming concepts
- Two pointers technique
- Center expansion technique

### First Principles
A palindrome reads the same forwards and backwards. To find the longest:
- **Brute Force**: Check all possible substrings
- **Center Expansion**: Expand around each possible center
- **Dynamic Programming**: Build solution using smaller palindromes
- **Manacher's Algorithm**: Linear time specialized algorithm

### Problem-First Approach

**Step 1: Understand the Problem**
- Find the longest contiguous substring that is a palindrome
- If multiple exist with same length, any one is acceptable
- Single characters are palindromes by definition

**Step 2: Key Insights**
- Palindromes have centers (either character or between characters)
- Can expand around centers to find longest palindrome
- Dynamic programming can optimize by reusing palindrome information
- Need to handle both odd and even length palindromes

**Step 3: Algorithm Options**
1. Brute force: Check all substrings O(n³)
2. Center expansion: Expand around each center O(n²)
3. Dynamic programming: Build table O(n²)
4. Manacher's algorithm: Linear time O(n)

### Multiple Java Solutions

#### Solution 1: Brute Force
```java
public String longestPalindrome(String s) {
    if (s == null || s.length() < 2) return s;
    
    String longest = "";
    
    for (int i = 0; i < s.length(); i++) {
        for (int j = i; j < s.length(); j++) {
            String substring = s.substring(i, j + 1);
            if (isPalindrome(substring) && substring.length() > longest.length()) {
                longest = substring;
            }
        }
    }
    
    return longest;
}

private boolean isPalindrome(String str) {
    int left = 0, right = str.length() - 1;
    while (left < right) {
        if (str.charAt(left) != str.charAt(right)) {
            return false;
        }
        left++;
        right--;
    }
    return true;
}
```

#### Solution 2: Center Expansion (Optimal)
```java
public String longestPalindrome(String s) {
    if (s == null || s.length() < 2) return s;
    
    int start = 0, maxLen = 1;
    
    for (int i = 0; i < s.length(); i++) {
        // Check for odd length palindromes (center at i)
        int len1 = expandAroundCenter(s, i, i);
        // Check for even length palindromes (center between i and i+1)
        int len2 = expandAroundCenter(s, i, i + 1);
        
        int currentMax = Math.max(len1, len2);
        if (currentMax > maxLen) {
            maxLen = currentMax;
            start = i - (currentMax - 1) / 2;
        }
    }
    
    return s.substring(start, start + maxLen);
}

private int expandAroundCenter(String s, int left, int right) {
    while (left >= 0 && right < s.length() && s.charAt(left) == s.charAt(right)) {
        left--;
        right++;
    }
    return right - left - 1; // Length of palindrome
}
```

#### Solution 3: Dynamic Programming
```java
public String longestPalindrome(String s) {
    if (s == null || s.length() < 2) return s;
    
    int n = s.length();
    boolean[][] dp = new boolean[n][n];
    int start = 0, maxLen = 1;
    
    // All single characters are palindromes
    for (int i = 0; i < n; i++) {
        dp[i][i] = true;
    }
    
    // Check for 2-character palindromes
    for (int i = 0; i < n - 1; i++) {
        if (s.charAt(i) == s.charAt(i + 1)) {
            dp[i][i + 1] = true;
            start = i;
            maxLen = 2;
        }
    }
    
    // Check for palindromes of length 3 and more
    for (int len = 3; len <= n; len++) {
        for (int i = 0; i <= n - len; i++) {
            int j = i + len - 1;
            
            if (s.charAt(i) == s.charAt(j) && dp[i + 1][j - 1]) {
                dp[i][j] = true;
                if (len > maxLen) {
                    start = i;
                    maxLen = len;
                }
            }
        }
    }
    
    return s.substring(start, start + maxLen);
}
```

#### Solution 4: Manacher's Algorithm (Linear Time)
```java
public String longestPalindrome(String s) {
    if (s == null || s.length() < 2) return s;
    
    // Preprocess string: "abc" -> "^#a#b#c#$"
    StringBuilder sb = new StringBuilder();
    sb.append("^#");
    for (char c : s.toCharArray()) {
        sb.append(c).append("#");
    }
    sb.append("$");
    String processed = sb.toString();
    
    int n = processed.length();
    int[] p = new int[n]; // palindrome radius array
    int center = 0, right = 0; // center and right boundary of rightmost palindrome
    int maxLen = 0, centerIndex = 0;
    
    for (int i = 1; i < n - 1; i++) {
        int mirror = 2 * center - i; // mirror of i with respect to center
        
        if (i < right) {
            p[i] = Math.min(right - i, p[mirror]);
        }
        
        // Try to expand palindrome centered at i
        while (processed.charAt(i + p[i] + 1) == processed.charAt(i - p[i] - 1)) {
            p[i]++;
        }
        
        // If palindrome centered at i extends past right, adjust center and right
        if (i + p[i] > right) {
            center = i;
            right = i + p[i];
        }
        
        // Update longest palindrome found so far
        if (p[i] > maxLen) {
            maxLen = p[i];
            centerIndex = i;
        }
    }
    
    int start = (centerIndex - maxLen) / 2;
    return s.substring(start, start + maxLen);
}
```

### Complexity Analysis
- **Brute Force**: Time O(n³), Space O(1)
- **Center Expansion**: Time O(n²), Space O(1)
- **Dynamic Programming**: Time O(n²), Space O(n²)
- **Manacher's**: Time O(n), Space O(n)

### Key Insights & Patterns
1. **Center Expansion**: Most intuitive and efficient for interviews
2. **Odd vs Even**: Handle both odd-length and even-length palindromes
3. **Index Calculation**: Careful calculation of start index from center and length
4. **Space-Time Tradeoff**: DP uses more space but has clear state transitions

### Common Pitfalls
1. **Center Types**: Forget to check both odd and even length palindromes
2. **Index Calculation**: Incorrect start position calculation from center
3. **Edge Cases**: Empty string, single character, no palindromes longer than 1
4. **Boundary Checks**: Array bounds when expanding around centers

### Follow-up Questions
1. How would you modify this to return all longest palindromic substrings?
2. What if you needed to find the longest palindromic subsequence instead?
3. How would you handle case-insensitive palindromes?
4. Can you optimize for space if you only need the length, not the actual substring?

---

## 9. Palindromic Substrings

**🔗 LeetCode Link:** [Palindromic Substrings - LeetCode #647](https://leetcode.com/problems/palindromic-substrings/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. How is counting palindromes different from finding the longest palindrome?
2. When you expand around a center, how many palindromes do you discover with each valid expansion?
3. What's the relationship between this problem and the previous longest palindromic substring problem?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: Understanding the Counting Requirement
> **Guided Question:** What makes this problem different from finding the longest palindromic substring, and what does "count" mean here?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Instead of finding just the longest palindrome, you need to count ALL palindromic substrings. Every single character is a palindrome, every valid 2-character palindrome counts, every 3-character palindrome counts, etc. The total count includes all of these. For "aaa", you have 3 single characters ("a"), 2 two-character palindromes ("aa"), and 1 three-character palindrome ("aaa") = 6 total.

</details>

#### Step 2: Reusing Center Expansion for Counting
> **Guided Question:** How can you modify the center expansion technique to count palindromes instead of just finding the longest one?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Use the same center expansion approach, but instead of tracking the longest palindrome, count each valid palindrome as you expand. For each center, expand outward and increment a counter for every valid expansion step. Each expansion that maintains the palindrome property represents a distinct palindromic substring to be counted.

</details>

#### Step 3: Comprehensive Center Coverage
> **Guided Question:** How do you ensure you count every possible palindromic substring exactly once?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Check all possible centers systematically: for each position i, check both odd-length palindromes (centered at i) and even-length palindromes (centered between i and i+1). Each palindrome has exactly one center, so by checking all centers, you count each palindrome exactly once. The expansion process naturally discovers all palindromes of different lengths at each center.

</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Initialize a counter for total palindromes
- [ ] For each position, check odd-length palindromes (center at position)
- [ ] For each position, check even-length palindromes (center between positions)
- [ ] Expand around each center while characters match, incrementing counter
- [ ] Return the total count

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does the center expansion naturally avoid double-counting palindromes?
2. **Complexity Analysis:** How does this counting approach compare in complexity to the longest palindrome problem?
3. **Trade-offs:** Could you use dynamic programming instead, and what would be the space trade-off?
4. **Pattern Recognition:** How does this technique scale to related problems like counting palindromes with specific constraints?

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

### Problem Statement
Given a string `s`, return the number of palindromic substrings in it. A string is a palindrome when it reads the same backward as forward. A substring is a contiguous sequence of characters within the string.

**Examples:**
```
Input: s = "abc"
Output: 3
Explanation: Three palindromic strings: "a", "b", "c".

Input: s = "aaa"
Output: 6
Explanation: Six palindromic strings: "a", "a", "a", "aa", "aa", "aaa".
```

### Knowledge Prerequisites
- Understanding of palindrome properties
- Center expansion technique
- Dynamic programming
- String manipulation and indexing

### First Principles
Count all possible palindromic substrings by:
- **Every Character**: Single characters are palindromes
- **Center Expansion**: Expand around each possible center
- **Dynamic Programming**: Build solution using smaller palindromes
- **Systematic Checking**: Ensure no palindrome is missed or double-counted

### Problem-First Approach

**Step 1: Understand the Problem**
- Count all contiguous substrings that are palindromes
- Include single characters (they are palindromes)
- Each occurrence should be counted separately

**Step 2: Key Insights**
- Similar to longest palindromic substring but count instead of find
- Can use center expansion around each possible center
- Need to handle both odd and even length palindromes
- Dynamic programming can also solve this systematically

**Step 3: Algorithm Design**
1. For each possible center, expand outward while characters match
2. Count each valid palindrome found
3. Handle both odd-length (center at character) and even-length (center between characters)

### Multiple Java Solutions

#### Solution 1: Center Expansion (Optimal)
```java
public int countSubstrings(String s) {
    if (s == null || s.length() == 0) return 0;
    
    int count = 0;
    
    for (int i = 0; i < s.length(); i++) {
        // Count odd-length palindromes centered at i
        count += expandAroundCenter(s, i, i);
        // Count even-length palindromes centered between i and i+1
        count += expandAroundCenter(s, i, i + 1);
    }
    
    return count;
}

private int expandAroundCenter(String s, int left, int right) {
    int count = 0;
    while (left >= 0 && right < s.length() && s.charAt(left) == s.charAt(right)) {
        count++;
        left--;
        right++;
    }
    return count;
}
```

#### Solution 2: Dynamic Programming
```java
public int countSubstrings(String s) {
    if (s == null || s.length() == 0) return 0;
    
    int n = s.length();
    boolean[][] dp = new boolean[n][n];
    int count = 0;
    
    // All single characters are palindromes
    for (int i = 0; i < n; i++) {
        dp[i][i] = true;
        count++;
    }
    
    // Check for 2-character palindromes
    for (int i = 0; i < n - 1; i++) {
        if (s.charAt(i) == s.charAt(i + 1)) {
            dp[i][i + 1] = true;
            count++;
        }
    }
    
    // Check for palindromes of length 3 and more
    for (int len = 3; len <= n; len++) {
        for (int i = 0; i <= n - len; i++) {
            int j = i + len - 1;
            
            if (s.charAt(i) == s.charAt(j) && dp[i + 1][j - 1]) {
                dp[i][j] = true;
                count++;
            }
        }
    }
    
    return count;
}
```

#### Solution 3: Brute Force (For Understanding)
```java
public int countSubstrings(String s) {
    if (s == null || s.length() == 0) return 0;
    
    int count = 0;
    
    for (int i = 0; i < s.length(); i++) {
        for (int j = i; j < s.length(); j++) {
            if (isPalindrome(s, i, j)) {
                count++;
            }
        }
    }
    
    return count;
}

private boolean isPalindrome(String s, int start, int end) {
    while (start < end) {
        if (s.charAt(start) != s.charAt(end)) {
            return false;
        }
        start++;
        end--;
    }
    return true;
}
```

#### Solution 4: Optimized Center Expansion with Early Termination
```java
public int countSubstrings(String s) {
    if (s == null || s.length() == 0) return 0;
    
    int count = 0;
    
    for (int i = 0; i < s.length(); i++) {
        // Expand around single character center
        count += countPalindromes(s, i, i);
        // Expand around dual character center
        count += countPalindromes(s, i, i + 1);
    }
    
    return count;
}

private int countPalindromes(String s, int left, int right) {
    int count = 0;
    while (left >= 0 && right < s.length()) {
        if (s.charAt(left) == s.charAt(right)) {
            count++;
            left--;
            right++;
        } else {
            break; // No need to continue if characters don't match
        }
    }
    return count;
}
```

### Complexity Analysis
- **Center Expansion**: Time O(n²), Space O(1)
- **Dynamic Programming**: Time O(n²), Space O(n²)
- **Brute Force**: Time O(n³), Space O(1)

### Key Insights & Patterns
1. **Center Expansion**: Most efficient approach for this problem
2. **Two Center Types**: Always check both odd and even length palindromes
3. **Incremental Counting**: Count each palindrome as it's discovered
4. **Symmetry Property**: Palindromes expand symmetrically from their centers

### Common Pitfalls
1. **Double Counting**: Ensure each palindrome is counted exactly once
2. **Center Types**: Don't forget even-length palindromes (center between characters)
3. **Base Cases**: Single characters are palindromes and should be counted
4. **Boundary Checks**: Ensure expansion doesn't go out of bounds

### Follow-up Questions
1. How would you modify this to return the actual palindromic substrings?
2. What if you needed to count only palindromes of length ≥ k?
3. How would you solve this for a very large string that doesn't fit in memory?
4. Can you solve this problem in O(n) time?

---

## 10. Encode and Decode Strings

**🔗 LeetCode Link:** [Encode and Decode Strings - LeetCode #271](https://leetcode.com/problems/encode-and-decode-strings/)

### 🤔 Think First (Active Retrieval)
Before reading the solution, spend 2-3 minutes thinking about this problem:

**Quick Reflection Questions:**
1. What happens if you use a simple delimiter and one of the strings contains that delimiter?
2. How can you encode string length information to help with unambiguous decoding?
3. What makes this different from just joining strings with a separator?

*Take a moment to think through these questions before continuing...*

### 💡 Discovery Process (Guided Learning)

#### Step 1: The Delimiter Problem
> **Guided Question:** Why would a simple approach like joining strings with a delimiter (like comma or semicolon) fail for this problem?

<details>
<summary>💭 Think about it, then click to reveal</summary>

If you use a delimiter like "," and one of your input strings is "hello,world", you can't distinguish between: 1) Two strings ["hello", "world"], or 2) One string ["hello,world"]. The delimiter becomes ambiguous when it appears in the actual data. This is a fundamental challenge in serialization - you need unambiguous encoding regardless of string content.

</details>

#### Step 2: Length-Prefixed Encoding Strategy
> **Guided Question:** How could you use the length of each string to solve the delimiter ambiguity problem?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Prefix each string with its length and a separator! For example, encode ["abc", "de"] as "3#abc2#de". When decoding, read the length first, then extract exactly that many characters for the string. This works because you know exactly how many characters belong to each string, regardless of their content. The length acts as an unambiguous boundary marker.

</details>

#### Step 3: Robust Decoding Implementation
> **Guided Question:** How do you implement the decoding process to reliably extract the original strings from the length-prefixed format?

<details>
<summary>💭 Think about it, then click to reveal</summary>

Parse the encoded string by: 1) Finding the next '#' delimiter to get the length, 2) Converting the length substring to an integer, 3) Extracting exactly that many characters after the '#', 4) Adding the extracted string to your result, 5) Moving your position to start of the next encoded string. This process ensures you can handle any string content, including strings with '#' characters.

</details>

### 🎯 Practice & Self-Assessment

#### Implementation Challenge
Try implementing the optimal solution from memory:

**Step-by-step checklist:**
- [ ] Encode: For each string, append its length + delimiter + the string itself
- [ ] Decode: Parse length, extract exact number of characters, repeat until end
- [ ] Handle edge cases: empty strings, strings containing the delimiter
- [ ] Test with tricky inputs: strings with numbers, special characters
- [ ] Verify round-trip correctness: encode then decode should return original

#### Reflection Questions
After solving, think about:

1. **Understanding Check:** Why does length-prefixing eliminate the ambiguity problem completely?
2. **Complexity Analysis:** What's the time and space complexity of your encoding and decoding functions?
3. **Trade-offs:** What are alternative approaches (escape sequences, base64) and their pros/cons?
4. **Pattern Recognition:** Where else do you see length-prefixed encoding in real systems?

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

### Problem Statement
Design an algorithm to encode a list of strings to a string. The encoded string is then sent over the network and is decoded back to the original list of strings.

**Examples:**
```
Input: ["lint","code","love","you"]
Output: ["lint","code","love","you"]
Explanation: One possible encode method is: "lint:;code:;love:;you"

Input: ["we", "say", ":", "yes"]
Output: ["we", "say", ":", "yes"]
```

### Knowledge Prerequisites
- String manipulation and concatenation
- Understanding of delimiter-based encoding
- Handling special characters in strings
- Length-based encoding schemes

### First Principles
Need to encode multiple strings into one string such that:
- **Unambiguous Decoding**: Must be able to reconstruct original strings exactly
- **Handle Any Characters**: Original strings can contain any characters including delimiters
- **Efficient**: Encoding and decoding should be reasonably fast
- **Robust**: Must handle edge cases like empty strings, strings with special characters

### Problem-First Approach

**Step 1: Understand the Problem**
- Combine multiple strings into a single encoded string
- Decode the single string back to original list
- Must handle any possible characters in input strings

**Step 2: Key Challenge**
- Simple delimiters fail when strings contain the delimiter
- Need encoding scheme that's unambiguous regardless of string content

**Step 3: Solution Approaches**
1. **Length-based encoding**: Prefix each string with its length
2. **Escape sequences**: Escape special characters
3. **Non-ASCII delimiters**: Use characters not in normal text
4. **Base64 encoding**: Encode individual strings first

### Multiple Java Solutions

#### Solution 1: Length-based Encoding (Recommended)
```java
public class Codec {
    
    // Encodes a list of strings to a single string.
    public String encode(List<String> strs) {
        StringBuilder encoded = new StringBuilder();
        for (String str : strs) {
            encoded.append(str.length()).append("#").append(str);
        }
        return encoded.toString();
    }

    // Decodes a single string to a list of strings.
    public List<String> decode(String s) {
        List<String> result = new ArrayList<>();
        int i = 0;
        
        while (i < s.length()) {
            // Find the delimiter '#'
            int delimiterIndex = s.indexOf('#', i);
            int length = Integer.parseInt(s.substring(i, delimiterIndex));
            
            // Extract string of specified length
            String str = s.substring(delimiterIndex + 1, delimiterIndex + 1 + length);
            result.add(str);
            
            // Move to next encoded string
            i = delimiterIndex + 1 + length;
        }
        
        return result;
    }
}
```

#### Solution 2: Escape-based Encoding
```java
public class Codec {
    private static final String DELIMITER = ":;";
    private static final String ESCAPE = "\\";
    
    public String encode(List<String> strs) {
        StringBuilder encoded = new StringBuilder();
        for (int i = 0; i < strs.size(); i++) {
            String escaped = strs.get(i)
                .replace(ESCAPE, ESCAPE + ESCAPE)  // Escape the escape character
                .replace(DELIMITER, ESCAPE + DELIMITER);  // Escape the delimiter
            
            encoded.append(escaped);
            if (i < strs.size() - 1) {
                encoded.append(DELIMITER);
            }
        }
        return encoded.toString();
    }

    public List<String> decode(String s) {
        List<String> result = new ArrayList<>();
        StringBuilder current = new StringBuilder();
        int i = 0;
        
        while (i < s.length()) {
            if (i < s.length() - 1 && s.substring(i, i + 2).equals(DELIMITER)) {
                // Found unescaped delimiter
                result.add(current.toString());
                current = new StringBuilder();
                i += 2;
            } else if (s.charAt(i) == ESCAPE.charAt(0)) {
                // Found escape character, add next character literally
                if (i + 1 < s.length()) {
                    current.append(s.charAt(i + 1));
                    i += 2;
                } else {
                    current.append(s.charAt(i));
                    i++;
                }
            } else {
                current.append(s.charAt(i));
                i++;
            }
        }
        
        result.add(current.toString());
        return result;
    }
}
```

#### Solution 3: Non-ASCII Delimiter
```java
public class Codec {
    private static final char DELIMITER = '\u0001'; // Non-printable ASCII character
    
    public String encode(List<String> strs) {
        StringBuilder encoded = new StringBuilder();
        for (int i = 0; i < strs.size(); i++) {
            encoded.append(strs.get(i));
            if (i < strs.size() - 1) {
                encoded.append(DELIMITER);
            }
        }
        return encoded.toString();
    }

    public List<String> decode(String s) {
        if (s.isEmpty()) return new ArrayList<>();
        
        List<String> result = new ArrayList<>();
        StringBuilder current = new StringBuilder();
        
        for (char c : s.toCharArray()) {
            if (c == DELIMITER) {
                result.add(current.toString());
                current = new StringBuilder();
            } else {
                current.append(c);
            }
        }
        
        result.add(current.toString());
        return result;
    }
}
```

#### Solution 4: Base64 with Length Prefix
```java
import java.util.Base64;

public class Codec {
    
    public String encode(List<String> strs) {
        StringBuilder encoded = new StringBuilder();
        for (String str : strs) {
            byte[] bytes = str.getBytes();
            String base64 = Base64.getEncoder().encodeToString(bytes);
            encoded.append(base64.length()).append("#").append(base64);
        }
        return encoded.toString();
    }

    public List<String> decode(String s) {
        List<String> result = new ArrayList<>();
        int i = 0;
        
        while (i < s.length()) {
            int delimiterIndex = s.indexOf('#', i);
            int length = Integer.parseInt(s.substring(i, delimiterIndex));
            
            String base64 = s.substring(delimiterIndex + 1, delimiterIndex + 1 + length);
            byte[] bytes = Base64.getDecoder().decode(base64);
            result.add(new String(bytes));
            
            i = delimiterIndex + 1 + length;
        }
        
        return result;
    }
}
```

### Complexity Analysis
- **Length-based**: Encode O(n), Decode O(n), Space O(1) extra
- **Escape-based**: Encode O(n), Decode O(n), Space O(1) extra  
- **Non-ASCII**: Encode O(n), Decode O(n), Space O(1) extra
- **Base64**: Encode O(n), Decode O(n), Space O(n) for encoding overhead

### Key Insights & Patterns
1. **Length Prefix**: Most robust approach, works with any string content
2. **Delimiter Choice**: Choose delimiters that won't conflict with data
3. **Escape Sequences**: Handle conflicts by escaping special characters
4. **Unambiguous Parsing**: Ensure decoding produces exactly original strings

### Common Pitfalls
1. **Delimiter Conflicts**: Simple delimiters fail when strings contain them
2. **Empty Strings**: Must handle empty strings in the list correctly
3. **Edge Cases**: Single string, all empty strings, very long strings
4. **Character Encoding**: Be consistent about character encoding (UTF-8, etc.)

### Follow-up Questions
1. How would you optimize for space if strings have a lot of repeated content?
2. What if you needed to make the encoded string human-readable?
3. How would you handle very large strings that might not fit in memory?
4. Can you make the encoding more compact for specific types of data?

---

## String Problem Patterns Summary

### Core Patterns
1. **Sliding Window**: Longest substring problems, character replacement
2. **Two Pointers**: Palindrome checking, anagram validation
3. **Hash Maps**: Character frequency counting, anagram grouping
4. **Stack**: Bracket matching, nested structure validation
5. **Center Expansion**: Palindrome finding and counting
6. **Encoding Schemes**: String serialization and deserialization

### Time Complexity Patterns
- **O(n)**: Single pass with hash map, two pointers
- **O(n log n)**: Sorting-based solutions
- **O(n²)**: Center expansion, dynamic programming
- **O(n³)**: Brute force substring checking

### Space Complexity Considerations
- **O(1)**: Two pointers, center expansion
- **O(k)**: Hash map with fixed character set
- **O(n)**: Dynamic programming tables, string building
- **O(n²)**: 2D DP arrays

### Interview Tips
1. **Clarify Requirements**: Case sensitivity, character sets, edge cases
2. **Start Simple**: Brute force first, then optimize
3. **Consider Multiple Approaches**: Discuss trade-offs between solutions
4. **Handle Edge Cases**: Empty strings, single characters, special characters
5. **Test Thoroughly**: Include edge cases and typical examples in testing
