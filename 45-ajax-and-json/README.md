# AJAX and JSON

Today we look at how to add Ajax to a Rails app by converting an existing simple non-Ajax app into an Ajax-enabled app.

## Agenda

* Brief Rails review with the Robots App (15 mins)
* Converting Robots App to Ajax (100 mins)

## Robots App

* Demo of the Robots App
* The `Robot` model, the `RobotsController`, and associated views.
* Where does the app's Javascript go? 
  * Answer: `app/assets/javascripts`
* Where does the app's Stylesheets go?
  * Answer: `app/assets/stylesheets`
* Asset Pipeline

## Converting Robots App to Ajax

* Client Side:
  * `preventDefault()`
  * `$(this)`
  * Parsing JSON into the DOM
* Server Side:
  * Rendering with `layout: false`
  * `respond_to` different data types

## Links

* [`jQuery.ajax()` Documentation](http://api.jquery.com/jquery.ajax)
