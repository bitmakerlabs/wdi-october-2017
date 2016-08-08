// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Document Ready
$(function() {
  // 1. Listen for click events on our links
  $('.robot > a').on('click', function(eventObject) {
    // 2. Prevent the default behaviour (following the link)
    eventObject.preventDefault();

    // 3. Send an AJAX request to the server
    $.ajax({
      url: $(this).attr('href'),
      method: 'GET',
      data: {},
      dataType: 'json'
    }).done(function(responseData) {
      var priceString = '$' + (responseData.model_number / 100);

      // 4. Take the response from the server and insert it into the page
      console.log(responseData);

      // This worked for the HTML response, but not for the JSON response
      // $('#robot-details').html(responseData);

      // $('#robot-details').html('');

      var container = $('<div>');

      $('<img>').attr('src', 'http://robohash.org/' + responseData.address)
                .appendTo(container);

      $('<h1>').html(responseData.name).appendTo(container);

      // <p>Price: <strong>$123.45</strong></p>
      var priceParagraph = $('<p>').html('Price: ');
      var priceStrong = $('<strong>').html(priceString);

      priceParagraph.append(priceStrong).appendTo(container);

      $('#robot-details').html(container);
    });
  });
});
