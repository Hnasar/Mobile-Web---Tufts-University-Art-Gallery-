/* global google map variables */

$('#tours').live("pageshow", function() {
	
var tufts_latlng = new google.maps.LatLng(42.405547, -71.120259);
	
$('#map_canvas').gmap( { 
	'center': tufts_latlng,
	'zoom': 17, 
	'callback': 
	function (map) {
		if ( navigator.geolocation ) {
			watch = navigator.geolocation.watchPosition ( 
				function( position ) { 
					$('#map_canvas').gmap('clearMarkers');
					$('#map_canvas').gmap('addMarker', 
						{ 
						'title': 'You are here!', 
						'bound': true, 
						'position':new google.maps.LatLng(position.coords.latitude, position.coords.longitude) 
						}, 
						function(map, marker) {
							$('#map_canvas').gmap('addInfoWindow', 
								{ 
								'position': marker.getPosition(), 
								'content': 'You are here!' 
								}, 
								function(iw) {
									$(marker).click(function() {
										iw.open(map, marker);
									});
								});
					});
					
					
					/** Add the markers for each art piece **/
					$.ajax({
					  type: 'POST',
					  url: '/tour_items/'+tour_id,
					  success: function(data){
					  				/* title of each art piece */
					  				var title;
									
									for(var i = 0; i  < data.length; i++){
										title = data[i].artwork.title;
										$.post(
											'/artworks/getlatlng/'+data[i].artwork.id,
											function(latlng_data){
														if(latlng_data){
														$('#map_canvas').gmap('addMarker', 
														{ 
														'title': title, 
														'bound': true, 
														'position':new google.maps.LatLng(latlng_data['building_location']['lat'], latlng_data['building_location']['lng']) 
														}, 
														function(map, marker) {
															$('#map_canvas').gmap('addInfoWindow', 
																{ 
																'position': marker.getPosition(), 
																'content': title
																}, 
																function(iw) {
																	$(marker).click(function() {
																		iw.open(map, marker);
																	});
																});
														});
														}/* end if latlng_data */
																						
											} /* end success() function */
										); /* end nested-ajax */
									} /* end for-loop */
								},
					  dataType: 'json'
					});
					
				}
			);
		}
	}
}); 
	
function getLatLng() {
	if ( google.loader.ClientLocation != null ) {
		return new google.maps.LatLng(google.loader.ClientLocation.latitude, google.loader.ClientLocation.longitude);	
	}
	return new google.maps.LatLng(59.3426606750, 18.0736160278);
}

});

$('#tours').live("pagehide", function() {
	if ( navigator.geolocation ) {
		navigator.geolocation.clearWatch(watch);
    }
});

$('#tours').live("pagecreate", function() {
	var watch;
});




