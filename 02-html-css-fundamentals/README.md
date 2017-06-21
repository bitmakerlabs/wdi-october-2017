The majority of our interactions on the Internet occur on the World Wide Web and our interface to the content on the Web are documents structured with HTML and styled with CSS. Today we'll look at the purpose and use of these technologies. We'll assume some basic understanding so that we can dive deeper into the details of how to use the different features of these two technologies to create the foundation of every single web app you'll ever build.

After this lesson, you'll be familiar with:

1. The purpose and semantics of HTML
1. Defining the layout of your document
1. Adding style through CSS
1. Basic CSS selectors
1. Advanced CSS selectors
1. The meaning of 'cascading'
1. Specificity
1. Typography
1. Colours
1. Reset and Normalize
1. Reading the documentation

## The purpose and semantics of HTML

* HTML: HyperText Markup Language
* A language used to describe the content and structure of our documents
* Comprised of a fixed set of tags used to describe the content of your document
* Tags give semantic meaning to the content for the browser and other software
* Choosing the right tag for your content is more of an art than a science in some cases!

## Defining the layout of your document

* HTML describes your content, but it also gives it structure, like the outline of a report or academic paper
* You will use your HTML tags to define and group logical sections of your document

## Adding style through CSS

* CSS: Cascading Style Sheets
* A set of rules that describe the presentation of a document written in HTML
* Separating the style rules from the content allows us to easily update the presentation of our document.
* See [CSS Zen Garden](http://csszengarden.com/) for a great example of the power of separating these concerns, content and style, from one another

## Basic CSS selectors

CSS selectors are used to identify the elements in the document to which we want to apply a set of specfic styles. There are three (3) types of CSS selectors:

### Tag selectors

Tag selectors are the most generic. They'll select all of the elements in the document that use that tag name.

For example, the following code will make the text in all paragraphs red:
```
p {
  color: red;
}
```

### Class selectors

Class selectors are much more specific selectors. They'll select only the elements that have a `class` attribute whose value matches the selector, regardless of their tag name. **This is the most common selector used for styling content**.

For example, the following code will make all elements with class `highlight` have a yellow background:

```
# HTML
<h1 class="highlight">A highlighted title</h1>
<p>A paragraph</p>
<p class="highlight">A highlighted paragraph</p>

# CSS
.highlight {
  background-color: yellow;
}
```

### ID selectors

ID selectors are the most specific type of selector. Since ID attributes are unique in a document, and ID selector will either select one element or none at all. **ID selectors should generally be avoided for styling purposes**. They're generally more useful when it comes to adding interactivity to your app.

```
# HTML
<p id="unique">I'm special! This paragraph is unique in the document</p>

# CSS
#unique {
  background-color: purple;
}
```

## The meaning of 'cascading'

The first C in CSS stands for "Cascading". Cascade, in the context of CSS, allows style rules to be built up incrementally or overridden by other sets of rules that target the same elements through their selectors. The cascade manifests itself in a few ways.

1. Rules that come later inherit from or override previous rules that select the same element
2. Properties that come later within the same rule will override identical properties that come earlier


## Specificity

The specificity of the selectors is calculated by giving each type of selector a score. The reason it's laid out this way is because you can combine selectors and the score will increase in each column depending on the number of each type of basic selector used. The end goal is to calculate which rules will be applied to the selected elements.

  ID  |  Class  |  Tag
------|---------|-----
  0   |    0    |   1
  0   |    1    |   0
  1   |    0    |   0

The general rule of thumb, which we'll see over and over again throughout the course, is to keep the specificity of any selector as low as possible.

[Calculating Specificity](http://learn.shayhowe.com/html-css/getting-to-know-css/#specificity)

Documentation: https://developer.mozilla.org/en-US/docs/Web/CSS/Specificity


## Advanced CSS selectors

### Combining Selectors

You can select elements based on their hierarchical relationship. Combining selectors allows you to create a selector that is more specific.

**Common selectors based on relationships**

Selector | Selects
---------|--------------------------------------------
A E      | Any E element that is a descendent of an A element *at any depth* (i.e. E is a child, grandchild, etc.)
A > E    | Any E element that is a direct child (i.e. direct descendent) of an A element
B + E    | And E element that is the next sibling of a B element (i.e. the next child of the same parent)

[A good, technical overview of combining selectors](http://galjot.si/combining-css-selectors)

### Pseudo-class selectors

A CSS pseudo-class is a keyword added to a selector that specifies a special state of the element to be selected. These selectors can be used to select states like `:hover` or `:visited` for links, but they can also be use to select elements based on their position within their parent, like `:first-child` or `:last-child`.

```CSS
/* Let's set hovered links to be purple */
a:hover {
  color: purple;
}

/* Set the background-color of every other list item to black */
a:nth-child(2n) {
  color: white;
  background-color: black;
}
```

[MDN Pseudo-classes](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes)


## Typography

* There are a lot of ways to affect the type in your documents
* The most important features are the `font-family`, `font-size`, `font-weight` and `line-height`
* Together these features will determine how the text in your document appears in the browser
* By default browsers are restricted to font files available on the user's computer
* We can extend the default capabilities of browsers by pointing to font files on the web, known as web fonts.


## Colour

* Named colours
* Hex colours
* Advanced colour definitions

Documentation: https://developer.mozilla.org/en-US/docs/Web/CSS/color_value


## Reset and Normalize

Browsers apply their own stylesheet to documents by default. Each browser maker decides which default styles are applied to each HTML element and they're not all the same. When creating a design for your own HTML document, it's helpful to start off with a baseline set of styles that you can be sure are the same across all browsers. This is where a CSS Reset or Normalize comes in.

A CSS Reset is a simple solution to the problem of different defaults across browsers: just set all the styles for all the elements to zero. This removes all of the defaults from the browser, setting all the styles to zero. This makes headings are no longer bold, lists don't look like lists, paragraphs no longer have space after them, etc. Everything looks like basic text until you add styles and you can build up your stylesheet from there. The most widely used CSS Reset is the [Eric Meyer CSS Reset](http://meyerweb.com/eric/tools/css/reset/).

A CSS Normalize is a bit more nuanced than a reset. Instead of setting all styles to zero, it smooths out the differences across browsers to one baseline stylesheet. This makes all browsers render an HTML document with no other stylesheet applied exactly the same. As opposed to the reset, normalize keeps basic styles for HTML elements and you build your document styles up from there. The most widely used CSS Normalize is [Normalize.css](https://necolas.github.io/normalize.css/).

The one you choose is based on your preference and philosophy. A reset allows you to control every single style, but forces you to define basic styles for every element. A normalize gives you a nice place to start, but requires you to work around its base styles in some cases.

## Reading the documentation

HTML and CSS are both standards that are regulated by the World Wide Web Consortium, otherwise known as the W3C. They produce official documentation that dictates how web browsers are meant to interpret HTML tags and CSS rules. That documentation is very technical and a lot of it isn't relevant from a web developer's perspective, so there are many other resources out there.

The best single source of truth from a web developer's perspective for both HTML and CSS is the Mozilla Developer Network (MDN). You can find the reference documentation, as well as guides and tutorials, for these web technologies here:

* [HTML](https://developer.mozilla.org/en/docs/Web/HTML/Element)
* [CSS](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference)
