# Debugging & Testing in Ruby

## Intro
At least half of your time as a developer is going to be spent debugging or testing broken code.  One thing that sets apart really good developers from not so good developers is a really good developer knows that they are going to make a lot of mistakes, and knows what precautions to take in order to mitigate that.  This lesson will show you some habits and tools you can adopt to improve your adventures in debugging and testing code, and introduce you to the concept of automated tests.

## Agenda
1. What's a bug?
2. Good habits for avoiding bugs
3. Debugging techniques
4. Using a debugger (pry) 
5. What is testing?
6. Testing methodologies
7. Using a testing framework (MiniTest)

## What is a bug? (less than 5 minutes)
- Code that won't run at all (error message)

- Code that runs but doesn't behave the way you expect

- History of the word bug (optional)

![Grace Hopper's notebook recording the first bug](https://www.wired.com/images_blogs/wiredscience/2013/12/moth-660x548.jpg)

## Debugging

### Good habits for avoiding bugs (5-10 minutes)
- Brainstorm with class then refer to [slides](https://s3.amazonaws.com/bitmakerhq/lessons/web-development/2016-08-team-johnny5/debugging_testing.pdf)



### Debugging techniques (5-10 minutes)
- Brainstorm with class then refer to [slides](https://s3.amazonaws.com/bitmakerhq/lessons/web-development/2016-08-team-johnny5/debugging_testing.pdf)




### Tools for debugging
[Pry](http://pryrepl.org/)

Installation:

```
gem install pry
rbenv rehash
```

- What is a debugger? (less than 5 mins)
  - [Sidenote: What is a gem?](https://rubygems.org/) (Less than 5 mins)

Demo how to set pry breakpoints in order to fix broken code in `rover.rb`. (10 mins)

Interactively debug broken code in `game.rb` and `player.rb`. (20 mins)


---
break
---

## Testing

### What is testing? (5 mins)
- Tests are a way of trying to verify that your code works the way you think it should
- Tests do not prove that your code is correct

- Types of testing (manual, automated)
- Testing philosophies (no testing, verification testing, test-first, TDD)

See [slides up to and including "testing philosophies"](https://s3.amazonaws.com/bitmakerhq/lessons/web-development/2016-08-team-johnny5/debugging_testing.pdf)

### Minitest (10 mins)
- Anatomy of a Minitest test (example from contact test suite)
  - `require`
  - inheritance
  - setup, tear down
  - naming convention
- How to read output (pass, fail, error)
- What it looks like when tests fail

## TDD Example (10 mins)
- `f_to_c`
- tests for positive numbers, negative numbers, and zero
- 50F/10C and -4F/-20C are nice round numbers to use

## Verification Testing Example (5-10 mins)
- `c_to_f`
- again include tests for positive numbers, negative numbers, and zero

### More Testing Theory (10 mins)
- Why test?
- Qualities of a good test
- Levels of tests
- Functional vs non-functional tests
See [rest of slides](https://s3.amazonaws.com/bitmakerhq/lessons/web-development/2016-08-team-johnny5/debugging_testing.pdf)



## Summary (less than 5 mins)

- Writing broken code doesn't mean you've failed - it's just part of the process
- Using a debugger like pry should become an essential part of your workflow
- Testing your code is just as important as writing it in the first place

## Today's assignments (less than 5 mins)
- Getting contact tests to pass is the top priority
- Submit testing with ruby assignment as soon as you've done the first 4ish parts and continue to come back to the remaining parts throughout the rest of the course as time permits
- Make sure you read the test code before trying to write the code to make it pass - pay attention to arguments, return types, and the surrounding comments
- `rake` is the command to run tests in one subdirectory
