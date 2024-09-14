# F# Syntax Covered in Week 2

## Table of Contents

1. [Types](#1-types)
   1.1. [Basic Types](#basic-types)
   1.2. [Type Inference](#type-inference)
   1.3. [Type Annotations](#type-annotations)
   1.4. [Type Conversion](#type-conversion)
   1.5. [User-Defined Types](#user-defined-types)

2. [Functions](#2-functions)
   2.1. [Function Signatures](#function-signatures)
   2.2. [Currying](#currying)

3. [Composite Types](#3-composite-types)
   3.1. [Tuples](#tuples)
   3.2. [Lists](#lists)

4. [Recursion](#4-recursion)

5. [Style Guide](#5-style-guide)

6. [Bit Manipulation (Advanced Topic)](#6-bit-manipulation-advanced-topic)

## 1. Types

### Basic Types

**Beginner:** These are the fundamental data types in F#.

**Experienced:** F# provides a rich set of basic types, each with its own literal syntax and type inference rules. The unit type `()` represents the absence of an actual value.

**Example:**
```fsharp
> 1;;
val it: int = 1

> 1uy;;
val it: byte = 1uy

> 1s;;
val it: int16 = 1s

> 1.0;;
val it: float = 1.0

> 'v';;
val it: char = 'v'

> "sdfs";;
val it: string = "sdfs"

> ();;
val it: unit = ()
```

### Type Inference

**Beginner:** F# can often figure out the type of your data without you explicitly stating it.

**Experienced:** F# uses a sophisticated type inference system. It works across function boundaries and is a key feature of the language. When F# cannot infer a specific type, it uses a generic type represented by `'a`.

**Example:**
```fsharp
> let f x =
-   x + 1;;
val f: x: int -> int

> let f x =
-   x + 1.0;;
val f: x: float -> float

> let f x =
-   true;;
val f: x: 'a -> bool
```

### Type Annotations

**Beginner:** Sometimes you need to tell F# exactly what type you're using.

**Experienced:** Type annotations can be used to provide clarity, resolve ambiguities, or enforce specific types. They're also useful for documentation and type-driven development.

**Example:**
```fsharp
> let (x: 'a) = 2;;
val x: int = 2
```

### Type Conversion

**Beginner:** This is how you change one type to another.

**Experienced:** F# provides built-in conversion functions for basic types. These are often used in conjunction with type annotations to ensure type safety.

**Example:**
```fsharp
> let (x: int) = int "2";;
val x: int = 2
```

### User-Defined Types

**Beginner:** You can create your own types to better represent your data.

**Experienced:** User-defined types in F# allow for domain modeling and can improve code clarity and type safety.

**Example:**
```fsharp
type BottleNumber = int

type Cm = int 

let volume (length: Cm) (height: Cm) (width: Cm) : Cm = 
    length * height * width 

printfn "The volume is %d" (volume 10 20 15)
```

## 2. Functions

### Function Signatures

**Beginner:** This shows what types a function takes in and gives out.

**Experienced:** Function signatures in F# provide a concise way to understand a function's behavior. They're crucial for type-driven development and documentation.

**Example:**
```fsharp
let booleanFalse (number: float) (character: char): bool = false 
// float -> char -> bool

let sub x = x - 10 
// int -> int

let interestRate (deposit: int) : float =
    if (deposit < 0) then
        0.0
    elif (deposit < 10_000) then
        0.02
    elif (deposit < 50_000) then
        0.03
    else 
        0.04
```

### Currying

**Beginner:** This is a way to create new functions from existing ones by providing some, but not all, of the arguments.

**Experienced:** Currying is a fundamental concept in functional programming. In F#, all functions are automatically curried, enabling partial application and function composition.

**Example:**
```fsharp
> let g x y =
-   x + y;;
val g: x: int -> y: int -> int

> let h = g 1;;
val h: (int -> int)

> h 2;;
val it: int = 3
```

## 3. Composite Types

### Tuples

**Beginner:** These are ways to group multiple values together.

**Experienced:** Tuples in F# are immutable, structural types that can hold a fixed number of elements of different types.

**Example:**
```fsharp
> let x = (2, 3);;
val x: int * int = (2, 3)

> (fst x);;
val it: int = 2

> (snd x);;
val it: int = 3

type Mix = bool * float * byte

let f (x: Mix) = true
```

### Lists

**Beginner:** These are ordered collections of items of the same type.

**Experienced:** F# lists are immutable, singly-linked lists. They're optimized for prepending elements and recursion.

**Example:**
```fsharp
> let l = [1; 2; 3];;
val l: int list = [1; 2; 3]

> let l = [1 .. 3];;
val l: int list = [1; 2; 3]

> [];;
val it: 'a list

> 1::[2];;
val it: int list = [1; 2]

> "a"::[];;
val it: string list = ["a"]

> let lstOne = [1; 2; 61; 24];;
val lstOne: int list = [1; 2; 61; 24]

> let lstTwo = [2 .. 5];;
val lstTwo: int list = [2; 3; 4; 5]

> lstOne @ lstTwo;;
val it: int list = [1; 2; 61; 24; 2; 3; 4; 5]

> lstTwo @ lstOne;;
val it: int list = [2; 3; 4; 5; 1; 2; 61; 24]

> [2 .. 4] @ [2];;
val it: int list = [2; 3; 4; 2]

> let h = l.Head;;
val h: int = 1

> let t = l.Tail;;
val t: int list = [2; 3]

> let l = [1..100];;
val l: int list = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10; ...]

> let ll = l[4..20];;
val ll: int list = [5; 6; 7; 8; 9; 10; 11; 12; 13; 14; ...]

> let ll = l[..20];;
val ll: int list = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10; ...]

> let ll = l[90..];;
val ll: int list = [91; 92; 93; 94; 95; 96; 97; 98; 99; 100]
```

## 4. Recursion

**Beginner:** This is when a function calls itself.

**Experienced:** Recursion is a fundamental concept in functional programming. In F#, recursive functions need to be explicitly marked with the `rec` keyword.

**Example:**
```fsharp
let rec futureValue (deposit: int) (years: int) : float = 
    let interestRate = 0.2

    if (years <= 0) then
        float deposit
    else
        let lastYearDeposit = futureValue deposit (years - 1)
        lastYearDeposit + interestRate * lastYearDeposit
```

## 5. Style Guide

**Beginner:** These are rules for writing F# code in a consistent way.

**Experienced:** Following a consistent style guide improves code readability and maintainability. It also helps in adhering to F# idioms and best practices.

**Example:**
```fsharp
// Pascal case for types and modules
type DepositList = int list

// Camel case for variables and functions
let calculateInterest deposit = 
    // function implementation
```

## 6. Bit Manipulation (Advanced Topic)

**Beginner:** Bit manipulation involves working with individual bits in a number. This is useful for certain types of algorithms and low-level operations.

**Experienced:** F# provides bitwise operators that allow for efficient manipulation of bits. These operations are often used in scenarios requiring low-level data manipulation, optimization, or when working with certain protocols or file formats.

### Bitwise Operators

- `&&&`: Bitwise AND
- `|||`: Bitwise OR
- `^^^`: Bitwise XOR
- `~~~`: Bitwise NOT
- `<<<`: Left shift
- `>>>`: Right shift

### Example: Counting Set Bits

This example demonstrates a recursive function that counts the number of '1' bits in a 16-bit unsigned integer:

```fsharp
let rec bitCountOnes (inputBits: uint16) : uint16 =
    if inputBits = 0us then
        0us
    else
        let count = inputBits &&& 1us
        let tail = inputBits >>> 1
        count + bitCountOnes tail
```

**Explanation:**

1. The function takes a `uint16` (16-bit unsigned integer) as input and returns a `uint16`.
2. The base case: if `inputBits` is 0, return 0.
3. For non-zero inputs:
   - `inputBits &&& 1us` performs a bitwise AND with 1, effectively checking if the least significant bit is set.
   - `inputBits >>> 1` performs a right shift by 1 bit, moving all bits one position to the right.
   - The function recursively calls itself with the shifted bits and adds the count of the least significant bit.

This function efficiently counts the number of set bits (1s) in the binary representation of the input number.

**Usage:**

```fsharp
let result = bitCountOnes 0b1010_1010us
printfn "Number of set bits: %d" result
// Output: Number of set bits: 4
```

In this example, `0b1010_1010us` is a binary literal representing the number 170 as a 16-bit unsigned integer. The function correctly identifies that there are 4 set bits in this number.

Bit manipulation can be particularly useful in scenarios such as:
- Implementing certain data structures (e.g., bitsets)
- Optimizing algorithms for space or time efficiency
- Working with hardware interfaces or low-level protocols
- Solving certain types of puzzles or coding challenges

When using bit manipulation, it's important to be aware of the size and signedness of the types you're working with to avoid unexpected behavior due to overflow or sign extension.