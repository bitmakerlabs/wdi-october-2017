# Intro to AJAX

Today we introduce Ajax, the last major conceptual piece of building a modern web application.

## Agenda

* Requests and Responses Review (10 mins)
* Intro to Ajax (30 mins)
* Code Example (75 mins)

## Requests and Responses Review

* HTTP Basics
* [Classic vs Ajax Web Application Model](http://adaptivepath.org/uploads/archive/images/publications/essays/ajax-fig1.png)
* [Synchronous vs Asynchronous Web Application Model](http://adaptivepath.org/uploads/archive/images/publications/essays/ajax-fig2.png)

## Intro to Ajax

* History of Ajax
* What is Ajax
  * A - Asynchronous: Non-blocking communication
  * J - JavaScript
  * A - and
  * X - XML (HTML, JS, JSON, etc.)
* Ajax with XMLHttpRequest (i.e. xhr)
* Ajax with JQuery
  * 90% case:

```javascript
$.ajax({
  url: _____,
  method: _____,
  data: _____,
  dataType: _____
});
```

## Code Example

* Unobtrusive Javascript
* Query String Parameters
* [Monsters API](monsters-api.herokuapp.com/monsters) Example
* Anatomy of an AJAX request
  * An event happens!
  * Javascript makes request (method/action/verb, URL, data type, body(sometimes))
  * Server responds to JS request (needs to respond to requested data type (HTML, JSON, JS), if HTML (partial))
  * Back in Javascript: a callback function does DOM manipulation to insert response back into document

## Progressive Enhancement / Graceful Degradation

* Accessibility concerns
* [Sigh, JavaScript](http://sighjavascript.tumblr.com)

## Links

* [HTTP Diagram](http://wiki.hashphp.org/images/6/67/HTTP_Model.jpg)
* [Ajax: A New Approach to Web Applications](http://adaptivepath.org/ideas/ajax-new-approach-web-applications/)
* [JSON Example](http://json.org/example.html)
* [`jQuery.ajax()` Documentation](http://api.jquery.com/jquery.ajax)