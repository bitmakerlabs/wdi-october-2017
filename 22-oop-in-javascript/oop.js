function Car(make, model) {
  this.make = make;
  this.model = model;
}

Car.prototype.start = function() {
  console.log("Car started!");
}

Car.prototype.stop = function() {
  console.log("Car stopped!");
}

Car.prototype.drive = function() {
  console.log("Driving");
}


function Truck() {
  this.type = "truck";
}

Truck.prototype = Object.create(Car.prototype);

// Car.prototype = {
//   start: function() {
//
//   },
//
//   stop: function() {
//
//   },
//
//   drive: function() {
//
//   }
// }
