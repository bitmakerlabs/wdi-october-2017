# HTTP Requests and Responses

Every time you enter a URL in your browser, you're making a request for certain information to a certain server. When your page loads, it's because you've received the response from the server with the information you requested.

The entirety of the web is designed on the concept of clients that make requests to servers and servers returning a response for the requested information.

During this lecture, we'll cover how the web works and the different parts of the HTTP (Hypertext Transfer Protocol). We'll also cover how to get started writing our very first Ruby web application using Sinatra!

## Agenda
* [Request-Response Cycle](#request-response-cycle)
* [Request Methods](#request-methods)
* [CRUD](#crud)
* [Response Codes](#response-codes)
* [Sinatra](#sinatra)

## Request-Response Cycle
* How information gets passed around on the web
* Client-server concept

### Parts of a request
* URL
* Request method
* Headers
* Body (sometimes)

### Parts of a response
* Response status code
* Headers
* Body (most of the time)

## Request Methods
Since a URL represent the location of a particular set of information, the request methods let us indicate what we want to do with it.

Common request methods:
* GET
* POST
* PUT or PATCH
* DELETE

## CRUD
* Create
* Read
* Update
* Delete

## Response Codes
Response codes let the browser know the status of the request

Response code categories:
* 1xx: Informational (not really used)
* 2xx: Success
* 3xx: Redirection
* 4xx: User Error
* 5xx: Server Error

## Sinatra
Sinatra is a mini web-framework for Ruby we'll be using to learn the different parts of web development before we dive into Rails.

### Installing sinatra
```bash
$ gem install sinatra
```

* Routes
* Params
* Views / Templates
