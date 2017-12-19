// Callbacks

var numbers = [1, 2, 3, 4, 5];

for (var count = 0; count < numbers.length; count++) {
  var timesTen = numbers[count] * 10;
  console.log(timesTen);
}

// First revision
console.log("\nFirst Revision");

var timesByTenFn = function(number) {
  var timesTen = number * 10;
  console.log(timesTen);
};


for (var count = 0; count < numbers.length; count++) {
  timesByTenFn(numbers[count]);
}

// Using forEach
console.log("\nSecond Revision");

numbers.forEach(function(item) {
  timesByTenFn(item);
});

console.log("\nFinal Revision");

numbers.forEach(timesByTenFn);


// Asynchronous

console.log("About to wait 5 seconds...");

setTimeout(function() {
  console.log("Time's up!");
}, 5000);

console.log("After setTimeout for 5 seconds...");
