$(function() {
	var $userSearch = $('#userSearch');

	$userSearch.autocomplete({
		source: function(request, response) {
			var requestObject = {
				input: request.term
			};
			$.ajax({
				type: "GET",
				url: "/api/admin/manage_users",
				data: requestObject,
				dataType: "JSON",
				success: function (data) {
					response($.map(data, function(item) {
						item.label = 'friend_id';
						item.value = item.username;
						return item;
					}));
				}
			});
		}
	}).data("ui-autocomplete")._renderItem = function (ul, item) {
		var img = item.avatar_url == 'img/book-icon-thumb.png' ? '/assets/' + item.avatar_url : item.avatar_url;
		var listItem = $('<li class="avatar-container"><span class="image-wrap avatar" style="position:relative; display:inline-block; background: #F3F3F3 url(' + img + ') no-repeat center center; "><img class="avatar" style="opacity:0" src="' + img + '" alt="Book icon thumb b34b38fe8a5f330d80e0fb74ba447793970c23457f10e59bbe427b4703ba06ff"></span> ' + item.firstname + ' ' + item.lastname + '</li>').appendTo(ul);
		return listItem;
	};

	$userSearch.bind('enterKey', function(e) {
		// Ajax call to make friend request
		$.ajax({
			type: 'GET',
			url: '/api/admin/render_admin_form',
			data: { friend_id : $userSearch.val() },
			dataType: "script",
			beforeSend: function(jqXHR, settings) {
				jqXHR.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
			},
			success: function(data) {
				// If the no-user element is in the data, there was no user found
				if ($(data).attr('id') == "no-user") {
					$('#user-search-container').append(data);
					$userSearch.val('');
				} else {
					// make notice that friend request was sent
					$('#user-search-container').append(data);
					$userSearch.val('');
				}
				setTimeout(function() {
					// in 5 seconds, remove the first notification-container
					$('#user-search-container > .notification-container').get(0).remove();
				}, 5001)
			}
		});
	});
	$userSearch.keyup(function(e) {
		if (e.keyCode == 13) {
			$(this).trigger('enterKey');
		}
	});
});