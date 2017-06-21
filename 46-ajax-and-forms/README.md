# AJAX and Forms

Today, we'll learn how to work with Rails and AJAX and all the different ways we can do that. We'll learn how to submit forms!

Clone: git@github.com:bitmakerlabs/wdi-ajax-forms.git

## Agenda - 3 minutes
After this lesson, you should have an understanding of:

  * Binding event handlers to a form
  * Serializing form data for an AJAX request
  * Sending AJAX requests with request methods other than GET
  * Responding to form posts via AJAX

## The current app - 10 minutes

* The app already works - we just need to use AJAX to make it nicer!
* Allows the user to submit a greeting.
  * The greeting will be saved in the database.
  * All the greetings are displayed on the main page in descending order of creation.

* What is the flow through the Rails app? Go through each piece.

## The Plan - 2 minutes

* Add JS to catch the form submission, stop it, and let us do it with AJAX.
* Place a new list item on the page.
* Update any back-end code to provide the response we need.

## The Asset Pipeline - 10 minutes

* We need to add JavaScript to make this work.
* application.js/application.css manifests
* Rails Guide: http://guides.rubyonrails.org/asset_pipeline.html

## AJAXifying the front-end with JavaScript - 25 minutes
* document.ready callback
* catch the event
* $.ajax - url, method, dataType, data
  * use simple values for these to start (eg. action: '/greetings'), no dataType
* .done(), .fail(), .always()
  * make sure to include a .fail() callback to catch our mistakes!
* Test it at every stage!
* What do our responses look like? What's wrong with them?

*From this point on, bounce back and forth between the front-end and the back-end*

## Break - 5-10 minutes

## The response - 30 minutes
* Break somewhere here (5-10 minutes)
* Take a closer look at the controller. Why is it giving a strange response?
* Send some plain text back (just to mess around)
* Try sending some HTML - **this is one major approach**
* Respond with JSON - **this is another major approach**

* How does our front-end change when we change the response?

## Minimizing duplicated code - 10 minutes
* use a partial for a 'greeting' for both the response and the view

## Returning multiple response types - 15 minutes
* https://www.reddit.com/r/aww/ vs https://www.reddit.com/r/aww.json
* Used when we want to build an API
* return text, JSON, and HTML
* Experiment with dataType on the front-end
  * log the results - what else is dataType doing?

## Clean up our form - 5 minutes
* Take advantage of the fact the the form already works just fine without AJAX!
* Reference form attributes to allow for better maintainability of our front-end
* use serialize()

## Wrap-up - 5 minutes
* Front-end frameworks exist to make this easier
  * avoid code duplication!
* other questions?
