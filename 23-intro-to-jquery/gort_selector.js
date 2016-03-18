// ARGS: selector. selector could be "#gort" or '.january'
// RETURNS: an array of elements
function gortSelector(selector) {
  // selector is gonna start with either a hash (#) or a dot (.)
  var selectorFirstChar = selector[0];
  var elements = []; // array to return

  // if firstChar of selector is a hash, then
  // use document.getElementById
  // else if firstChar of selector is a dot, then
  // use document.getElementsByClassName

  if ( selectorFirstChar === "#" ) {
    var id = selector.substr(1);
    var element = document.getElementById(id);
    elements.push(element);
  } else if ( selectorFirstChar === "." ) {
    var className = selector.substr(1);
    var htmlCollection = document.getElementsByClassName(className);
    // transform htmlCollection to a plain array of elements
    // loop over htmlCollection and copy each element into the elements array
    for ( var i = 0; i < htmlCollection.length; i++ ) {
      elements.push(htmlCollection[i]);
    }
  }

  return elements;

}

var $ = gortSelector;

var januaryDivs = $('.january');

console.log($('#gort').length);

console.log($(".january").length);





