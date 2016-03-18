// Variables & Types

// Single line comment

/*
  Multi-line
  comment
*/

// Numbers
var aNumber = 10;
var aFloatingPointNumber = 3.1415;

// Strings
var aString = 'This is a string';
var anotherString = "This is also a string";

// Booleans / Logical (True and False)
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
var emptyObject = {};
var anObject = { "key": "value", name: "description", "title": "body"};
anObject["name"] //=> "description"
anObject.name // => "description"


typeof(undefined);    //-> undefined
typeof(10);           //-> number
typeof('some text');  //-> string
typeof(true);         //-> boolean
typeof(null);         //-> object

typeof(function() { return true; });  //-> function

