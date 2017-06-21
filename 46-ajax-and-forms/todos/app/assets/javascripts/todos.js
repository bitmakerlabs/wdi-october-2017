$(function() {
  $('#new_todo').on('submit', function(eventObject) {
    // 1. Prevent the browser from submitting the form
    eventObject.preventDefault();

    // 2. Make an AJAX call
    $.ajax({
      url: $(this).attr('action'),
      method: $(this).attr('method'),
      data: $(this).serialize(),
      dataType: 'json'
    }).done(function(responseData) {
      // 1. Create the list item with class todo
      var listItem = $('<li class="todo"></li>');
      var completedInput = $('<input type="checkbox" class="todo-complete" name="todos[]">');
      var label = $('<label>').html(responseData.task);

      completedInput.attr('value', responseData.id);

      // 2. Add the is-complete class if there is a value for completed_at
      if ( responseData.completed_at ) {
        listItem.addClass('is-complete');
        completedInput.attr('checked', 'checked');
      }

      listItem.append(completedInput).append(label).appendTo('#todos-list');

      // Useful for HTML response, less so for JSON
      // $('#todos-list').append(responseData);

      // Clear out the text field
      $('#todo-task').val('');
    })
  });

  $('.todo-complete').on('click', function() {
    // $(this).parent().toggleClass('is-complete');
    var self = $(this);

    $.ajax({
      url: '/todos/' + self.val(),
      method: 'patch',
      data: {},
      dataType: 'json'
    }).done(function(responseData) {
      self.parent().toggleClass('is-complete');
    });
  });
});
