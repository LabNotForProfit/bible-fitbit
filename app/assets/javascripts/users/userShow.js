$(document).ready(function() {
	$(".friend").hover(function() {
		$(".friend > span").removeClass("glyphicon-ok");
		$(".friend > span").addClass("glyphicon-remove");

		$(".friend").removeClass("btn-success");
		$(".friend").addClass("btn-danger");
	}, function() {
		$(".friend > span").removeClass("glyphicon-remove");
		$(".friend > span").addClass("glyphicon-ok");

		$(".friend").removeClass("btn-danger");
		$(".friend").addClass("btn-success");
	});

	$("#bookSelect").change(function() {
		$.ajax({
			url: 'api/users/quiz-graph',
			type: 'GET',
			data: { book_id: $(this).val() },
			success: function(data) {
				console.out('success')
			}
		})
	})
})

