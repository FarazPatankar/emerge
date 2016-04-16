// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var map;
var infowindow;
var lat;
var lng;
var type = 'store';

function createMarker(place) {
        var placeLoc = place.geometry.location;
        var marker = new google.maps.Marker({
            map: map,
            position: place.geometry.location
        });

        google.maps.event.addListener(marker, 'click', function() {
            infowindow.setContent("<p>Name: " + place.name + "</p>" + "<p>Address: " + place.vicinity + "</p>");
            infowindow.open(map, this);
            console.log(place);

            var request = {
                placeId: place.place_id
            };

            var startService = new google.maps.places.PlacesService(map);
            startService.getDetails(request, getPlace);
        });
}

function startSearch(results, status) {
    if (status === google.maps.places.PlacesServiceStatus.OK) {
    	console.log(results)
        for (var i = 0; i < results.length; i++) {
            createMarker(results[i]);
        }
    }
}

function initMap() {
    var pyrmont = {
        lat: lat,
        lng: lng
    };

    map = new google.maps.Map(document.getElementById('map'), {
        center: pyrmont,
        zoom: 16
    });

    infowindow = new google.maps.InfoWindow();
    var service = new google.maps.places.PlacesService(map);
    service.nearbySearch({
        location: pyrmont,
        radius: 500,
        type: [type]
    }, startSearch);
}


function getPlace(place, status){
    if (status == google.maps.places.PlacesServiceStatus.OK) {
        console.log(place)
    }
}


// STUFF
$(document).on("ready", function() {
    lat = $('h1').data("lat");
    lng = $('h1').data("lng");

    $('.type-list li input').on('click', function(thing){
            var selection = thing.currentTarget.id;
            type = selection;
            initMap();

    })




    $('select').material_select();
})