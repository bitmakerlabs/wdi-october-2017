# Intro to AJAX

## Agenda
  * What is AJAX, history
    * What is asynchronous?
  * Unobtrusive JavaScript
  * AJAX with XMLHTTPRequest (xhr)
  * AJAX with jQuery
  * "respond_to" JS

## What is AJAX?

http://wiki.hashphp.org/images/6/67/HTTP_Model.jpg

A - Asynchronous: Non-blocking communication
J - JavaScript
a - and
X - XML (HTML, JS, JSON, etc.)

http://imps.mcmaster.ca/courses/SE-4C03-07/wiki/vanschj/vanschj_picture1.png

## Unobtrusive JavaScript

## Graceful degradation
(Sigh, JavaScript)[http://sighjavascript.tumblr.com/]

## Add search feature to Rainforest
To the code!

## Anatomy of an AJAX request
* an event happens!
1. Javascript makes request (method/action/verb, URL, data type, body(sometimes))
2. Server responds to JS request (needs to respond to requested data type (HTML, JSON, JS), if HTML (partial))
3. Back in JS: callback (DOM manipulation to insert response back into document)
