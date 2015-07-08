$(document).ready(function() {
	$(".friend").hover(function() {
		$(".friend > span").removeClass("glyphicon-ok");
		$(".friend > span").addClass("glyphicon-remove");
	}, function() {
		$(".friend > span").removeClass("glyphicon-remove");
		$(".friend > span").addClass("glyphicon-ok");
	})
})