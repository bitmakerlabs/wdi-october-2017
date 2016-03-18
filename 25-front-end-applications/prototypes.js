// Inheritance in JavaScript

// It's a bit different than class-based inheritance (Ruby, etc),
// where classes define inheritance

// In JavaScript, we don't have classes! So inheritance is strictly
// based on objects

// Let's look at two objects
var obj = {a: 1, b: 2}
var parentObj = {b: 3, c: 5}

// Using the proto property on any object tells us the object's parent
// Here it shows that Object is the prototype
obj.__proto__;

// Even better, you can use the Object.getPrototypeOf instead
// (__proto__ maybe be deprecated soon)
Object.getPrototypeOf(obj);

// obj has two "own properties", properties available
// directly on that object
obj.a
obj.b

// The prototype chain describes the chain of inheritance for an object
// obj's current chain:
// obj -> Object {} -> null

// null is always the last in the chain

// When we access a property on an object, it will traverse the prototype chain
// one link at a time.

// If we call
obj.a
// it'll first check if this is an "own property" of the object
// If it is, it returns the value.

// Otherwise, it'll start looking up at the next object in the chain to see
// if the property exists there

// Let's add another link in the chain

// parentObj's prototype is also Object
Object.getPrototypeOf(parentObj);

// Add a chain link, by setting parentObj as the prototype for obj
Object.setPrototypeOf(obj, parentObj);

// Now the chain is updated to
// obj -> parentObj -> Object {} -> null

// This means that we can now access properties on the parent also

// If we call a property on obj that is not an "own property", it'll check parentObj next
// So we call the following, we get the value from parentObj
obj.c

// What happens to obj.b? It should return the "own property" value
// because it's always checked first
obj.b

// Function prototype

// Here is a constructor function, when we call it with `new` we create new objects
function Student(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
}

var aStudent = new Student("Roger", "Flopple");

// Each function has a prototype property
// This prototype tells which prototype each object created will have

Student.prototype // returns an empty Student object

// When we created aStudent, the Student object became its prototype
Object.getPrototypeOf(aStudent) // returns empty Student object

// Therefore

Object.getPrototypeOf(aStudent) === Student.prototype

// We can add things to our prototype, which will change all objects in real time!

Student.prototype.fullName = function() {
  return this.firstName + ' ' + this.lastName;
}

// Now this method will exist on aStudent too!
aStudent.fullName();
