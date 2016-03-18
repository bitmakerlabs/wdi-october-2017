# Turbolinks, JSON & JS Templates

## Agenda
After this lesson, you'll know:

  * The purpose of Turbolinks
  * Advantages of using Turbolinks
  * Important caveats to using Turbolinks
  * Returning JSON responses
  * Consuming JSON responses in JS
  * Using JS templates

# How Turbolinks Works

## WITHOUT TURBOLINKS

**GET /products/2**

--> Router --> ProductsController --> #show --> /app/views/products/show.html.erb

Build the response using the layout

--> application.html.erb
  --> show.html.erb

### SENDS THE RESPONSE

``` html
<html>
  <head>
    <script src="application.js"></script>  (1)
    <link href="application.css">           (2)
  </head>
  <body>
    ...
  </body>
</html>
```

### BROWSER INTERPRETS THIS
- (1) GET /application.js
- (2) GET /application.css

Adding HTTP requests to the loading of your page
Each HTTP request adds a bunch of over overhead

Overhead?
  - Create a request
  - Send the request
  - Wait for the response
  - Download x bytes that represents the response
  - Parse the response


## WITH TURBOLINKS

**AJAX REQUEST to GET /products/2**
--> Router --> ProductsController --> #show --> /app/views/products/show.html.erb

SENDS THE RESPONSE

... (whatever was in show.html.erb)

AJAX "done" event handler will **replace** the `<body>` with the response
