# CSS Box Model and Developer Tools

Every element in your HTML document is rendered in the browser as a rectangle (even if it looks like a circle!). Each one of those rectangles is governed by a set of rules known as the CSS Box Model. Today we'll take a close look at how the browser renders elements and the CSS properties we can use to control how each element is rendered relative to the document.

We'll also start using the powerful developer tools provided by every modern web browser. These tools allow us to inspect the document in the browser, see the styles being applied to any element, and make live changes to the document.

## Agenda

1. Browser developer tools and how to use them
1. The CSS box model
1. The `display` property


## Developer Tools

Most modern web browsers ship with a power set of tools for inspecting all aspects of the page that's being rendered, including all of the HTML, CSS and JavaScript code that makes it up. This helps us learn how a page is put together and is useful in experimenting with and debugging our projects and any site on the Internet.

Any time you're working on front-end code (HTML, CSS or JavaScript) you'll want to have the developer tools open. Otherwise, **You're Doing It Wrong**.


## CSS Box Model

Every element in your HTML document is drawn to the page as a rectangle (even if it looks like a circle!). Every one of those rectangles is drawn and placed using a set of rules known as the **CSS Box Model**.

Each rectangle is made up of 4 concentric parts, boxes within boxes, like a Russian doll. The four parts, from inside to outside, are:

* content: the space for the content of the element
* padding: the space between the content and the edge of the box
* border: the actual edge of the box
* margin: the space between one rectangle and the next

### `box-sizing`

The default rules that govern how the size of a box is calculated are a bit odd. When setting the width or height of a box using the CSS `width` and `height` properties, those values will only apply to the **content** box. Any values set for the padding, border and margin will be **in addition to** the width and/or height set.

This is called the `content-box` box model. As mentioned, this is the default box model but it can be set in CSS if need be with the following rule:

```
box-sizing: content-box;
```

The `content-box` box model is not very intuitive. We have to constantly do math to calculate the final width and height that a box will be rendered at.

As an alternative, we can change the value of the `box-sizing` property to `border-box` with this declaration:

```
box-sizing: border-box;
```

By changing the box model with this rule, width and height values now **include** the content, padding and border. As padding and border values grow, the area available for the content shrinks to maintain the width and height at the declared values.

It's important to note that in both box model modes, **the margin is always OUTSIDE the box**.

Because `border-box` mode is so much more intuitive, it's very common in modern web designs to apply it to every element in your document as one of the first declarations in your stylesheets, like so:

```
* {
  box-sizing: border-box;
}
```

[Read the documentation about the `box-sizing` property on MDN](https://developer.mozilla.org/en/docs/Web/CSS/box-sizing)
