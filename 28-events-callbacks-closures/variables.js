unvared = 'I was declared without var';
var globalScope = 'mina';

function scopeExample() {
    console.log('insideScope: ' + insideScope); // (3)
    console.log('globalScope: ' + globalScope); // (4)

    globalScope = 'Set inside function';

    console.log('globalScope: ' + globalScope); // (5)

    console.log('unvared: ' + unvared); // (6)

    unvared = "This was CLOBBERED";

    console.log('unvared: ' + unvared); // (7)

    var insideScope = 'Declared inside function';
    console.log('insideScope: ' + insideScope); // (3)

    unvaredInsideScope = "Declared inside the function without var";
}

try {
    console.log('unvared: ' + unvared); // (1)
    console.log('globalScope: ' + globalScope); // (2)

    scopeExample();

    console.log('unvared: ' + unvared); // (8)
    console.log('globalScope: ' + globalScope); // (9)
    console.log('unvaredInsideScope: ' + unvaredInsideScope); // (10)
    console.log('insideScope: ' + insideScope); // (10)
} catch(e) {
    console.log('ERROR: ' + e.message);
}
