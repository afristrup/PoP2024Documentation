# Week 1 Overview: Programming Concepts from the Lecture

## Table of Contents
1. [Introduction to Programming](#introduction-to-programming)
2. [Course Structure and Grading](#course-structure-and-grading)
3. [Computer Basics](#computer-basics)
    - [Computer Components](#computer-components)
    - [Computer Architecture](#computer-architecture)
    - [Operating System](#operating-system)
    - [File System](#file-system)
    - [Terminal and Shell](#terminal-and-shell)
    - [Editor](#editor)
4. [Programming Concepts](#programming-concepts)
    - [Program Components](#program-components)
    - [Data](#data)
    - [Computation](#computation)
    - [Actions](#actions)
    - [Expressions](#expressions)
    - [F# Basics](#f-basics)
5. [Problem Solving Strategies](#problem-solving-strategies)

## Introduction to Programming

Programming is defined by Peter Naur as:

> "Programming is the activity of matching some significant part and aspect of an activity in the real world to the formal symbol manipulation that can be done by a program running on a computer"

Naur also emphasizes that:

> "Programming primarily must be the programmers' building up knowledge of a certain kind"

This definition highlights the importance of understanding the problem domain and translating real-world concepts into formal computer instructions.

## Course Structure and Grading

- **Course Load**: 15 ECTS (~23 hours/week over 18 weeks)
- **Weekly Structure**:
    - Tuesdays 8-12: Lectures, exercises, live coding
    - Thursdays: 2-hour slot with Teaching Assistants (TAs)
- **Grading System**:
    - Pass/fail based on 4 assignments
    - Requirements:
        - Pass one of the first two assignments
        - Pass both of the last two assignments
    - Mandatory resubmission for all assignments
    - Re-exam: Oral exam if needed

## Computer Basics

### Computer Components

1. **CPU (Central Processing Unit)**
    - Function: Executes instructions
    - Core of the computer's processing power

2. **Memory**
    - Function: Stores instructions and data
    - Characteristics:
        - Transient (content disappears without power)
        - Organized as an array of bytes

3. **Disk**
    - Function: Permanent storage for instructions and data
    - Retains information even when power is off

### Computer Architecture

- Main components (CPU, Memory, Disk) are connected via buses
- Peripherals include:
    - Screen
    - Keyboard
    - Network interfaces
    - Other input/output devices

### Operating System

The operating system acts as an intermediary between hardware and software, providing:

1. Graphical User Interface (GUI)
2. File System management
3. Terminal emulator (console)

### File System

- Hierarchical structure (tree-like)
- Root directory:
    - macOS: "/"
    - Windows: "C:\"
- Paths:
    - Absolute: Starts from the root (e.g., "/Users/username/Documents")
    - Relative: Starts from current directory (e.g., "Documents/project")

### Terminal and Shell

- **Terminal**: Input/Output interface for text-based interactions
- **Shell**: Command interpreter (e.g., zsh on macOS, PowerShell on Windows)
- Basic commands:
    - `ls` or `dir`: List directory contents
    - `pwd` or `gl`: Print working directory
    - `mkdir`: Make directory
    - `cd`: Change directory
    - `touch` (macOS) or `ni` (Windows): Create new file
    - `rm -rf` (macOS) or `rmdir` (Windows): Remove directory

### Editor

- Purpose: Write and edit file contents
- Recommended: Visual Studio Code (VS Code)
- VS Code can be configured as an Integrated Development Environment (IDE)

## Programming Concepts

### Program Components

A program consists of three main components:
1. Data
2. Computations
3. Actions

### Data

- Definition: Collection of bits interpreted as information
- Characteristics:
    - Values have types
    - Finite representation in memory
    - Values are immutable
- Types of values:
    - Primitive (e.g., integers, booleans, strings, floats)
    - Composite (e.g., tuples, lists)

### Computation

- Definition: Transformation from input to output
- Implemented with pure functions
- Properties:
    - Deterministic (same input always produces same output)
    - No side effects

### Actions

- Functions with side effects (e.g., I/O operations, file manipulations)
- Characteristics:
    - Results can change based on when or how many times they're run
    - More challenging to test compared to pure computations

### Expressions

- Fundamental unit of computation
- Evaluated to compute a value
- In F#, everything is an expression

### F# Basics

- **F# Interactive**: Read-Eval-Print Loop (REPL) environment
- Expressions are terminated with ";;"
- Binding (assigning names to values) uses "let" keyword
- Binding environment: Collection of active bindings
- F# scripts: Files containing F# code (usually with .fsx extension)

## Problem Solving Strategies

1. **Use Examples**
    - Start with concrete input/output examples
    - Consider edge cases (e.g., empty input, maximum values)

2. **Sequence of Steps**
    - Identify intermediate goals
    - Split the main problem into smaller sub-problems

3. **Ken's Detailed Method for Function Design**
    1. Write a brief description of the function's purpose
    2. Choose an appropriate name for the function
    3. Write down test examples (input and expected output)
    4. Determine the types of inputs and outputs
    5. Generate the function code (including any necessary helper functions)
    6. Write comprehensive test cases
    7. Provide concise documentation for the function

By following these strategies and understanding the core concepts, you'll be well-equipped to tackle programming problems in this course and beyond.