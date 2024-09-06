# F# Syntax Covered in Week 1

# Table of Contents

1. [Basic Syntax](#1-basic-syntax)
   1.1. [Value Binding](#value-binding)
   1.2. [Function Definition](#function-definition)
   1.3. [Type Annotations](#type-annotations)

2. [Basic Types](#2-basic-types)
   2.1. [Integer Types](#integer-types)
   2.2. [Floating-Point Types](#floating-point-types)
   2.3. [String Type](#string-type)

3. [Operators](#3-operators)
   3.1. [Arithmetic Operators](#arithmetic-operators)
   3.2. [String Concatenation](#string-concatenation)

4. [Function Application](#4-function-application)

5. [Tuples](#5-tuples)
   5.1. [Tuple Pattern Matching in Function Parameters](#tuple-pattern-matching-in-function-parameters)

6. [Comments](#6-comments)

7. [Modules and Namespaces](#7-modules-and-namespaces)
   7.1. [Opening a Module](#opening-a-module)

8. [Basic I/O](#8-basic-i-o)
   8.1. [Printing to Console](#printing-to-console)

9. [F# Interactive](#9-f-interactive)

10. [Type Inference](#10-type-inference)

11. [Immutability](#11-immutability)

12. [Function Composition](#12-function-composition)

13. [Partial Application](#13-partial-application)

## 1. Basic Syntax

### Value Binding
```fsharp
let x = expression
```

**Beginner:** This is how you give a name to a value in F#. It's like saying "let x be equal to this expression."

**Experienced:** The `let` keyword introduces a binding. It's immutable by default, promoting functional programming principles. The right-hand side is evaluated eagerly.

**Example:**
```fsharp
let myNumber = 42
let myName = "Alice"
```

### Function Definition
```fsharp
let functionName parameter1 parameter2 = expression
```

**Beginner:** This is how you create a function. You give it a name and tell it what inputs (parameters) it should expect.

**Experienced:** Functions in F# are first-class values. This syntax defines a function value. It's curried by default, allowing partial application.

**Example:**
```fsharp
let add x y = x + y
let greet name = printfn "Hello, %s!" name
```

### Type Annotations
```fsharp
let functionName (parameter: type) = expression
```

**Beginner:** Sometimes you need to tell F# what type of data you're working with. This is how you do that.

**Experienced:** F# uses type inference, but explicit annotations can be used for clarity or to resolve ambiguities. They're also useful for documentation and type-driven development.

**Example:**
```fsharp
let square (x: int) = x * x
let convertToString (num: float) : string = string num
```

## 2. Basic Types

### Integer Types
- `int`: 32-bit signed integer
- `int64` or `L`: 64-bit signed integer
- `byte` or `uy`: 8-bit unsigned integer
- `uint64`: 64-bit unsigned integer

**Beginner:** These are different ways to represent whole numbers. Some can be bigger than others or only positive.

**Experienced:** F# provides a range of integer types for different precision needs. The suffixes (`L`, `uy`) are type-specific literals that help with type inference.

**Example:**
```fsharp
let smallNumber = 42
let largeNumber = 9876543210L
let unsignedByte = 255uy
let unsignedLarge = 18446744073709551615UL
```

### Floating-Point Types
- `float`: 64-bit double-precision floating-point number

**Beginner:** This is for numbers with decimal points.

**Experienced:** F# uses `float` as an alias for `System.Double`. It follows IEEE 754 standard for floating-point arithmetic.

**Example:**
```fsharp
let pi = 3.14159
let avogadro = 6.022e23
```

### String Type
- `string`: Unicode text

**Beginner:** This is for text.

**Experienced:** Strings in F# are immutable and represent Unicode text. They're instances of `System.String`.

**Example:**
```fsharp
let greeting = "Hello, World!"
let multiLine = "This is a
multi-line string"
```

## 3. Operators

### Arithmetic Operators
- `+`: Addition
- `-`: Subtraction
- `*`: Multiplication
- `/`: Division

**Beginner:** These work just like in math class.

**Experienced:** Operators in F# are actually functions. They can be overloaded and used in partial application.

**Example:**
```fsharp
let sum = 5 + 3
let difference = 10 - 7
let product = 4 * 6
let quotient = 15 / 3
```

### String Concatenation
- `+`: Used to concatenate strings

**Beginner:** This is how you stick two pieces of text together.

**Experienced:** String concatenation with `+` is syntactic sugar. For performance-critical operations, consider using `StringBuilder`.

**Example:**
```fsharp
let firstName = "John"
let lastName = "Doe"
let fullName = firstName + " " + lastName
```

## 4. Function Application
```fsharp
functionName argument1 argument2
```

**Beginner:** This is how you use a function. You write its name and then give it the information it needs.

**Experienced:** Function application in F# is left-associative and doesn't require parentheses. This allows for clean, pipeline-style programming.

**Example:**
```fsharp
let add x y = x + y
let result = add 3 4  // result is 7

let greet name = printfn "Hello, %s!" name
greet "Alice"  // Prints: Hello, Alice!
```

## 5. Tuples
```fsharp
let tuple = (item1, item2)
```

**Beginner:** This is a way to group multiple values together.

**Experienced:** Tuples are structural types in F#. They're immutable and can be pattern-matched. They're often used for multiple return values.

**Example:**
```fsharp
let person = ("Alice", 30)
let point3D = (1.0, 2.0, 3.0)
```

### Tuple Pattern Matching in Function Parameters
```fsharp
let functionName (a, b) = expression
```

**Beginner:** This is a way to break apart a tuple when you're defining a function.

**Experienced:** This syntax demonstrates F#'s pattern matching capabilities. It's a form of destructuring that can be used in various contexts, not just function parameters.

**Example:**
```fsharp
let addCoordinates (x, y) = x + y
let result = addCoordinates (3, 4)  // result is 7

let printPerson (name, age) = printfn "%s is %d years old" name age
printPerson ("Bob", 25)  // Prints: Bob is 25 years old
```

## 6. Comments

**Beginner:** These are notes in your code that F# ignores. They're for humans to read.

**Experienced:** F# supports single-line, multi-line, and XML documentation comments. XML comments can be used to generate documentation.

**Example:**
```fsharp
// This is a single-line comment

(*
   This is a
   multi-line comment
*)

/// <summary>
/// This is an XML documentation comment
/// </summary>
/// <param name="x">The first number to add</param>
/// <param name="y">The second number to add</param>
/// <returns>The sum of x and y</returns>
let add x y = x + y
```

## 7. Modules and Namespaces

### Opening a Module
```fsharp
open ModuleName
```

**Beginner:** This is how you tell F# you want to use stuff from another part of the code.

**Experienced:** `open` brings a module's contents into scope. It's similar to `import` in other languages but with some unique behaviors in F#'s module system.

**Example:**
```fsharp
open System
let now = DateTime.Now
```

## 8. Basic I/O

### Printing to Console
```fsharp
printfn "formatString %s %d" stringArg intArg
```

**Beginner:** This is how you make your program show text on the screen.

**Experienced:** `printfn` is a type-safe formatting function. It uses printf-style format strings and is resolved at compile-time.

**Example:**
```fsharp
let name = "Alice"
let age = 30
printfn "%s is %d years old" name age
// Prints: Alice is 30 years old
```

## 9. F# Interactive

**Beginner:** This is a tool where you can try out F# code piece by piece.

**Experienced:** F# Interactive (FSI) is a REPL that supports incremental compilation. It's valuable for exploratory programming and testing.

**Example:**
```fsharp
> let x = 42;;
val x : int = 42

> let double x = x * 2;;
val double : x:int -> int

> double 21;;
val it : int = 42
```

## 10. Type Inference

**Beginner:** F# is smart and can often figure out what type of data you're using without you telling it.

**Experienced:** F#'s type inference is based on Hindley-Milner type inference. It works across function boundaries and is a key feature of the language.

**Example:**
```fsharp
let numbers = [1; 2; 3; 4; 5]  // F# infers this is a list of integers
let square x = x * x  // F# infers x is a number (generic)
```

## 11. Immutability

**Beginner:** Once you give something a value in F#, it doesn't change unless you explicitly say it can.

**Experienced:** Immutability is a core principle in F#, promoting functional programming paradigms. It aids in creating thread-safe and easier-to-reason-about code.

**Example:**
```fsharp
let x = 5
// x <- 10  // This would cause a compilation error
let y = x + 5  // This creates a new binding, y, with value 10
```

## 12. Function Composition

**Beginner:** You can combine simple functions to make more complex ones.

**Experienced:** F# provides the `>>` and `<<` operators for forward and backward function composition, enabling point-free style programming. We are not allowed to use this yet though.

**Example:**
```fsharp
let add1 x = x + 1
let double x = x * 2
let add1ThenDouble x = double (add1 x)
```

## 13. Partial Application

**Beginner:** You can use a function even if you don't give it all the information it usually needs.

**Experienced:** Partial application is a consequence of currying in F#. It's powerful for creating specialized functions from more general ones and is fundamental to many functional programming patterns.

**Example:**
```fsharp
let add x y = x + y
let add5 = add 5  // Partially applied function
let result = add5 3  // result is 8
```