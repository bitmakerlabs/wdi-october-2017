// Let's make sure our DOM is loaded before we start trying to manipulate it
$(document).ready(function(){
  console.log('READY!');

  // jQuery provides us with a master method we can use to select anything
  // This method is called "jQuery()", but can also be accessed with "$()"
  //
  // var body = jQuery('body');
  // console.log(body);
  // var body = $('body');
  // console.log(body);


  // We can use CSS selectors to select by things like id and class
  //
  // var titleElement = $("#some-id");
  // var classElements = $(".some-class");
  // console.log(titleElement);
  // console.log(classElements);


  // jQuery can also set up event handlers
  // These trigger when a certain browser event happens
  // $("button").on("click", function(){
  //   alert("I've been clicked!");
  // });

  // $("h2").on({
  //   mouseover: function(){
  //     $(this).css('color', 'red');
  //   },
  //   mouseleave: function() {
  //     $(this).css('color', 'black');
  //   }
  // });
});

// $(document).ready only works when we aren't using turbolinks
// With turbolinks and rails 4, we need to use $(document).on('page:load')
// With turbolinks and rails 5, we need to use $(document).on('turbolinks:load')
// FUN STUFF!

