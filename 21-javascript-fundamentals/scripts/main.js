// Numbers
var aNumber = 10;
var aFloatingPointNumber = 3.1415;

// Strings
var aString = 'this is a string';
var anotherString = "This is also a string";

// Booleans (True and False)
var aTrue = true;
var aFalse = false;

// undefined
var anUndefinedVariable;
var anUndefinedVariable = undefined; // exactly the same as previous line

// null
// This is an value that indicates something explicitly has no value
var nullValue = null;

// Arrays
var anEmptyArray = [];
var daysOfTheWeek = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
var mixedArray = [1, 2, 'THREE', 'Four', false];

daysOfTheWeek[1]      // => Monday
daysOfTheWeek.length  // => 7

// Object Literals
var anObject = { key: "value", name: "description", "title": "body"};


function simpleForLoop() {
  for (var i = 0; i < 9; i++) {
    console.log(i);
  };

  console.log("Done looping! i = " + i);
}

// For Loop
function forLoop() {
  var mystring = "some random string";
  var sum = 0;
  for (var i = 0; i < mystring.length; i++) {
    sum += i; // sum = sum + i;
    console.log(mystring[i]);
  };

  console.log("sum: ", sum);
}


// While Loop
function whileLoop() {
  var counter = 200;
  while (counter < 100) {
    counter++;
    console.log('Counter:', counter);
  }
}


// Do/While Loop
function doWhileLoop() {
  var atLeastOnce = false;

  do {
    console.log('atLeastOnce:', atLeastOnce);
    // atLeastOnce = true;
  } while (atLeastOnce);

  console.log('atLeastOnce after loop', atLeastOnce);
}


function infiniteLoop() {
  var counter = 0;
  while (true) {
    counter++;
    console.log(counter);

    if (counter > 100) {
      console.log("Found a match!");
      break;
    }
  }

  console.log("Final counter:", counter);
}


// If Statement
function ifStatement() {
  var somethingTrue = true,
      somethingFalse = false,
      aString = "PROTOTYPE",
      result;

  if ( aString.length >= 9 ) {
    console.log("Condition A");
    result = aString.length;
  } else if ( aString.length < 9 ) {
    console.log("Condition B");
    result = "short"
  } else {
    console.log("DEFAULT CASE");
    result = null;
  }

  console.log("result: ", result);
}

function tertiaryOperator() {
  var ten = 10,
      result = (ten >= 10) ? true : false;

  console.log("result:", result);
}


function switchStatement() {
  var fruit = "Banana";

  switch (fruit) {
      case "Apple":
          console.log("APPLE");
          break;
      case "Pear":
          console.log("PEAR");
          break;
      case "Banana":
      case "Costa Rican Banana":
      case "African Banana":
      case "Plantain":
          console.log("BANANA");
          break;
      default:
          console.log("DEFAULT");
          break;
  }

  console.log("Switch DONE.");
}


// Named function
function namedFunction() {
  console.log("Inside namedFunction");
}

function sum(a, b) {
  return a + b;
}

// Functions with parameters
function functionWithParameters(param1, param2) {
  console.log('param1:', param1);
  console.log('param2:', param2);
}

// Anonymous function
var anonymous = function() {
  console.log("I'm anonymous");
};
