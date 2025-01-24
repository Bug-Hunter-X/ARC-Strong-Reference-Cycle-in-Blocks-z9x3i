# ARC Strong Reference Cycle in Blocks in Objective-C

This repository demonstrates a common Objective-C memory management issue: strong reference cycles within blocks.  When a block strongly captures `self`, and `self` also holds a strong reference to an object within the block, a retain cycle occurs, preventing the objects from being deallocated.

## Problem

The `bug.m` file shows an example of how a strong reference cycle can happen.  The `MyClass` object holds a strong reference to its `myString` property, while a block inside `someMethod` also strongly captures `self`.  This creates a circular dependency, causing a memory leak.

## Solution

The `bugSolution.m` file presents a corrected version. By using `__weak` to capture `self` within the block, the cycle is broken. This ensures that `self` is not strongly retained by the block, allowing for proper deallocation of the object when no longer needed.

## How to Reproduce

1. Clone this repository.
2. Open the project in Xcode.
3. Run the example. Observe memory usage, and you'll see memory leaks in the original and proper deallocation in the solution.