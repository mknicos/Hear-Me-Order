

$("#map-canvas").ready(initializeGoogleMap);

var map;
var lat = 36.1667;
var lng = -86.7833;
var initialZoom = 11;
var markers = [];

function initializeGoogleMap(){
  initMap(lat, lng, initialZoom);
  getRestaurantLocations();
  getLocation();
}

function getRestaurantLocations(){
  rest_markers = $.map($('.restaurant'), function(e) {
    return {name: $(e).data('name'),
            lat: $(e).data('latitude'),
            lng: $(e).data('longitude'),
            id: $(e).data('id')};
  });

  for(i = 0; i < rest_markers.length; i++){
    addMarker(rest_markers[i]);
  }
}

function initMap(lat, lng, zoom){
  var mapOptions = {center: new google.maps.LatLng(lat, lng), zoom: zoom, mapTypeId: google.maps.MapTypeId.ROADMAP};
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
}

function getLocation(){
  var geoOptions = {enableHighAccuracy: true, maximumAge: 1000, timeout: 60000};
  navigator.geolocation.getCurrentPosition(geoSuccess, geoError, geoOptions);
}

function geoSuccess(location) {
  lat = location.coords.latitude;
  lng = location.coords.longitude;
  console.log("Your current location is: " + lat +', ' + lng);
  //When it finds your location I would like the map to update
  map.setZoom(16);
  map.setCenter({"lat":lat, "lng":lng});
}

function geoError() {
  alert('Sorry, no position available.');
}

function addMarker(restaurant){
  var currentClick;
  var position = new google.maps.LatLng(restaurant.lat, restaurant.lng);
  var marker = new google.maps.Marker({map:map, position:position, title:restaurant.name});
  marker.set('id', restaurant.id);
  markers.push(marker);
  google.maps.event.addListener(marker, 'click', function() {
    if(currentClick === marker){
      window.location.href = '/restaurants/' + marker.id;
    }
  });
  google.maps.event.addListener(marker, 'click', function() {
    map.setZoom(17);
    map.setCenter(marker.getPosition());
    currentClick = marker;
  });
}
//google.maps.event.addDomListener(window, 'load', initialize);
