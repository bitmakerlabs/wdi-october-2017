function takeOrder(order) {
  // var makeString = "Making " + order;
  // console.log(makeString);

  // function chef(skill) {
  //   // same as below
  // }

  var chef = function(skill) {
    var output = skill + 'ing ' + order;
    console.log(output);
    return output;
  };

  return chef;
}


var makeBurger = takeOrder("burger");
var makePizza = takeOrder("pizza");

makeBurger('Grill'); // => Grilling burger
makeBurger('Flip'); // => Fliping burger

makePizza('Top'); // Toping pizza
makePizza('Bake'); // Bakeing pizza
