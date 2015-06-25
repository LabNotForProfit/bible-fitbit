// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require jquery.dataTables
//= require jquery-ui

function saveBadge() {
	var name = $('#badgeName').val();
	if (name == '') {
		alert('Error: Name cannot be empty!');
		return;
	}

	var requestObject = {
		name: name,
		description: $('#badgeDescription').val()
	}
	$.ajax({
		type: 'POST',
		url: '/api/badges',
		data: requestObject,
		success: function(data) {
			window.location.href = '/api/badges';
		}
	})
}

$(document).on('page:load', function() {
	$(function () {
		var $friendSearch = $('#friendSearch');
		$friendSearch.bind('enterKey', function(e){
			// Ajax call to make friend request
			$.ajax({
				type: 'POST',
				url: '/api/friend_requests',
				data: { friend_id : $friendSearch.val() },
				beforeSend: function(jqXHR, settings) {
					jqXHR.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
				},
				success: function(data) {
					
					// If the no user element is in the data, there was no user found
					if($(data).attr('id') == "no-user") {
						$('#friend-search-container').append(data);
						$friendSearch.val('');
					} else
					// if the friend requests element exists, we're just going to append the new request
					if($('#my-friend-requests').length > 0) {
						$('#my-friend-requests').append(data);
						$friendSearch.val('')
					} else {
						// otherwise, we're starting the list so append it to the body
						$("body").append(data)
						$friendSearch.val('')
					}
				}
			})
		});

		$friendSearch.keyup(function(e) {
			if(e.keyCode == 13) {
				$(this).trigger('enterKey');
			}
		});
	});
});