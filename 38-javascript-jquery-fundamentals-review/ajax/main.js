$(document).ready(function(){
  ////// SYNC VS ASYNC //////
  //
  // Some code can be executed synchronously like so
  // function foo() {
  //   console.log('bar');
  // }
  // foo();

  // But sometimes we want code to execute out of order, or asynchronously
  // Function will execute after 3000 milliseconds
  // setTimeout(function(){ console.log('baz'); }, 3000);

  // Notice how if we switch the order of theses function calls,
  // foo() still executes first
  // setTimeout(function(){ console.log('baz'); }, 3000);
  // function foo() {
  //   console.log('bar');
  // }
  // foo();

  ////// AJAX //////
  //
  // Asynchronous programming is useful for when we make AJAX calls
  // We want to send a request, and then do something only when it completes
  // console.log('Sending AJAX request...');
  // $.ajax({
  //   url: 'https://bb-election-api.herokuapp.com', // let's use bb-election as an example
  //   method: 'GET', // We're gonna make a GET request
  //   data: {}, // Because its a GET request, our body will be empty
  //   dataType: 'json' // We want a JSON respons
  // }).done(function(data){ // This code executes when we get a success response
  //   console.log('Request complete!');
  //   console.log(data); // Let's just log out list of candidates we got from the API
  // });
});

