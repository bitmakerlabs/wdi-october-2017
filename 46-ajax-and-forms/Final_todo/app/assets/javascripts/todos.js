// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
document.addEventListener('DOMContentLoaded', function(){
  var form = document.querySelector('#new_todo');

    form.addEventListener('submit', function(e){
      e.preventDefault();
      $.ajax({
        url:  form.getAttribute('action'),
        method: form.getAttribute('method'),
        dataType:  'JSON', //shud change the type to json if you want to test that
        data: $(form).serialize()
      }).done(function(data){
          console.log(data);

          // to clear the field after submiting the data
          var inputField = document.querySelector("#todo_content")
          inputField.value = "";

          // when return is of type html
          //var list = document.querySelector('#my_list');
          //$(list).append(data);


          //when return is of type JSON
          var listItem = document.createElement('li');
           listItem.innerHTML = data.content;

           var todosList = document.querySelector('#my_list');
           todosList.append(listItem);


      })
        console.log("AJAX request send!! ");
    })


});
