# JS Functions & Callbacks

As we dive deeper into JavaScript, our second programming language, we need to revisit the concept of functions (methods in Ruby). We'll spend time noting the similarities and investigating the differences with how they're defined and called in Ruby.

## Agenda

0. A short review of methods
1. Side-by-side comparison with Ruby
2. How are JS Functions different than methods?
3. Functions as 'first-class citizens'
4. Callbacks & Asynchronous code


## A short review of methods

- Methods are used to give a name to an algorithm
- The two most important things about methods are the inputs and the outputs
- A method can accept zero or more parameters as inputs
- Parameters are local to the method
- The name of the method and it's list of parameters make up its signature
- Every method returns something to the caller


## Side-by-side comparison with Ruby

|   Ruby  |   JS    |
|---------|---------|
|Defined with the `def` keyword|Defined with the `function` keyword|
|All parameters must be specified when called|Parameters are not required|
|Implicit and explicit return values|Explicit return value only (otherwise `undefined`)|
|One way to define a method|Two ways to define a function: function declaration and function expression|

## How are JS Functions different than methods?

- Functions in JS are **first-class citizens** of the language
- More technically speaking, they're referred to as **first-order functions**
- This means that a function can be:
  - Stored in a variable
  - Passed as an argument to another function
  - Returned from a function
- They're treated like all of the other basic data types (AKA primitive data types)
