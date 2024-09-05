# Week 1 Hands-On: F# Exercises

## 1. Basic F# Operations

### Integer Addition
```fsharp
let addInt (a: int) (b: int) = a + b
```
This function adds two integers.

### Float Addition
```fsharp
let addFloat (a: float) (b: float) = a + b
```
This function adds two floating-point numbers.

### String Concatenation
```fsharp
let concatStrings (a: string) (b: string) = a + b
```
This function concatenates two strings.

### Byte Addition
```fsharp
let addByte (a: byte) (b: byte) = a + b
```
This function adds two byte values.

### Unsigned Long Integer Addition
```fsharp
let addUnsignedLong (a: uint64) (b: uint64) = a + b
```
This function adds two unsigned 64-bit integers.

### Variable Bindings and Overflow Examples
```fsharp
let x = 3 + 6
let y = 3L + 6L
let canAddXY = false
let overflowOne = 255uy + 1uy = 0uy
let overflowTwo = 255uy + 2uy = 1uy
```
These lines demonstrate variable binding and overflow behavior with byte operations.

## 2. Geometric Calculations

### Circle Area
```fsharp
let circleArea radius = Math.PI * radius * radius
```
Calculates the area of a circle given its radius.

### Circle Perimeter
```fsharp
let circlePerimeter radius = 2. * Math.PI * radius
```
Calculates the perimeter of a circle given its radius.

### Square Area
```fsharp
let squareArea (length: float) = length * length
```
Calculates the area of a square given the length of one side.

### Square Perimeter
```fsharp
let squarePerimeter length = 4. * length
```
Calculates the perimeter of a square given the length of one side.

## 3. Average Functions

### Integer Average
```fsharp
let avg x y = (x + y) / 2
```
Calculates the average of two numbers (note: this performs integer division).

### Float Average
```fsharp
let avgFloat x y = (x + y) / 2.
```
Calculates the average of two floating-point numbers.

## 4. Rational Number Operations

Rational numbers are represented as tuples `(numerator, denominator)`.

### Addition of Rationals
```fsharp
let qplus (a, b) (c, d) = ((a * d + b * c), (b * d))
```

### Subtraction of Rationals
```fsharp
let qminus (a, b) (c, d) = ((a * d - b * c), (b * d))
```

### Multiplication of Rationals
```f#
let qmult (a, b) (c, d) = ((a * c), (b * d))
```

### Division of Rationals
```fsharp
let qdiv (a, b) (c, d) = ((a * d), (b * c))
```

### String Representation of Rationals
```fsharp
let toString (a: int, b: int) = string a + "/" + string b
```

### Example Usage
```fsharp
printfn "1/2 + 1/3 = %s" (toString (qplus (1, 2) (1, 3)))
```
This line demonstrates how to use the rational number functions and print the result.

## Notes
- The rational number operations do not include simplification or error handling for division by zero.
- The `avg` function uses integer division, which may lead to unexpected results for odd sums.
- The geometric functions use `float` type for precision in calculations.