
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
    atLeastOnce = true;
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

function ternaryOperator() {
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

// Callback

function pretty(func) {
  console.log("The year is:");
  func();
  console.log("You made it!");
}

function printYear() {
  var currentDate = new Date();
  console.log(currentDate.getFullYear());
}

printYear();

pretty(printYear); // named function example


pretty(function() { // anonymous function example
  console.log("How long did I take to run?");
});


// Scope examples -------------------

var test = 7;
console.log(test);
console.log(global.test);
function d() {
  test2 = 'cheese';
  var localToFunction = 'bob';
}
d();
console.log(global.test2);
console.log(global.localToFunction);


console.log("\n\n\n");

// Callbacks --------------------------


function takesLong() {
  for (var i=0; i<1000000000; i++) {
    // do nothing but take a while!
  }
  console.log("Took a while!");
}

takesLong();

function analyze(funcToTime) {
  console.log("\nAnalyzing...");
  console.time(funcToTime.name);
  funcToTime();
  console.timeEnd(funcToTime.name);
}

analyze(takesLong);

console.log("\n\n\n");


// forEach callback
arr = [1, 2, 3];
arr.forEach(function(x) {
  console.log(x * 2);
});

// objects - accessing attributes

places = {
  'toronto': 'big',
  'montreal': 'very artsy',
  'vancouver': 'relaxed'
};
console.log(places['toronto']); // the standard way
console.log(places.montreal); // much easier and more readable!
var place = "montreal";
console.log(places[place]); // the standard way - no way around it for dynamic access


// objects with functions - basic example
var y = 0;
var moves = {
  'F': function() { y += 1 },
  'B': function() { y -= 1 },
}

moves.F();
console.log(y);
moves.B();
console.log(y);



// objects with functions - basic Mars Rover implementation

var roverX = 0,
    roverY = 0,
    roverDirection = 'N',
    directions = ['N', 'E', 'S', 'W'];

function turnRover(amount) {
  index = directions.indexOf(roverDirection);
  index = (index + amount) % 4;
  if (index < 0) index += 4;
  roverDirection = directions[index];
}

// use this function...
function moveRover(amount) {
  switch (roverDirection) {
    case "N": roverY += amount; break;
    case "E": roverX += amount; break;
    case "S": roverY -= amount; break;
    case "W": roverX -= amount; break;
  }
}

// OR this object!
roverMoves = {
  "N": function() { roverY += 1; },
  "E": function() { roverX += 1; },
  "S": function() { roverY -= 1; },
  "W": function() { roverX -= 1; },
}

// main function
var orders = {
  'L': function() { turnRover(-1) },
  'R': function() { turnRover(1) },
  'M': function() { moveRover(1) },
  // 'M': function() { roverMoves[roverDirection]() },
};

orders.L();
orders.L();
orders.M();
orders.R();
orders.M();
console.log(roverX, roverY, roverDirection);



// More complicated callbacks --------------------------

function addBun(addBurger, addToppings) {
  console.log('___---___'); // top bun
  if (addToppings) addToppings();
  addBurger();
  console.log('---___---'); // bottom bun

  serve();
}

function addCheeseBurger() {
  console.log('---------'); // cheese
  addPlainBurger();
}

function addPlainBurger() {
  console.log('========='); // patty
}

function addToppings() {
  console.log('   +++   '); // ketchup
  console.log('  =====  '); // tomato
}

function serve() {
  console.log("\n\n\n");
}



addBun(addCheeseBurger, addToppings);
addBun(addPlainBurger, addToppings);
addBun(addPlainBurger);

console.log("\n\n\n");
// asynchronous JS
function doStuff() {
  console.log("*************");
  console.log("Should print after");
}
setTimeout(doStuff, 500);
console.log("Print as soon as possible");
