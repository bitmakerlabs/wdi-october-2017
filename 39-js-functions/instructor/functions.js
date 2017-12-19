// Basics

// Write a function that takes someone's order

// Function declaration
function takeOrder(order) {
  console.log(order);
  return "functions are the best";
}

// Function expression
var takeOrder = function(order) {
  console.log(order);
  return order + " finished."
};

// Call the function
takeOrder("pizza");

// Questions:

// Can we assign a function to a variable?

// What happens if I reference the variable that contains the function?

// Can I call the function using normal function call syntax (with round brackets)?
