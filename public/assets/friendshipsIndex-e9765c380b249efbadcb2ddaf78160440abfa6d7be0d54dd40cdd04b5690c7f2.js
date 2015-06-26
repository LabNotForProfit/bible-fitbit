$(function() {
	var $friendSearch = $('#friendSearch');
	$friendSearch.bind('enterKey', function(e) {
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
					$friendSearch.val('');
				} else {
					// otherwise, we're starting the list so append it to the body
					$("body").append(data);
					$friendSearch.val('');
				}
			}
		})
	});

	$friendSearch.keyup(function(e) {
		if (e.keyCode == 13) {
			$(this).trigger('enterKey');
		}
	});
});
