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
			data: { username : $userSearch.val() },
		});
	});
	$userSearch.keyup(function(e) {
		if (e.keyCode == 13) {
			$(this).trigger('enterKey');
		}
	});
});