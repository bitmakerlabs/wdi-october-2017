# Methods and Collections

## Atom Overview

- Setting the language for the current file
- Setting spaces vs tabs for indentation

## Collections

- A collection is a grouping of objects
- In Ruby, you can make collections comprised of different types of objects
- Usually we group things into collections because they are somehow related
- Performing operations on collections of objects is one area computers provide a lot of benefit
  - In particular, performing **the same operation** on each item in a collection is where we'll get the most benefit
- The two main types of collections in Ruby are **Arrays** and **Hashes**
- They are both collections of things that can be counted
  - Something that can be counted is **Enumerable**
  - We'll revisit this idea with both Arrays and Hashes

## Methods

- A method is a named sequence of instructions
- Some programming languages refer to it as a function
- It *encapsulates* logic for re-use
  - Basically, it allows us to write code once, and reuse it in multiple places
  - A building block toward Don't Repeat Yourself (DRY)
  - Improves maintainability of our code when there's only one point of failure

### Variable Scope

- Local variables are only visible to the other statements at the same level

### Inputs & Outputs

- When creating a method the two things you want to think about at first are:
  - What are the inputs required to do the work inside the method?
  - What do I want to get out of the method?
- Every method returns something
- The last line of a method in Ruby will be the return value if you don't otherwise specify the return value explicitly
  - That's referred to as the implicit return value
- You can use the `return` keyword to return a value explicitly

- If you're not careful, your method will return nil
- That's not a particularly useful result for anyone using your method


## Code Style Guide

- Code must be indented within blocks
- Spaces around operators (=, +, =>, etc.)
- No space between method name and parameter list
  - DO: def method(something)
  - DON'T: def method (something)
- Spaces after commas in lists
