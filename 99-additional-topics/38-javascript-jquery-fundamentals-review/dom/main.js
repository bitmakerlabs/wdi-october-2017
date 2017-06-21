/////////////////
// DOM Practice//
/////////////////

////// DOM != HTML //////

// The DOM and the HTML are not the same thing
// Here we're creating a new DOM node that is not present in the HTML

// var element = document.createElement("h3");
// var content = document.createTextNode("I was not created in index.html, but I'm in the DOM");
// element.appendChild(content);
// document.body.appendChild(element);

////// DOCUMENT VS WINDOW //////

// The document is the parent of every other DOM node

// console.log("Here's the body, called from the document object:");
// console.log(document.body);


// The window is the global context, the document's parent
// It refers to the window itself rather than its content

// console.log("Here's the window:");
// console.log(window);
// console.log("And here's the document called from the window object:");
// console.log(window.document);


// We can get elements from the document a variety of ways:
// var byId = document.getElementById("page-title");
// var byClass = document.getElementsByClassName("some-class");
// var byTag = document.getElementsByTagName("h1");
// console.log("By ID:");
// console.log(byId);
// console.log("By Class:");
// console.log(byClass);
// console.log("By Tag:");
// console.log(byTag);

////// HEAD VS BODY //////

// Try uncommenting something, and moving the script tag to the head instead of the body
// It won't work anymore!

