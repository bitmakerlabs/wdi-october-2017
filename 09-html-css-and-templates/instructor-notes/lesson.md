### Reminder: Start Recording With Quicktime

# CSS Box Model and Templates

## Agenda

* HTML Fundamentals:
	- Elements
	- Tags
	- Attributes
* What is CSS?
* Linking to the Stylesheet from our HTML
* CSS Selectors
* Chrome Dev Tools
* Block and Inline Elements
* Box Model:
	- Margin
	- Border
	- Padding
	- Content
* Box-Sizing
* Fonts
* Colours
* Cascading Style Sheets
* Templates in Sinatra
* Learning Resources:
	- HTML
	- CSS
	- Sinatra


## HTML Fundamentals*

### Element

An element in HTML represents some kind of structure or semantics and generally consists of a start tag, content, and an end tag.

For Example:

```html
<p>
	This is the content of the paragraph element.
</p>
```

### Tag

- Used to mark the start or end of an HTML element
- May or may not contain attributes
- End tags consist of an opening angle bracket followed by a forward slash, the element name, and a closing angle bracket:

In this example, a <p> tag is used to open a close the paragraph:

```html
<p>
	I am a paragraph.
</p>
```

In this example, a single <br> tag is all that's needed to insert a line break:

```html
I am line one.<br>I am line two and will appear in the browser on the line below line one.
```

The content above appears like so:

```
I am line one.
I am line two and will appear in the browser on the line below line one.
```

Older XHTML syntax uses a `/` (slash) within the tag to denote both starting and ending:

For example, instead of:

```html
<br>
```

```html
<br /> or <br/>
```

- I prefer no slash: `<br>`

### Attributes

- An attribute defines a property for an element
- It consists of an attribute / value pair
- They appear within an element's start tag. An element's start tag may contain any number of attributes

For example, in this link element, `href` is the attribute and `http://bitmaker.co` is the value:

```html
<a href='http://bitmaker.co'>Bitmaker Homepage</a>
```

*source: http://www.456bereastreet.com/archive/200508/html_tags_vs_elements_vs_attributes/


## Bonus Reminder: Are you recording with Quicktime?

## What is CSS?

CSS is an acronyym for Cascading Style Sheets

Generally speaking:

- HTML is our content
- CSS is how we present our content
- http://www.csszengarden.com/ demonstrates how the look of a site can vary even though the content is the same (only the CSS and images differ for each page)


## Today's Lesson's Exercise: Peter Parker's Resume

### This is how his resume will look after we're finished:
file:/Users/sean/Desktop/wdi-october-2016/09-css-box-model-and-templates/peter_parkers_resume/final/index.html


### Setup for this lesson:

#### Step 1
- find the `git@github.com:bitmakerlabs/wdi-october-2016` repo on your computer and:

```bash
git pull
```
  or

- create a new repo of wdi-october-2016:

```bash
git clone git@github.com:bitmakerlabs/wdi-october-2016
```


#### Step 2
- open folder in your editor:

```bash
atom wdi-october-2016/09-css-box-model-and-templates/peter_parkers_resume/student/
```


#### Step 3
- Verify you have three files to work with:
    - index.html <-- this is our HTML page
    - styles.css <-- this is our CSS Stylesheet
    - spidey.png

#### Step 4
- open index.html in your web browser


### After setup, here is our page unstyled:
file:/Users/sean/Desktop/wdi-october-2016/09-css-box-model-and-templates/peter_parkers_resume/instructor/index.html


## Linking to the Stylesheet from our HTML

- add a very obvious style to your stylesheet to test if your style is working:

```css
/* style.css */
body {
  background: yellow;
}
```

- save your style.css file (CMD-S on mac)
- go back to your browser (CMD-Tab on mac)
- refresh your browser (CMD-R on mac)

Did the style take?  No, as there is no link in our html to the stylesheet.

- add the following to your index.html file

```html
<!-- index.html -->
<link rel="stylesheet" href="styles.css">
```

- save your index.html file
- go back to your browser
- refresh your browser

It should have a yellow background now! This means we've successful told our html where to find it's stylesheet.

Let's remove that yellow test style now:

