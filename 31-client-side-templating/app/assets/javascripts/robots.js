// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('ready page:load', function() {
  // 1. Listen for clicks on the link to individual robots
  $('.robot > a').on('click', function(eventObject) {
    // 2. Prevent the browser from following the link
    eventObject.preventDefault();

    // 3. Send an AJAX request to the server to get the info about the robot
    $.ajax({
      url: $(this).attr('href'),
      method: 'GET',
      data: {},
      dataType: 'json'
    }).done(function(responseData) {
      // 4. When I receive a response, update the page with the new info from the server
      console.log(responseData);

      // a. Fetch the raw string version of our template
      var source = $('#robot-template').html();

      // b. Wrap the string version in a function that accepts a robot object
      var template = Handlebars.compile(source);

      // c. Pass in our robot object, get out our template populated with robot data
      var output = template(responseData);

      // d. Add the HTML template to the document
      $('#robot-details').html(output);
    }).fail(function() {
      console.log("Something went wrong!");
    });
  });
});
