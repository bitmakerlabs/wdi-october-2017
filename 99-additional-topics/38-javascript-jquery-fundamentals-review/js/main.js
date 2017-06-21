/////////////////////////////
// JS PRACTICE AND EXAMPLES//
/////////////////////////////

//////// LOOPS ////////

// This for loop prints 1 to 5
// "var i = 0" is the initial value of i at the first step of the loop
// "i < 5" is the end the end condition; we'll stop once i gets to 4
// "i++" is how we should transform i at each stage of the loop

// for (var i = 0; i < 5; i++) {
//   console.log(i+1); // we want 1 to 5, not 0 to 4
// }


// Here's a while loop that does the same thing
// var i = 0;
// while (i < 5) {
//   console.log(i+1);
//   i++;
// }

//////// SCOPE ////////

// var bar;
// function foo() {
//   var bar = 'baz';
//   console.log(bar);
// }
// foo(); // will print out 'baz'
// console.log(bar); // will print undefined


// function foo() {
//   bar = "baz";
//   console.log(bar);
// }
// foo(); // will print out 'baz'
// console.log(bar); // will also print 'baz'

//////// NAMED VS ANONYMOUS FUNCTIONS ////////

// function foo() {
//   console.log("I'm a function named 'foo'");
// }
// foo();


// var bar = function() {
//   console.log("I'm actually an anonymous function assigned to the variable 'bar'");
// }
// bar();


// (function () {
//   console.log("I don't have a name :(");
// })();

//////// CALLBACKS ////////

// function foo(callback) {
//   console.log("I'm 'foo', here's me invoking my callback:");
//   callback();
// }

// function bar() {
//   console.log("I'm named function 'bar'");
// }

// foo(bar);

// foo(function(){
//   console.log("I'm an anonymous function be passed as a callback");
// });

//////// CLOSURES ////////

// function foo() {
//   var a = "I'm defined in 'foo'";
//   function bar() {
//     console.log(a);
//   }
//   bar();
// }
// foo();

