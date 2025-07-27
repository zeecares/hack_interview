#!/bin/bash

# Script to add a new study guide to the GitHub Pages site

if [ $# -eq 0 ]; then
    echo "Usage: $0 <guide-name> [title]"
    echo "Example: $0 binary-trees 'Binary Tree Problems'"
    exit 1
fi

GUIDE_NAME=$1
TITLE=${2:-"$(echo $GUIDE_NAME | sed 's/-/ /g' | sed 's/\b\w/\U&/g') Problems"}

# Create the markdown file
cat > "blind75/${GUIDE_NAME}-study-guide.md" << EOF
---
layout: default
title: ${TITLE}
description: Comprehensive study guide for ${TITLE} in the Blind 75 LeetCode collection
---

# ${TITLE} - Blind 75 LeetCode

## Table of Contents
1. [Introduction](#introduction)
2. [Problem Solutions](#problem-solutions)
3. [Common Patterns](#common-patterns)
4. [Implementation Templates](#implementation-templates)

## Introduction

This guide covers ${TITLE} from the Blind 75 LeetCode problem set.

## Problem Solutions

### Problem 1: [Problem Name]

**Problem Statement**: [Brief description]

**Visual Example**:
\`\`\`
[Add visual example here]
\`\`\`

**Knowledge Prerequisites**:
- [List prerequisites]

**First Principles**:
- [Key concepts]

**Problem-First Approach**:
1. [Step 1]
2. [Step 2]
3. [Step 3]

**Java Solutions**:

**Solution 1: [Approach Name]**
\`\`\`java
// Add solution code here
\`\`\`

**Complexity Analysis**:
- Time: O(...)
- Space: O(...)

**Key Insights**:
- [Key insights]

---

## Common Patterns

[Add common patterns for this topic]

## Implementation Templates

[Add implementation templates]

---

*This guide is part of the Blind 75 LeetCode study collection.*
EOF

echo "✅ Created new study guide: blind75/${GUIDE_NAME}-study-guide.md"
echo "📝 Don't forget to:"
echo "   1. Add content to the new guide"
echo "   2. Update navigation in _layouts/default.html"
echo "   3. Update the main index.md file"
echo "   4. Commit and push your changes" 