- remove the body yellow style
- save style.css
- refresh browser
- browser should have a white background again


## CSS Selectors

### Selecting by Element

Format is:

```css
element {
  property: value;
}
```

For example, on my Cupcake Ipsum page:

file:/Users/sean/Desktop/wdi-october-2016/09-css-box-model-and-templates/cupcake-ipsum/instructor/index.html

My footer doesn't have a colour!

```css
footer {
  background: tomato;
}
```

### Selecting by Class

- many elements on a page can have the same class
- an element can have many classes
- define a class for an element by adding it as an attribute

For example, in your html, this:

```html
<li><a href='http://bitmaker.co'>My Awesome Link</a></li>
<li><a href='http://google.com'>My 2nd Awesome Link</a></li>
<li><a href='http://yahoo.com'>My 3rd Awesome Link</a></li>
```

Becomes:

```html
<li class='nav-item'><a href='http://bitmaker.co'>My Awesome Link</a></li>
<li class='nav-item'><a href='http://google.com'>My 2nd Awesome Link</a></li>
<li class='nav-item'><a href='http://yahoo.com'>My 3rd Awesome Link</a></li>
```

And in your CSS, use `.` before classname to target:

```css
.nav-item {
  color: purple;
}
```

You can combine elements and classes when selecting:

```css
li.nav-item {
  color: purple;
}
```


### Selecting by Id

- elements can only have one id
- an id should be unique to the element (i.e. no other element on the page should have the same id)
- define an id for an element by adding it as an attribute

For example, in your html, this:

```html
<li class='nav-item'><a href='http://bitmaker.co'>My Awesome Link</a></li>
<li class='nav-item'><a href='http://google.com'>My 2nd Awesome Link</a></li>
<li class='nav-item'><a href='http://yahoo.com'>My 3rd Awesome Link</a></li>
```

Becomes:

```html
<li id='bitmaker-link' class='nav-item'><a href='http://bitmaker.co'>My Awesome Link</a></li>
<li id='google-link' class='nav-item'><a href='http://google.com'>My 2nd Awesome Link</a></li>
<li id='yahoo-link' class='nav-item'><a href='http://yahoo.com'>My 3rd Awesome Link</a></li>
```

And in your stylesheet, use `#` before classname to target:

```css
 #nav-item {
   color: purple;
 }
```

You can also combing targeting elements with an id:

```css
li#bitmaker-link {
  color: purple;
}
```

### Selecting using a combination of elements, classes and ids:

```css
main section#education p {
  background: blue;
}
```

### Selecting Multiple Items at once:

- Separate them with a comma:

```css
h1,
h2,
h3,
main section#education p,
li.nav-link,
p#special-content {
  background: yellow;
}
```

### You can target everything on the page with *

```css
* {
  margin: 0;
  padding: 0;
}
```

## Chrome Dev Tools

- open them up:
  - Option-CMD-I (on a mac)

        or

  - from the menu: View -> Developer -> Developer Tools

        or

  - right click on the page -> Inspect

- you can dock the tools along the side, bottom, or as a separate window

- various panels have different applications

- we'll mainly be using the `Elements` panel for styling, along with the `Styles` sub-panel

- To select a specific part of the page:

  - CMD-Shift-C (on a mac)

  or

  - use the arrow-square icon

- select an element by hovering over it

- i'll change the background color of my footer to `hotpink`


## Block and Inline Elements

### Default Behavior:

Block: sizes to the width of the screen

Inline: sizes to the width of the content

- most elements on the Cupcake Ipsum Demo page area block elements, and the background colour takes up the entire width of those elements

- the `<b>` elements are inline, and thus the background colour only takes up the width of the content

### Overiding Behavior:

We can override the display property with `display: block` and `display: inline`

For example, say we would like the nav items to display on a single line:

```css
li {
  display: inline;
}
```

And we would like the first word of each paragraph to be on it's own line. As each first word has a `<b>` tag around it, we could target it:

```css
b {
  display: block;
}
```

### Common Block Elements

```html
<div>  <--- defacto non-semantic element
<header>
<main>
<footer>
<section>
<h1>, <h2>, <h3>, <h4>, <h5>, <h6>
<nav>
<ul>, <ol>
<li>
<form>
<p>
<video >
```

