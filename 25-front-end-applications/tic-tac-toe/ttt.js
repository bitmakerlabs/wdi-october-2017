
$(document).on('ready', function () {
  var winningCombos = [[1,2,3], [4,5,6], [7,8,9]];
  var turn = 0;

  function checkWinner() {
    //check for a winner here
    for(var i = 0; i < winningCombos.length; i++) {
      var combo = winningCombos[i];
      //combo will be [1,2,3]
      //compare each combo to a playerState array or use the DOM => $('.x')
      //alert("We have a winner!")
    }

  }

  $('td').on('click', function () {

    if (turn % 2 === 0) {
      $(this).html("X").addClass("x");
    } else {
      $(this).html("O").addClass("o");
    }

    checkWinner();

    $(this).off('click');
    turn++;

  });

});
