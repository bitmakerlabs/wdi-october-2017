# Intro to AJAX

Today we introduce Ajax, the last major conceptual piece of building a modern web application. 

## Agenda

* Requests and Responses Review (10 mins)
* Intro to Ajax (45 mins)
* Code Example (60 mins)

## Requests and Responses Review

* HTTP Basics
* Synchronous vs Asynchronous

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

* Unobtrusive Javascript

## Code Example

* [Monsters API](monsters-api.herokuapp.com/monsters) Example
* Anatomy of an AJAX request
  * An event happens!
  * Javascript makes request (method/action/verb, URL, data type, body(sometimes))
  * Server responds to JS request (needs to respond to requested data type (HTML, JSON, JS), if HTML (partial))
  * Back in Javascript: a callback function does DOM manipulation to insert response back into document

## Progressive Enhancement / Graceful Degradation

* [Sigh, JavaScript](http://sighjavascript.tumblr.com)

## Links

* [HTTP Diagram](http://wiki.hashphp.org/images/6/67/HTTP_Model.jpg)
* [Classic vs Ajax Web Application Model](http://adaptivepath.org/uploads/archive/images/publications/essays/ajax-fig2.png)
* [Ajax: A New Approach to Web Applications](http://adaptivepath.org/ideas/ajax-new-approach-web-applications/)
* [JSON Example](http://json.org/example.html)
* [`jQuery.ajax()` Documentation](http://api.jquery.com/jquery.ajax)