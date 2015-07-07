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
				// If the no-user element is in the data, there was no user found
				if ($(data).attr('id') == "no-user") {
					$('#friend-search-container').append(data);
					$friendSearch.val('');
				} else {
					// make notice that friend request was sent
					$('#friend-search-container').append(data);
					$friendSearch.val('');
				}
				setTimeout(function() {
					// in 5 seconds, remove the first notification-container
					$('#friend-search-container > .notification-container').get(0).remove();
				}, 5001)
			}
		});
	});

	$friendSearch.keyup(function(e) {
		if (e.keyCode == 13) {
			$(this).trigger('enterKey');
		}
	});
});