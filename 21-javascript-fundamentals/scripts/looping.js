// Looping

// For Loop
// i++ === (i = i + 1)
for (var i = 0; i < 9; i++) {
  console.log(i);
};


// While Loop
var counter = 90
while (counter < 100) {
  counter++;
  console.log('Counter:', counter);
}


// Do/While Loop
var atLeastOnce = false;

do {
  console.log('atLeastOnce:', atLeastOnce);
  atLeastOnce = true;
} while (!atLeastOnce);

console.log('atLeastOnce after loop', atLeastOnce);
