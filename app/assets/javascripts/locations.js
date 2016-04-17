// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('ready', function() {


$('.upvote').on('click', function() {

	var locationId = $('.upvote').data("location-id");


	$.ajax({

		url: '/upvote/location/',

		type: 'POST',

		data: {

			location: locationId

		},

		success: function(response) {
			console.log(response);
		},

		error: function() {
			console.log("Something went wrong");
		}

	});
});


$('.downvote').on('click', function() {

	var locationId = $('.downvote').data("location-id");

	$.ajax({

		url: '/downvote/location/',

		type: 'POST',

		data: {

			location: locationId

		},

		success: function(response) {
			console.log(response);
		},

		error: function() {
			console.log("Something went wrong");
		}

	});
});

	

});