function sum(x, y) {
  return x + y;
}

function name() {
  var firstName = "Mina";

  function displayName() {
    return firstName + " is Awesome!";
  }

  return displayName;
}

name() // => displayName function

function makeAdder(x) {
  return function(y) {
    return x + y;
  }
}

function Person(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;

  function fullName() {
    return firstName + ' ' + lastName;
  }
}

mina = new Person("Mina", "Mikhail");









