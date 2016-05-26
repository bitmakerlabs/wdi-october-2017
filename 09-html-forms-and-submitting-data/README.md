# HTML Forms

Forms are the mechanism by which you can gather data from users.
Pretty much every web app requires a form, from simple cases like
logging users in, to more complex scenarios like gathering financial data.

We'll look at how to build a form, how a form sends its data across the wire, best practices for creating good forms, and talk about how to style a form beyond browser defaults.


## Agenda
1. The purpose and structure of a form
2. Common form elements & best practices for making good forms
3. How form data gets sent to the server & how to handle it once it's there
4. Limitations of HTML forms & how to get around them


## HTTP Method Review

Send a request to a server
e.g. GET /films

HTTP Methods
----
GET     # retrieving info
POST    # creating a new resource on the server
PUT     # replacing a resource on the server
PATCH   # update an existing resource on the server
DELETE  # delete an existing resource from the server

Examples
--------
GET
http://localhost:4567/films?title=Titanic&description=something+else

POST
http://localhost:4567/films
