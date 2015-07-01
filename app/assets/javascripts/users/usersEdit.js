function updateProfile() {
	var requestObject = {
		firstname: $('#firstname').val(),
		lastname: $('#lastname').val(),
		email: $('#email').val()
	};
	var url = '/api/users/' + $('#username').val();
	$.ajax({
		type: 'PUT',
		url: url,
		data: requestObject,
		success: function(data) {
			window.location.href = url;
		}
	});
}