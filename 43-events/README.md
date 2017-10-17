# Events, Callbacks & Closures

## Agenda

1. How events work in the browser
2. How to react to an event with JavaScript
3. The Event object
4. Using delegated events to bind handlers to new DOM elements


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


## How to react to an event in JavaScript
- JavaScript makes it simple to attach some code, in the form of a function, that will execute when an event occurs on a particular DOM element
  - This is called **binding an event handler** to an element
  - The function is referred to as the event handler or callback
- Every time the event occurs, your event handler function will be executed

## The Event Object
- The event handler will be passed an Event object that contains information about the event that occurred
- The Event object also has methods that allow you to control whether the event bubbles up the DOM (event.stopPropagation()) and whether the browser's default behaviour for that event should occur (event.preventDefault())


## Using delegated event handlers
- Sometimes you'll need to attach an event handler to an object that's dynamically created through JavaScript
- Attaching event handlers to each newly created object is not always possible or desirable
  - There can be performance implications if you're creating a lot of event handlers
  - Often if you're dynamically creating new DOM elements, you want the same behaviours attached to all of those same elements
- We can make this simple by attaching the event handler to a parent element that's in the document when the page loads and leveraging event propagation to run the event handler when an event happens on any of its children
- This is called a **delegated event handler**
