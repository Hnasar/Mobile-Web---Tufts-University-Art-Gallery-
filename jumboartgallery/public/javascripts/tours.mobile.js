/* global google map variables */

jQuery('#tours').live("pageshow", function() {
	jQuery('#map_canvas').gmap({'center': getLatLng(), 'callback': function() {
			jQuery('#map_canvas').gmap('addMarker', {'position': getLatLng(), 'animation': google.maps.Animation.DROP, 'title': 'Hello world!'}, function(map, marker) {
				jQuery('#map_canvas').gmap('addInfoWindow', { 'position':marker.getPosition(), 'content': 'Hello world!' }, function(iw) { 
					jQuery(marker).click(function() { 
							iw.open(map, marker); 
							map.panTo(marker.getPosition()); 
					}); 
				}); 
			});
		}
	});
	function getLatLng() {
		if ( google.loader.ClientLocation != null ) {
			return new google.maps.LatLng(google.loader.ClientLocation.latitude, google.loader.ClientLocation.longitude);	
		}
		return new google.maps.LatLng(59.3426606750, 18.0736160278);
	}
});



