   

   if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
            var lat = position.coords.latitude;
            var lon = position.coords.longitude;
            showMap(lat, lon);
             $.ajax({              
                            type: "POST",
                            url: "/locations",
                            contentType: 'application/json; charset=utf-8',
                            data: JSON.stringify({lat: lat, long: lon}),
                            dataType: "json",
            success: function(response) { alert("we have your location"); },  
            error: function(xhr, ajaxOptions, thrownError) { alert(xhr.responseText); }
          });
        });
   } else {
       document.write('Your browser does not support GeoLocation :(');
    }
function showMap(lat, lon) {
    var myLatLng = new google.maps.LatLng(lat, lon);
    var mapOptions = {
    zoom: 15,
    center: myLatLng,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
      var map = new google.maps.Map(document.getElementById('map'), mapOptions);
      var marker = new google.maps.Marker({
      position: myLatLng,
      map: map,
      title: 'Found you!'
  });

    
 };


           

 
   

 
