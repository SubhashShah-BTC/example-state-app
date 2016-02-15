function buildMap(lat, long) {
  handler = Gmaps.build('Google');
  handler.buildMap({ internal: {id: 'one_marker'}}, function(){
    var marker = handler.addMarker({lat: parseFloat(lat), lng: parseFloat(long)});
    handler.map.centerOn(marker);
  });
}