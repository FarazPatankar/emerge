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
            infowindow.setContent("<p>Name: " + place.name + "</p>" + "<p>" + "<p>Address: " + place.vicinity + "</p>" + "<a href=/locations/" + place.id + ">" + "...Click Here for more info" + "</a>");
            infowindow.open(map, this);
            // console.log(place);

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
        console.log(place);
        createLocation(place);
    }
}

function createLocation(place) {
    var gid = place.id ? place.id : "";
    var website = place.website ? place.website : "";
    var name = place.name ? place.name : "";
    var icon = place.icon ? place.icon : "";
    var address = place.formatted_address ? place.formatted_address : "";
    var number = place.formatted_phone_number ? place.formatted_phone_number : "";
    var rating = place.rating ? place.rating : 0;
    $.ajax({
        url: '/locations',
        type: "POST",
        data: {
            location: {
                gid: gid,
                website: website,
                name: name,
                icon: icon,
                address: address,
                number: number,
                rating: rating
            }
        },
        success: function(response){
            var response = response;
            console.log(rating)
        },
        error: function(response){
            var response = response;
            console.log(response)
        }

    });
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