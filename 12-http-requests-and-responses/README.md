# HTTP Requests and Responses

Every time you enter a URL in your browser, you're making a **request** to a web server. When the page you requested appears in your browser, it's because you've received the **response** from the server.

The entire web is designed on the concept of clients that make requests to servers and servers returning a response for the requested information.

During this lecture, we'll cover how the web works and the different parts of the **HTTP** (Hypertext Transfer Protocol). We'll also cover how to get started writing our very first Ruby web application!

## Agenda

* [Intro](#intro) (< 5 mins)
* [Request-Response Cycle](#request-response-cycle) (30 min)
* [Request Methods](#request-methods) (15 min)
* [CRUD](#crud) (5 min)
* [Response Codes](#response-codes) (5 min)
* [Sinatra](#sinatra) (60 min)

## Intro

* Recap of testing
* Intro of Requests and Responses

## Request-Response Cycle

* How information gets passed around on the web
* HTTP
* Client/Server concept
* Examples of making requests and getting reponses in the real world. e.g. Restaurant server, bank teller, post office.

### Parts of a request

* URL
* Request method
* Headers
* Body (sometimes)

### Parts of a response

* Response status code
* Headers
* Body (most of the time)

### Statelessness

## Request Methods/HTTP Verbs

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

How the HTTP Verbs relate to CRUD:

HTTP Verb | Action   | Explanation
----------+----------+-------------
POST      | (C)reate | Create data
GET       | (R)ead   | Fetch data
PUT/PATCH | (U)pdate | Update data
DELETE    | (D)elete | Delete data

## Response Codes

Response codes let the browser know the status of the request

Response code categories:

* 1xx: Informational (not really used)
* 2xx: Success
* 3xx: Redirection
* 4xx: User Error
* 5xx: Server Error

Most important:

* 200: OK
* 301: Moved Permanently
* 302: Found
* 403: Forbidden
* 404: Not Found
* 500: Internal Server Error
* 503: Service Unavailable

## Sinatra

Sinatra is a mini web-framework for Ruby we'll be using to learn the different parts of web development before we dive into Rails.

### Installing Sinatra

```bash
$ gem install sinatra
```

* Routes (Only GET for now)
* Params
* Views / Templates

## Links

* [Slides](http://bitmakerlabs.s3.amazonaws.com/slides/cohort9/HTTP.pdf) - These are old slides and are for Reference Only
* [404 Not Found images](https://google.com/search?q=404+not+found&tbm=isch)
* [500 Internal Server Error images](https://google.com/search?q=500+internal+server+error&tbm=isch)
* [Wikipedia: List of HTTP Status Codes](https://en.wikipedia.org/wiki/List_of_HTTP_status_codes)
* [Wikipedia: CRUD](https://en.wikipedia.org/wiki/Create,_read,_update_and_delete)
* [Sinatra](http://www.sinatrarb.com)
* [Rack](http://rack.github.io)
* [Wikipedia: Domain-Specific Language](https://en.wikipedia.org/wiki/Domain-specific_language)
