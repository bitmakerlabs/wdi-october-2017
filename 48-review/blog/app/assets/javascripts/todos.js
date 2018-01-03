document.addEventListener('DOMContentLoaded', function() {
  var todoForm = document.querySelector('#new_todo');

  todoForm.addEventListener('submit', function(e) {
    e.preventDefault();

    $.ajax({
      url: todoForm.getAttribute('action'),
      method: todoForm.getAttribute('method'),
      data: $(todoForm).serialize(),
      dataType: 'html'
    }).done(function(data) {
      console.log('Received the response');
      var todosList = document.querySelector('#todos-list');

      var newTodo = document.createElement('li');
      newTodo.innerHTML = "New TODO!";

      todosList.append(newTodo);
    });

    console.log('AJAX request sent');
  });
});
