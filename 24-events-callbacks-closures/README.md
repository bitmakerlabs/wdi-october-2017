# Events, Callbacks & Closures

## Agenda

1. How events work in the browser
2. How to react to an event with jQuery
3. Variable scope, revisited
4. Closures
5. Using delegated events to bind handlers to new DOM elements


## How events work in the browser
- There are many different events that can fire in the browser
  - click
  - keyup, keydown, keypress
  - mousein, mouseout, mouseover, mousemove
  - touch
  - scroll
  - load
- Events generally bubble up the DOM from the spot where they originate from
  - This means that every parent element will be notified that an event occurred and will have the opportunity to respond


## How to react to an event in jQuery
- jQuery makes it simple to attach some code, in the form of a function, that will execute when an event occurs on a particular DOM element
  - This is called **binding an event handler** to an element
  - The function is referred to as the event handler or callback
- Every time the event occurs, your event handler function will be executed
- The event handler will be passed an Event object that contains information about the event that occurred
- The Event object also has methods that allow you to control whether the event bubbles up the DOM (event.stopPropagation()) and whether the browser's default behaviour for that event should occur (event.preventDefault())


## Variable scope, revisited
- Variables declared with the var keyword have function-level scope in JavaScript
  - You should always declare your variables with the var keyword!
- Variables declared without the var keyword have global scope
  - You shouldn't be adding many variables to the global scope if possible
  - This is referred to as "polluting the global namespace"

## Closures
- Functions are first-class objects in JavaScript
- You can pass them as parameters to other functions, and...
- You can define a function within a function!!!
  - This is referred to as a **Closure**
  - This may seem useless at first, but it comes up a lot in JavaScript because of its asynchronous, event-driven nature
- Closures can be a tricky concept to understand, but it's important to accomplishing anything non-trivial in JavaScript
- The inner function will have access to all the variables defined in its parent functions at the time of its definition
- This is best seen through an example
- You'll need this concept often when you deal with AJAX requests (starting next week)

