# Debugging

## Intro
At least half of your time as a developer is going to be spent debugging or testing broken code.  One thing that sets apart really good developers from not so good developers is a really good developer knows that they are going to make a lot of mistakes, and knows what precautions to take in order to mitigate that.  This lesson will show you some habits and tools you can adopt to improve your adventures in debugging.

## Agenda
1. What's a bug?
2. Good habits for avoiding bugs
3. Debugging techniques
4. Using a debugger (pry) 
5. Common error messages

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

