var books = [];

$(function () {
	$('.cd-date').each(function() {
		var book = $(this).text();
		if ($.inArray(book, books) === -1) {
			books.push($(this).text());
		}
	});
	var $bookSearch = $('#bookSearch');
	$bookSearch.autocomplete({
		source: books
	})
	$bookSearch.bind('enterKey', function(e) {
		var goToDiv = $('#' + $('#bookSearch').val().split(' ').join(''));
		if (goToDiv.offset().top > 0) {
			$('html,body').animate({
          		scrollTop: goToDiv.offset().top - goToDiv.height()
        	}, 1000);
        	return false;
		}
	});
	$bookSearch.keyup(function(e) {
		if (e.keyCode == 13) {
			$(this).trigger('enterKey');
		}
	});
});
