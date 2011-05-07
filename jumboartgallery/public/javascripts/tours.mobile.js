/* global google map variables */

  $(function() {
  		var art_piece = 0;
  		var tour_items = $('#tour_items').find('a');
  		var tufts_latlng = new google.maps.LatLng(42.405547, -71.120259);

        $('#map_canvas').gmap({'center': tufts_latlng, 'zoom': 16});
        
        function set_marker(id, title){
			$.post(  
				'/artworks/getlatlng/'+id,
				function(data){
					/*latlng object */
					art_latlng = new google.maps.LatLng(data['building_location']['lat'], data['building_location']['lng'])
				
					/* Create the marker */
					$('#map_canvas').gmap('addMarker', {'ARTWORK_ID' : id, 'position': art_latlng, 'title': title}, function(map, marker){
				
						/* Add the pop-up window */ 
						$('#map_canvas').gmap(
							'addInfoWindow', 
							{'position': art_latlng, 'content': '<p><b>' + title + '</b></p>'+'<p>Located at ' + data['building_location']['name'] + '</p>' }, 
							function(iw) {
								iw.open(map, marker);
								map.panTo(marker.getPosition());
							});
					});
				}
			); /* end post */
        } /* End set_marker function */
        
        $('#start-tour').click(function(){
        	if(art_piece==0){
        		set_marker(tour_items[art_piece].id, $('#'+tour_items[art_piece].id).text());
        		$('#start-button').hide();
        		$('#tour-controls').show();
        	}
        });
        
        $('#next').click(function(){
        	art_piece++;
        	if(art_piece<tour_items.length){
        		set_marker(tour_items[art_piece].id, $('#'+tour_items[art_piece].id).text());
        	}else{
        		$('#tour-controls').replaceWith('<h1>Tour Complete!</h1>');
        	}
        });     
        
    });


