# JavaScript Fundamentals

In this lesson, we'll be covering the origins of JavaScript, as well as some the basic language constructs.

Bounce between explanation (on slides) and coding some examples in skeleton.js .

## Agenda - 5 minutes
After this lesson, you will know:

  * Data types and built-in functions
  * Using JS in HTML
  * Variable assignment
  * Flow control
  * Loops
  * Defining our own functions

Slides here: https://docs.google.com/presentation/d/15qjYctB823Jd3Bp7b89SiZkWXWfCn6g7xFGl9RjRfbM/edit

## What is JavaScript/where does it run? - 5 minutes

  * Show the MDN description of JS
  * Talk about the browser and why JS is such a big deal.
  * Mention node.js.
  * JavaScript is not Java! (not allowed to abbreviate JS to 'Java')

## Ruby vs JavaScript - 5 minutes

  * Show examples.js side-by-side with examples.rb (pick a good spot to show, eg. simple for loop section)
    * What looks different? (eg. `var` used for variables)
    * What looks the same? (much more open)
  * JavaScript is more syntax-heavy (eg. curly braces)


#### --- From this point on, bounce between slides and working through skeleton.js. examples.js is there as a reference if you need it.

## Data types - 5 minutes

  * different data types
  * use of `var`
  * use semi-colons! Always!

## Control Flow - 15 minutes

  * `if` statement, `switch`, `for` loop, `while` loop
  * Equality in JavaScript
    * use triple equals! (5 minutes - make this super clear)

## Functions - how to write them - 10 minutes
  * Call them functions instead of methods in JavaScript
  * Function declaration
  * Function expression
  * Anonymous functions

## Scope - 15 minutes

  * Local (function based)
  * Global
    * `window.varname` (in the browser)
    * `global.varname` (in node)
    * declare a variable without `var`
  * Always use `var`!!!


#### --- 5-10 minute break here ---

## Callbacks - 15 minutes

  * keep this very basic! Just an intro before a future lesson.
  * Functions passed into other functions.
    * Why would we want to do this? When we want to follow a set of instructions *later*.

## JavaScript Objects - 15 minutes

  * like hashes in Ruby!
  * JSON (briefly) - just a notation!
  * Can do obj.attrName instead of obj['attrName'] - Ruby can't do this!

## Asynchronous - 15 minutes

  * Keep this basic! Just an intro.
  * Use timer example - we want this code to run later.
  * Pass a callback to do it (just a function with instructions).
  * Show that code will not run in order.


## Wrap-up - 5 minutes

  * JavaScript gotchas
  * Why is JavaScript a big deal?
