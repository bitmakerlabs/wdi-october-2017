$(document).on('ready page:load', function() {
  $('.menu a').on('click', function(e) {
    e.preventDefault();

    var self = $(this),
        parent = self.parent(),
        ink = parent.find('.ink'),
        diameter = Math.max(parent.outerWidth(), parent.outerHeight()),
        radius = diameter / 2,
        xPosition,
        yPosition;

    if ( ink.length === 0 ) {
      ink = $('<span class="ink"></span>');
      parent.prepend(ink);
    }

    ink.removeClass('animate');

    ink.css({
      'width': diameter + 'px',
      'height': diameter + 'px'
    });

    xPosition = e.pageX - parent.offset().left - radius;
    yPosition = e.pageY - parent.offset().top - radius;

    ink
      .css({
        'left': xPosition + 'px',
        'top': yPosition + 'px'
      })
      .addClass('animate');
  });
});