# HTML Forms

## Intro
Forms are the mechanism by which you can gather data from users.  Pretty much every web app requires a form, from simple cases like logging users in, to more complex scenarios like gathering financial data.  

We'll look at how to build a form, how a form sends its data to the server, best practices for creating good forms, and briefly talk about how to style a form beyond browser defaults.


## Agenda
1. The purpose and structure of a form
2. Common form elements & best practices for making good forms
3. How form data gets sent to the server & how to handle it once it's there
4. Limitations of HTML forms & how to get around them

## Overview of forms (less than 5 minutes)
- forms are for collecting data from users
- submitting a form generates an HTTP request, same as clicking a link
- `action` and `method` attributes

## Fields (45 minutes)
- note: warn students that it's probably best not to try to code along with this part due to all the repetitive and finicky syntax (instead they should just pull the code after the break)
- make sure to emphasize accessibility & usability

 `<input type="text" name="title" value="" id="film-title" placeholder="eg. My Neighbour Totoro">`
 `<label for="film-title">Title:</label>`

 ```
  <!-- <input type="date" name="name" value="">
  <input type="time" name="name" value="">
  <input type="number" name="name" value="">
  <input type="email" name="name" value="">
  <input type="tel" name="name" value="">
  <input type="url" name="name" value="">
  <input type="color" name="name" value="">
  <input type="search" name="name" value="">
  <input type="range" name="name" value="">
  --->
```

 `<label for="film-description">Synopsis:</label>`
 `<textarea name="description" id="film-description"></textarea>`

```
  <label for="film-country">Country:</label>
  <select name="country" id="film-country">
    <option value="">Pick a country</option>
    <option value="CA">Canada</option>
    <option value="GB">United Kingdom</option>
    <option value="JP">Japan</option>
  </select>
```

- talk about the joys of styling form elements :(

```
  <fieldset>
    <legend>Rating</legend>
      <label>
        1 Star
        <input type="radio" name="rating" value="1">
      </label>

      <label>
        2 Stars
        <input type="radio" name="rating" value="2">
      </label>

      <label>
        3 Stars
        <input type="radio" name="rating" value="3">
      </label>

      <label>
        4 Stars
        <input type="radio" name="rating" value="4" id="rating-4">
      </label>
  </fieldset>
```
```

  <fieldset>
    <legend>Genre</legend>

    <label>
      Animated
      <input type="checkbox" name="genre[]" value="animated">
    </label>

    <label>
      Drama
      <input type="checkbox" name="genre[]" value="drama">
    </label>

    <label>
      Comedy
      <input type="checkbox" name="genre[]" value="comedy">
    </label>

    <label>
      Documentary
      <input type="checkbox" name="genre[]" value="documentary">
    </label>
  </fieldset>
```

 `<!-- <input type="file" name="name" value=""> -->`

 `<!-- <input type="hidden" name="loyalty-points-code" value="wz45435"> -->`

 ```
  <!-- <input type="submit" value="Go!"> -->
  <button type="submit">
    <img src="http://placekitten.com/100/100" alt="a kitten" />
    Go!
  </button>
 ```

--- BREAK ---


## HTTP Method Review (10 minutes)

- reiterate that submitting form generates HTTP request and attaches data from form
- review `action` and `method` attributes

HTTP Methods
----
GET     # retrieving info
POST    # creating a new resource on the server
PUT     # replacing a resource on the server
PATCH   # update an existing resource on the server
DELETE  # delete an existing resource from the server

### POST (15 minutes)
- demo what happens without changing server code (show dev tools, **params hash**)
- add server-side code to make it work

```
post '/films' do
  Film.create(params)
  # don't do this!
  # erb :index

  # do this instead
  redirect to('/')
end
```
- first show `erb :index` and the problems it causes (refreshing = resubmitting, sharing link doesn't work), then show how `redirect to('/')` solves these issues

### GET (5-10 minutes)
- demo submitting form as a GET request: show dev tools, params hash
- look at query string params (shareable search results!)

### PUT/PATCH, DELETE (5-10 minutes)
 `<!-- <input type="hidden" name="_method" value="delete"> -->`
 `<!-- <input type="hidden" name="_method" value="put"> -->`

- show how server treats these as PUT, DELETE requests even though dev tools in browser shows request was a POST

## Summary (5 minutes)
- Forms are for gathering data from users
- Submitting a form generates an HTTP request as dictated by `action` and `method` attributes
- Many types of form fields and how to make them accessible to all users (don't worry about memorizing)
- Pains of styling forms
- When to use GET vs POST
- What to do with data on the server side after it has been submitted
- `params`
- redirecting vs rendering
