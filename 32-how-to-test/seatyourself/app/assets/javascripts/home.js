$(document).on('ready page:load', function() {
  $('#nearby-search').on('click', function() {
    if ("geolocation" in navigator) {
      //geolocation supported
      navigator.geolocation.getCurrentPosition(itWorked, itFailed);
    } else {
      alert("Geolocation not supported :(");
    }
  })
})

function itWorked(position){
  var lat = position.coords.latitude;
  var lon = position.coords.longitude;

  $.ajax({
    url: '/restaurants',
    method: 'get',
    dataType: 'html',
    data: {lat: lat, lon: lon},
    success: function(data) {
      $('.restaurants-list').html(data);
    }
  });

}

function itFailed(error) {
  console.log(error.message);
}