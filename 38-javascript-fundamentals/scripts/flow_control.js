// if statements

/*
if (condition is true) then
    do some action
else if (other condition is true) then
    do some secondary action
else
    default action
*/

var somethingTrue = true,
    somethingFalse = false,
    aString = "PROTOTYPE";

if ( conditionA === true ) {
  // Do this if condition is true
} else if ( conditionB === true ) {
  // If conditionB is true
} else if ( conditionC === true ) {
  // if conditionC is true
}



if (somethingTrue === false ) {
    alert("Something TRUE");
} else if (aString.length > 15) {
    alert("REALLY TRUE");
} else {
    alert("DEFAULT CASE");
}



// switch statement
var fruit = "Banana";

switch (fruit) {
    case "Banana":
    // case "Costa Rican Banana":
    // case "African Banana":
    // case "Plantain":
        alert("BANANA");
        break;
    case "Apple":
        alert("APPLE");
        break;
    case "Pear":
        alert("PEAR");
        break;
    default:
        alert("DEFAULT");
        break;
}
