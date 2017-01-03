# HTML, CSS and Templates

Webpages are made up of **HTML** and **CSS**. 

HTML provides the structure and content of page using elements (e.g. `<p>` and `<div>` tags). HTML is an acronym for Hypertext Mark-up Language.

CSS controls the presentation of the page: layout, colours, fonts, etc. CSS is an acronym for Cascading Style Sheet.

HTML and CSS are ever evolving: Web Browsers will often lead the way by introducing support for unspecified features, and then if these features catch on, they'll be formalized into the HTML and CSS specifications and others browsers will add support for them. HTML5 and CSS3 are the current specs.

Templates allow you to keep your code DRY (Don't Repeat Yourself). The common way to use templates in Ruby is with ERB Templates (Embedded Ruby).

## Agenda
After this lesson, you will know:

  * HTML Fundamentals:
    - Tags
    - Elements
    - Attributes
  * CSS Fundamentals:
    - Defining styles
    - Selectors
    - Cascade & Inheritance
  * Layout Basics:
    - Block and Inline Elements
    - Box Model:
      * Margin
      * Border
      * Padding
      * Content
  * How to effectively working with CSS:
    - Chrome Dev Tools
  * ERB Templates

## HTML Fundamentals

### Tags

An HTML tag is an opening or closing entity. For example, both `<p>` and `</p>` are tags.

### Elements

An HTML element consists of an opening tag, content, and a closing tag.

In the following example:

```html
<p>I am a short paragraph made up of one sentence.</p>
```

The opening tag is `<p>`.

The content is `I am a short paragraph made up of one sentence.`.

The closing tag is `<p>`.

And the whole thing is an **element**.

Not all elements have content or require a closing tag. For example, everything an `<img>` element needs is defined with its opening tag:

```html
<img src='my_pic.jpg'>
```

### Attributes

An HTML attribute defines a property for an element. It's defined in the opening tag of an element.

In the following example:

```html
<a href='http://bitmaker.co'>Link to Bitmaker</a>
```

The `href='http://bitmaker.co'` is the attribute.

## CSS Fundamentals

### Defining Styles

Styles can be defined in three areas:

- **external**: separate files ending with a `.css` extension
- **internal**: defined within the head element of our html page
- **inline**: defined using a `style` attribute

Most of our styling will be done using external stylesheets, as they are the easiest to develop and maintain.

To use an external stylesheet, we use a link tag in the `<head>` element of our html document:

```html
<link rel='stylesheet' href='styles.css'>
```

### Selectors

HTML elements can have `class` and `id` attributes. `class` attributes can be used more than once on a page. An `id` attribute should only be used once on a page.

For example:

```html
<p class='big-red-box'>This paragraph has a class of big-red-box.<p>
<p id='call-to-action'>This paragraph has an id of call-to-action.<p>
<p>This paragraph does not have a class or an id.<p>
```
We target the styles we want our html elements to have by using selectors. We can target by tag, class or id. First we specify our target, and then we specify the CSS we'd like to apply through attribute/value pairs.

To target all the `<p>` elements, we use:

```css
p {
  border: 2px solid red;
  width: 300px;
}
```

To target elements with a `big-red-box` class, we put a `.` in front of the class:

```css
.big-red-box {
  border: 2px solid red;
  width: 300px;
}
```

To target an element with the id `call-to-action` , we put a `#` in front of the id:

```css
#call-to-action {
  border: 2px solid red;
  width: 300px;
}
```

You can use multiple selectors to target specific elements. For example, to style the following `<p>` tag:

```html
<main>
  ...
  <section id='primary-content'>
    <p class='big-red-box'>Order Today!</p>
  </section>
</main>
```

We could use the following style:

```css
main section#primary-content p.big-red-box {
  border: 10px solid red;
}
```

**A general guideline for styling:** be a specific as you need to be, but not any more than you need to be. For example, if there was only one `.big-red-box` inside the `#primary-content` section, then the following style would suffice for the above example:

```css
#primary-content .big-red-box {
  border: 10px solid red;
}
```

### Cascade & Inheritance

As styles can be defined in multiple places and with varying specifity, browsers assign priority to what styles it will apply.

- External (lowest priority)
- Internal (medium priority)
- Inline (highest priority)
- styles with more specifity will take precedence
- styles will overide previously defined styles
- styles that use an `!important` tag at the end of the value will have the highest priority

**Note:** use of `!important` is discouraged unless it's the only way to apply your style. Stylesheets can become difficult to manage if `!important` is used throughout.

## Layout Basics

### Block and Inline Elements

**Block:** sizes to the width of the screen

**Inline:** sizes to the width of the content

By default, browsers will display html elements from top left to bottom right.

### Box Model:

Every visiable element in the body of an html page is made up of content, padding, border and margin.

We can control the top, bottom, left and right for the margin, padding and border.

**Margin:** area between elements
**Border:** area surrounding an element
**Padding:** area between the border and the content
**Content:** the text or image of an element


## Box-Sizing

Box-sizing can be set to either `content-box` or `border-box`.

When the web was first created, everything was set to `content-box`. 

`Border-box` came later to make web development easier. Generally you should always use `border-box`, however `content-box` is the default to ensure backwards compatibility.

**content-box:** the `width` and `height` css properties will cause elements to size themselves to the **content** of the element.

**border-box:** the `width` and `height` css properties will cause elements to size themselves to the border of the element.


## How to effectively work with CSS:

### Chrome Dev Tools

The Chrome Dev Tools allow you to easily experiment with CSS on a web page.

Access them by **right-clicking on the element** you wish to experiement with and then **click inspect**.

## ERB Templates

Templates keep our code DRY (Don't Repeat Yourself) by allowing us to easily re-use parts of our webpages throughout our sites. Often the header and footer of every webpage will be the same and only the content in the middle of the page will vary.

With Sinatra, our main template will be called `layout.erb` and we'll put page specific content in other `.erb.` files. The `<%= yield %>` statement will be replaced by our page-specfic content.

`layout.erb`:

```html
<!DOCTYPE html>
<html>
  <head>
    <link rel='stylesheet' type='text/css' href='style.css'>
  </head>
  <body>
      <%= yield %>
    </div>
  </body>
</html>
```

`page-1.erb`:

```html
<h1>Page 1</h1>
<p>A lovely sentence...</p>
```

`page-2.erb`:

```html
<h1>Page 2</h1>
<p>Another lovely sentence...</p>
```

---

## Resrouces

* [Sean Lerner's Instructor Notes](instructor-notes/lesson.md)
* [Box-Model Image](instructor-notes/box-model.gif)

### In-Class Exercise files

- [Cupcake Ipsum](cupcake-ipsum/): Useful for demonstrating CSS.
- [Peter Parker's Resume](peter-parkers-resume): Assignment to work on in class to review what's been covered for CSS.
- [Super Heroes](super-heroes): Assignment to work on in class to review what's been covered for Templates.