### Common Inline Elements

```html
<span> <--- defacto non-semantic element
<a>
<img>
<b>
<i>
<button>
<input>
```

### Spidey Demo

- let's put our main nav items on the same line:

```css
.nav-item {
  display: inline;
}
```

- and our social media nav:

```css
ul#social li {
  display: inline;
}
```

- this looks like a good candidate for keeping our code DRY (don't repeat yourself):

```css
.nav-item,
ul#social li {
  display: inline;
}
```


## Box Model: Margin, Border, Padding and Content

file:///Users/sean/Desktop/CSS%20Box%20Model%20and%20Templates/CSS%20Box%20Model/Box%20Model.gif

- every visiable element in the body of an html page is made up of content, padding, border and margin

- we can use a single value with margin and padding if we want the margin or padding is the same around the element:

```css
margin: 20px;
padding: 20px;
```

We can also specify top, bottom, left, and right:

```css
margin-top: 50px;
margin-bottom: 60px;
margin-left: 70px;
margin-right: 80px;
```
or

```css
padding-top: 10px;
padding-bottom: 20px;
padding-left: 30px;
padding-right: 40px;
```

We can specify top, bottom, left and right on the same line by giving it four values ordered:

```css
property: top_value right_value bottom_value left_value;
```
(follow clockwise starting from top)

```css
padding: 10px 40px 20px 30px;
margin: 50px 70px 60px 80px;
```

We can specify top and bottom together, and left and right together by providing to values:

```css
padding: 5px 10px; /* this pads the top and bottom 5px, and the left and right 10px */
margin: 5px 10px;
```

- we can also provide three values to effect the top and bottom separately, but keep the same right a left;

```css
padding: 5px 20px 10px; /* this pads the top: 5px, bottom: 10px, right: 20px and left 20px */
margin: 5px 20px 10px;
```

- to give elements a border:

```css
border: 2px solid black;
```

### Spidey Demo: Margin, Padding and Borders

#### Reset margin and padding:

```css
* {
  margin: 0;
  padding: 0;
}
```

#### Now let's add a margin between the main sections:

```css
header,
main,
footer {
  margin: 20px;
}
```

#### We can use margin auto to center the entire page:

```css
.container {
  width: 600px;
  margin-left: auto;
  margin-right: auto;
}
```

#### We'll give our image a nice border:

```css
 #bio {
   border: 2px solid lightgrey;
 }
```

#### And let's make the background of the header the same colour:

```css
 h2 {
   background: lightgrey;
 }
```

#### All our H2s are light grey now. How do we target just the H2 within the Bio area?

```css
 #bio h2 {
   background: lightgrey;
 }
```

#### Let's center and add some padding in the bio area:

```css
 #bio h2 {
   background: lightgrey;
   padding-top: 25px;
   padding-bottom: 25px;
   text-align: center;
 }
```

#### Add padding to our img tag line

```css
.bio-content {
  padding: 20px 0;
  text-align: center;
}
```

#### Let's add padding and margins to the rest of the block elements on our page:

```css
section {
  margin-bottom: 50px;
}

header {
  text-align: center;
}

header h1 {
  margin-bottom: 20px;
}

main h2 {
  margin-bottom: 20px;
}

main ul,
main ol {
  margin-left: 40px;
}

footer ul#social {
  text-align: right;
}

p {
  margin-bottom: 20px;
}
```

#### Add margins to the inline elements on our page:

```css
.nav-item,
ul#social li {
  margin: 0 7px;
}
```

#### Shrink our image a little

```css
img {
  width: 200px;
}
```

## Box-Sizing

Box-sizing can be set to either content-box or border-box.

- intially when the web standard was first created, everything was set to content-box
- border-box came later as it's easier math to work with
- generally you should always use border-box now-a-days
- content box is still the default for backwards compatibility

### Box-Sizing Demo

http://codepen.io/fightingtheboss/pen/xwggBV

### Spidey Demo: Box Sizing

```css
* {
  box-sizing: border-box;
}
```

## Fonts

* we can use to change the default font:

```css
font-family: <font_name_1> <font_name_2> <font_name_3>
```

### Spidey Demo: fonts

```css
h1, h2 {
  font-family: helvetica, arial, sans-serif;
}

body {
  font-family: Palatino, serif;
  line-height: 1.7em;
}
```

## Colours

* use `background` for the background colours
* use `color` for text

```css
background: red;    /* Changes background of element to red */
color: blue;        /* Changes text to blue for element */
```

* Although I've used keyword colours in this demo, colours are usually expressed as a hex, rgb, or rgba:

```css
background: #FF0000;     /* Changes background of element to red */
color: rgb(0, 0, 255);  /* Changes text to blue for element */
```

### Spidey Demo: colours

```css
h1 {
  color: rgb(153, 22, 24);
  border: 3px solid;
  padding: 20px;
  background: rgba(25, 45, 106, 0.1);
  border-radius: 25px;
}
```

## Cascading Style Sheets

* there are three types of stylesheets:
  - external (lowest priority)
  - internal (medium priority)
  - inline (highest priority)

* styles redefined after a previously defined style takes precedant

* mostly we work with external stylesheets

* we can use !important make a style the highest priority, but generally it's good to avoid using !important unless you have to

### Spidey Demo:

#### External:

```css
h2 {
  background: peachpuff;
}
```

#### Internal:

```html
<head>
  <style>
    h2 {
      background: hotpink;
    }
  </style>
</head>
```

#### Internal (Redefined):

```css
h2 {
  background: lavender;
}
```


#### Inline:

```html
<h2 style='background: yellow;'>Header</h2>
```

## Summary

### Mention key take aways

* HTML Fundamentals:
	- Elements
	- Tags
	- Attributes
* What is CSS?
* Linking to the Stylesheet from our HTML
* CSS Selectors
* Chrome Dev Tools
* Block and Inline Elements
* Box Model:
	- Margin
	- Border
	- Padding
	- Content
* Box-Sizing
* Fonts
* Colours
* Cascading Style Sheets

## Learning Resources

http://learn.shayhowe.com/

https://developer.mozilla.org/  (and add MDN after anything you google)

http://discover-devtools.codeschool.com/

Lynda.com + Library Card = Free:

- look for courses with "essentials" or "fundamentals" in the course title for foundation training

--

### Any Questions About CSS?

--

# Templates in Sinatra

### Reminder: Is Quicktime running?

## Agenda

- Installing Sinatra and getting ready
- Using a layout to keep things DRY

## Installing Sinatra and getting ready

### Install Sinatra (if you haven't already)

In Terminal:

gem install sinatra

### Go into the working folder:

In Terminal go to this folder:

```
wdi-october-2016/09-css-box-model-and-templates/peter-parkers-resume/student
```

### Run the app:

Terminal:

```bash
ruby super_hero.rb
```

### Go to website:

Browser:

```
http://localhost:4567/
```

## Use layouts to keep things DRY

### The non-DRY way to make every page work properly:

```html
<!DOCTYPE html>
<html>
  <head>
    <link rel='stylesheet' type='text/css' href='style.css'>
  </head>
  <body>
    <div class='container'>
      <nav>
        <div class='nav-item'><a href="/">Home</a></div>
        <div class='nav-item'><a href="/spiderman">Spiderman</a></div>
        <div class='nav-item'><a href="/superman">Superman</a></div>
        <div class='nav-item'><a href="/wonderwoman">Wonder Woman</a></div>
      </nav>

      MAIN CONTENT

    </div>
  </body>
</html>
```

### The DRY way to make every page work properly:

```html
<!DOCTYPE html>
<html>
  <head>
    <link rel='stylesheet' type='text/css' href='style.css'>
  </head>
  <body>
    <div class='container'>
      <nav>
        <div class='nav-item'><a href="/">Home</a></div>
        <div class='nav-item'><a href="/spiderman">Spiderman</a></div>
        <div class='nav-item'><a href="/superman">Superman</a></div>
        <div class='nav-item'><a href="/wonderwoman">Wonder Woman</a></div>
      </nav>
      <%= yield %>
    </div>
  </body>
</html>
```

--

### Any Questions About Templates?


