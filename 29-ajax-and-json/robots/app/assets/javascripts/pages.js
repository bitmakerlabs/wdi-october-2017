// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

// Turbolinks.enableProgressBar();

$(document).on('ready', function() {
  function createBoxes(numBoxes, label) {
    var boxLabel = label || 'BOX',
        box = $('<div class="box"></div>').html(boxLabel),
        boxesArray = [];

    for (var i = 0; i < numBoxes; i++) {
      boxesArray.push(box.clone());
    };

    return boxesArray;
  }

  $('#storage').append(createBoxes(16));

  // $('a').on('click', function() {
  //   alert("Link was clicked");
  // })
});
