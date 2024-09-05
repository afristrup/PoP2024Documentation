# F# Week 1 Flashcards

## Basic Syntax

What is the syntax for value binding in F#?
: ```fsharp
let x = expression
```
Value binding in F# assigns a name to a value. It's immutable by default.

How do you define a function in F#?
: ```fsharp
let functionName parameter1 parameter2 = expression
```
This syntax defines a function value. Functions in F# are first-class values and are curried by default.

What is the purpose of type annotations in F#?
: Type annotations explicitly specify the type of a value or function parameter.
```fsharp
let square (x: int) = x * x
```
They can be used for clarity, to resolve ambiguities, or for documentation.

## Data Types

What are some integer types in F#?
: - `int`: 32-bit signed integer
- `int64` or `L`: 64-bit signed integer
- `byte` or `uy`: 8-bit unsigned integer
- `uint64`: 64-bit unsigned integer

What is the floating-point type in F#?
: `float` is the 64-bit double-precision floating-point number type in F#. It's an alias for `System.Double`.

How are strings represented in F#?
: Strings in F# are immutable Unicode text, represented by the `string` type. They are instances of `System.String`.

## Operators

What are the basic arithmetic operators in F#?
: - `+`: Addition
- `-`: Subtraction
- `*`: Multiplication
- `/`: Division

Operators in F# are actually functions and can be overloaded.

How is string concatenation performed in F#?
: The `+` operator is used to concatenate strings in F#.
```fsharp
let fullName = firstName + " " + lastName
```

## Functions and Application

How is function application done in F#?
: ```fsharp
functionName argument1 argument2
```
Function application is left-associative and doesn't require parentheses, allowing for pipeline-style programming.

What is a tuple in F# and how is it used?
: A tuple is a way to group multiple values together. It's defined using parentheses:
```fsharp
let person = ("Alice", 30)
```
Tuples are immutable and can be pattern-matched.

## F# Interactive

What is F# Interactive?
: F# Interactive (FSI) is a REPL (Read-Eval-Print Loop) environment for F#. It allows you to execute F# code interactively and see immediate results.

## Type Inference

What is type inference in F#?
: Type inference is F#'s ability to automatically deduce the types of values and functions without explicit type annotations. It's based on Hindley-Milner type inference.

## Immutability

What is immutability in F#?
: Immutability means that once a value is created, it cannot be changed. This is a default behavior in F# and promotes functional programming principles.

## Problem Solving Strategies

What are some problem-solving strategies introduced in the course?
: 1. Use Examples: Start with concrete input/output examples
2. Sequence of Steps: Identify intermediate goals and split problems into sub-problems
3. Ken's Detailed Method for Function Design:
    - Write a brief description
    - Choose an appropriate name
    - Write test examples
    - Determine input/output types
    - Generate function code
    - Write comprehensive tests
    - Provide concise documentation