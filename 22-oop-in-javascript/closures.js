function add(x, y) {
  return x + y;
}

var multiply = function(x, y) {
  return x * y;
}

var multiplier = function(z) {
  return function(x) {
    return x * z;
  }
}

var multiplyBy100 = multiplier(100);
