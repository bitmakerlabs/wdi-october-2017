# Request-Response Revisited
## Rendering Different Types of Responses

Data doesn't inherently have any one way of being presented. The same data can be formatted in many different ways, depending on what the client needs. So far, we've only seen HTML responses, but as our web apps grow, we'll need to provide different representations so that clients (not just web browsers!) can interact with our data in cool new ways.

## Agenda
After this lesson, you should have an understanding of:

  * Different representations of the same data
    * Why are different representations useful?
    * What is JSON?  What is CSV?
  * Application Programming Interfaces (APIs)
  * Making requests without a browser
  * Consuming different response types
  * How to serve different representations in Rails
    * How all of this affects your routes


## Different representations of the same data
* Data doesn't inherently have any one way of being presented
* For example, a book has many different representations
  * A printed version
  * An audiobook version
  * An ebook version
* There's a different way of using (or consuming) each format
  * Reading the bytes of an audiobook probably isn't useful
* There are many different ways to represent the data we store in our databases
  * Some common data types are: HTML, JSON, and CSV

## Why are different representations useful?
* Depending on the use case, you'll want to interact with your data in different ways
* For example, if you have a database full of events, you may want to:
  * Open them in Excel to do spreadsheet magic to them
  * Create a nice PDF to hand out at each event
  * List them on your website in HTML
  * Store them in your calendar using the iCal format
  * Publish the data in a machine-readable format for other people to create mash-ups

## Application Programming Interfaces (APIs)
* By now you've probably heard some mention of the term **API**
* An API is the collection of actions you can perform programmatically on any given system
* Some examples:
  * Every public method of a class is part of its API
  * All of the routes in your Rails application make up its API
  * The routes exposed by Twitter for reading and writing tweets from any site on the web is part of their API
    * When using the data from another site, we often refer to it as a **third-party API**
* Clients and servers don't need to be written by the same team as long as the API is shared publicly

## Making requests without a browser
* Browsers are not the only clients to your web applications
* Googlebot is a good example of a client that will visit your application that is not a browser
* In fact, we can write apps that request info from other apps directly
* Let's see how we can do this with Ruby!

## Consuming different response types
* Now that we can respond with different data types, we need to do something with the response
* The response is just 0s and 1s until you do something productive with it
* It's important to know what structure to expect back from your request
  * e.g. `<html>...</html>` for an HTML response
  * e.g. `"title, description, price"` for a CSV
* You need to parse the data into a format that is understood by the rest of your program

## How to serve different representations in Rails
* Rails controllers have a built-in method for responding with different representations of the same data
* `respond_to` is used to explicitly define the different data types a particular action can respond with
  * In fact, when using `respond_to`, the action will throw an exception if a data type that's not defined is requested

## How this affects your routes
* Knowing about different data formats should demystify one more thing in the `rails routes` output
* Each of the routes accepts a format at the end, which can be used to indicate which response the client wants
  * e.g. `/products/1.json` will return the JSON response rather than the HTML response for that resource
  * See how that looks like a file extension!
